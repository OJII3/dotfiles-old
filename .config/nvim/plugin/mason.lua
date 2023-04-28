-- local satus, mason = pcall(require, 'mason')
-- if not satus then
--   return
-- end

-- local mason_package = require('mason-core.package')
-- local mason_registry = require('mason-registry')
-- local null_ls = require('null-ls')
-- local null_ls_helpers = require('null-ls.helpers')
-- local mason_lspconfig = require('mason-lspconfig')
-- local nvim_lspconfig = require('lspconfig')

-- mason.setup({})
-- mason_lspconfig.setup({})

-- local null_sources = {}
-- for _, package in ipairs(mason_registry.get_installed_packages()) do
--   local package_category = package.spec.categories[1]
--   if package_category == mason_package.Cat.Formatter then
--     table.insert(null_sources, null_ls.builtins.formatting[package.name])
--   end
--   if package_category == mason_package.Cat.Linter then
--     table.insert(null_sources, null_ls.builtins.diagnostics[package.name])
--   end
-- end


-- table.insert(null_sources, null_ls.builtins.diagnostics.eslint.with({
--   prefer_local = "node_modules/.bin"
-- }))


-- null_ls.setup({
--   sources = null_sources,
-- })
