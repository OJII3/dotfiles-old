local keymap = vim.keymap

-- builtin
keymap.set('n', '<F1>', ':edit $MYVIMRC<CR>')
keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })
keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true, silent = true })
-- fern
keymap.set('n', '<Space>e', "<cmd>Fern . -drawer -toggle<CR>", { noremap = true, silent = true })
-- telescope
keymap.set('n', '<Space>g', '<cmd>Telescope git_files<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>fd', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>h', '<cmd>Telescope oldfiles<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>r', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
-- lightspeed
keymap.set('n', 's', '<Plug>Lightspeed_s', { noremap = true, silent = true })
-- coc
keymap.set('i', '<C-Space>', 'coc#refresh()', { expr = true, silent = true }) -- trigger completion
keymap.set('i', '<C-e>', '<Plug>(coc-snippet-expand-jump)')                   -- trigger snippet
keymap.set('n', 'rn', '<Plug>(coc-rename)', { silent = true })                -- rename
-- skkeleton
keymap.set('i', '<C-j>', '<Plug>(skkeleton-enable)', { noremap = false, silent = true })
keymap.set('c', '<C-j>', '<Plug>(skkeleton-enable)', { noremap = false, silent = true })
-- markdown-preview
keymap.set('n', '<Space>m', '<Plug>MarkdownPreviewToggle', { noremap = false, silent = true })
-- toggleterm
keymap.set('n', '<Space>t', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
keymap.set('t', '<C-j>', '<C-\\><C-n><cmd>ToggleTerm<CR>', { noremap = true, silent = true })
