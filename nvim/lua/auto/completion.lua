vim.pack.add({ 'https://github.com/saghen/blink.cmp', 'https://github.com/saghen/blink.lib' })
local cmp = require('blink.cmp')

cmp.build():wait(60000)
cmp.setup({
	keymap = {
		preset = "default",
		["<C-p>"] = {},
		["<C-n>"] = {},
		["<C-j>"] = { "select_next" },
		["<C-k>"] = { "select_prev" },
		["<C-e>"] = { "hide" },
		["<C-c>"] = { "hide" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	-- (Default) Only show the documentation popup when manually triggered
	completion = {
	menu = {
		auto_show = false
	},
		documentation = {
			auto_show = true,
			window = { border = "rounded" },
		},
		accept = { auto_brackets = { enabled = false } },
		list = {
			selection = {
				auto_insert = false,
				preselect = true,
			},
		},
	},
	sources = {
		default = { "lsp", "path", "buffer", "snippets" },
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
})
