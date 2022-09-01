-- Shorten function name
local o = vim.opt

-- Options
o.backup = false                          -- creates a backup file
o.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
o.number = true                           -- show current line number
o.relativenumber = true                   -- show realtive line numbers
o.cmdheight = 1                           -- more space in the neovim command line for displaying messages
o.completeopt = { "menuone", "noselect" } -- mostly just for cmp
o.conceallevel = 0                        -- so that `` is visible in markdown files
o.fileencoding = "utf-8"                  -- the encoding written to a file
o.hlsearch = true                         -- highlight all matches on previous search pattern
o.ignorecase = true                       -- ignore case in search patterns
o.mouse = "a"                             -- allow the mouse to be used in neovim
o.pumheight = 10                          -- pop up menu height
o.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 0                         -- always show tabs
o.smartcase = true                        -- smart case
o.smartindent = true                      -- make indenting smarter again
o.splitbelow = true                       -- force all horizontal splits to go below current window
o.splitright = true                       -- force all vertical splits to go to the right of current window
o.swapfile = false                        -- creates a swapfile
o.termguicolors = true                    -- set term gui colors (most terminals support this)
o.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true                         -- enable persistent undo
o.updatetime = 300                        -- faster completion (4000ms default)
o.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.expandtab = true                        -- convert tabs to spaces
o.shiftwidth = 4                          -- the number of spaces inserted for each indentation
o.tabstop = 4                             -- insert 4 spaces for a tab
o.cursorline = true                       -- highlight the current line
o.number = true                           -- set numbered lines
o.laststatus = 3			              -- tells when last window has status lines
o.showcmd = false			              -- show (partial) command in status line
o.ruler = false				              -- show cursor line and column in the status line
o.numberwidth = 4                         -- set number column width to 2 {default 4}
o.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
o.wrap = false                            -- display lines as one long line
o.scrolloff = 8                           -- min. nr. of lines above and below cursor
o.sidescrolloff = 8			              -- min. nr. of columns to left and right of cursor
o.guifont = "monospace:h17"               -- the font used in graphical neovim applications
o.fillchars.eob=" "			              -- characters to use for displaying special items
o.shortmess:append "c"			          -- list of flags, reduce length of messages
o.whichwrap:append("<,>,[,],h,l")	      -- allow specified keys to cross line boundaries
o.iskeyword:append("-")			          -- characters included in keywords

