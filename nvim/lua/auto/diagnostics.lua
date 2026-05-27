local keymap = function(key, fn, desc, mode)
	vim.keymap.set(mode or "n", key, fn, {
		desc = desc,
	})
end

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
