local nnoremap = require("forbi.keymap").nnoremap
local utils = require('telescope.utils')

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("Y", "yy")
nnoremap("?", "?\\v")
nnoremap("/", "/\\v")

nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")

nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})

end)

nnoremap("<C-p>", function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' }) 
    if ret == 0 then 
			require('telescope.builtin').git_files()
    else 
			require('telescope.builtin').find_files()
    end 
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)

nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)



