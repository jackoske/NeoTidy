-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Move selected lines up/down
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Split window commands
vim.keymap.set('n', '<leader>wh', ':split<CR>', { desc = '[W]indow split [H]orizontally' })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { desc = '[W]indow split [V]ertically' })
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = '[W]indow [E]qualize' })
vim.keymap.set('n', '<leader>wx', ':close<CR>', { desc = '[W]indow [X]close' })

-- Quickfix window commands
vim.keymap.set('n', 'co', ':copen<CR>', { desc = '[C]quickfix [O]pen' })
vim.keymap.set('n', 'cc', ':cclose<CR>', { desc = '[C]quickfix [C]lose' })

-- [[ Telescope Keymaps ]]
-- These are loaded after Telescope plugin is available
local function setup_telescope_keymaps()
  local builtin = require 'telescope.builtin'
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
  vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

  vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep {
      grep_open_files = true,
      prompt_title = 'Live Grep in Open Files',
    }
  end, { desc = '[S]earch [/] in Open Files' })

  vim.keymap.set('n', '<leader>sn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
  end, { desc = '[S]earch [N]eovim files' })
end

-- Set up Telescope keymaps when the plugin is loaded
vim.api.nvim_create_autocmd('User', {
  pattern = 'TelescopeSetup',
  callback = setup_telescope_keymaps,
})

-- Also try to set up immediately if Telescope is already available
if pcall(require, 'telescope.builtin') then
  setup_telescope_keymaps()
end

-- [[ Tab management ]]
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

-- Keymaps for navigating tabs
vim.keymap.set('n', '<leader>bp', ':BufferLineCyclePrev<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>bn', ':BufferLineCycleNext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bc', ':BufferLinePickClose<CR>', { desc = 'Close Buffer (Pick)' })
vim.keymap.set('n', '<leader>bs', ':BufferLinePick<CR>', { desc = 'Select Buffer' })

-- Short buffer keybinds
vim.keymap.set('n', '<leader>x', ':bp | bd #<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>p', ':BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>n', ':BufferLineCycleNext<CR>', { desc = 'Next buffer' })

-- Close tabs (buffers) - multiple methods
vim.keymap.set('n', '<leader>bd', ':bp | bd #<CR>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<C-w>', ':bp | bd #<CR>', { desc = 'Close current buffer (VSCode style)' })
vim.keymap.set('n', '<A-w>', ':bp | bd #<CR>', { desc = 'Close current buffer (Alt+W)' })
-- Force close
vim.keymap.set('n', '<leader>bD', ':bp | bd! #<CR>', { desc = 'Force close current buffer' })

-- Move buffer position left/right (reorder tabs)
vim.keymap.set('n', '<leader>bl', ':BufferLineMoveNext<CR>', { desc = 'Move buffer right' })
vim.keymap.set('n', '<leader>bh', ':BufferLineMovePrev<CR>', { desc = 'Move buffer left' })

-- More intuitive tab navigation (similar to browser/VSCode)
vim.keymap.set('n', '<C-Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<C-S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Previous Buffer' })
-- Alt+Left/Right to switch tabs (VSCode-style)
vim.keymap.set('n', '<A-Left>', ':BufferLineCyclePrev<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<A-Right>', ':BufferLineCycleNext<CR>', { desc = 'Next Buffer' })
-- Alt+Shift+Left/Right to move tabs (VSCode-style)
vim.keymap.set('n', '<A-S-Left>', ':BufferLineMovePrev<CR>', { desc = 'Move buffer left' })
vim.keymap.set('n', '<A-S-Right>', ':BufferLineMoveNext<CR>', { desc = 'Move buffer right' })

-- Quick buffer navigation
vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', { desc = 'Go to buffer 1' })
vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', { desc = 'Go to buffer 2' })
vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', { desc = 'Go to buffer 3' })
vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', { desc = 'Go to buffer 4' })
vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', { desc = 'Go to buffer 5' })
vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', { desc = 'Go to buffer 6' })
vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', { desc = 'Go to buffer 7' })
vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', { desc = 'Go to buffer 8' })
vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', { desc = 'Go to buffer 9' }) 