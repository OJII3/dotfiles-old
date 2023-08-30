-- auto bootstrap lazy.nvim ======================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nivm ==========================================================

-- vim.g.mapleader = ' ' -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  { "folke/which-key.nvim" },
  { "folke/neoconf.nvim",          cmd = "Neoconf" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/nerdfont.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
      "lambdalisue/fern-git-status.vim",
      "lambdalisue/glyph-palette.vim",
    },
  },
  { "lambdalisue/nerdfont.vim",        lazy = true },
  { "lambdalisue/fern-git-status.vim", lazy = true },
  {
    "lambdalisue/fern-renderer-nerdfont.vim",
    lazy = true,
  },
  { "lambdalisue/glyph-palette.vim", lazy = true },
  { "nvim-lualine/lualine.nvim" },
  -- colorscheme ----------------
  { "folke/tokyonight.nvim",         lazy = true },
  { "ayu-theme/ayu-vim",             lazy = true },
  { "cocopon/iceberg.vim",           lazy = true },
  ------------------------------
  { "neoclide/coc.nvim",             branch = "release" },
  { "heavenshell/vim-jsdoc" },
  -- lsp
  -- { 'neovim/nvim-lspconfig' },
  -- { 'williamboman/mason-lspconfig.nvim' },
  -- {
  -- 	"glepnir/lspsaga.nvim",
  -- 	branch = "main",
  -- },
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
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
  },
  { "rafamadriz/friendly-snippets" },
  {
    "windwp/nvim-autopairs",
    init = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    init = function()
      require("nvim-surround").setup()
    end,
  },
  -- { "lewis6991/gitsigns.nvim", lazy = true },
  { "nvim-telescope/telescope.nvim" },
  { "windwp/nvim-ts-autotag" },
  { "ggandor/lightspeed.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  { "github/Copilot.vim" },
  { "vim-denops/denops.vim" },
  { "vim-skk/skkeleton",           dependencies = { "vim-denops/denops.vim" } },
  { "lambdalisue/kensaku.vim",     dependencies = { "vim-denops/denops.vim" } },
  -- { "ryicoh/deepl.vim", },
  -- { 'haya14busa/vim-edgemotion' },
  { "tpope/vim-commentary" },
  { "johngrib/vim-game-code-break" },
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { "romgrk/barbar.nvim" },
  { "akinsho/toggleterm.nvim", config = true },
  { "goolord/alpha-nvim",      dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "lervag/vimtex" },
  { "dstein64/vim-startuptime" },
  { "monaqa/dial.nvim" },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
  },
})
