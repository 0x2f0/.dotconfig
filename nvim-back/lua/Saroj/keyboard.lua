local utils = require("Saroj.utils")
local keymap = utils.keymap
local compile = require("Saroj.compile")

keymap("-", "<CMD>Oil<CR>", "Open parent directory")

-- mapping the system clipboard
keymap("<leader>y", '"+y', "Copy to the system clipboard (normal mode)", "n")
keymap("<leader>Y", '"+Y', "Copy to the system clipboard (normal mode)", "n")
keymap("<leader>y", '"+y', "Copy to the system clipboard (visual mode)", "x")
keymap("<leader>Y", '"+Y', "Copy to the system clipboard (visual mode)", "x")

-- mapping the vim diagnonistics
keymap("<leader>d", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.open_float()
end, "Opens the error diagnostic float")

keymap("d[", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.jump({
		count = -1,
		float = true,
	})
end, "moves to previous vim  diagnostic float")

keymap("d]", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.jump({
		count = 1,
		float = true,
	})
end, "moves to next vim  diagnostic float")

--- open the definition in a new split
keymap("gvd", function()
	vim.cmd("rightbelow vsplit")
	vim.lsp.buf.definition()
end)

--- open the definition in a new split
keymap("ghd", function()
	vim.cmd("rightbelow split")
	vim.lsp.buf.definition()
end)

-- vertical split into file explorer
keymap("v-", function()
	vim.cmd("rightbelow vsplit")
	vim.cmd("norm -")
end)

keymap("<Esc>", "<C-\\><C-n>", nil, "t")

keymap("<M-c>", function()
	compile.command()
end, "Opens tmux like compile window at the bottom")

keymap("<M-e>", function()
	compile.editCmdAndCwd()
end, "Edit the compile command envs")

keymap("<C-l>", function()
	utils.open_term_in_current_dir()
end, "Open Terminal in the split aside.")
