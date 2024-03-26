-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
     -----------
--------------------- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

local opts = { noremap = true, silent = true }

-- clear search highlights
keymap.set("n", "<leader>hh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "sv", "<C-w>v") -- split window vertically
keymap.set("n", "sh", "<C-w>s") -- split window horizontally
keymap.set("n", "se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "sx", ":close<CR>") -- close current split window

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file
keymap.set("n", "<C-s>", ":w<cr>")
keymap.set("n", "<leader>w", ":w<cr>")
keymap.set("i", "<C-s>", "<ESC>:w<cr>")

-- Duplicate line
keymap.set("n", "<C-d>", "yyp")

-- Move lines and group lines up, down for windows
keymap.set("n", "<A-k>", ":m .-2<cr>")
keymap.set("n", "<A-j>", ":m .+1<cr>")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- move quickly up and down
keymap.set("n", "<S-j>", ":+5<cr>", { noremap = true, silent = true })
keymap.set("n", "<S-k>", ":-5<cr>", { noremap = true, silent = true })

-- move to first or last charactor of the line
keymap.set("n", "<S-l>", "$")
keymap.set("v", "<S-l>", "$")
keymap.set("n", "<S-h>", "^")
keymap.set("v", "<S-h>", "^")

-- delete all word at current cursor
keymap.set("n", "dw", "daw")

-- comment line
keymap.set("n", "<leader>/", "gcc", { remap = true }) -- toggle comment on current line
keymap.set("v", "<leader>/", "gc", { remap = true }) -- toggle comment on current line


-- switch windows
keymap.set("n", "<C-h>", ":wincmd h<cr>", opts)
keymap.set("n", "<C-j>", ":wincmd j<cr>", opts)
keymap.set("n", "<C-k>", ":wincmd k<cr>", opts)
keymap.set("n", "<C-l>", ":wincmd l<cr>", opts)
