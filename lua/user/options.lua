-- Shorten function name
local set = vim.opt

-- Options
set.autoindent = true
set.backup = false -- creates a backup file
set.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
set.cmdheight = 1 -- more space in the neovim command line for displaying messages
set.completeopt = { "menuone", "noselect" } -- mostly just for cmp
set.conceallevel = 0 -- so that `` is visible in markdown files
set.cursorline = true -- highlight the current line
set.expandtab = true -- convert tabs to spaces
set.fileencoding = "utf-8" -- the encoding written to a file
set.fillchars.eob = " " -- characters to use for displaying special items
set.guifont = "monospace:h17" -- the font used in graphical neovim applications
set.hlsearch = true -- highlight all matches on previous search pattern
set.ignorecase = true -- ignore case in search patterns
set.iskeyword:append("-") -- characters included in keywords
set.laststatus = 3 -- tells when last window has status lines
set.mouse = "a" -- allow the mouse to be used in neovim
set.number = true -- set numbered lines
set.numberwidth = 4 -- set number column width to 2 {default 4}
set.pumheight = 10 -- pop up menu height
set.relativenumber = true -- show realtive line numbers
set.ruler = false -- show cursor line and column in the status line
set.scrolloff = 8 -- min. nr. of lines above and below cursor
set.shell = "/bin/zsh" -- shell to use {default is bash}
set.shiftwidth = 2 -- the number of spaces inserted for each indentation
set.shortmess:append("c") -- list of flags, reduce length of messages
set.showcmd = false -- show (partial) command in status line
set.showmode = false -- we don't need to see things like -- INSERT -- anymore
set.showtabline = 0 -- always show tabs
set.sidescrolloff = 8 -- min. nr. of columns to left and right of cursor
set.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
set.smartcase = true -- smart case
set.smartindent = true -- make indenting smarter again
set.splitbelow = true -- force all horizontal splits to go below current window
set.splitright = true -- force all vertical splits to go to the right of current window
set.swapfile = false -- creates a swapfile
set.tabstop = 2 -- insert 2 spaces for a tab
set.termguicolors = true -- set term gui colors (most terminals support this)
set.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
set.undofile = true -- enable persistent undo
set.updatetime = 300 -- faster completion (4000ms default)
set.whichwrap:append("<,>,[,],h,l") -- allow specified keys to cross line boundaries
set.wrap = false -- display lines as one long line
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
