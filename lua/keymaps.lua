-- Keybindings

local wk = require("which-key")
local oil = require("oil")

-- window management
vim.keymap.set({ "n", "i" }, "<c-h>", "<c-w>h")
vim.keymap.set({ "n", "i" }, "<c-j>", "<c-w>j")
vim.keymap.set({ "n", "i" }, "<c-k>", "<c-w>k")
vim.keymap.set({ "n", "i" }, "<c-l>", "<c-w>l")

wk.register({
	K = { vim.lsp.buf.hover, "show documentation" },
	Q = { "<cmd>wqa<cr>", "exit neovim" },
	g = {
		name = "go to",
		d = { vim.lsp.buf.definition, "go to definition" },
		i = { vim.lsp.buf.implementation, "go to implementation" },
		D = { vim.lsp.buf.declaration, "go to declaration" },
	},
	["<C-s>"] = { "<cmd>w<cr>", "save buffer" },
})

-- Leader bindings
wk.register({
	o = { oil.toggle_float, "toggle floating Oil buffer" },
	w = {
		name = "window",
		w = { "<C-w>w", "focus other window" },
		h = { "<cmd>aboveleft vsplit<cr>", "split left" },
		j = { "<cmd>split<cr>", "split down" },
		k = { "<cmd>aboveleft split<cr>", "split up" },
		l = { "<cmd>vsplit<cr>", "split right" },
		d = { "<cmd>bp<bar>bd#<cr>", "delete buffer" },
		q = { "<cmd>close<cr>", "close window" },
		r = { "<C-w>r", "rotate windows" },
		H = { "<C-w>H", "move left" },
		J = { "<C-w>J", "move down" },
		K = { "<C-w>K", "move up" },
		L = { "<C-w>L", "move right" },
		["="] = { "<C-w>=", "make all windows equal size" },
		["<"] = { "<C-w><", "decrease window width" },
		[">"] = { "<C-w>>", "increase window width" },
	},
	s = { "<cmd>so %<cr>", "source buffer" },
	q = { "<cmd>close<cr>", "close window" },
	r = { vim.lsp.buf.rename, "rename symbol" },
	a = { vim.lsp.buf.code_action, "code actions" },
}, { prefix = "<leader>" })

-- toggleterm stuff
vim.keymap.set("t", "<A-i>", "<cmd>ToggleTerm<cr>")
vim.keymap.set("t", "<A-h>", "<cmd>ToggleTerm<cr>")
vim.keymap.set("t", "<A-v>", "<cmd>ToggleTerm<cr>")
