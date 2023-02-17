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

-- Pinned commits for stable installation
-- To update all packages
-- Set global_lock = false
-- comment out pinned (usage will result in "nil" which allows for latest commit)
-- To update single plugin, do the same but for the specific plugin
local global_lock = true
local pinned = {
	["wbthomason/packer.nvim"] = "1d0cf98a561f7fd654c970c49f917d74fafe1530",
	["nvim-lua/plenary.nvim"] = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
	["windwp/nvim-autopairs"] = "45ae3122a4c7744db41298b41f9f5a3f092123e6",
	["numToStr/Comment.nvim"] = "418d3117dab2f54c4340ea73e0070dd78fc81753",
	["nvim-tree/nvim-web-devicons"] = "bd7a222287c5828cd0607cd0a5605e52f0460074",
	["nvim-tree/nvim-tree.lua"] = "4222bb875d86a2a53069c75c4833e27f58e26d90",
	["akinsho/bufferline.nvim"] = "84b0822b2af478d0b4f7b0f9249ca218855331db",
	-- ["moll/vim-bbye"] = "25ef93ac5a87526111f43e5110675032dbcacf56",
	["nvim-lualine/lualine.nvim"] = "e99d733e0213ceb8f548ae6551b04ae32e590c80",
	["ahmedkhalf/project.nvim"] = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
	["lewis6991/impatient.nvim"] = "c90e273f7b8c50a02f956c24ce4804a47f18162e",
	["lukas-reineke/indent-blankline.nvim"] = "8299fe7703dfff4b1752aeed271c3b95281a952d",
	["kylechui/nvim-surround"] = "9739e85547cb97d2f0497d2aedbab7d6f5c6654d",
	["goolord/alpha-nvim"] = "b3eef69e95674905bf26c7740dd4bbb09b355494",
	["simrat39/rust-tools.nvim"] = "bd1aa99ffb911a1cf99b3fcf3b44c0391c57e3ef",

	-- Terminals and cod running
	["akinsho/toggleterm.nvim"] = "557664818f6af78de6192f0ce8bc2e887bf4943a",
	["CRAG666/code_runner.nvim"] = "a010649236fe245eaab2641a13228cd601499715",

	-- Colorschemes
	["folke/tokyonight.nvim"] = "a0abe53df53616d13da327636cb0bcac3ea7f5af",
	["lunarvim/darkplus.nvim"] = "1826879d9cb14e5d93cd142d19f02b23840408a6",

	-- cmp plugins
	["hrsh7th/nvim-cmp"] = "ea9eaff5739856f3187d228d2c1181ea49fd4697",
	["hrsh7th/cmp-buffer"] = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
	["hrsh7th/cmp-path"] = "91ff86cd9c29299a64f968ebb45846c485725f23",
	["saadparwaiz1/cmp_luasnip"] = "18095520391186d634a0045dacaa346291096566",
	["hrsh7th/cmp-nvim-lsp"] = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
	["hrsh7th/cmp-nvim-lua"] = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
	["hrsh7th/cmp-nvim-lsp-signature-help"] = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1",

	-- snippets
	["L3MON4D3/LuaSnip"] = "58fbfc627a93281a77f7d161d4ff702e639677b1",
	["rafamadriz/friendly-snippets"] = "1645e7cd98ed99e766c84ab3cf13a1612c77dcee",

	-- LSP
	["neovim/nvim-lspconfig"] = "649137cbc53a044bffde36294ce3160cb18f32c7",
	["williamboman/nvim-lsp-installer"] = "17e0bfa5f2c8854d1636fcd036dc8284db136baa",
	["jose-elias-alvarez/null-ls.nvim"] = "a82aa08c0063843926947f3688b0e61fd71db680",
	["RRethy/vim-illuminate"] = "49062ab1dd8fec91833a69f0a1344223dd59d643",

	-- Telescope
	["nvim-telescope/telescope.nvim"] = "203bf5609137600d73e8ed82703d6b0e320a5f36",

	-- Treesitter
	["nvim-treesitter/nvim-treesitter"] = "be26661417ae44ee11253e60afe86c51844a34ce",
	["p00f/nvim-ts-rainbow"] = "ef95c15a935f97c65a80e48e12fe72d49aacf9b9",
	["nvim-treesitter/nvim-treesitter-context"] = "895ec44f5c89bc67ba5440aef3d1f2efa3d59a41",

	-- Git
	["lewis6991/gitsigns.nvim"] = "f388995990aba04cfdc7c3ab870c33e280601109",

	-- DAP
	["mfussenegger/nvim-dap"] = "049eebe3a1609547a5d2db5ba99585212836adf5",
	["rcarriga/nvim-dap-ui"] = "ffe3e589fe2861b5ed0486832b0974e94587ae23",
	["theHamsta/nvim-dap-virtual-text"] = "8db23ea51203b5f00ad107a0cef7e0b2d7a0476c",
}

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim", commit = pinned["wbthomason/packer.nvim"], lock = global_lock }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = pinned["nvim-lua/plenary.nvim"], lock = global_lock }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = pinned["windwp/nvim-autopairs"], lock = global_lock }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = pinned["numToStr/Comment.nvim"], lock = global_lock }) -- Comment lines, "gcc"
	use({ "nvim-tree/nvim-web-devicons", commit = pinned["nvim-tree/nvim-web-devicons"], lock = global_lock }) -- Icons for nvim tree
	-- use({ "kyazdani42/nvim-web-devicons",commit=pinned[ "kyazdani42/nvim-web-devicons" ,lock = false }) -- Icons for nvim tree
	use({ "nvim-tree/nvim-tree.lua", commit = pinned["nvim-tree/nvim-tree.lua"], lock = global_lock }) -- Folder tree
	-- use({ "kyazdani42/nvim-tree.lua",commit=pinned[ "kyazdani42/nvim-tree.lua" ,lock = global_lock }) -- Folder tree
	use({ "akinsho/bufferline.nvim", commit = pinned["akinsho/bufferline.nvim"], lock = global_lock }) -- highlighting
	-- use({ "moll/vim-bbye",commit=pinned[ "moll/vim-bbye" ,lock = global_lock }) -- REMOVE?
	use({ "nvim-lualine/lualine.nvim", commit = pinned["nvim-lualine/lualine.nvim"], lock = global_lock }) -- Bottom status line
	use({ "ahmedkhalf/project.nvim", commit = pinned["ahmedkhalf/project.nvim"], lock = global_lock })
	use({ "lewis6991/impatient.nvim", commit = pinned["lewis6991/impatient.nvim"], lock = global_lock })
	use({
		"lukas-reineke/indent-blankline.nvim",
		commit = pinned["lukas-reineke/indent-blankline.nvim"],
		lock = global_lock,
	})
	use({ "kylechui/nvim-surround", commit = pinned["kylechui/nvim-surround"], lock = global_lock }) -- Tool for surrounds like ()[]{}<>
	use({ "goolord/alpha-nvim", commit = pinned["goolord/alpha-nvim"], lock = global_lock }) -- Start-up menu
	use({ "simrat39/rust-tools.nvim", commit = pinned["simrat39/rust-tools.nvim"], lock = global_lock }) --Rust tools

	-- Terminals and cod running
	use({ "akinsho/toggleterm.nvim", commit = pinned["akinsho/toggleterm.nvim"], lock = global_lock }) -- Toggle terminals within nvim
	use({ "CRAG666/code_runner.nvim", commit = pinned["CRAG666/code_runner.nvim"], lock = global_lock }) -- Code runner

	-- Colorschemes
	use({ "folke/tokyonight.nvim", commit = pinned["folke/tokyonight.nvim"], lock = global_lock })
	use({ "lunarvim/darkplus.nvim", commit = pinned["lunarvim/darkplus.nvim"], lock = global_lock })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = pinned["hrsh7th/nvim-cmp"], lock = global_lock }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = pinned["hrsh7th/cmp-buffer"], lock = global_lock }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = pinned["hrsh7th/cmp-path"], lock = global_lock }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = pinned["saadparwaiz1/cmp_luasnip"], lock = global_lock }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = pinned["hrsh7th/cmp-nvim-lsp"], lock = global_lock })
	use({ "hrsh7th/cmp-nvim-lua", commit = pinned["hrsh7th/cmp-nvim-lua"], lock = global_lock })
	use({
		"hrsh7th/cmp-nvim-lsp-signature-help",
		commit = pinned["hrsh7th/cmp-nvim-lsp-signature-help"],
		lock = global_lock,
	}) -- Show current parameter while autocompleting

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = pinned["L3MON4D3/LuaSnip"], lock = global_lock }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = pinned["rafamadriz/friendly-snippets"], lock = global_lock }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = pinned["neovim/nvim-lspconfig"], lock = global_lock }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer", commit = pinned["williamboman/nvim-lsp-installer"], lock = global_lock }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim", commit = pinned["jose-elias-alvarez/null-ls.nvim"], lock = global_lock }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", commit = pinned["RRethy/vim-illuminate"], lock = global_lock })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = pinned["nvim-telescope/telescope.nvim"], lock = global_lock }) -- Fuzzy finder

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", commit = pinned["nvim-treesitter/nvim-treesitter"], lock = global_lock }) -- Syntax highlighting
	use({ "p00f/nvim-ts-rainbow", commit = pinned["p00f/nvim-ts-rainbow"], lock = global_lock }) -- Coloring for nested scopes ([{}])
	use({
		"nvim-treesitter/nvim-treesitter-context",
		commit = pinned["nvim-treesitter/nvim-treesitter-context"],
		lock = global_lock,
	}) -- Sticky header for functions/statements

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = pinned["lewis6991/gitsigns.nvim"], lock = global_lock }) -- Tracking git repo and give some useful git commands directly from nvim

	-- DAP
	use({ "mfussenegger/nvim-dap", commit = pinned["mfussenegger/nvim-dap"], lock = global_lock }) -- Debug adapt protocol client
	use({ "rcarriga/nvim-dap-ui", commit = pinned["rcarriga/nvim-dap-ui"], lock = global_lock }) -- Debug user interface
	use({ "theHamsta/nvim-dap-virtual-text", commit = pinned["theHamsta/nvim-dap-virtual-text"], lock = global_lock }) -- Adds text for variables during debugging

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
