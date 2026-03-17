return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
				icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = { "gopls", "lua_ls" },
		})
	end,
}
