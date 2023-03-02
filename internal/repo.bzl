_OS_MAP = {
  "macos": "@platforms//os:macos",
  "linux": "@platforms//os:linux",
  "windows": "@platforms//os:windows",
}

_ARCH_MAP = {
  "arm64": "@platforms//cpu:arm64",
  "x86_64": "@platforms//cpu:x86_64",
}

def _fluent_types_download(ctx):
  os_constraint = _OS_MAP[ctx.attr.os]
  arch_constraint = _ARCH_MAP[ctx.attr.arch]

  ext = ".exe" if ctx.attr.os == "windows" else ""

  if ctx.attr.os != "windows":
    ctx.report_progress("downloading")
    ctx.download(
      ctx.attr.urls,
      sha256 = ctx.attr.sha256,
      output = "fluent_types.tar.gz",
    )

    ctx.report_progress("extracting")
    ctx.execute(["tar", "xf", "fluent_types.tar.gz"])
    ctx.delete("fluent_types.tar.gz")
  else:
    fail("windows is not supported in this release")

  ctx.report_progress("generating build file")

  constraints = [os_constraint, arch_constraint]
  constraint_str = ",".join(['"%s"' % c for c in constraints])

  ctx.template(
    "BUILD.bazel",
    ctx.attr._build_tpl,
    substitutions = {
      "{exec_constraints}": constraint_str,
      "{target_constraints}": constraint_str,
      "{ext}": ext,
    },
  )

fluent_types_download = repository_rule(
  implementation = _fluent_types_download,
  attrs = {
    "urls": attr.string_list(mandatory = True),
    "sha256": attr.string(mandatory = True),
    "os": attr.string(
      mandatory = True,
      values = ["macos", "windows", "linux"],
    ),
    "arch": attr.string(
      mandatory = True,
      values = ["arm64", "x86_64"],
    ),
    "_build_tpl": attr.label(
      default = "@rules_fluent_types//internal:BUILD.bazel.dist.tpl"
    )
  },
)
