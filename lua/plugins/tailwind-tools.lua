require("tailwind-tools").setup()

require("tw-values").setup({
	border = "rounded", -- Valid window border style,
	show_unknown_classes = true, -- Shows the unknown classes popup
	focus_preview = false, -- Sets the preview as the current window
	copy_register = "", -- The register to copy values to
	keymaps = {
		copy = "<C-y>", -- Normal mode keymap to copy the CSS values between {}, work only in case of copy_register = true
	},
})

vim.keymap.set("n", "tw", ":TWValues<cr>", { silent = true })
