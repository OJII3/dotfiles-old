return {
	"giusgad/pets.nvim",
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
		{
			"giusgad/hologram.nvim",
			config = function()
				require("hologram").setup({
					auto_display = true,
				})
			end,
		},
	},
	lazy = false,
  opts = true,
}
