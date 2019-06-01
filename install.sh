#!/bin/sh

USER_NAME="Sven Luijten"
USER_EMAIL="svenluijten1995@gmail.com"

echo "Setting up your Mac."

# Install xcode tools.
echo "Running xcode-select --install"
xcode-select --install

# Check for Homebrew and install it if we don't have it.
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing Homebrew formulae..." # See the 'Brewfile'.
brew update
brew tap homebrew/bundle
brew bundle

echo "Symlinking .zshrc into $HOME..."
rm -f $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

echo "Changing the default shell to 'zsh'..."
chsh -s $(which zsh)

echo "Creating $HOME/Code..."
mkdir $HOME/Code

echo "Installing required PHP extensions..."
pecl install memcached imagick

echo "Installing Composer & pulling in global dependencies..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

/usr/local/bin/composer global require laravel/installer

echo "Setting npm's global directory to something read- & writeable..."
mkdir "$HOME/.npm-global"
npm config set prefix "$HOME/.npm-global"

echo "Setting git configuration..."
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"
git config --global user.useConfigOnly true

git config --global alias.st "status -sb"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.df "diff --"
git config --global alias.ap "add -p"
git config --global alias.find "log --pretty=\"format:%Cblue%H %Cgreen%s%Creset\" --abbrev-commit --grep"
git config --global alias.nah "!git reset --hard && git clean -df"

git config --global branch.autosetuprebase always

git config --global core.excludesFile "$HOME/.gitignore"
git config --global core.whitespace "-trailing-space"

git config --global push.default current
git config --global push.followTags true

git config --global color.ui true

git config --global tag.forceSignAnnotated true

git config --global log.abbrevCommit true
git config --global log.date relative
git config --global log.decorate full
git config --global log.showRoot true

git config --global grep.lineNumber true

ln -s $HOME/.dotfiles/.gitignore $HOME/.gitignore

if [ ! -d "$HOME/.ssh" ]; then
  echo "Symlinking the .ssh/ folder into $HOME..."
  ln -s $HOME/.dotfiles/.ssh $HOME/.ssh
fi

if [ ! -f $HOME/.ssh/id_ed25519 ]; then
  echo "Generating a new ed25519 SSH key pair..."
  ssh-keygen -t ed25519 -b 4096 -C "$USER_EMAIL" -f $HOME/.ssh/id_ed25519
fi

# Set macOS preferences.
# We will run this last because this will reload the shell.
source .macos
