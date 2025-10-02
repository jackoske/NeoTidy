-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- PDF viewer autocommand
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.pdf",
  callback = function()
    local file = vim.fn.expand("%")
    vim.fn.jobstart({ "zathura", file }, { detach = true })
    vim.schedule(function()
      vim.cmd("bd!") -- Close the buffer after launching Zathura
    end)
  end,
})

-- Platform-agnostic clipboard integration
local function setup_clipboard_integration()
  -- Detect display server and OS
  local wayland_display = os.getenv("WAYLAND_DISPLAY")
  local xdg_session_type = os.getenv("XDG_SESSION_TYPE")
  local is_wayland = wayland_display ~= nil or xdg_session_type == "wayland"
  local is_macos = vim.fn.has("macunix") == 1
  
  if is_macos then
    -- macOS clipboard integration
    vim.cmd([[
      augroup system_clipboard
        autocmd!
        autocmd FocusLost * call system('pbcopy', @+)
        autocmd FocusGained * let @+ = system('pbpaste')
      augroup END
    ]])
  elseif is_wayland then
    -- Wayland clipboard integration
    vim.cmd([[
      augroup wl_clipboard
        autocmd!
        autocmd FocusLost * call system('wl-copy --trim-newline', @+)
        autocmd FocusGained * let @+ = system('wl-paste -n')
      augroup END
    ]])
  else
    -- X11 clipboard integration
    vim.cmd([[
      augroup x11_clipboard
        autocmd!
        autocmd FocusLost * call system('xclip -selection clipboard', @+)
        autocmd FocusGained * let @+ = system('xclip -selection clipboard -o')
      augroup END
    ]])
  end
end

-- Initialize clipboard integration
setup_clipboard_integration()

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- VSCode-like file opening commands
vim.api.nvim_create_user_command('VSCodeOpen', function(opts)
  local file = opts.args
  -- Check if file exists
  if vim.fn.filereadable(file) == 1 then
    -- Open in a new buffer
    vim.cmd('edit ' .. file)
  end
end, { nargs = 1, complete = 'file' })

-- Add command to open file in new tab/buffer if not already open
vim.api.nvim_create_user_command('EditInNewBuffer', function(opts)
  local file = opts.args
  -- Check if buffer already exists
  local bufnr = vim.fn.bufnr(file)
  if bufnr > 0 then
    -- Buffer exists, switch to it
    vim.cmd('buffer ' .. bufnr)
  else
    -- Buffer doesn't exist, create new one
    vim.cmd('edit ' .. file)
  end
end, { nargs = 1, complete = 'file' })

-- Enable basic syntax highlighting for unknown file types
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = '*',
  callback = function()
    local ft = vim.bo.filetype
    if ft == '' or ft == nil then
      -- Try to detect filetype by file extension or content
      vim.cmd('filetype detect')
      
      -- If still no filetype, apply basic syntax highlighting
      if vim.bo.filetype == '' then
        vim.cmd('set syntax=on')
        -- Enable basic text highlighting patterns
        vim.cmd('syntax match Comment /\\v^\\s*#.*$/')
        vim.cmd('syntax match Comment /\\v^\\s*\\/\\/.*$/')
        vim.cmd('syntax match Comment /\\v\\/\\*.*\\*\\//')
        vim.cmd('syntax match String /\\v"[^"]*"/')
        vim.cmd('syntax match String /\\v\'[^\']*\'/')
        vim.cmd('syntax match Number /\\v<\\d+>/')
        vim.cmd('syntax match Keyword /\\v<(function|def|class|if|else|for|while|return|import|from|var|let|const)>/')
      end
    end
  end,
}) 