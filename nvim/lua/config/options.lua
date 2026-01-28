local opt = vim.opt
local opt_global = vim.opt_global
local fn = vim.fn

vim.g.mapleader = [[,]]
vim.g.maplocalleader = [[,]]

-- to use system clipboard
opt.clipboard:append({ "unnamedplus" })

opt.termguicolors = true

-- show line numbers
opt.number = true

-- open new panels right and below
opt.splitright = true
opt.splitbelow = true

-- show relative number of current line
opt.relativenumber = true

-- write backup of the file before overwriting

  -- (backup removed after success in writing the file)
opt.writebackup = true
  -- (persistent backup to have as a recovery file)
opt.backup = true

-- list of directories for the backup file
local backupdir = vim.fn.stdpath("state") .. "/backup/"
if vim.fn.isdirectory(backupdir) == 0 then
  vim.fn.mkdir(backupdir, "p")
end
opt_global.backupdir = { backupdir }

-- how backups are done
opt.backupcopy = "auto"

-- extension for backups
opt.backupext = ".vimbak"

-- enable saving unsaved files
opt.swapfile = true
opt.updatetime = 100

-- save undo file
opt.undofile = true

-- maximum number of changes to undo
opt.undolevels = 10000

-- time in milliseconds for a mapped sequence to complete
opt.timeoutlen = 500

-- merge sign column and number column
opt.signcolumn = "yes"

-- no ins-completion messages, no "written", no intro message
opt.shortmess:append({ c = true, W = true, I = true })

-- completion menu options
opt_global.completeopt = { "menu", "menuone", "noselect" }

-- conceal options
opt.conceallevel = 3
opt.concealcursor = "nc"

-- highlight cursor line
opt.cursorline = true

-- keep 8 lines above/below cursor when scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- popup blend ("transparency")
opt.pumblend = 10

-- maximum entries in popup
opt.pumheight = 8

-- switch buffers without saving
opt.hidden = false

-- enable mouse
opt.mouse = "a"

-- enable line wrap
opt.wrap = true

-- wrapped line prefix
opt.showbreak = [[↪ ]]

-- where the line is broken
opt.linebreak = true

-- indentation in wrapped lines
opt.breakindent = true

-- highligth matching pair
opt.showmatch = true

-- open diff in vertical split
opt_global.diffopt:append({ "vertical" })

-- visual bell (do not use beep sound)
opt.visualbell = true

-- case insensitive
opt.ignorecase = true

-- allow case sensitivity in searches
opt.smartcase = true

-- case insensitive (autocompletion)
opt.wildignorecase = true

-- amount of spaces used in a tab
opt.tabstop = 2
opt.softtabstop = 2

-- number of autoindent spaces
opt.shiftwidth = 2

-- expand tabs to spaces
opt.expandtab = true

-- confirmation dialogs
opt.confirm = true

-- display unprintable characters
opt.list = true
opt.listchars = { tab = [[→→]], trail = "•", extends = "»", precedes = "«" }

-- enable folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- show unfolded text at start
opt.foldenable = false

-- number of screen lines above which a fold is displayed closed
opt.foldminlines = 5
