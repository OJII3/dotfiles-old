return {
	enabled = function()
		return os.getenv("TERM") == "xterm-kitty"
	end,
	"3rd/image.nvim",
	dependencies = {
		{ "vhyrro/luarocks.nvim" },
	},
	build = false,
	config = true,
}
