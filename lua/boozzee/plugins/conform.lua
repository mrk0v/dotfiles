return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "goimports", "gofumpt" },
				lua = { "stylua" },
				json = { "jq" },
				yaml = { "yamlfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "never",
			},
			notify_on_error = true,
		})
	end,
}
