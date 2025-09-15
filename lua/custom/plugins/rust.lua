return {
  -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/lang/rust.lua
  -- LSP for Cargo.toml
  {
    'Saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },

    opts = {

      completion = {

        crates = {
          enabled = true,
        },
      },

      lsp = {

        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
  -- Add Rust & related to treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'rust', 'ron' } },
  },

  -- Ensure Rust debugger is installed
  {
    'mason-org/mason.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 'codelldb' })
      if diagnostics == 'bacon-ls' then
        vim.list_extend(opts.ensure_installed, { 'bacon' })
      end
    end,
  },

  -- Correctly setup lspconfig for Rust 🚀
  {
    'neovim/nvim-lspconfig',

    opts = {

      servers = {
        bacon_ls = {

          enabled = diagnostics == 'bacon-ls',
        },
        rust_analyzer = { enabled = false },
      },
    },
  },
  {
    'nvim-neotest/neotest',
    optional = true,

    opts = {

      adapters = {
        ['rustaceanvim.neotest'] = {},
      },
    },
  },
}
