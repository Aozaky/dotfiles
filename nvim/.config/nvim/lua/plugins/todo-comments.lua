return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
	opts = {
		highlight = {
			pattern = [[.*<(KEYWORDS)\s*]],
		},
    search = {
      pattern = [[\b(KEYWORDS)\s*]],
    },
	},
}
