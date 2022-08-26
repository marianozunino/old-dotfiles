-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- use("folke/tokyonight.nvim")
	use("gruvbox-community/gruvbox")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	use("nvim-telescope/telescope.nvim")
	use("gbrlsnchs/telescope-lsp-handlers.nvim")

	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	-- use({
	-- 	"zbirenbaum/copilot-cmp",
	-- 	module = "copilot_cmp",
	-- })
	use("onsails/lspkind.nvim")
	use("github/copilot.vim")

	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")

	use("jose-elias-alvarez/null-ls.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use("numToStr/Comment.nvim")

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	--
	-- GIT:
	use("TimUntersberger/neogit")
	use("sindrets/diffview.nvim")

	-- use("github/copilot.vim")
	-- use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	event = { "VimEnter" },
	-- 	config = function()
	-- 		vim.defer_fn(function()
	-- 			require("copilot").setup({
	-- 				ft_disable = {
	-- 					"dap-repl",
	-- 				},
	-- 			})
	-- 		end, 100)
	-- 	end,
	-- })
	use("ethanholz/nvim-lastplace")

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

	-- debugger
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("leoluz/nvim-dap-go")
	use("David-Kunz/jester")

	use({ "williamboman/mason.nvim" })
	use("WhoIsSethDaniel/mason-tool-installer.nvim")
end)
