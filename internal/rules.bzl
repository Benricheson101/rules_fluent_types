def _fluent_types_generate_impl(ctx):
  toolchain = ctx.toolchains["@rules_fluent_types//:toolchain_type"]

  out = ctx.actions.declare_file(ctx.file.out.path)

  ctx.actions.run(
    executable = toolchain.exe,
    arguments = [s.path for s in ctx.files.srcs] + ["-o", out.path],
    inputs = ctx.files.srcs,
    outputs = [out],
  )

  return [DefaultInfo(files = depset([out]))]

fluent_types_generate = rule(
  implementation = _fluent_types_generate_impl,
  attrs = {
    "srcs": attr.label_list(
      mandatory = True,
      allow_files = [".ftl"],
    ),
    "out": attr.label(
      mandatory = True,
      allow_single_file = [".ts"],
    ),
  },
  toolchains = ["@rules_fluent_types//:toolchain_type"],
)
