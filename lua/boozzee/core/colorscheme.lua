local ok, tokyonight = pcall(require, "tokyonight")
if not ok then
	return
end

tokyonight.setup({
	style = "night",
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	sidebars = { "qf", "help", "NvimTree", "terminal" },
	on_highlights = function(hl, _)
		hl.Visual = { bg = "#364a82" }
		hl.CursorLine = { bg = "#1e2030" }
	end,
})

vim.cmd.colorscheme("tokyonight-night")
