# Prefer /usr/local/bin over /usr/bin
export PATH=/usr/local/bin:$PATH

# Load globally installed Composer binaries.
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load globally installed Node binaries.
export PATH="$HOME/.node/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# Use project specific binaries before global ones.
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Include Go's "bin" folder in the path.
export PATH="$GOPATH/bin:$PATH"

# Include Python's "bin" folder in the path.
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

