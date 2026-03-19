vim.o.nu = true
vim.o.rnu = true

vim.o.mouse = ""
vim.o.mousescroll = "ver:0,hor:0"

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.wrap = false

vim.g.mapleader = " "

vim.pack.add({
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/nvim-tree/nvim-web-devicons',
	"https://github.com/sainnhe/gruvbox-material",
	"https://github.com/nvim-mini/mini.nvim",
})

-- fff.nvim
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(event)
		if event.data.updated then
			require('fff.download').download_or_build_binary()
		end
	end,
})

vim.g.fff = {
	lazy_sync = false,
	debug = {
		enabled = true
	}
}

vim.keymap.set( "n", "<leader>df", function() 
end)
vim.keymap.set( "n", "<leader>sf", function() 
end)

-- oil nvim
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
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- mini nvim
require("mini.surround").setup({ })
require("mini.pick").setup({
	window = {
		config = {
			relative = "win",
			row = 10,
			col = 10,
			width = 100,
			height = 100,
			border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
		},
		prompt_caret = "█",
		prompt_prefix = "$> ",
	},
	mappings = {
		choose_in_vsplit = "<c-v>",
		choose_in_split = "<c-s>",
		move_down = "<c-j>",
		move_up = "<c-k>",
	},
})

vim.keymap.set("n", "<leader>sf", function()
	require("mini.pick").builtin.cli({ command = { 'git', 'ls-files', '--recurse-submodules' } })
end, { desc = "[S]earch [F]iles" })

vim.keymap.set("n", "<leader>sr", function()
	vim.cmd("Pick resume")
end, { desc = "[S]earch [R]esume" })

vim.keymap.set("n", "<leader>sh", function()
	vim.cmd("Pick help")
end, { desc = "[S]earch [H]elp" })

vim.keymap.set("n", "<leader>ss", function()
	vim.cmd("Pick grep_live")
end, { desc = "[S]earch [S]tring" })

vim.keymap.set("n", "<leader>sg", function()
	vim.cmd("Pick grep")
end, { desc = "[S]earch [G]rep" })

vim.keymap.set("n", "<leader>sb", function()
	vim.cmd("Pick buffers")
end, { desc = "[S]earch [B]uffers" })

vim.keymap.set("n", "<leader>sb", function()
	vim.cmd("Pick buffers")
end, { desc = "[S]earch [B]uffers" })

-- theme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox-material]])
