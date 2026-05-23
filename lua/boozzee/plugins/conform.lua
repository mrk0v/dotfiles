return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "goimports" },
				lua = { "stylua" },
				json = { "jq" },
				yaml = { "yamlfmt" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = false,
			},
		})
	end,
}