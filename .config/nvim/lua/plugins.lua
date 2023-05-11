-- auto bootstrap lazy.nvim ======================================================
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nivm ==========================================================

-- vim.g.mapleader = ' ' -- make sure to set `mapleader` before lazy so your mappings are correct

require('lazy').setup({
  { 'folke/which-key.nvim' },
  {
    'folke/neoconf.nvim',
    cmd = 'Neoconf'
  },
  { 'nvim-lua/plenary.nvim' },
  { 'kyazdani42/nvim-web-devicons' },
  { 'lambdalisue/fern.vim' },
  {
    'lambdalisue/nerdfont.vim',
    lazy = true
  },
  {
    'lambdalisue/fern-git-status.vim',
    dependencies = { "lambdalisue/fern.vim" }
  },
  {
    'lambdalisue/fern-renderer-nerdfont.vim',
    dependencies = {
      'lambdalisue/nerdfont.vim',
      'lambdalisue/fern.vim'
    }
  },
  {
    'lambdalisue/glyph-palette.vim',
    dependencies = {
      'lambdalisue/nerdfont.vim',
      'lambdalisue/fern.vim',
    },
  },
  { 'nvim-lualine/lualine.nvim' },
  -- colorscheme
  { 'folke/tokyonight.nvim' },
  { 'EdenEast/nightfox.nvim' },
  --
  {
    'neoclide/coc.nvim',
    branch = 'release',
  },
  -- lsp
  -- { 'neovim/nvim-lspconfig' },
  -- { 'jose-elias-alvarez/null-ls.nvim' },
  -- { 'williamboman/mason-lspconfig.nvim' },
  -- { 'onsails/lspkind-nvim' },
  -- { 'hrsh7th/nvim-cmp' },
  -- { 'hrsh7th/cmp-nvim-lsp' },
  -- { 'hrsh7th/cmp-vsnip' },
  -- { 'hrsh7th/cmp-buffer' },
  -- { 'hrsh7th/cmp-path' },
  -- { 'hrsh7th/cmp-cmdline' },
  -- { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  -- { 'onsails/lspkind.nvim' },
  -- { 'williamboman/mason.nvim', build = ":MasonUpdate" },
  -- { 'L3MON4D3/LuaSnip' },
  {
    'windwp/nvim-autopairs',
    init = function() require('nvim-autopairs').setup() end
  },
  {
    'kylechui/nvim-surround',
    init = function() require('nvim-surround').setup() end
  },
  { 'lewis6991/gitsigns.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'windwp/nvim-ts-autotag' },
  { 'ggandor/lightspeed.nvim' },
  {
    'glepnir/lspsaga.nvim',
    branch = 'main'
  },
  {
    'nvim-treesitter/nvim-treesitter',
    init = function() require('nvim-treesitter.install').update({ with_sync = true }) end
  },
  { 'github/Copilot.vim' },
  { 'vim-denops/denops.vim' },
  { 'vim-skk/skkeleton' },
  { 'ryicoh/deepl.vim' },
  { 'haya14busa/vim-edgemotion' },
  { 'tpope/vim-commentary' },
  { 'johngrib/vim-game-code-break' },
  {
    'iamcco/markdown-preview.nvim',
    config = function() vim.fn["mkdp#util#install"]() end
  },
  {
    'akinsho/toggleterm.nvim',
    config = true
  },
  { 'goolord/alpha-nvim' },
  { 'TimUntersberger/neogit' },
  { 'vim-latex/vim-latex' },
})
