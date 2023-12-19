local status, mason = pcall(require, "mason")
if not status then
	return
end

mason.setup({})

local mason_lsp = require("mason-lspconfig")
local nvim_lsp = require("lspconfig")
mason_lsp.setup({})
mason_lsp.setup_handlers({
	function(server_name)
		local opts = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		}
		if server_name == "denols" then -- WARN: Neccessary for avoiding error
			opts = {
				root_dir = nvim_lsp.util.root_pattern("deno.json"),
				init_options = {
					lint = true,
					unstable = true,
					suggest = {
						imports = {
							hosts = {
								["https://deno.land"] = true,
								["https://cdn.nest.land"] = true,
								["https://crux.land"] = true,
							},
						},
					},
				},
			}
		elseif server_name == "biome" or server_name == "efm/biome" then
			opts = {
				root_dir = nvim_lsp.util.root_pattern("biome.toml"),
			}
		elseif server_name == "eslint" then
			opts = {
				root_dir = nvim_lsp.util.root_pattern(".eslintrc.js", ".eslintrc.json", ".eslintrc"),
			}
		elseif server_name == "efm" then
		else
			nvim_lsp[server_name].setup(opts)
		end
	end,
})

local function on_list(options)
	vim.fn.setqflist({}, " ", options)
	vim.api.nvim_command("cfirst")
end

vim.lsp.buf.definition({ on_list = on_list })
vim.lsp.buf.references(nil, { on_list = on_list })
vim.diagnostic.config({
	virtual_text = {
		source = true,
	},
})
