vim.g["fern#default_hidden"] = 1
vim.g["fern#renderer"] = "nerdfont"
vim.cmd([[
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
]])
