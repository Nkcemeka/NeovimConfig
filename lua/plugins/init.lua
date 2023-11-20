-- This file returns all of the 
-- plugs I need, muhahaha!

return{
	-- Catppuccin colorscheme plugin
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- Mason Plugin (helps to manage LSP servers, DSP servers, Linters
	-- & Formatters). I will use mason-lspconfig due to issues with 
	-- original
	{
          "williamboman/mason.nvim",
	},

	{
	  "williamboman/mason-lspconfig.nvim",
	},

	{
	  "neovim/nvim-lspconfig",
	},
	
	-- Installs nvim-lint to provide 
	-- linting support
	{
	  "mfussenegger/nvim-lint",
	},

	-- Install nvim-cmp dependencies for nvim-cmp
	{"hrsh7th/cmp-nvim-lsp",},
	{'hrsh7th/cmp-buffer',},
	{'hrsh7th/cmp-path',},
	{'hrsh7th/cmp-cmdline',},
	{'hrsh7th/nvim-cmp',},

	-- Install nvim-tree to get the file explorer functionality
	{"nvim-tree/nvim-tree.lua",},
	{"nvim-tree/nvim-web-devicons",},

	-- Install nvim telescope the fuzzy finder
	{
          'nvim-telescope/telescope.nvim', tag = '0.1.2',
          dependencies = { 'nvim-lua/plenary.nvim' },
        },

        -- Install vsnip
        {'hrsh7th/vim-vsnip',},
        {'hrsh7th/vim-vsnip-integ',},

        -- Install Copilot
        {"github/copilot.vim",},
}
