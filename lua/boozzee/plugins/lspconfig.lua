return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Диагностика
		vim.diagnostic.config({
			virtual_text = { prefix = "●", spacing = 4 },
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = { border = "rounded", source = "always" },
		})

		-- Общие keymaps при attach к любому LSP
		local on_attach = function(_, bufnr)
			local m = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
			end
			m("n", "gd",         vim.lsp.buf.definition,     "Go to definition")
			m("n", "gD",         vim.lsp.buf.declaration,    "Go to declaration")
			m("n", "gi",         vim.lsp.buf.implementation, "Go to implementation")
			m("n", "gt",         vim.lsp.buf.type_definition,"Type definition")
			m("n", "gr",         vim.lsp.buf.references,     "References")
			m("n", "K",          vim.lsp.buf.hover,          "Hover docs")
			m("n", "<leader>ca", vim.lsp.buf.code_action,    "Code action")
			m("n", "<leader>rn", vim.lsp.buf.rename,         "Rename symbol")
			m("i", "<C-k>",      vim.lsp.buf.signature_help, "Signature help")
		end

		-- Настройки серверов
		local servers = {
			gopls = {
				gopls = {
					gofumpt = true,
					staticcheck = true,
					usePlaceholders = true,
					completeUnimported = true,
					analyses = {
						unusedparams  = true,
						shadow         = true,
						nilness        = true,
						unusedwrite    = true,
						useany         = true,
					},
					hints = {
						assignVariableTypes    = true,
						compositeLiteralFields = true,
						constantValues         = true,
						functionTypeParameters = true,
						parameterNames         = true,
						rangeVariableTypes     = true,
					},
					codelenses = {
						gc_details = true,
						generate   = true,
						test       = true,
						tidy       = true,
					},
				},
			},

			lua_ls = {
				Lua = {
					runtime   = { version = "LuaJIT" },
					workspace = {
						checkThirdParty = false,
						library = vim.api.nvim_get_runtime_file("", true),
					},
					diagnostics = { globals = { "vim" } },
					telemetry   = { enable = false },
					format      = { enable = false }, -- форматируем через stylua/conform
				},
			},

			jsonls = {
				json = {
					schemas  = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},

			yamlls = {
				yaml = {
					schemas   = require("schemastore").yaml.schemas(),
					validate  = true,
					format    = { enable = false }, -- форматируем через yamlfmt/conform
					schemaStore = { enable = false, url = "" },
				},
			},
		}

		-- mason-lspconfig автоматически настраивает серверы через handlers
		require("mason-lspconfig").setup({
			handlers = {
				-- Дефолтный handler для всех серверов
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach    = on_attach,
						settings     = servers[server_name] or {},
					})
				end,

				-- Специальный handler для jsonls (нужен schemastore)
				jsonls = function()
					local ok, schemastore = pcall(require, "schemastore")
					lspconfig.jsonls.setup({
						capabilities = capabilities,
						on_attach    = on_attach,
						settings     = ok and servers.jsonls or {},
					})
				end,

				-- Специальный handler для yamlls (нужен schemastore)
				yamlls = function()
					local ok, schemastore = pcall(require, "schemastore")
					lspconfig.yamlls.setup({
						capabilities = capabilities,
						on_attach    = on_attach,
						settings     = ok and servers.yamlls or {},
					})
				end,
			},
		})
	end,
}
