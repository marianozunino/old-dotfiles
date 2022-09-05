-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- treesitter stuff
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context") -- Sticky header (class, for, function, etc)
	use("windwp/nvim-ts-autotag") -- Close html tags automagically

	-- Telescope stuff
	use("nvim-telescope/telescope.nvim")
	use("gbrlsnchs/telescope-lsp-handlers.nvim")
	use("xiyaowong/telescope-emoji.nvim")

	--
	-- LSP stuff
	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	use("jose-elias-alvarez/null-ls.nvim")

	-- Completion stuff
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind.nvim")
	use("github/copilot.vim")

	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")

	-- Lua line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- use({
	-- 	"kyazdani42/nvim-tree.lua",
	-- 	requires = {
	-- 		"kyazdani42/nvim-web-devicons", -- optional, for file icons
	-- 	},
	-- 	tag = "nightly", -- optional, updated every week. (see issue #1193)
	-- })

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	use("numToStr/Comment.nvim") --  Commenting plugin

	--
	-- GIT:
	use("TimUntersberger/neogit")
	use("sindrets/diffview.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	}) -- display git signs in the buffer

	use("ethanholz/nvim-lastplace")

	-- Make it look pretty with buffer headers
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

	-- debugger
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("leoluz/nvim-dap-go")
	use("David-Kunz/jester")

	-- Handle LSP, Linters, and Formatters for me
	use({ "williamboman/mason.nvim" })
	use("WhoIsSethDaniel/mason-tool-installer.nvim")

	--
	use("ThePrimeagen/harpoon")
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- Load nvim quicker using cache
	use("lewis6991/impatient.nvim")

	-- Some themes
	use("sainnhe/gruvbox-material")

	-- Markdown, Mermaid, etc
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Pretty csv
	use("mechatroner/rainbow_csv")
	use("lingnand/pandoc-preview.vim")

	--Grammar checking because I can't english
	use("rhysd/vim-grammarous")

	use("wakatime/vim-wakatime")
end)
