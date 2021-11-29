#!/usr/bin/env zsh

echo "\n<<< Starting ZSH Setup >>>\n"

# Add brew-installed ZSH as a valid osx shell
if grep -Fxq '/usr/local/bin/zsh' '/etc/shells'; then
    echo '/usr/local/bin/zsh already exists in /etc/shells'
else
    echo "Enter superuser (sudo) password to edit /etc/shells"
    echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

# Add brew-installed ZSH as default shell
if [ "$SHELL" = '/usr/local/bin/zsh' ]; then
    echo '$SHELL is already /usr/local/bin/zsh'
else
    echo "Enter user password to change login shell"
    chsh -s '/usr/local/bin/zsh'
fi