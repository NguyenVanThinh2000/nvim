local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-H>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-C>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
