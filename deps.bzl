load("@rules_fluent_types//internal:repo.bzl",
  _fluent_types_download = "fluent_types_download",
)

fluent_types_download = _fluent_types_download

def register_fluent_types_toolchain():
  releases = [
    {
      "urls": [
        "https://github.com/Benricheson101/fluent-types/releases/download/v1.0.12/fluent-types-x86_64-unknown-linux-gnu.tar.gz"
      ],
      "sha256": "c2bc7929036ef2e8656928aaca0b5d8ea5539e933edc9962fa2d197695c1846e",
      "os": "linux",
      "arch": "x86_64"
    },
    {
      "urls": [
        "https://github.com/Benricheson101/fluent-types/releases/download/v1.0.12/fluent-types-aarch64-unknown-linux-gnu.tar.gz"
      ],
      "sha256": "54457e336e90963a3517d29d77f75c99a859a3027b7bd8953c4c883a10839dd9",
      "os": "linux",
      "arch": "arm64"
    },
    {
      "urls": [
        "https://github.com/Benricheson101/fluent-types/releases/download/v1.0.12/fluent-types-x86_64-apple-darwin.tar.gz"
      ],
      "sha256": "da50acd93740f0c5fe93f139e636ee1d688fb0695c45b613e760b965a4b1df0d",
      "os": "macos",
      "arch": "x86_64"
    },
    {
      "urls": [
        "https://github.com/Benricheson101/fluent-types/releases/download/v1.0.12/fluent-types-aarch64-apple-darwin.tar.gz"
      ],
      "sha256": "b4bf75cc3807f53d5e2fa2db99eb5cf9fa48cc4564777bd13f3617046f902357",
      "os": "macos",
      "arch": "arm64"
    }
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
