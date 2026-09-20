local ok = pcall(require, "gruber-darker")
if not ok then
	return
end

require("gruber-darker").setup({
	bold = true,
	italic = { strings = true, comments = true },
	undercurl = true,
})

vim.cmd.colorscheme("gruber-darker")

-- Softer green
local soft_green = "#8faa4b"

vim.api.nvim_set_hl(0, "String", { fg = soft_green })
vim.api.nvim_set_hl(0, "SpecialString", { fg = soft_green })
vim.api.nvim_set_hl(0, "Character", { fg = soft_green })
