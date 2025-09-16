local g = vim.g
local map = vim.keymap.set

----------------------------------
------------- LEADER -------------
----------------------------------
g.mapleader = ";"

----------------------------------
------------- REMAPS -------------
----------------------------------
map('n', 'v', '<C-v>') -- entering Visual Block

----------------------------------
------------ GENERAL -------------
----------------------------------
map('i', 'jk', '<ESC>')
map('v', '<Tab>', '<ESC>')
map('n', 'H', '0')
map('v', 'H', '0')
map('n', 'L', 'A<ESC>')
map('v', 'L', '$')
map('n', 'vv', '0v$')
map('n', '<C-A>', 'gg0vG$')
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', '-', 'ddp')
map('n', '_', 'ddkP')
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')
map('n', '<leader>w', ':FormatWrite<CR>')
map('n', '<leader>yl', '0v$"*y') map('n', '<leader>y', 'viw"*y')
map('n', '<leader>r', 'viwp')

----------------------------------
------------ SPLIT ---------------
----------------------------------
map('n', '¬', ':vsp<CR>')
map('n', '∆', ':sp<CR>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<leader>h', ':vertical resize +5<CR>')
map('n', '<leader>l', ':vertical resize -5<CR>')

----------------------------------
-------------- COPILOT -----------
----------------------------------
vim.cmd [[
imap <silent><script><expr> <leader><Tab> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
]]

----------------------------------
------------ TELESCOPE -----------
----------------------------------
local builtin = require('telescope.builtin')
local extents = require('telescope').extensions

map('n', '<leader>?', function() return builtin.oldfiles() end)
map('n', '<leader>ff', function() return builtin.find_files() end)
map('n', '<leader>fg', function() return builtin.live_grep() end)
map('n', '<C-p>', function() return builtin.git_files() end)
map('n', '<leader>fh', function() return builtin.help_tags() end)
map('n', '<leader>fb', function() return builtin.buffers() end)
map('n', '<leader>fw', function() return builtin.grep_string() end)
map('n', '<leader>fd', function() return builtin.diagnostics() end)
map("n", 'gr', function() return builtin.lsp_references() end)
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
})
end)

map('n', '<leader>fz', function() return extents.zoxide.list() end)
map('n', '<leader>p', function() return extents.neoclip.default() end)
map('n', '<leader>P', ':Telescope neoclip star<CR>')

----------------------------------
------------ LSP SAGA ------------
----------------------------------

-- LSP finder
-- Navigate inside<A-l> = vsplit, <A-j> = split, o = goto
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Peek definition
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
map("n","gd", "<cmd>Lspsaga goto_definition<CR>")

-- Code action
map({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
map("n", "<leader>gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
map("n", "<leader>Gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek type definition
map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
map("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Toggle outline
map("n","<leader><C-t>", "<cmd>Lspsaga outline<CR>")

-- Toggle nvim-tree
map("n", "<C-t>", "<cmd>NvimTreeToggle<CR>")
map("n", "<leader><C-f>", "<cmd>NvimTreeFindFile<CR>")

-- Hover Doc
-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
map("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Floating terminal
map({"n", "t"}, "∂", "<cmd>Lspsaga term_toggle<CR>")

-- Oil explorer
map("n", "<leader>-", "<cmd>Oil --float<CR>", { desc = "Open parent directory" })
