if test ! $(which rustc); then
  echo "Installing rust..."
  curl https://sh.rustup.rs -sSf | sh
fi

# Install Cargo modules
# cargo-edit
# https://github.com/killercup/cargo-edit
mod=(
  cargo-edit 
)

echo "installing node modules..."
cargo install ${mod[@]}

# IDE Plugins
# https://github.com/rust-lang/rls
rustup update
rustup component add rls rust-analysis rust-src