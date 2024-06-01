return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
			per_filetype = {
				["tsx"] = {
					enable_close = true,
				},
			},
		})
	end,
	event = { "InsertEnter *.html", "InsertEnter *.xml", "InsertEnter *.jsx", "InsertEnter *.tsx" },
}
