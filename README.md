Bazel rules for [Fluent Types](https://github.com/benricheson101/fluent-types)

### Usage:

Add this to your `WORKSPACE.bazel`
```starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
  name = "rules_fluent_types",
  url = "https://github.com/Benricheson101/rules_fluent_types/archive/6be8f0d6f6891af405c055bc24ee17171e0ddce3.zip",
  sha256 = "eccb13edb232e101bfb1db2a2e6334c82ae0715a0eed9f578fdcbcff5da88964",
  strip_prefix = "rules_fluent_types-6be8f0d6f6891af405c055bc24ee17171e0ddce3",
)

load("@rules_fluent_types//:deps.bzl", "register_fluent_types_toolchain")
register_fluent_types_toolchain()
```
