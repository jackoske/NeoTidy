-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ General Keymaps ]]
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move selected lines up/down
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- [[ Window Navigation ]]
-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Close current window
vim.keymap.set('n', '<leader>wc', '<C-w>c', { desc = '[W]indow [C]lose' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = '[W]indow [O]nly (close all others)' })

-- [[ Terminal Mode ]]
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Diagnostics ]]
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- [[ Quickfix/Location List ]]
-- Close quickfix and location list windows
vim.keymap.set("n", "<leader>cc", ":cclose<CR>:lclose<CR>", { desc = "[C]lose quickfix/location list" })
vim.keymap.set("n", "<leader>co", ":copen<CR>", { desc = "Quickfix [O]pen" })
vim.keymap.set("n", "<leader>lo", ":lopen<CR>", { desc = "[L]ocation list [O]pen" })
-- Navigate quickfix/location list
vim.keymap.set("n", "[q", ":cprev<CR>", { desc = "Previous quickfix item" })
vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "[l", ":lprev<CR>", { desc = "Previous location list item" })
vim.keymap.set("n", "]l", ":lnext<CR>", { desc = "Next location list item" })
-- More intuitive reference navigation
vim.keymap.set("n", "<leader>n", ":cnext<CR>", { desc = "[N]ext reference/quickfix" })
vim.keymap.set("n", "<leader>p", ":cprev<CR>", { desc = "[P]revious reference/quickfix" })

-- [[ Tab Management ]]
-- Create a new tab
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = '[T]ab [N]ew' })
-- Close current tab
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = '[T]ab [C]lose' })
-- Go to next tab
vim.keymap.set('n', '<leader>tl', ':tabnext<CR>', { desc = '[T]ab Next (Right)' })
-- Go to previous tab
vim.keymap.set('n', '<leader>th', ':tabprevious<CR>', { desc = '[T]ab Previous (Left)' })
-- Open current buffer in new tab
vim.keymap.set('n', '<leader>tb', ':tab split<CR>', { desc = '[T]ab Open [B]uffer' })
-- Show all tabs
vim.keymap.set('n', '<leader>ta', ':tabs<CR>', { desc = '[T]ab Show [A]ll' })

