return {
	"folke/flash.nvim",
	opts = {
		modes = {
			char = { enable = false },
		},
	},
	event = "VeryLazy",
	keys = {
		{
			"gs",
			function()
				require("flash").jump()
			end,
			mode = { "n", "x", "o" },
			desc = "Flash",
		},
		{
			"<leader>ts",
			function()
				require("flash").treesitter()
			end,
			mode = { "n", "o" },
			desc = "Flash Treesitter",
		},
		{
			"r",
			function()
				require("flash").remote()
			end,
			mode = "o",
			desc = "Remote Flash",
		},
		{
			"R",
			function()
				require("flash").treesitter_search()
			end,
			mode = { "o", "x" },
			desc = "Treesitter Search",
		},
		{
			"<c-s>",
			function()
				require("flash").toggle()
			end,
			mode = { "c" },
			desc = "Toggle Flash Search",
		},
	},
}
