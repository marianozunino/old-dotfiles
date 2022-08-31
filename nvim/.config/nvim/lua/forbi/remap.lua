local nnoremap = require("forbi.keymap").nnoremap
local inoremap = require("forbi.keymap").inoremap
local dev_folders = require("forbi.telescope").dev_folders

nnoremap("<leader>tt", function()
	dev_folders()
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
nnoremap("<leader>n", ":NvimTreeToggle<cr>")

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
