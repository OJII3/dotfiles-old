return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{
			"github/Copilot.vim",
			config = function()
				vim.g.copilot_filetypes = {
					markdown = true,
					yaml = true,
					toml = true,
					gitcommit = true,
					text = true,
				}
			end,
			event = "InsertEnter",
		},
		{ "nvim-lua/plenary.nvim" },
	},
	opts = {},
	build = function()
		vim.defer_fn(function()
			vim.cmd("UpdateRemotePlugins")
			vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
		end, 3000)
	end,
	keys = {
		{
			"<leader>ccq",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
				end
			end,
			desc = "CopilotChat - Quick chat",
		},
	},
	event = "VeryLazy",
}
