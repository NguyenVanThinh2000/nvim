-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
-----------
--------------------- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

local opts = { noremap = true, silent = true }
local opts_remap = { remap = true }

-- clear search highlights
keymap.set("n", "<leader>hh", ":nohl<CR>", opts)

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", opts) -- increment
keymap.set("n", "<leader>-", "<C-x>", opts) -- decrement

-- window management
keymap.set("n", "sv", "<C-w>v", opts) -- split window vertically
keymap.set("n", "sh", "<C-w>s", opts) -- split window horizontally
keymap.set("n", "se", "<C-w>=", opts) -- make split windows equal width & height
keymap.set("n", "sx", ":close<CR>", opts) -- close current split window

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Save file
keymap.set("n", "<C-s>", ":w<cr>", opts)
keymap.set("n", "<leader>w", ":w<cr>", opts)
keymap.set("i", "<C-s>", "<ESC>:w<cr>", opts)

-- Duplicate line
keymap.set("n", "<C-d>", "yyp", opts)

-- Move lines and group lines up, down for windows
keymap.set("n", "<A-k>", ":m .-2<cr>", opts)
keymap.set("n", "<A-j>", ":m .+1<cr>", opts)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)

-- move quickly up and down
keymap.set("n", "<S-j>", ":+5<cr>", opts)
keymap.set("n", "<S-k>", ":-5<cr>", opts)

-- move to first or last charactor of the line
keymap.set("n", "<S-l>", "$", opts)
keymap.set("v", "<S-l>", "$", opts)
keymap.set("n", "<S-h>", "^", opts)
keymap.set("v", "<S-h>", "^", opts)

-- delete all word at current cursor
keymap.set("n", "dw", "daw", opts)

-- comment line
keymap.set("n", "<leader>/", "gcc", opts_remap) -- toggle comment on current line
keymap.set("v", "<leader>/", "gc", opts_remap) -- toggle comment on current line

-- switch windows
keymap.set("n", "<C-h>", ":wincmd h<cr>", opts)
keymap.set("n", "<C-j>", ":wincmd j<cr>", opts)
keymap.set("n", "<C-k>", ":wincmd k<cr>", opts)
keymap.set("n", "<C-l>", ":wincmd l<cr>", opts)

-- select word
keymap.set("n", "sw", "viw")

-- copy word
keymap.set("n", "yw", "viwy")

-- delete word and insert mode
keymap.set("n", "di", '"_ciw', opts)

keymap.set("v", "p", '"_dP', opts)

keymap.set("n", "dd", '"_dd', opts)

keymap.set("n", "<leader>q", ":bd<cr>", opts)

-- keymap.set("v", "d", '"_d', opts)

-- git
keymap.set("n", "<leader>gd", ":Gitsigns diffthis<cr>", opts)
keymap.set("n", "<C-S-right>", ":NvimTreeResize +5<cr>", opts)
keymap.set("n", "<C-S-left>", ":NvimTreeResize -5<cr>", opts)

-- replace word
keymap.set("n", "<leader>ra", ":%s/\\<<C-r><C-w>\\>//g<left><left>", opts)
keymap.set("v", "<leader>ra", ":s/\\<<C-r><C-w>\\>//g<left><left>", opts)
keymap.set("n", "<leader>rw", ":%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>", opts)
keymap.set("v", "<leader>rw", ":s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>", opts)
