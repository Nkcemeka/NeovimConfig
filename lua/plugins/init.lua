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
}
