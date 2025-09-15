# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration based on kickstart.nvim, a minimal starting point for Neovim that provides essential IDE-like features. This is NOT a complete Neovim distribution but rather a foundation for building a personal configuration.

## Key Files and Structure

- `init.lua` - Main configuration file containing all core setup, plugins, and keymaps
- `lua/custom/plugins/` - Directory for user-added plugins (imported via `{ import = 'custom.plugins' }`)
- `lua/kickstart/plugins/` - Optional plugins provided by kickstart (commented out in init.lua)
- `lazy-lock.json` - Plugin version lockfile managed by lazy.nvim
- `.stylua.toml` - Lua formatting configuration

## Plugin Management

- **Plugin Manager**: lazy.nvim
- **Plugin Installation**: Plugins are declared in the `require('lazy').setup({})` call in init.lua
- **Plugin Updates**: Run `:Lazy update` in Neovim
- **Plugin Status**: Run `:Lazy` to view current plugin status

## Development Commands

### Formatting
- **Command**: `stylua .`
- **Config**: Uses `.stylua.toml` for formatting rules (2-space indents, Unix line endings, single quotes)

### LSP and Tools
- **LSP Management**: Mason manages LSP servers - run `:Mason` to install/manage servers
- **Available LSPs**: Currently configured for lua_ls (Lua Language Server)
- **Tool Installation**: Use `:MasonToolInstaller` to install configured tools

### Plugin Development
- **Adding Plugins**: Add new plugins to `lua/custom/plugins/` directory as separate .lua files
- **Kickstart Plugins**: Uncomment lines in init.lua to enable optional kickstart plugins:
  - `require 'kickstart.plugins.debug'`
  - `require 'kickstart.plugins.indent_line'`
  - `require 'kickstart.plugins.lint'`
  - `require 'kickstart.plugins.autopairs'`
  - `require 'kickstart.plugins.neo-tree'`
  - `require 'kickstart.plugins.gitsigns'`

## Architecture

### Configuration Philosophy
- Single-file approach (`init.lua`) for core configuration to maintain readability
- Modular plugin system via `lua/custom/plugins/` for user extensions
- Heavily documented code with explanations for learning purposes

### Key Components
- **LSP**: nvim-lspconfig with Mason for server management
- **Completion**: blink.cmp with LuaSnip for snippets
- **Fuzzy Finding**: Telescope with fzf-native for fast searching
- **Syntax Highlighting**: nvim-treesitter
- **Formatting**: conform.nvim with LSP fallback
- **UI**: which-key for keybind discovery, mini.nvim for statusline and utilities

### Keybinding Structure
- **Leader**: Space (` `)
- **LSP**: `gr` prefix (rename, references, definitions, etc.)
- **Search**: `<leader>s` prefix (files, grep, help, etc.)
- **Toggles**: `<leader>t` prefix (inlay hints, git blame, etc.)
- **Git**: `<leader>h` prefix for git hunks (when gitsigns plugin enabled)

## Custom Plugins

### Rust Development
The configuration includes `lua/custom/plugins/rust.lua` with:
- crates.nvim for Cargo.toml management
- Additional treesitter parsers for Rust
- Mason setup for Rust debugging tools
- LSP configuration for rust-analyzer

## Important Notes

- Run `:checkhealth` to diagnose configuration issues
- The configuration targets latest stable and nightly Neovim versions
- External dependencies required: git, make, unzip, C compiler, ripgrep, fd-find
- Nerd Font support can be enabled by setting `vim.g.have_nerd_font = true` in init.lua