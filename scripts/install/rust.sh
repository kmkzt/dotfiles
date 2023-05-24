#!/bin/sh

if test ! $(which rustc); then
	echo "Installing rust..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# update version
rustup update
rustup component add rls rust-analysis rust-src rust-fmt clippy
rustup toolchain install nightly

# Cargo modules
mod=(
	cargo-edit
	cargo-generate
	wasm-pack
	deno
	starship
	bat
)

echo "installing cargo modules..."
cargo install ${mod[@]}
