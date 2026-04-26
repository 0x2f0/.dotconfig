vim.pack.add({
	'https://github.com/nvim-tree/nvim-web-devicons',
	"https://github.com/sainnhe/gruvbox-material",
})

-- theme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox-material]])
