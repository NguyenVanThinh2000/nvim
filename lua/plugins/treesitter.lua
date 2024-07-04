local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
	ensure_installed = {
		"lua",
		"tsx",
		"javascript",
		"typescript",
		"vim",
		"prisma",
		"vue",
		"html",
		"json",
		"scss",
		"css",
		"markdown",
		"markdown_inline",
		"dart",
	},
	highlight = { enable = true },
	indent = { enable = true },
	auto_install = true,

	-- commentstring
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
