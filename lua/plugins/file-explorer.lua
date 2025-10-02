-- File explorer and navigation plugins
return {
  -- Neo-tree is a Neovim plugin to browse the file system
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
      { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle File Explorer', silent = true },
      { '<C-e>', ':Neotree toggle<CR>', desc = 'Toggle File Explorer (VSCode style)', silent = true },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
            ["o"] = function(state)
              local node = state.tree:get_node()
              if not node then return end
              local path = node:get_id()
              if not path then return end
              
              if path:match("%.pdf$") then
                vim.fn.jobstart({ "zathura", path }, { detach = true })
                vim.schedule(function()
                  vim.cmd("bd!") -- Close the buffer after opening Zathura
                end)
              else
                -- Open file and focus on it
                require("neo-tree.sources.filesystem.commands").open(state)
                -- Focus on the newly opened file
                vim.schedule(function()
                  local current_win = vim.api.nvim_get_current_win()
                  local wins = vim.api.nvim_list_wins()
                  for _, win in ipairs(wins) do
                    if win ~= current_win then
                      local buf = vim.api.nvim_win_get_buf(win)
                      local buf_name = vim.api.nvim_buf_get_name(buf)
                      if buf_name == path then
                        vim.api.nvim_set_current_win(win)
                        break
                      end
                    end
                  end
                end)
              end
            end,
            -- Add Enter key mapping for the same behavior
            ["<CR>"] = function(state)
              local node = state.tree:get_node()
              if not node then return end
              local path = node:get_id()
              if not path then return end
              
              if path:match("%.pdf$") then
                vim.fn.jobstart({ "zathura", path }, { detach = true })
                vim.schedule(function()
                  vim.cmd("bd!") -- Close the buffer after opening Zathura
                end)
              else
                -- Open file and focus on it
                require("neo-tree.sources.filesystem.commands").open(state)
                -- Focus on the newly opened file
                vim.schedule(function()
                  local current_win = vim.api.nvim_get_current_win()
                  local wins = vim.api.nvim_list_wins()
                  for _, win in ipairs(wins) do
                    if win ~= current_win then
                      local buf = vim.api.nvim_win_get_buf(win)
                      local buf_name = vim.api.nvim_buf_get_name(buf)
                      if buf_name == path then
                        vim.api.nvim_set_current_win(win)
                        break
                      end
                    end
                  end
                end)
              end
            end,
          },
        },
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
        hijack_netrw_behavior = "open_default",
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = false,
          ["<esc>"] = "cancel",
          ["P"] = { "toggle_preview", config = { use_float = true } },
        },
      },
    },
  },
} 