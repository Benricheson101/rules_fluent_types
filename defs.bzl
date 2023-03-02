load(
  "@rules_fluent_types//internal:rules.bzl",
  _fluent_types_generate = "fluent_types_generate"
)

load(
  "@rules_fluent_types//internal:toolchain.bzl",
  _fluent_types_toolchain = "fluent_types_toolchain"
)

fluent_types_generate = _fluent_types_generate
fluent_types_toolchain = _fluent_types_toolchain
