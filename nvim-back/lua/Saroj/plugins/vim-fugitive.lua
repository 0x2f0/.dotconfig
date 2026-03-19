return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Go to git staging area" })
		vim.keymap.set(
			"n",
			"<leader>dh",
			"<Cmd>diffget //2<Cr>",
			{ desc = "Get the code from the second buffer to the first buffer. " }
		)
		vim.keymap.set(
			"n",
			"<leader>dl",
			"<Cmd>diffget //3<Cr>",
			{ desc = "Get the code from the third buffer to the first buffer. " }
		)
	end,
}
