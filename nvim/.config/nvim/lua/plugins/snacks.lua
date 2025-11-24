return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = {},
			dashboard = {},
			indent = {},
			notifier = {},
			scope = {},
		},
		-- keys = {
		-- 	{
		-- 		"<leader>th",
		-- 		function()
		-- 			require("snacks.picker").colorschemes({ layout = "ivy" })
		-- 		end,
		-- 		desc = "Pick Theme",
		-- 	},
		-- },
	},
}
