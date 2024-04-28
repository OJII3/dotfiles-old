return {
	"vim-scripts/vim-auto-save",
	config = function()
		vim.g.auto_save = 0
		vim.g.auto_save_silent = 1
		vim.g.auto_save_in_insert_mode = 1

		vim.cmd([[
      augroup ft_markdown
        au!
        au FileType markdown let b:auto_save = 1
      augroup END
    ]])
	end,
	event = "BufReadPre",
}
