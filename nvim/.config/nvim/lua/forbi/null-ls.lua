local null_ls = require("null-ls")

local use_null = true

if use_null then
	null_ls.setup({
		sources = {
			null_ls.builtins.diagnostics.eslint_d,
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.rubocop,
			-- require("null-ls").builtins.diagnostics.cspell,
		},
	})
end
