-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("folke/tokyonight.nvim")
	use("gruvbox-community/gruvbox")

	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")

	use("github/copilot.vim")

	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	use("hrsh7th/nvim-cmp")
	use("tzachar/cmp-tabnine", { run = "./install.sh" })
	use("hrsh7th/cmp-nvim-lsp")

	use({ "jose-elias-alvarez/null-ls.nvim", config = "require('null-ls-config')" })
end)
