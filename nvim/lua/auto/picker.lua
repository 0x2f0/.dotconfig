vim.pack.add({"https://github.com/ibhagwan/fzf-lua"})

local picker = require("fzf-lua")

picker.setup({
	keymap = {
		actions = {
			true, -- inherit all the default
			["<C-q>"] = picker.actions.file_sel_to_qf,
		},
		builtin = {
			true,
			["<C-f>"] = "toggle-fullscreen",
			["<C-h>"] = "toggle-help",
			["<C-p>"] = "toggle-preview",
			["<C-w>"] = "toggle-preview-wrap",
		},
	},
	files = {
		cwd_prompt = false,
		prompt = "f> ",
	},
		winopts = {
			preview = {
				hidden = true,
			}
		},
});

vim.keymap.set({"n"}, "<leader>sg", picker.grep)
vim.keymap.set({"n"}, "<leader>lg", picker.live_grep)
vim.keymap.set({"n"}, "<leader>gw", picker.grep_cword)
vim.keymap.set({"n"}, "<leader>gW", picker.grep_cWORD)
vim.keymap.set({"n"}, "<leader>sf", picker.files)
vim.keymap.set({"n"}, "<leader>sr", picker.resume)
vim.keymap.set({"n"}, "<leader>sb", picker.buffers)
vim.keymap.set({"n"}, "<leader>sq", picker.quickfix)
vim.keymap.set({"n"}, "<leader>so", picker.history)
vim.keymap.set({"n"}, "<leader>sz", picker.zoxide, {desc = "Uses zoxide history to change the cwd"})
vim.keymap.set({"n"}, "<leader>sh", function() picker.helptags({ prompt = "help> ", }) end)
vim.keymap.set({"n"}, "<leader>sm", function() picker.manpages() end)
vim.keymap.set({"n"}, "<leader>sd", function()
	local configDir = "~/.config/.dotconfig" picker.files({ cwd = configDir }) 
end, { desc = "Search the dotfiles and open in tab" })

vim.keymap.set({"n"}, "<leader>sc", function()
	local configDir = "~/.config/.dotconfig/nvim"
	picker.files({ cwd = configDir })
end, { desc = "Search neovim configuration" })
