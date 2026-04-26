vim.pack.add({
	'https://github.com/stevearc/oil.nvim',
})

require("oil").setup({
	skip_confirm_for_simple_edits = true,
	columns = { "icon", "permissions", "size" },
	lsp_file_methods = {
		enable = true,
		autosave_changes = true,
	},
	view_options = {
		show_hidden = true,
	}
})
