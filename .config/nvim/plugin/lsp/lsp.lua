local status, mason = pcall(require, "mason")
if not status then
	return
end

mason.setup({})

local mason_lsp = require("mason-lspconfig")
local nvim_lsp = require("lspconfig")
mason_lsp.setup({
	ensure_installed = {
		"bashls",
		"cssls",
		"denols",
		"dockerls",
		"docker_compose_language_service",
		"efm",
		"eslint",
		"html",
		"jsonls",
		"pyright",
		"stylelint_lsp",
		"tailwindcss",
		"tsserver",
		"vimls",
		"yamlls",
		"biome",
		"clangd",
		"cmake",
		"jsonls",
		"texlab",
		"lua_ls",
		"cssls",
		"mdx_analyzer",
		"pyright",
		"omnisharp_mono",
		"graphql",
		"typst_lsp",
		"lemminx",
		"taplo",
		"astro",
	},
})

mason_lsp.setup_handlers({
	function(server_name)
		if server_name == "efm" then
			return
		end

		local opts = {
			capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			),
		}
		if server_name == "denols" then
			-- INFO: Neccessary for avoiding conflict with other js severs
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
		elseif server_name == "biome" then
			opts.single_file_support = false
		elseif server_name == "eslint" then
			opts.root_dir = nvim_lsp.util.root_pattern(".eslintrc.js", ".eslintrc.json", ".eslintrc")
		elseif server_name == "stylelint_lsp" then
			opts.filetypes = { "css", "scss", "less", "sass" } -- exclude javascript and typescript
		end
		nvim_lsp[server_name].setup(opts)
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
