vim.api.nvim_create_augroup("JSLogMacro", { clear = true })
vim.api.nvim_create_augroup("LuaLogMacro", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = "JSLogMacro",
	pattern = { "javascript", "typescript", "reacttypescript", "javascriptreact", "typescriptreact" },
	callback = function()
		vim.fn.setreg("l", "oconsole.log('jkpa:', jkpa)jk")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = "LuaLogMacro",
	pattern = { "lua", "mlua" },
	callback = function()
		vim.fn.setreg("l", "oprint('jkpa:', jkpa)jk")
	end,
})

vim.keymap.set("v", "<A-S-l>", "y@l")
