-- Global settings and variables
-- This file contains global Neovim settings that affect the entire editor

-- Performance settings
vim.opt.lazyredraw = true     -- Don't redraw during macros
vim.opt.updatetime = 100      -- Faster completion (default 4000ms)
vim.opt.timeoutlen = 200      -- Faster which-key popup (default 1000ms)

-- UI enhancements
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
vim.opt.pumheight = 10        -- Popup menu height
vim.opt.cmdheight = 1         -- Command line height
vim.opt.showtabline = 2       -- Always show tabs
vim.opt.showmatch = true      -- Show matching brackets
vim.opt.matchtime = 2         -- Time to show matching bracket

-- Search improvements
vim.opt.wrapscan = true       -- Wrap search around file
vim.opt.incsearch = true      -- Incremental search
vim.opt.magic = true          -- Enable magic for regex

-- File handling
vim.opt.backup = false        -- Don't create backup files
vim.opt.writebackup = false   -- Don't create backup before overwriting
vim.opt.swapfile = false      -- Don't create swap files
vim.opt.autoread = true       -- Auto-reload files changed outside vim
vim.opt.confirm = true        -- Ask for confirmation instead of failing

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99        -- Start with all folds open
vim.opt.foldcolumn = '1'      -- Show fold column

-- Completion
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess:append('c') -- Don't show completion messages

-- Global variables for plugins
vim.g.loaded_netrw = 1        -- Disable netrw
vim.g.loaded_netrwPlugin = 1  -- Disable netrw plugin
vim.g.loaded_matchit = 1      -- Disable matchit (we have better alternatives)

-- Python provider (if you use Python plugins)
if vim.fn.executable('python3') == 1 then
  vim.g.python3_host_prog = vim.fn.exepath('python3')
end

-- Node provider (if you use Node.js plugins)
if vim.fn.executable('node') == 1 then
  vim.g.node_host_prog = vim.fn.exepath('node')
end

-- Ruby provider (if you use Ruby plugins)
if vim.fn.executable('ruby') == 1 then
  vim.g.ruby_host_prog = vim.fn.exepath('ruby')
end