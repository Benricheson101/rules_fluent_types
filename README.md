Bazel rules for [Fluent Types](https://github.com/benricheson101/fluent-types)

### Usage:

Add this to your `WORKSPACE.bazel`
```starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
  name = "rules_fluent_types",
  url = "https://github.com/Benricheson101/rules_fluent_types/archive/<commit>.tar.gz",
  sha256 = "<sha256>",
  strip_prefix = "rules_fluent_types-<commit>",
)

load("@rules_fluent_types//:deps.bzl", "register_fluent_types_toolchain")
register_fluent_types_toolchain()
```
