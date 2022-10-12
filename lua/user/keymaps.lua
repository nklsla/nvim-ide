-- Reload config on save/write
vim.cmd([[
  augroup keymap_user_config
    autocmd!
    autocmd BufWritePost keymaps.lua source %
  augroup end
]])

-- Shorten function name
local keymap = vim.keymap.set

-- Keymap options
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "J", "3j", opts)
keymap("n", "K", "3k", opts)

-- Clear highlight
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)
-- keymap("n", "<S-q>", ":q<CR>", opts)

-- Save buffer
keymap("n", "<C-s>", ":w<CR>", { noremap = true })

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk/kj fast to enter normal mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Save buffer and stay in insert mode
keymap("i", "<C-s>", "<ESC>:w<CR>li", { noremap = true })

-- Better word delete (CTRL + BackSpace = deletes one word)
keymap("i", "<C-h>", "<C-w>")
keymap("i", "<C-Del>", "<cmd>norm! dw<CR>")

-- Map shift-tab to behave normally
keymap("i", "<S-TAB>", "<C-d>")

-- Visul --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Comment
-- see user.comment

-- LSP
-- see user.lsp.handlers

-- ToggleTerm
keymap("n", "<leader>R", ":RunFile toggleterm<CR>", { noremap = true, silent = false })
keymap("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
keymap("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
keymap("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
keymap("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
keymap("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
keymap("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
keymap("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns preview_hunk <CR>", opts)

-- DAP
keymap("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<S-F7>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.terminate()<cr>", opts)
