return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.diagnostic.config({
			virtual_text = { prefix = "●", spacing = 4 },
			signs = true,
			underline = true,
			update_in_insert = false,
			float = { border = "rounded", source = "always" },
		})

		local on_attach = function(_, bufnr)
			local m = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end
			m("n", "gd", vim.lsp.buf.definition, "Go to definition")
			m("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
			m("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
			m("n", "gt", vim.lsp.buf.type_definition, "Type definition")
			m("n", "gr", vim.lsp.buf.references, "References")
			m("n", "K", vim.lsp.buf.hover, "Hover docs")
			m("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
			m("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
			m("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
		end

		lspconfig.gopls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				gopls = {
					gofumpt = true,
					staticcheck = true,
					usePlaceholders = true,
					completeUnimported = true,
					analyses = {
						unusedparams = true,
						shadow = true,
						nilness = true,
						unusedwrite = true,
						useany = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					codelenses = {
						gc_details = true,
						generate = true,
						test = true,
						tidy = true,
					},
				},
			},
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
					diagnostics = { globals = { "vim" } },
					telemetry = { enable = false },
				},
			},
		})
	end,
}
