load("@rules_fluent_types//:defs.bzl", "fluent_types_toolchain")

fluent_types_toolchain(
  name = "toolchain_impl",
  exe = ":fluent-types{ext}",
)

toolchain(
  name = "toolchain",
  exec_compatible_with = [{exec_constraints}],
  toolchain_type = "@rules_fluent_types//:toolchain_type",
  toolchain = ":toolchain_impl",
)
