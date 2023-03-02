load("@rules_fluent_types//internal:repo.bzl",
  _fluent_types_download = "fluent_types_download",
)

fluent_types_download = _fluent_types_download

def register_fluent_types_toolchain():
  releases = [
    {
      "urls": ["https://github.com/Benricheson101/fluent-types/releases/download/v1.0.7/fluent-types-aarch64-apple-darwin.tar.gz"],
      "sha256": "a4839387d667bd955704aa85279cf570484059a7ea4db81bbcd0aae80412a6b6",
      "os": "macos",
      "arch": "arm64",
    },
    {
      "urls": ["https://github.com/Benricheson101/fluent-types/releases/download/v1.0.7/fluent-types-x86_64-apple-darwin.tar.gz"],
      "sha256": "37ac90aae4d0cfbd210968e4e66fcec617bf875cc0d2c8b4489cd377717d676f",
      "os": "macos",
      "arch": "x86_64",
    },

    {
      "urls": ["https://github.com/Benricheson101/fluent-types/releases/download/v1.0.7/fluent-types-x86_64-unknown-linux-gnu.tar.gz"],
      "sha256": "55985ccd0106102701cdc9be95858eab6164671186b63e26621a1e25cb7ab392",
      "os": "linux",
      "arch": "x86_64",
    },
    # TODO: how do I make an x86_64 musl target instead of gnu
    # {
    #   "urls": ["https://github.com/Benricheson101/fluent-types/releases/download/v1.0.7/fluent-types-x86_64-unknown-linux-musl.tar.gz"],
    #   "sha256": "37fc10e1f79e93360c3c33579cd5a3bade4fdfc20fe26b27332d66593183fe17",
    #   "os": "linux",
    #   "arch": "x86_64",
    # },
  ]

  for r in releases:
    name = "fluent_types_{}_{}".format(r["os"], r["arch"])

    fluent_types_download(
      name = name,
      urls = r["urls"],
      sha256 = r["sha256"],
      os = r["os"],
      arch = r["arch"],
    )

    native.register_toolchains("@{}//:toolchain".format(name))
