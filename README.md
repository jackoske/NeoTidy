```
███╗   ██╗███████╗ ██████╗ ████████╗██╗██████╗ ██╗   ██╗
████╗  ██║██╔════╝██╔═══██╗╚══██╔══╝██║██╔══██╗╚██╗ ██╔╝
██╔██╗ ██║█████╗  ██║   ██║   ██║   ██║██║  ██║ ╚████╔╝ 
██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██║██║  ██║  ╚██╔╝  
██║ ╚████║███████╗╚██████╔╝   ██║   ██║██████╔╝   ██║   
╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝╚═════╝    ╚═╝   
```
# 👾 Jack's Neovim Configuration

A modern, modular Neovim configuration focused on development productivity.

## ✨ Features

- 🚀 **Fast startup** with lazy loading
- 🔧 **Modular structure** - easy to customize and maintain
- 💻 **Multi-language LSP support** (C/C++, Rust, Python, JS/TS, HTML, CSS, Bash, Lua, Markdown)
- 🎯 **Intelligent completion** with nvim-cmp
- 🔍 **Fuzzy finding** with Telescope
- 🌳 **File explorer** with Neo-tree
- 🐛 **Debugging support** with DAP
- 🤖 **GitHub Copilot** integration
- 🎨 **Beautiful UI** with Dracula theme and BufferLine
- 📋 **VSCode-like experience** with familiar keybindings

## 📁 Structure

```
~/.config/nvim/
├── init.lua                        # Main entry point
├── lua/
│   ├── config/                     # Core configuration
│   │   ├── options.lua             # Vim settings & options
│   │   ├── keymaps.lua             # All keybindings
│   │   ├── autocmds.lua            # Autocommands & custom commands
│   │   └── lazy.lua                # Plugin manager setup
│   └── plugins/                    # Plugin configurations
│       ├── core.lua                # Essential plugins
│       ├── lsp.lua                 # Language servers & completion
│       ├── ui.lua                  # UI components
│       ├── file-explorer.lua       # File browser
│       └── development.lua         # Dev tools & utilities
```

## 📋 Dependencies

Before installing, ensure you have these dependencies installed:

### Required
- **Neovim** >= 0.9.0
- **Git**
- **ripgrep** - Required for Telescope live grep
  ```bash
  brew install ripgrep
  ```

### Recommended
- **Node.js** - For many LSP servers
- **Python 3** - For Python LSP support
- **Build tools** (make, gcc) - For compiling plugins like telescope-fzf-native
- **Nerd Font** - For icons (e.g., Hack Nerd Font, FiraCode Nerd Font)

## ⚡ Quick Start

1. **Install dependencies:**
   ```bash
   brew install ripgrep neovim
   ```

2. **Backup your existing config:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

3. **Clone this config:**
   ```bash
   git clone git@github.com:jackoske/neotidy.git ~/.config/nvim
   ```

4. **Start Neovim:**
   ```bash
   nvim
   ```

5. **Install language servers:**
   ```vim
   :Mason
   ```

## 🔧 Customization

### Adding New Plugins

Add plugins to the appropriate file in `lua/plugins/`:
- **UI plugins** → `lua/plugins/ui.lua`
- **LSP/Language support** → `lua/plugins/lsp.lua`
- **Development tools** → `lua/plugins/development.lua`
- **Essential features** → `lua/plugins/core.lua`

### Modifying Settings

- **Vim options** → `lua/config/options.lua`
- **Keybindings** → `lua/config/keymaps.lua`
- **Autocommands** → `lua/config/autocmds.lua`

### Adding Language Support

1. Add the LSP server to `lua/plugins/lsp.lua`:
   ```lua
   local servers = {
     -- existing servers...
     your_language_server = {},
   }
   ```

2. Add formatter to the same file:
   ```lua
   formatters_by_ft = {
     -- existing formatters...
     your_language = { "your_formatter" },
   }
   ```

## ⌨️ Key Bindings

### General
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<Esc>` | Clear search highlights |
| `<C-h/j/k/l>` | Navigate windows |

### Window Splitting
| Key | Action |
|-----|--------|
| `<leader>wh` | Split horizontally |
| `<leader>wv` | Split vertically |
| `<leader>we` | Equalize split windows |
| `<leader>wx` | Close current split |
| `<C-h/j/k/l>` | Navigate between splits |

### Fuzzy Finding (Telescope)
| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sb` | Find buffers |
| `<leader>sh` | Help tags |
| `<leader>sk` | Keymaps |
| `<leader>sw` | Search current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>s/` | Search in open files |
| `<leader>sn` | Search Neovim files |
| `<leader>/` | Fuzzy find in current buffer |
| `<leader><leader>` | Find existing buffers |

### Quickfix Window
| Key | Action |
|-----|--------|
| `co` | Open quickfix window |
| `cc` | Close quickfix window |
| `:cnext` / `:cprev` | Navigate quickfix items |

### File Management
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<C-e>` | Toggle file explorer (VSCode style) |
| `\\` | Reveal current file in explorer |

### Buffer/Tab Management
| Key | Action |
|-----|--------|
| `<leader>bn/bp` | Next/Previous buffer |
| `<leader>bd` | Close buffer |
| `<C-w>` | Close buffer (VSCode style) |
| `<leader>1-9` | Go to buffer 1-9 |
| `<Alt-Left/Right>` | Switch buffers |

### LSP Features
| Key | Action |
|-----|--------|
| `gd` | Go to definition (populates quickfix) |
| `gr` | Go to references (populates quickfix) |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>f` | Format buffer |
| `[d/]d` | Previous/Next diagnostic |

### Debugging
| Key | Action |
|-----|--------|
| `<F5>` | Start/Continue debugging |
| `<F1-F3>` | Step into/over/out |
| `<leader>b` | Toggle breakpoint |
| `<F7>` | Toggle debug UI |

## 🔍 Supported Languages

| Language | LSP Server | Formatter | Linter |
|----------|------------|-----------|--------|
| Lua | lua_ls | stylua | - |
| Python | pyright | black, isort | pylint |
| JavaScript/TypeScript | ts_ls | prettier | eslint_d |
| C/C++ | clangd | clang-format | - |
| Rust | rust_analyzer | rustfmt | - |
| HTML | html | prettier | - |
| CSS | cssls | prettier | - |
| JSON | jsonls | prettier | - |
| Bash | bashls | shfmt | - |
| Markdown | marksman | prettier | markdownlint |

## 🛠️ Commands

- `:Mason` - Open Mason (LSP installer)
- `:Lazy` - Open Lazy (plugin manager)
- `:checkhealth` - Check Neovim health
- `:LspInfo` - Show LSP information
- `:Neotree toggle` - Toggle file explorer

## 📦 Included Plugins

### Core
- **lazy.nvim** - Plugin manager
- **which-key** - Keybinding hints
- **gitsigns** - Git integration
- **mini.nvim** - Collection of small plugins
- **todo-comments** - TODO highlighting

### LSP & Completion
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP installer
- **nvim-cmp** - Completion engine
- **conform.nvim** - Formatting

### UI
- **telescope** - Fuzzy finder
- **dracula.nvim** - Color scheme
- **bufferline** - Tab-like buffers
- **treesitter** - Syntax highlighting
- **neo-tree** - File explorer

### Development
- **nvim-dap** - Debugging
- **nvim-lint** - Linting
- **copilot.vim** - AI assistance
- **autopairs** - Auto brackets
- **indent-blankline** - Indent guides

## 🔧 Troubleshooting

### LSP not working?
1. Check if language server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Check health: `:checkhealth lsp`

### Plugins not loading?
1. Update plugins: `:Lazy sync`
2. Check for errors: `:Lazy log`
3. Restart Neovim

### Performance issues?
1. Check startup time: `nvim --startuptime startup.log`
2. Profile plugins: `:Lazy profile`

## 📝 License

MIT License - Feel free to use and modify as you like!

## 🙏 Credits & Acknowledgments

This configuration was originally based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) by the Neovim community. Kickstart.nvim provided an excellent foundation and starting point for learning Neovim configuration.

**Original kickstart.nvim contributors:**
- [TJ DeVries](https://github.com/tjdevries) and the [nvim-lua](https://github.com/nvim-lua) community
- All the contributors who made kickstart.nvim an amazing learning resource

**Key differences from kickstart.nvim:**
- 🏗️ **Modular structure** - Split into organized files instead of single `init.lua`
- 🎯 **Enhanced language support** - Added C/C++, Rust, and more LSP servers
- 🎨 **Custom UI** - BufferLine, enhanced keybindings, VSCode-like experience
- 📁 **File explorer** - Neo-tree integration with PDF support
- 🛠️ **Development tools** - Enhanced debugging, linting, and development workflow

While this configuration has evolved significantly, the core philosophy and many foundational concepts come from the excellent work of the kickstart.nvim project.

---

*Happy coding! 👾*

