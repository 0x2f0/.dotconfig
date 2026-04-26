-- oil nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- terminal ESC remap
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

vim.keymap.set("n", "so", function() 
	dofile(vim.fn.expand("%"))
	print("Sourced: ".. vim.fn.expand("%"))
end)
