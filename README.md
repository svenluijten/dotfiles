# Sven's Dotfiles
This project contains all my macOS dotfiles. These have been heavily inspired by [Dries Vints' dotfiles](https://github.com/driesvints/dotfiles).

## How to use
First, **make sure all important work is either in Google Drive, Dropbox, or pushed to your Git provider.**.

After you've done that, run the following commands. This may take a while and requires _some_ level of interaction from the user.

```sh
# Clone the repository into "~/.dotfiles".
$ git clone https://github.com/svenluijten/dotfiles ~/.dotfiles
$ cd ~/.dotfiles

# Run the installation script.
$ ./install.sh

# Restart the computer.
$ osascript -e 'tell app "System Events" to restart'
```

## Recommended next steps
You should now have a fully functioning macOS installation ready to go. However, there are some other things I recommend you
do before anything else.

### Sign in to all apps
This might take a while, but obviously you'll want to sign in on, and configure all the apps to your liking. Start with 1Password, and
work your way down [the list](Brewfile#L28).

### Adding SSH keys to servers/services
Copy your public SSH key (`pbcopy < $HOME/.ssh/id_ed25519.pub`) and add it to all your servers and services (GitHub, Laravel Forge, ...).

### Install your IDE
These dotfiles installed [JetBrains Toolbox](https://www.jetbrains.com/toolbox/), but none of JetBrains' IDEs. I recommend you use the
Toolbox app to install the IDE(s) you need.

### Configure PhpStorm settings
If you're using PhpStorm, [configure the settings repository](https://www.jetbrains.com/help/phpstorm/sharing-your-ide-settings.html#settings-repository)
to automatically apply all my settings.

## Disclaimer
I pieced these dotfiles together from various sources, most of which are attributed in comments throughout the source code. I am not
responsible for any damage caused to your machine or your files. Use at your own risk.
