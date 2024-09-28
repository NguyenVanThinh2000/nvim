local opt = vim.opt -- for conciseness
opt.number = true -- shows absolute line number on cursor line (when relative number is on)options
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false -- disable line wrapping
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.cursorline = true -- highlight the current cursor line
opt.termguicolors = true -- enable 24-bit RGB colors
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.iskeyword:append("-") -- consider string-string as whole word
vim.opt.spelllang = "en_us"
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.spell = false
vim.opt.laststatus = 3
-- vim.opt.laststatus = 0
-- opt.relativenumber = true -- show relative line numbers
-- opt.background = "dark" -- colorschemes that can be light or dark will be made dark
