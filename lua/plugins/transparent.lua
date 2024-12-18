require("transparent").setup({
	auto = true,
	extra_groups = {
		"NormalFloat",
		"Pmenu",
		"NvimTreeNormal",
	},
	excludes = { "BufferLine" },
})
require("transparent").clear_prefix("BufferLine")

vim.keymap.set("n", "tp", ":TransparentEnable<CR>", { noremap = true, nowait = true })
