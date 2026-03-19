return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-refactor",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		---@diagnostic disable-next-line: missing-fields
		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			refactor = {
				highlight_definitions = { enable = true, clear_on_cursor_move = true },
				smart_rename = { enable = true },
				navigation = { enable = true },
				keymaps = {
					list_definitions = "<leader>ld",
					goto_next_usage = "gnu",
					goto_previous_usage = "gpu",
					smart_rename = "<leader>srn",
				},
			},
		})
	end,
}
