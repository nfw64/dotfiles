-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map = vim.keymap.set

vim.g.mapleader = " "
-----------------
---- Custom -----
-----------------

map("n", '=q', ":close<cr>")
map("n", "<C-q>", ":q<cr>")
-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation

-- map('n', '<C-Left>',  '<C-w>h',  opts)
-- map('n', '<C-Right>', '<C-w>l',  opts)
map('n', '<C-s>' ,  ':w<CR>', opts)
map("v", "<C-S>", "<esc>:w<cr>")
map("i", "<C-S>", "<esc>:w<cr>")
-----------------
-- LSP keymaps --
-----------------

map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)
map('n', '[d',       vim.diagnostic.goto_prev,  opts)
map('n', ']d',       vim.diagnostic.goto_next,  opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-----------------
-- Insert mode --
-----------------

map('i', '<C-BS>', '<C-w>', opts)


local status, builtin = pcall(require, "telescope.builtin")
if status then
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
end
