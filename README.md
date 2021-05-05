## Setup

Install neovim, packages and fonts

```shell
$ brew install --HEAD neovim
$ brew tap universal-ctags/universal-ctags
$ brew install --HEAD universal-ctags
$ brew tap homebrew/cask-fonts
$ brew cask install font-blex-mono-nerd-font
```

Install language-specific packages (Ruby, Python 2 and 3)

```shell
$ gem install neovim
$ pip2 install --upgrade neovim
$ pip3 install --upgrade neovim
```

Make sure everything is ok

```vim
:checkhealth
```

Install neovim plugins

```vim
:PackerInstall
```

Install languages for `nvim-treesitter`

```vim
:TSInstall bash comment css go graphql html javascript jsdoc json jsonc lua regex ruby scss toml typescript vue yaml
```

## How to update packages:

```vim
:PackerUpdate
:TSUpdate
:CocUpdate
```

## How to find slow plugin:

```vim
:syntime on
```

--- open several files and do something ---

```vim
:syntime report
```
