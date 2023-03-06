#!/usr/bin/env bash

VERSION="$1"

RELEASES=(
	x86_64-unknown-linux-gnu
	aarch64-unknown-linux-gnu
	x86_64-apple-darwin
	aarch64-apple-darwin
)
	# 'x86_64-unknown-linux-musl'

json='[]'

for target in "${RELEASES[@]}"; do
	arch="$(cut -d '-' -f1 <<< $target)"
	[ $arch == 'aarch64' ] && arch='arm64'
	os="$(cut -d '-' -f3 <<< $target)"
	[ $os == 'darwin' ] && os='macos'

	url="https://github.com/Benricheson101/fluent-types/releases/download/$VERSION/fluent-types-$target.tar.gz"

	sha256=$(curl -sSL "${url}.sha256.txt")

	new_json=$(cat <<- EOF | jq
	{
		"urls": ["$url"],
		"sha256": "$sha256",
		"os": "$os",
		"arch": "$arch"
	}
	EOF
	)

	json=$(jq ". + [$new_json]" <<< "$json")
done

jq <<< $json

# vim: noet
