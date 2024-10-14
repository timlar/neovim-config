# Neovim Setup Guide

## 1. Install Neovim and Additional Utilities

To install Neovim and universal-ctags, run the following commands:

```shell
brew install --HEAD neovim
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
```

## 2. Install Language-Specific Plugins (Optional)

To enable language-specific features, you should install the following packages:

```shell
gem install neovim
npm install -g neovim stylelint
pip3 install --upgrade neovim
```

## 3. Verify Installation

Check that Neovim and its dependencies are correctly installed:

```vim
:checkhealth
```

It is highly recommended to run :checkhealth periodically, especially after
updating Ruby, Python, or JavaScript versions, to ensure that all plugins and
configurations are working correctly.

## 4. Install Neovim Plugins

To install plugins, use:

```vim
:Lazy
```

## 5. Install LSPs

To install language server protocols (LSPs), use:

```vim
:Mason
```

<details>
  <summary>For reference, I personally have the following Language Server Protocols (LSPs) installed:</summary>

  - docker-compose-language-service
  - dockerfile-language-server
  - eslint-lsp
  - eslint_d
  - fixjson
  - graphql-language-service-cli
  - json-lsp
  - lua-language-server
  - prettier
  - stylelint-lsp
  - tailwindcss-language-server
  - tflint
  - typescript-language-server
  - vue-language-server
  - yaml-language-server
  - yamlfmt
  - yamllint
</details>

# How to Update Plugins

## 1. Updating Plugins

You can use the same command to update plugins:

```vim
:Lazy
```

Just press `Shift + U`.

## 2. Update `nvim-treesitter` Parsers

After updating plugins, update `nvim-treesitter` parsers with:

```vim
:TSUpdate
```

## 3. Update LSPs

To update language server protocols (LSPs), use:

```vim
:Mason
```

Just press `Shift + U`.
