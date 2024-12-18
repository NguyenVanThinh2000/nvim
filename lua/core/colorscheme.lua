-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- local status, _ = pcall(vim.cmd, "colorscheme nord")
-- local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
local status, _ = pcall(vim.cmd, "colorscheme dracula")
-- local status, _ = pcall(vim.cmd, "colorscheme palenight")
-- local status, _ = pcall(vim.cmd, "colorscheme monokai-pro-classic")
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-storm")
-- local status, _ = pcall(vim.cmd, "colorscheme solarized-osaka-storm")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

require("solarized-osaka").setup({
	transparent = true,
	terminal_colors = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})

require("tokyonight").setup({
	transparent = vim.g.transparent_enabled,
	styles = {
		background = "transparent",
		sidebars = "transparent",
	},
})
