return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		local ts_js_eco = {
			"prettierd",
			"prettier",
			stop_after_first = true,
			timeout_ms = 3000,
		}

		conform.setup({
			log_level = vim.log.levels.DEBUG,
			formatters = {
				prettierd = {
					inherit = false,
					command = "prettierd",
					args = { "$FILENAME" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				typescriptreact = ts_js_eco,
				javascriptreact = ts_js_eco,
				javascript = ts_js_eco,
				typescript = ts_js_eco,
				svelte = ts_js_eco,
				json = { "jq" },
				python = { "black" },
			},
			lsp_fallback = true,
		})

		vim.keymap.set("n", "<c-f>", function()
			print("Formatting the file")
			local bufid = vim.api.nvim_get_current_buf()
			conform.format({ bufnr = bufid }, function(err, did_edit)
				if err then
					print("Error occured while formatting the file")
				end

				if did_edit then
					print("File formatted successfully")
				else
					print("Noting to be formatted!!")
				end
			end)
		end, { desc = "Format the current file" })
	end,
}
