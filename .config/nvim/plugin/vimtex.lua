local status, vimtex = pcall(require, "vimtex")
if not status then
	return
end

vim.g.vimtex_view_method = "general"
vim.g.vimtex_view_general_viewer = "xdg-open"
vim.g.vimtex_view_general_options = "@pdf"
vim.g.vimtex_compiler_method = "latexrun"
vim.g.vimtex_fold_types = "<sections>"
