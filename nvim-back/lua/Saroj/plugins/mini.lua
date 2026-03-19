local function keymap(...)
	vim.keymap.set(...)
end

return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.surround").setup()

		local pick = require("mini.pick")

		pick.setup({
			window = {
				config = {
					relative = "win",
					row = 10,
					col = 10,
					width = 100,
					height = 100,
					border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
				},
				prompt_caret = "█",
				prompt_prefix = "$> ",
			},
			mappings = {
				choose_in_vsplit = "<c-v>",
				choose_in_split = "<c-s>",
				move_down = "<c-j>",
				move_up = "<c-k>",
			},
		})

		keymap("n", "<leader>sf", function()
			vim.cmd("Pick files")
		end, { desc = "[S]earch [F]iles" })

		keymap("n", "<leader>sr", function()
			vim.cmd("Pick resume")
		end, { desc = "[S]earch [R]esume" })

		keymap("n", "<leader>sh", function()
			vim.cmd("Pick help")
		end, { desc = "[S]earch [H]elp" })

		keymap("n", "<leader>ss", function()
			vim.cmd("Pick grep_live")
		end, { desc = "[S]earch [S]tring" })

		keymap("n", "<leader>sg", function()
			vim.cmd("Pick grep")
		end, { desc = "[S]earch [G]rep" })

		keymap("n", "<leader>sb", function()
			vim.cmd("Pick buffers")
		end, { desc = "[S]earch [B]uffers" })

		keymap("n", "<leader>sb", function()
			vim.cmd("Pick buffers")
		end, { desc = "[S]earch [B]uffers" })
	end,
}
