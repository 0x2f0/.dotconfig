local utils = require("Saroj.utils")
local keymap = utils.keymap

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
		keymap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

		keymap("<leader>sd", function()
			vim.lsp.buf.document_symbol({})
		end, "[D]oument [S]ymbols")

		keymap("<leader>sw", function()
			local query = utils.get_word_under_cursor()

			--- @type vim.lsp.ListOpts
			local options = {}

			vim.lsp.buf.workspace_symbol(query, options)
		end, "[W]orkspace [S]ymbols")

		-- this definitions are remaining.
		--[[ Keymap("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		Keymap("<leader>gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		Keymap("<leader>td", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")]]

		keymap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		keymap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		keymap("K", vim.lsp.buf.hover, "Hover Documentation")
		keymap("<leader>gd", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

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

vim.api.nvim_create_autocmd("termopen", {
	command = "startinsert",
})
