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