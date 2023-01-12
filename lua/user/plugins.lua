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

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	-- updates are locked
	use({ "wbthomason/packer.nvim", lock = true }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", lock = true }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", lock = true }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", lock = true }) -- Comment lines, "gcc"
	use({ "kyazdani42/nvim-web-devicons", lock = true }) -- Icons for nvim tree
	use({ "kyazdani42/nvim-tree.lua", lock = true }) -- Folder tree
	use({ "akinsho/bufferline.nvim", lock = true }) -- highlighting
	use({ "moll/vim-bbye", lock = true })
	use({ "nvim-lualine/lualine.nvim", lock = true }) -- Bottom status line
	use({ "ahmedkhalf/project.nvim", lock = true })
	use({ "lewis6991/impatient.nvim", lock = true })
	use({ "lukas-reineke/indent-blankline.nvim", lock = true })
	use({ "kylechui/nvim-surround", lock = true }) -- Tool for surrounds like ()[]{}<>
	use({ "goolord/alpha-nvim", lock = true }) -- Start-up menu
	use({ "simrat39/rust-tools.nvim", lock = true }) --Rust tools

	-- Terminals and cod running
	use({ "akinsho/toggleterm.nvim", lock = true }) -- Toggle terminals within nvim
	use({ "CRAG666/code_runner.nvim", lock = true }) -- Code runner

	-- Colorschemes
	use({ "folke/tokyonight.nvim", lock = true })
	use({ "lunarvim/darkplus.nvim", lock = true })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", lock = true }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", lock = true }) -- buffer completions
	use({ "hrsh7th/cmp-path", lock = true }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", lock = true }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", lock = true })
	use({ "hrsh7th/cmp-nvim-lua", lock = true })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help", lock = true }) -- Show current parameter while autocompleting

	-- snippets
	use({ "L3MON4D3/LuaSnip", lock = true }) --snippet engine
	use({ "rafamadriz/friendly-snippets", lock = true }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", lock = true }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer", lock = true }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim", lock = true }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", lock = true })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", lock = true }) -- Fuzzy finder

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", lock = true }) -- Syntax highlighting
	use({ "p00f/nvim-ts-rainbow", lock = true }) -- Coloring for nested scopes ([{}])
	use({ "nvim-treesitter/nvim-treesitter-context", lock = true }) -- Sticky header for functions/statements

	-- Git
	use({ "lewis6991/gitsigns.nvim", lock = true }) -- Tracking git repo and give some useful git commands directly from nvim

	-- DAP
	use({ "mfussenegger/nvim-dap", lock = true }) -- Debug adapt protocol client
	use({ "rcarriga/nvim-dap-ui", lock = true }) -- Debug user interface
	use({ "theHamsta/nvim-dap-virtual-text", lock = true }) -- Adds text for variables during debugging

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
