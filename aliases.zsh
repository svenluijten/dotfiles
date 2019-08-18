# Shortcuts
alias ll="ls -lah"
alias ..="cd .."
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias c="clear"
alias path="echo $PATH | sed 's/:/\'$'\n/g'"

# Folders
alias co="cd $HOME/Code"
alias dotfiles="cd $DOTFILES"

# Development
alias a="php artisan"
alias cfresh="rm -rf vendor/ && composer install"

# Docker
alias dcr="docker-compose run --rm"
alias dex="docker exec -it"
