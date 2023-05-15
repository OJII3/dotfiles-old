local keymap = vim.keymap

-- builtin
keymap.set('n', '<Space>.', ':e $MYVIMRC<CR>')
keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })
keymap.set('t', '<C-[>', '<C-\\><C-n>', { noremap = true, silent = true })
keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true, silent = true })
-- fern
keymap.set('n', '<Space>e', "<cmd>Fern . -drawer -toggle<CR>", { noremap = true, silent = true })
-- telescope
keymap.set('n', '<Space>g', '<cmd>Telescope git_files<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>f', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
keymap.set('n', '<Space>o', '<cmd>Telescope oldfiles<cr>', { noremap = true, silent = true })
keymap.set('n', '<Space>r', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
-- lightspeed
keymap.set('n', 's', '<Plug>Lightspeed_s', { noremap = true, silent = true })
-- coc
keymap.set('i', '<C-Space>', 'coc#refresh()', { expr = true, silent = true })       -- trigger completion
keymap.set('n', '<Leader>rn', '<Plug>(coc-rename)', { silent = true })              -- rename
keymap.set('n', '<Leader>fm', '<Plug>(coc-format)', { silent = true })              -- format
keymap.set('n', '<Leader>ca', '<Plug>(coc-codeaction-selected)', { silent = true }) -- code action
keymap.set('n', '<Leader>rf', '<Plug>(coc-references)', { silent = true })          -- references
-- skkeleton
keymap.set('i', '<C-j>', '<Plug>(skkeleton-enable)', { noremap = false, silent = true })
keymap.set('i', '<C-k>', '<Plug>(skkeleton-disable)', { noremap = false, silent = true })
keymap.set('c', '<C-j>', '<Plug>(skkeleton-enable)', { noremap = false, silent = true })
keymap.set('c', '<C-k>', '<Plug>(skkeleton-disable)', { noremap = false, silent = true })
-- markdown-preview
keymap.set('n', '<Space>m', '<Plug>MarkdownPreviewToggle', { noremap = false, silent = true })
-- toggleterm
keymap.set('n', '<C-s>t', '<cmd>ToggleTerm direction=tab<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-s>v', '<cmd>ToggleTerm direction=vertical size=100<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-s>h', '<cmd>ToggleTerm direction=horizontal size=12<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-s>f', '<cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true })
keymap.set('t', '<C-s>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-s>g', '<cmd>lua Lazygit_toggle()<CR>', { noremap = true, silent = true })
