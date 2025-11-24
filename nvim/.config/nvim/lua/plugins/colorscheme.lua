return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				-- transparent_background = true,
				styles = {
					keywords = { "italic" },
					comments = {},
				},
				specs = {
					{
						"akinsho/bufferline.nvim",
						optional = true,
						opts = function(_, opts)
							if (vim.g.colors_name or ""):find("catppuccin") then
								opts.highlights = require("catppuccin.special.bufferline").get_theme()
							end
						end,
					},
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	-- {
	-- 	"xiyaowong/transparent.nvim",
	-- 	config = function()
	-- 		require("transparent").setup({
	-- 			extra_groups = {
	-- 				"BlinkCmpDoc",
	-- 				"BlinkCmpDocBorder",
	-- 				"BlinkCmpDocSeparator",
	-- 				"BlinkCmpSignatureHelp",
	-- 				"BlinkCmpSignatureHelpBorder",
	-- 			},
	-- 			exclude_groups = {},
	-- 		})
	-- 	end,
	-- },
}
