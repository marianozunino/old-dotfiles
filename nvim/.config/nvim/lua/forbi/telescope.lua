local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local utils = require("telescope.utils")
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
--
-- require("telescope").load_extension("file_browser")
require("telescope").setup({
	pickers = {
		buffers = {
			sort_lastused = true,
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})

require("telescope").load_extension("lsp_handlers")
require("telescope").load_extension("emoji")
require("telescope.builtin").quickfix()

local M = {}

function M.dev_folders()
	local name = "Development"
	local cmd = {
		vim.o.shell,
		"-c",
		"/bin/fd --base-directory ~/Development --search-path . -t d -d 2 2>/dev/null",
	}
	pickers
		.new(require("telescope.themes").get_dropdown({}), {
			prompt_title = name,
			finder = finders.new_table({ results = utils.get_os_command_output(cmd) }),
			sorter = sorters.get_fuzzy_file(),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local command =
						string.format("nohup sh -c 'cd %s && %s", "~/Development/" .. selection[1], "code .' && disown")
					local file = assert(io.popen(command, "r"))
					file:close()
				end)
				return true
			end,
		})
		:find()
end

return M
