#!/usr/bin/env zsh

echo "\n<<< Starting ZSH Setup >>>\n"

echo "Enter superuser (sudo) password to edit /etc/shells"
echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null # TODO: This command should not append to /etc/shells if command is path is already there.

echo "Enter user password to change login shell"
chsh -s '/usr/local/bin/zsh'