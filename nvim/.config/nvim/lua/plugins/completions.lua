return {
	{
		"L3MON4D3/LuaSnip",
		version = "^2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",
		dependencies = { "L3MON4D3/LuaSnip" },
		opts = {
			keymap = {
				preset = "super-tab",
			},
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			completion = {
				menu = {
					scrollbar = false,
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "kind" },
							{ "source_name" },
						},
					},
				},
				-- trigger = {
				-- 	show_in_snippet = false,
				-- },
				list = {
					selection = {
						preselect = function(ctx)
							return not require("blink.cmp").snippet_active({ direction = 1 })
						end,
					},
				},
				ghost_text = { enabled = false },
				documentation = {
					auto_show = true,
					window = {
						scrollbar = false,
					},
				},
			},
			cmdline = {
				sources = function()
					local cmd_type = vim.fn.getcmdtype()
					if cmd_type == "/" or cmd_type == "?" then
						return { "buffer" }
					end
					if cmd_type == ":" then
						return { "cmdline" }
					end
					return {}
				end,
				keymap = {
					preset = "super-tab",
				},
				completion = {
					menu = {
						auto_show = true,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
		config = function(_, opts)
			require("blink.cmp").setup(opts)
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
