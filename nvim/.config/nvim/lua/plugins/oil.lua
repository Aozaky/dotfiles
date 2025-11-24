return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open Oil file explorer" },
	},

	---@module 'oil'
	---@type oil.SetupOpts

	opts = {
		default_file_explorer = true,
	},
}
