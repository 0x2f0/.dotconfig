function Keymap(keys, fn, desc, mode)
	mode = mode or "n"
	vim.keymap.set("n", keys, fn, {
		desc = desc or "",
	})
end

-- mapping the vim diagnonistics
Keymap("<leader>d", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.open_float()
end, "Opens the error diagnostic float")

Keymap("d[", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.jump({
		count = -1,
		float = true,
	})
end, "moves to previous vim  diagnostic float")

Keymap("d]", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.jump({
		count = 1,
		float = true,
	})
end, "moves to next vim  diagnostic float")

--- open the definition in a new split
Keymap("gvd", function()
	vim.cmd("rightbelow vsplit")
	vim.lsp.buf.definition()
end)

--- open the definition in a new split
Keymap("ghd", function()
	vim.cmd("rightbelow split")
	vim.lsp.buf.definition()
end)

-- vertical split into file explorer
Keymap("v-", function()
	vim.cmd("rightbelow vsplit")
	vim.cmd("norm -")
end)

--[[ -- vertical split into file explorer
Keymap("<Esc>", "<C-\\><C-n>", {}) ]]
