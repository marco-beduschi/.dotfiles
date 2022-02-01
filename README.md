# dotfiles

Meus dotfiles. ([O que são dotfiles?](https://thoughtbot.com/upcase/videos/intro-to-dotfiles#:~:text=Dotfiles%20are%20plain%20text%20configuration,things%20like%20our%20shell%2C%20~%2F.&text=making%20them%20hidden%20files%20on,changes%20you%20make%20over%20time.))

Inspirados nos dotfiles do eieioxyz. [Link aqui](https://github.com/eieioxyz/dotfiles_macos).

## Antes de Formatar o PC

Auditar softwares instalados:

- Garantir que o arquivo `Brewfile` esteja atualizado rodando o comando `brew bundle dump --force --describe`
- Commitar e puxar o código de todos os repostórios existentes

## Restaurando o PC a partir do .dotfiles

1. `xcode-select --install` (Command Line Tools é necessário para o Git e o Homebrew)
2. `https://github.com/eieioxyz/dotfiles_macos.git`. Vamos começar usando `https` mas trocar pra `ssh` depois da instalação
3. `cd ~/.dotfiles`
4. Audite os softwares que serão instalados pelo arquivo `Brewfile` antes de instalá-los, por precaução
5. `./install`
6. Reinicie o computador
7. [Gere uma chave ssh](https://docs.github.com/en/authentication/connecting-to-github-with-ssh), adicione-a ao GitHub, e troque o remote do projeto.

```zsh
# Gera a chave SSH no caminho padrão (~/.ssh/config)
ssh-keygen -t rsa -b 4096 -C "8469440+marco-beduschi@users.noreply.github.com"

# Inicia o ssh-agent
eval "$(ssh-agent -s)"

# Cria um arquivo de configuração com os valores corretos
<< EOF > ~/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
EOF

# adiciona a chave SSH ao ssh-agent
#
# (software do Macbook que guarda passwords, evita que você precise adicionar a senha da sua chave SSH a cada push pro repositório)
ssh-add -K ~/.ssh/id_rsa

# Copia a chave SSH pública e adiciona ao github.com > Settings > SSH and GPG keys
pbcopy < ~/.ssh/id_rsa.pub

# Verifica a conexão usando SSH, e verifica o fingerprint e password.
# https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
ssh -T git@github.com

# Troca o remote de HTTPS para SSH
git remote set-url origin git@github.com:marco-beduschi/.dotfiles.git
```

## O Que Esse .dotfiles NÃO instala

Infelizmente esses softwares/preferências tem que ser configurados a mão:

- Node & NVM/N
- VIM preferences
- Dock Preferences
- Mission Control Preferences
- Finder Show Path Bar
- Trackpad
- Karabiner Elements
- Docker
