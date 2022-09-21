local nnoremap = require("forbi.keymap").nnoremap
local inoremap = require("forbi.keymap").inoremap
local vnoremap = require("forbi.keymap").vnoremap
local dev_folders = require("forbi.telescope").dev_folders

nnoremap("<leader>tt", function()
	dev_folders()
end)

nnoremap("<leader>qr", function()
	R("forbi")
end)

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("Y", "yy")
nnoremap("?", "?\\v")
nnoremap("/", "/\\v")

nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")

nnoremap("<c-s>", ":w<CR>")
inoremap("<c-s>", "<Esc>:w<CR>")

nnoremap("<leader>gf", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ") })
end)

nnoremap("<C-p>", function()
	local utils = require("telescope.utils")
	local _, ret, _ = utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
	if ret == 0 then
		require("telescope.builtin").git_files({
			show_untracked = true,
			git_command = {
				"git",
				"ls-files",
				"--exclude-standard",
				"--cached",
				"-x",
				"!*.tfvars",
				"-x",
				"!.env",
			},
		})
	else
		require("telescope.builtin").find_files()
	end
end)

nnoremap("<leader>gw", function()
	require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end)

nnoremap(";", require("telescope.builtin").buffers)
nnoremap("<leader>vh", require("telescope.builtin").help_tags)
-- nnoremap("<leader>n", require("telescope.builtin").help_tags)
nnoremap("<leader>n", ":NeoTreeRevealToggle<cr>")

nnoremap("<space>vv", ":DiffviewOpen ")

nnoremap("<leader>gs", function()
	require("neogit").open()
end)
nnoremap("<leader>gc", function()
	require("neogit").open({ "commit" })
end)

nnoremap("<leader>m", ":Telescope marks<cr>")
nnoremap("<leader>gr", ":Telescope lsp_references<cr>")
nnoremap("<leader><leader>", "<c-^>")

-- jester
nnoremap("<leader>jr", ":lua require('jester').run()<CR>")
nnoremap("<leader>jd", ":lua require('jester').debug()<CR>")

nnoremap("<M-h>", ":vertical resize +3<CR>")
nnoremap("<M-l>", ":vertical resize -3<CR>")
nnoremap("<M-j>", ":resize +3<CR>")
nnoremap("<M-k>", ":resize -3<CR>")
--
-- create a user command to exit all buffers without saving
vim.api.nvim_create_user_command("Q", function()
	vim.api.nvim_command("bd!|qall!")
end, { nargs = 0 })

nnoremap("<leader>a", require("harpoon.mark").add_file, { silent = true })
nnoremap("<C-h>", require("harpoon.ui").toggle_quick_menu, { silent = true })
nnoremap("<leader>tc", require("harpoon.cmd-ui").toggle_quick_menu, { silent = true })

nnoremap("<leader>y", function()
	require("harpoon.ui").nav_file(1)
end, { silent = true })

nnoremap("<leader>u", function()
	require("harpoon.ui").nav_file(2)
end, { silent = true })

nnoremap("<leader>i", function()
	require("harpoon.ui").nav_file(3)
end, { silent = true })

nnoremap("<leader>o", function()
	require("harpoon.ui").nav_file(4)
end, { silent = true })

-- move lines
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
