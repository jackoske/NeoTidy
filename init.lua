-- ███╗   ██╗███████╗ ██████╗ ████████╗██╗██████╗ ██╗   ██╗
-- ████╗  ██║██╔════╝██╔═══██╗╚══██╔══╝██║██╔══██╗╚██╗ ██╔╝
-- ██╔██╗ ██║█████╗  ██║   ██║   ██║   ██║██║  ██║ ╚████╔╝ 
-- ██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██║██║  ██║  ╚██╔╝  
-- ██║ ╚████║███████╗╚██████╔╝   ██║   ██║██████╔╝   ██║   
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝╚═════╝    ╚═╝   
-- 
-- A Tidy, Modular Neovim Configuration
-- Author: Jack Skehan

-- Load configuration modules
require('config.globals')    -- Global settings and variables
require('config.options')    -- Vim options and settings
require('config.keymaps')    -- Key mappings  
require('config.autocmds')   -- Autocommands
require('config.lazy')       -- Plugin manager and plugin loading

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et 