-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

-- enable comment
comment.setup({
	pre_hook = function()
		return require("ts_context_commentstring.internal").calculate_commentstring()
	end,
})

vim.g.skip_ts_context_commentstring_module = true
