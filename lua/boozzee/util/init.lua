local M = {}

M.shell = function(cmd)
	local handle = io.popen(cmd)
	if not handle then return "" end
	local result = handle:read("*a")
	handle:close()
	return result:gsub("%s+$", "")
end

M.has_bin = function(name)
	return vim.fn.executable(name) == 1
end

return M
