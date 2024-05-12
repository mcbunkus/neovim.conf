return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				-- border = true,
				-- path_display = "smart",
				-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				file_ignore_patterns = {
					"%.o",
					"%.d",
					"%.png",
					"%.jpeg",
					"%.jpg",
					"%.svg",
					"%.otf",
					"%.ttf",
					".git/",
					"%.tscn",
				},
			},
		})
	end,

	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "find files",
		},
		{
			"<leader>fi",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "find files tracked by Git",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "grep workspace",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").colorscheme({ enable_preview = true })
			end,
			desc = "colorschemes",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "help",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").reloader()
			end,
			desc = "reload modules",
		},
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "keymaps",
		},
		{
			"<leader>ft",
			function()
				require("telescope.builtin").grep_string({ search = "TODO" })
			end,
			desc = "find TODOs",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "fuzzy search current buffer",
		},
		{
			"<leader>fo",
			function()
				require("telescope.builtin").vim_options()
			end,
			desc = "Neovim options",
		},
		{
			"<leader>fd",
			function()
				require("telescope.builtin").find_files({ hidden = true, cwd = "~/.config/nvim" })
			end,
			desc = "find config files",
		},
		{
			"<leader>fm",
			function()
				require("telescope.builtin").man_pages({ sections = { "ALL" } })
			end,
			desc = "find map pages",
		},
		{
			"<leader>gc",
			function()
				require("telescope.builtin").git_commits()
			end,
			desc = "commits",
		},
		{
			"<leader>gx",
			function()
				require("telescope.builtin").git_bcommits()
			end,
			desc = "buffer commits",
		},
		{
			"<leader>gb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "branches",
		},
		{
			"<leader>gs",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "status",
		},
		{
			"<leader>lr",
			function()
				require("telescope.builtin").lsp_references()
			end,
			desc = "references",
		},
		{
			"<leader>ld",
			function()
				require("telescope.builtin").lsp_definitions()
			end,
			desc = "definitions",
		},
		{
			"<leader>li",
			function()
				require("telescope.builtin").lsp_implementations()
			end,
			desc = "implementations",
		},
		{
			"<leader>ls",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "document symbols",
		},
		{
			"<leader>lw",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
			desc = "workspace symbols",
		},
		{
			"<leader>le",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "find diagnostics",
		},
		{
			"<leader>p",
			function()
				require("telescope.builtin").commands()
			end,
			desc = "commands",
		},
		{
			"<leader>b",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "find buffers",
		},
	},
}
