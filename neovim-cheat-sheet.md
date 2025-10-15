# 🧠 Neovim Cheat Sheet (Navigation + Editing)

## 📦 MOVEMENT

| Key             | Action                       |
| --------------- | ---------------------------- |
| `h` / `l`       | Move left / right            |
| `j` / `k`       | Move down / up               |
| `w` / `W`       | Next word / WORD             |
| `b` / `B`       | Prev word / WORD             |
| `e` / `E`       | End of word / WORD           |
| `0`             | Start of line                |
| `^`             | First non-blank in line      |
| `$`             | End of line                  |
| `gg` / `G`      | Top / Bottom of file         |
| `H` / `M` / `L` | Top / Mid / Bottom of screen |

## ✂️ BASIC EDITING

| Key     | Action                            |
| ------- | --------------------------------- |
| `x`     | Delete character under cursor     |
| `X`     | Delete character before cursor    |
| `dw`    | Delete word from cursor           |
| `de`    | Delete to end of word             |
| `d$`    | Delete to end of line             |
| `d0`    | Delete to start of line           |
| `dd`    | Delete (cut) whole line           |
| `D`     | Delete from cursor to end of line |
| `cw`    | Change word (delete + insert)     |
| `cc`    | Change whole line                 |
| `C`     | Change to end of line             |
| `u`     | Undo                              |
| `<C-r>` | Redo                              |

## 📋 COPY/PASTE (YANK/PUT)

| Key    | Action                              |
| ------ | ----------------------------------- |
| `yy`   | Yank (copy) whole line              |
| `y$`   | Yank to end of line                 |
| `yw`   | Yank word                           |
| `p`    | Paste **after** cursor              |
| `P`    | Paste **before** cursor             |
| `"*p`  | Paste from system clipboard (Linux) |
| `"*y`  | Yank to system clipboard            |
| `"_d`  | Delete without yanking (black hole) |
| `"_dd` | Delete line without copying         |
| `"_x`  | Delete char without copying         |

💡 **Use `"_` (black hole register)** to delete without affecting your paste buffer.

## 🏄 ADVANCED TRICKS

| Action                      | Command                                 |
| --------------------------- | --------------------------------------- |
| Visual mode selection       | `v` (char), `V` (line), `<C-v>` (block) |
| Move selected lines up/down | `:m .+1` / `:m .-2`                     |
| Indent / de-indent          | `>>` / `<<` (in normal mode)            |
| Join current + next line    | `J`                                     |
| Repeat last action          | `.`                                     |
| Record macro                | `q<reg>` ... `q`                        |
| Replay macro                | `@<reg>`                                |

## 🚀 RECOMMENDED SETTINGS

```vim
set clipboard=unnamedplus  " Use system clipboard
set number                 " Show line numbers
set relativenumber         " Relative line numbers
```

## 🔍 SEARCH & REPLACE

| Key         | Action                    |
| ----------- | ------------------------- |
| `/pattern`  | Search forward            |
| `?pattern`  | Search backward           |
| `n` / `N`   | Next / Previous match     |
| `*` / `#`   | Search word under cursor  |
| `:%s/old/new/g` | Replace all in file   |
| `:%s/old/new/gc` | Replace with confirm |

## 🎯 JUMPS & MARKS

| Key     | Action                    |
| ------- | ------------------------- |
| `ma`    | Set mark 'a'              |
| `'a`    | Jump to mark 'a'          |
| `<C-o>` | Jump to previous location |
| `<C-i>` | Jump to next location     |
| `gi`    | Jump to last insert       |
| `gv`    | Reselect last visual      |

## 🪟 WINDOWS & TABS

| Key         | Action                |
| ----------- | --------------------- |
| `<C-w>s`    | Split horizontal      |
| `<C-w>v`    | Split vertical        |
| `<C-w>w`    | Switch window         |
| `<C-w>q`    | Close window          |
| `<C-w>h/j/k/l` | Navigate windows   |
| `:tabnew`   | New tab               |
| `gt` / `gT` | Next / Previous tab   |

## 💾 FILE OPERATIONS

| Key       | Action              |
| --------- | ------------------- |
| `:w`      | Save file           |
| `:q`      | Quit                |
| `:wq`     | Save and quit       |
| `:q!`     | Quit without saving |
| `:e file` | Edit file           |
| `:r file` | Read file into buffer |

---

# 🚀 Custom Keybindings (Your Config)

## 📁 FILE EXPLORER (Neo-tree)

| Key | Action |
| --- | ------ |
| `<leader>e` | Toggle file explorer |
| `<C-e>` | Toggle file explorer (VSCode style) |
| `\\` | Reveal current file in explorer |
| `o` or `<CR>` | Open file (in Neo-tree) |
| `P` | Toggle preview (in Neo-tree) |

## 🔍 FUZZY FINDING (Telescope)

| Key | Action |
| --- | ------ |
| `<leader>sf` | Search files |
| `<leader>sg` | Search by grep (live grep) |
| `<leader><leader>` | Find buffers |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>sw` | Search current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Search recent files |
| `<leader>ss` | Select Telescope picker |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>s/` | Search in open files |
| `<leader>sn` | Search Neovim config files |

## 📊 BUFFER MANAGEMENT (BufferLine)

| Key | Action |
| --- | ------ |
| `<C-n>` | Next buffer |
| `<C-p>` | Previous buffer |
| `gt` | Next buffer |
| `gT` | Previous buffer |
| `<A-Left>` | Previous buffer |
| `<A-Right>` | Next buffer |
| `<A-S-Left>` | Move buffer left |
| `<A-S-Right>` | Move buffer right |
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bd` | Close buffer |
| `<leader>bD` | Force close buffer |
| `<leader>x` | Close current buffer |
| `<leader>X` | Force close current buffer |
| `<leader>bc` | Close buffer (pick) |
| `<leader>bs` | Select buffer (pick) |
| `<leader>bl` | Move buffer right |
| `<leader>bh` | Move buffer left |
| `<leader>1-9` | Go to buffer 1-9 |

## 🪟 WINDOW NAVIGATION

| Key | Action |
| --- | ------ |
| `<C-h>` | Move to left window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |
| `<C-l>` | Move to right window |
| `<leader>wc` | Close window |
| `<leader>wo` | Close all other windows |

## 📑 TAB MANAGEMENT

| Key | Action |
| --- | ------ |
| `<leader>tn` | New tab |
| `<leader>tc` | Close tab |
| `<leader>tl` | Next tab |
| `<leader>th` | Previous tab |
| `<leader>tb` | Open buffer in new tab |
| `<leader>ta` | Show all tabs |

## 🎯 LSP FEATURES

| Key | Action |
| --- | ------ |
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>f` | Format buffer |
| `K` | Hover documentation |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>E` | Show diagnostic error |
| `<leader>q` | Diagnostic quickfix list |

## ⚡ FLASH NAVIGATION (Enhanced Jumping)

| Key | Action |
| --- | ------ |
| `s` | Flash jump to any location |
| `S` | Flash jump to treesitter node |
| `r` | Remote flash (in operator mode) |
| `R` | Treesitter search |
| `<C-s>` | Toggle flash search (command mode) |

## 🌳 TREESITTER TEXT OBJECTS

| Key | Action |
| --- | ------ |
| `af` | Select outer function |
| `if` | Select inner function |
| `ac` | Select outer class |
| `ic` | Select inner class |
| `aa` | Select outer parameter |
| `ia` | Select inner parameter |
| `]m` | Next function start |
| `[m` | Previous function start |
| `]M` | Next function end |
| `[M` | Previous function end |
| `]]` | Next class start |
| `[[` | Previous class start |
| `][` | Next class end |
| `[]` | Previous class end |

## 🐛 DEBUGGING (DAP)

| Key | Action |
| --- | ------ |
| `<F5>` | Start/Continue debugging |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set conditional breakpoint |
| `<F7>` | Toggle debug UI |

## 🤖 COPILOT

| Key | Action |
| --- | ------ |
| `<C-j>` | Accept Copilot suggestion (insert mode) |
| `<leader>ai` | Toggle Copilot on/off |

## 📖 MARKDOWN

| Key | Action |
| --- | ------ |
| `<leader>mp` | Toggle markdown preview |

## 🔧 QUICKFIX & LOCATION LIST

| Key | Action |
| --- | ------ |
| `<leader>cc` | Close quickfix/location list |
| `<leader>co` | Open quickfix |
| `<leader>lo` | Open location list |
| `[q` | Previous quickfix item |
| `]q` | Next quickfix item |
| `[l` | Previous location item |
| `]l` | Next location item |
| `<leader>n` | Next reference/quickfix |
| `<leader>p` | Previous reference/quickfix |

## 🎨 GENERAL EDITING

| Key | Action |
| --- | ------ |
| `<Esc>` | Clear search highlights |
| `<A-j>` | Move selected lines down (visual) |
| `<A-k>` | Move selected lines up (visual) |
| `<Esc><Esc>` | Exit terminal mode |