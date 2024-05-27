return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointTextHl" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStoppedTextHl" })

		dap.adapters = {
			codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					-- Masonはここにデバッガを入れてくれる
					command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
					-- ポートを自動的に割り振ってくれる
					args = { "--port", "${port}" },
				},
			},
			python = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/debugpy",
				-- args = { "-m", "debugpy.adapter" },
			},
		}
		dap.configurations = {
			cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/a.out", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			},
			python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						return "python"
					end,
				},
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
	event = "VeryLazy",
	keys = {
		{ "<F5>", "<cmd>lua require'dap'.continue()<CR>" },
		{ "<F10>", "<cmd>lua require'dap'.step_over()<CR>" },
		{ "<F11>", "<cmd>lua require'dap'.step_into()<CR>" },
		{ "<F12>", "<cmd>lua require'dap'.step_out()<CR>" },
		{ "<Leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>" },
		{ "<Leader>B", "<cmd>lua require'dap'.set_breakpoint()<CR>" },
		{ "<Leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" },
		{ "<Leader>dr", "<cmd>lua require'dap'.repl.open()<CR>" },
		{ "<Leader>dl", "<cmd>lua require'dap'.run_last()<CR>" },
		{ "<Leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<CR>" },
		{ "<Leader>dp", "<cmd>lua require'dap.ui.widgets'.preview()<CR>" },
		{ "<Leader>df", "<cmd>lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.frames)<CR>" },
		{ "<Leader>ds", "<cmd>lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.scopes)<CR>" },
	},
}
