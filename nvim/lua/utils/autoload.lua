local plugins_dir = vim.fn.stdpath("config") .. "/lua/auto"

for _, file in ipairs(vim.fn.glob(plugins_dir .. "/*", false, true)) do
	-- :t tails the path
	-- eg: /something/falana/dhimkana/test.lua -> test.lua
	--
	-- :r strips the extension
	-- test.lua -> test
	local name = vim.fn.fnamemodify(file, ":t:r")
	require("auto." .. name)
end
