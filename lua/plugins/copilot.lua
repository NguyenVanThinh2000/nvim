-- vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
--
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- require("copilot").setup({
-- 	suggestion = { enabled = false },
-- 	panel = { enabled = false },
-- })

local opts = { noremap = true, silent = true }
require("CopilotChat").setup({})
vim.keymap.set({ "n", "v" }, "<leader>cq", function()
	local input = vim.fn.input("Quick chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, {
			selection = require("CopilotChat.select").buffer,
		})
	end
end, opts)
vim.keymap.set({ "n", "v" }, "<leader>cc", ":CopilotChat<CR>", opts)
vim.keymap.set({ "n", "v" }, "<leader>cs", ":CopilotChatStop<CR>", opts)
vim.keymap.set({ "n", "v" }, "<leader>ce", ":CopilotChatExplain<CR>", opts)
vim.keymap.set({ "n", "v" }, "<leader>cf", ":CopilotChatFix<CR>", opts)
vim.keymap.set({ "n", "v" }, "<leader>co", ":CopilotChatOptimize<CR>", opts)
