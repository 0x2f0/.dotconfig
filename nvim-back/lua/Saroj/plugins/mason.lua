return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		-- setting up mason
		local mason = require("mason")
		mason.setup({})

		-- setting up the mason-lspconfig, it bridges the gap between lsp config and
		-- mason, creating a nice system where we can specify items from nvim-lspconfig to
		-- be preinstalled. And included in mason. And translates the mason package names to the
		-- actual lsp servers names.
		local mason_lspconfig = require("mason-lspconfig")

		-- These are the lsp servers that I want to be preinstalled.
		local servers = {
			lua_ls = {},
			ts_ls = {},
			emmet_ls = {},
			tailwindcss = {},
			cssls = {},
			bashls = {},
			jqls = {},
		}

		local servers_names = vim.tbl_keys(servers or {})
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		mason_lspconfig.setup({
			ensure_installed = servers_names,
			automatic_installation = true,
			handlers = {
				function(server_name)
					vim.lsp.enable(server_name)
					vim.lsp.config(server_name, {
						capabilities = capabilities,
					})
				end,
			},
		})
	end,
}
