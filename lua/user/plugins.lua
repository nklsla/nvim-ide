local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print(packer)
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local snapshot = "20240218"
-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim", config = { snapshot = snapshot } }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", config = { snapshot = snapshot } }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", config = { snapshot = snapshot } }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", config = { snapshot = snapshot } }) -- Comment lines, "gcc"
	use({ "nvim-tree/nvim-web-devicons", config = { snapshot = snapshot } }) -- Icons for nvim tree
	use({ "nvim-tree/nvim-tree.lua", config = { snapshot = snapshot } }) -- Folder tree
	use({ "akinsho/bufferline.nvim", config = { snapshot = snapshot } }) -- highlighting
	use({ "nvim-lualine/lualine.nvim", config = { snapshot = snapshot } }) -- Bottom status line
	use({ "ahmedkhalf/project.nvim", config = { snapshot = snapshot } })
	use({ "lewis6991/impatient.nvim", config = { snapshot = snapshot } })
	use({ "lukas-reineke/indent-blankline.nvim", config = { snapshot = snapshot } })
	use({ "kylechui/nvim-surround", config = { snapshot = snapshot } }) -- Tool for surrounds like ()[]{}<>
	use({ "goolord/alpha-nvim", config = { snapshot = snapshot } }) -- Start-up menu
	use({ "simrat39/rust-tools.nvim", config = { snapshot = snapshot } }) --Rust tools
	-- use({ "mrcjkb/rustaceanvim", config = { snapshot = snapshot } }) --Rust tool

	-- Terminals and cod running
	use({ "akinsho/toggleterm.nvim", config = { snapshot = snapshot } }) -- Toggle terminals within nvim
	use({ "CRAG666/code_runner.nvim", config = { snapshot = snapshot } }) -- Code runner

	-- Colorschemes
	use({ "folke/tokyonight.nvim", config = { snapshot = snapshot } })
	use({ "lunarvim/darkplus.nvim", config = { snapshot = snapshot } })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", config = { snapshot = snapshot } }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", config = { snapshot = snapshot } }) -- buffer completions
	use({ "hrsh7th/cmp-path", config = { snapshot = snapshot } }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", config = { snapshot = snapshot } }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", config = { snapshot = snapshot } })
	use({ "hrsh7th/cmp-nvim-lua", config = { snapshot = snapshot } })
	use({
		"hrsh7th/cmp-nvim-lsp-signature-help",
		config = { snapshot = snapshot },
	}) -- Show current parameter while autocompleting

	-- snippets
	use({ "L3MON4D3/LuaSnip", config = { snapshot = snapshot } }) --snippet engine
	use({ "rafamadriz/friendly-snippets", config = { snapshot = snapshot } }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", config = { snapshot = snapshot } }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer", config = { snapshot = snapshot } }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim", config = { snapshot = snapshot } }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", config = { snapshot = snapshot } })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", config = { snapshot = snapshot } }) -- Fuzzy finder

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", config = { snapshot = snapshot } }) -- Syntax highlighting
	use({ "p00f/nvim-ts-rainbow", config = { snapshot = snapshot } }) -- Coloring for nested scopes ([{}])
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = { snapshot = snapshot },
	}) -- Sticky header for functions/statements

	-- Git
	use({ "lewis6991/gitsigns.nvim", config = { snapshot = snapshot } }) -- Tracking git repo and give some useful git commands directly from nvim

	-- DAP
	use({ "mfussenegger/nvim-dap", config = { snapshot = snapshot } }) -- Debug adapt protocol client
	use({ "rcarriga/nvim-dap-ui", config = { snapshot = snapshot } }) -- Debug user interface
	use({ "theHamsta/nvim-dap-virtual-text", config = { snapshot = snapshot } }) -- Adds text for variables during debugging
	use({ "nvim-neotest/nvim-nio", config = { snapshot = snapshot } }) -- Asyncroneous

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		config = { snapshot = snapshot },
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
