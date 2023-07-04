-- Main init.lua for neovim

-- Change mapleader to allow for Telescope key mappings
vim.g.mapleader = " "

-- **** Bootstrap Lazy Plugin ****
-- set installation path for lazy 
-- data path for nvim should be ~/.local/share/nvim and it appends
-- lazy/lazy.nvim to it. lazy.nvim is our plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"


if not vim.loop.fs_stat(lazypath) then -- checks if lazy is installed
  -- Download vim from git via a clone and get stable release
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath) -- Add the cloned plugin to runtime path of nvim


-- Load the lazy module with require and call the setup method
-- from the lazy module
-- plugins is a table that contains name of plugin, url to git repo
-- , branch (otional) and config (Lua function to configure plugin)
-- opts is an optional arg to setup and includes options for the lazy.nvim plugin
-- auto_reload sets auto reload for plugins when updated, lazy_load
-- determines lazy-load of plugins by default and log_level which
-- is log level for plugin.
require("lazy").setup("plugins")

-- Require keymaps and options
require("keymaps.keymap")
require("options.opt")

-- Activate necessary plugins
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()
-- After setting up mason-lspconfig you may set up servers via lspconfig
--require("lspconfig").ruff_lsp.setup {}
require("lspconfig").jedi_language_server.setup {}
-- ~/.local/share/nvim/mason/packages/python-lsp-server/venv/pyvenv.cfg 
-- The path above can be edited to set site-packages as true/false. If
-- false, some libraries will be missing for python
require("lspconfig").clangd.setup {}


-- Set up nvim-lint for linting
require('lint').linters_by_ft = {
  markdown = {'vale',},
  python = {'pylint'},
  cpp = {'cpplint'},
}
-- autocmd to trigger linting
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- autocmd to trigger linting as I change text
--vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
--  callback = function()
--    require("lint").try_lint()
--  end,
--})

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['jedi_language_server'].setup {
  capabilities = capabilities
}


-- Setup colorscheme
vim.cmd.colorscheme "catppuccin"

-- Setup file explorer with Nvim 
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

