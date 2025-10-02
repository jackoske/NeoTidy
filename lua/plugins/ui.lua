-- UI and interface plugins
return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

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
    end,
  },

  -- Colorscheme
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'dracula'
      vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi NonText guibg=NONE ctermbg=NONE
        hi LineNr guibg=NONE ctermbg=NONE
        hi Folded guibg=NONE ctermbg=NONE
        hi EndOfBuffer guibg=NONE ctermbg=NONE
      ]])
    end,
  },

  -- Bufferline for visual tab management (VSCode-like tabs)
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "slant",
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true
            }
          },
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
        }
      })
      
      -- BufferLine keymaps
      vim.keymap.set('n', '<leader>bp', ':BufferLineCyclePrev<CR>', { desc = 'Previous Buffer' })
      vim.keymap.set('n', '<leader>bn', ':BufferLineCycleNext<CR>', { desc = 'Next Buffer' })
      vim.keymap.set('n', '<leader>bc', ':BufferLinePickClose<CR>', { desc = 'Close Buffer (Pick)' })
      vim.keymap.set('n', '<leader>bs', ':BufferLinePick<CR>', { desc = 'Select Buffer' })
      vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = 'Close current buffer' })
      vim.keymap.set('n', '<leader>bD', ':bd!<CR>', { desc = 'Force close current buffer' })
      vim.keymap.set('n', '<leader>bl', ':BufferLineMoveNext<CR>', { desc = 'Move buffer right' })
      vim.keymap.set('n', '<leader>bh', ':BufferLineMovePrev<CR>', { desc = 'Move buffer left' })
      
      -- Tab switching (reliable keybindings) - removed C-h/C-l to avoid conflict with window navigation
      vim.keymap.set('n', '<C-n>', ':BufferLineCycleNext<CR>', { desc = 'Next Buffer' })
      vim.keymap.set('n', '<C-p>', ':BufferLineCyclePrev<CR>', { desc = 'Previous Buffer' })
      vim.keymap.set('n', 'gt', ':BufferLineCycleNext<CR>', { desc = 'Next Buffer' })
      vim.keymap.set('n', 'gT', ':BufferLineCyclePrev<CR>', { desc = 'Previous Buffer' })

      -- Alt+arrow keys for buffer navigation
      vim.keymap.set('n', '<A-Left>', ':BufferLineCyclePrev<CR>', { desc = 'Previous Buffer' })
      vim.keymap.set('n', '<A-Right>', ':BufferLineCycleNext<CR>', { desc = 'Next Buffer' })
      vim.keymap.set('n', '<A-S-Left>', ':BufferLineMovePrev<CR>', { desc = 'Move buffer left' })
      vim.keymap.set('n', '<A-S-Right>', ':BufferLineMoveNext<CR>', { desc = 'Move buffer right' })

      -- Close buffer keybindings
      vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = 'Close current buffer' })
      vim.keymap.set('n', '<leader>X', ':bd!<CR>', { desc = 'Force close current buffer' })
      
      -- Quick buffer navigation
      for i = 1, 9 do
        vim.keymap.set('n', '<leader>' .. i, ':BufferLineGoToBuffer ' .. i .. '<CR>', { desc = 'Go to buffer ' .. i })
      end
    end,
  },

  -- Enhanced navigation with flash.nvim
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
      { '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
    },
    opts = {},
  },

  -- Color preview in CSS/SCSS/HTML files
  {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('colorizer').setup({
        filetypes = { 'css', 'scss', 'sass', 'html', 'javascript', 'typescript', 'jsx', 'tsx', 'lua', 'vim' },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          AARRGGBB = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = 'virtualtext',
          virtualtext = '■',
          always_update = false
        },
        buftypes = {},
      })
    end
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'bash', 'c', 'cpp', 'rust', 'diff', 'html', 'css', 'scss', 'javascript', 'typescript', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
      },
    },
  },
} 