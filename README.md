## Setup

Install neovim and additional utils

```shell
$ brew install --HEAD neovim
$ brew tap universal-ctags/universal-ctags
$ brew install --HEAD universal-ctags
```

Install language-specific packages (optional)

```shell
$ gem install neovim # provider for Ruby
$ npm install -g neovim stylelint # provider for JavaScript
$ pip3 install --upgrade neovim # provider for Python 3
```

Make sure everything is ok

```vim
:checkhealth
```

Install neovim plugins

```vim
:Lazy
```

## How to update packages:

```vim
:Lazy
:TSUpdate
:Mason
```
