# Neovim Setup Guide

## 1. Install Neovim and Additional Utilities

To install Neovim and universal-ctags, run the following commands:

```sh
brew install --HEAD neovim
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
```

## 2. Install Language-Specific Plugins (Optional)

To enable language-specific features, you should install the following packages:

```sh
gem install neovim
npm install -g neovim
pip3 install --upgrade neovim
```

## 3. Verify Installation

Check that Neovim and its dependencies are correctly installed:

```vim
:checkhealth
```

It is highly recommended to run `:checkhealth` periodically, especially after
updating Ruby, Python, or JavaScript versions, to ensure that all plugins and
configurations are working correctly.

## 4. Manage Neovim Plugins

To install or plugins, use:

```vim
:Lazy
```

## 5. Manage LSPs

To install or update language server protocols (LSPs), use:

```vim
:Mason
```
