-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
---------------------
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
keymap.set("n", "<A-S-j>", "yyp", opts)
-- Duplicate line in visual mode
keymap.set("v", "<A-S-j>", "yP", opts)

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
keymap.set("v", "<S-l>", "$h", opts)
keymap.set("n", "<S-h>", "^", opts)
keymap.set("v", "<S-h>", "^", opts)

-- delete all word at current cursor
keymap.set("n", "dw", "diw", opts)

-- comment line
keymap.set("n", "<leader>/", "gcc", opts_remap) -- toggle comment on current line
keymap.set("v", "<leader>/", "gc", opts_remap) -- toggle comment on current line

-- switch windows
-- keymap.set("n", "<C-h>", ":wincmd h<cr>", opts)
-- keymap.set("n", "<C-j>", ":wincmd j<cr>", opts)
-- keymap.set("n", "<C-k>", ":wincmd k<cr>", opts)
-- keymap.set("n", "<C-l>", ":wincmd l<cr>", opts)

-- select word
keymap.set("n", "sw", "viw")

-- copy word
keymap.set("n", "yw", "viwy")

-- delete word and insert mode
keymap.set("n", "di", '"_ciw', opts)

keymap.set("v", "p", '"_dP', opts)

keymap.set("n", "dd", '"_dd', opts)

keymap.set("n", "<leader>q", ":q!<cr>", opts)

-- keymap.set("v", "d", '"_d', opts)

-- git
keymap.set("n", "<S-right>", ":NvimTreeResize +5<cr>", opts)
keymap.set("n", "<S-left>", ":NvimTreeResize -5<cr>", opts)
keymap.set("n", "<S-A-l>", ":NvimTreeResize +5<cr>", opts)
keymap.set("n", "<S-A-h>", ":NvimTreeResize -5<cr>", opts)

-- replace word
keymap.set("n", "<leader>ra", ":%s/\\<<C-r><C-w>\\>//g<left><left>", opts)
keymap.set("v", "<leader>ra", ":s/\\<<C-r><C-w>\\>//g<left><left>", opts)
keymap.set("n", "<leader>rw", ":%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>", opts)
keymap.set("v", "<leader>rw", ":s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>", opts)

-- refresh nvim
keymap.set("n", "<leader>rf", ":source %<cr>", opts)

-- find word under cursor
keymap.set("n", "fw", ":Lspsaga finder<cr>", opts)

-- nvim tree collapse
keymap.set("n", "<leader>cl", ":NvimTreeCollapse<cr>", opts)

-- lazygit
keymap.set("n", "<leader>gg", ":LazyGit<cr>")

-- set keybinds
keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
-- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename for typescript
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- smart rename
keymap.set("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show  diagnostics for line
keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for cursor
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
keymap.set("n", "gk", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side


-- config vscode neovim
if vim.g.vscode then
    local vscode = require("vscode-neovim")
    keymap.set("n", "<Tab>", function()
        vscode.action "workbench.action.nextEditorInGroup"
    end)
    keymap.set("n", "<S-Tab>", function()
        vscode.action "workbench.action.previousEditorInGroup"
    end)
    keymap.set("n", "<leader>e", function()
        vscode.action "workbench.files.action.focusFilesExplorer"
    end)
    keymap.set({"n", "i"}, ">", function()
        vscode.action "editor.action.indentLines"
    end)
    keymap.set({"n", "i"}, "<", function()
        vscode.action "editor.action.outdentLines"
    end)
    -- keymap.set("n", "<C-l>", function() vscode.action"workbench.action.navigateLeft" end)
    -- keymap.set("n", "<C-h>", function() vscode.action"workbench.action.navigateRight" end)
    -- keymap.set("n", "<C-k>", function() vscode.action"workbench.action.navigateUp" end)
    keymap.set({"n", "i"}, "<S-d>", function()
        vscode.action "editor.action.duplicateSelection"
    end)
    keymap.set("n", "gk", function()
        vscode.action "editor.action.showHover"
    end)
    keymap.set("n", "to", function()
        vscode.action "workbench.action.closeOtherEditors"
    end)
    keymap.set("n", "to", function()
        vscode.action "workbench.action.closeOtherEditors"
    end)
else
    -- switch windows
    keymap.set("n", "<C-h>", ":wincmd h<cr>", opts)
    keymap.set("n", "<C-j>", ":wincmd j<cr>", opts)
    keymap.set("n", "<C-k>", ":wincmd k<cr>", opts)
    keymap.set("n", "<C-l>", ":wincmd l<cr>", opts)
end

