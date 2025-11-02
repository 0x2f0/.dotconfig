-- highlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- These are the auto commands that rfter
-- the lspattaches and provide some good shortcuts and keymaps
-- for making the editing experience great again
-- And offcourse starting the completion engine
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local mpicker = require("mini.pick")

		Keymap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

		-- this definitions are remaining.
		--[[ Keymap("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		Keymap("<leader>gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		Keymap("<leader>td", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		Keymap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		Keymap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols") ]]

		Keymap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		Keymap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		Keymap("K", vim.lsp.buf.hover, "Hover Documentation")
		Keymap("<leader>gd", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})
