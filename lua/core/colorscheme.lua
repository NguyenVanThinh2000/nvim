-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- local status, _ = pcall(vim.cmd, "colorscheme nord")
-- local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
-- local status, _ = pcall(vim.cmd, "colorscheme dracula")
-- local status, _ = pcall(vim.cmd, "colorscheme palenight")
-- local status, _ = pcall(vim.cmd, "colorscheme monokai-pro-classic")
local status, _ = pcall(vim.cmd, "colorscheme tokyonight-storm")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
