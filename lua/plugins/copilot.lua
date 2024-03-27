-- vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- require("copilot").setup({
-- 	suggestion = { enabled = false },
-- 	panel = { enabled = false },
-- })
