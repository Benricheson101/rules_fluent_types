def _fluent_types_toolchain(ctx):
  toolchain_info = platform_common.ToolchainInfo(
    exe = ctx.executable.exe,
  )

  return [toolchain_info]

fluent_types_toolchain = rule(
  implementation = _fluent_types_toolchain,
  attrs = {
    "exe": attr.label(
      mandatory = True,
      allow_single_file = True,
      executable = True,
      cfg = "exec",
    ),
  },
)
