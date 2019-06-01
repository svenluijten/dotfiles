# Load globally installed Composer binaries.
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load globally installed Node binaries.
export PATH="$HOME/.node/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# Use project specific binaries before global ones.
export PATH="node_modules/.bin:vendor/bin:$PATH"
