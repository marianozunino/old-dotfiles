require("lualine").setup({
	options = { theme = "codedark" },
})

require("Comment").setup({
	opleader = {
		line = "gc",
		block = "gb",
	},
	mappings = {
		basic = true,
	},
})

require("nvim-lastplace").setup({})

local neogit = require("neogit")
neogit.setup({
	integrations = {
		diffview = true,
	},
})

require("bufferline").setup({})
