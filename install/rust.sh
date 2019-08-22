if test ! $(which rustc); then
  echo "Installing rust..."
  curl https://sh.rustup.rs -sSf | sh
fi

# Install Cargo modules
# cargo-edit: https://github.com/killercup/cargo-edit
# cargo-generate: https://github.com/ashleygwilliams/cargo-generate
# wasm-pack: https://github.com/rustwasm/wasm-pack
mod=(
  cargo-edit
  cargo-generate
  wasm-pack
)

echo "installing node modules..."
cargo install ${mod[@]}

# IDE Plugins
# https://github.com/rust-lang/rls
rustup update
rustup component add rls rust-analysis rust-src

# Clippy is Rust format tools
# https://github.com/rust-lang/rust-clippy
rustup component add clippy