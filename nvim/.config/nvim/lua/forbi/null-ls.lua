local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.rubocop,
	null_ls.builtins.formatting.beautysh,
	null_ls.builtins.code_actions.refactoring,
	null_ls.builtins.code_actions.eslint_d,
	null_ls.builtins.diagnostics.eslint_d,
	null_ls.builtins.diagnostics.cspell.with({
		condition = function(utils)
			return utils.root_has_file({ "cspell.json" })
		end,
	}),
	null_ls.builtins.code_actions.cspell.with({
		condition = function(utils)
			return utils.root_has_file({ "cspell.json" })
		end,
	}),
}

null_ls.setup({
	sources = sources,
})
