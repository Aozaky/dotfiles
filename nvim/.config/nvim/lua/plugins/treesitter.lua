return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		lazy = false,
		opts = {
			ignore_install = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
			auto_install = true,
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			-- 增量选择
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gii",
					node_incremental = "gin",
					scope_incremental = "gic",
					node_decremental = "gid",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			vim.treesitter.language.register("bash", "zsh")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}
