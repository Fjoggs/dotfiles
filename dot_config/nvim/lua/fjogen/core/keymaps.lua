--vim.g.mapleader = " "
local wk = require("which-key")
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- scroll with center screen
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go half a page down and center the screen" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go half a page up and center the screen" })

-- auto-save.nvim
keymap.set("n", "<leader>as", ":ASToggle<CR>", { desc = "Toggles auto save function" })

-- window management
local split_bindings = {
	name = "Split management",
	v = { "<C-w>v", "Split window vertically" },
	h = { "<C-w>s", "Split window horizontally" },
	e = { "<C-w>=", "Make splits equal size" },
	x = { "<cmd>close<CR>", "Close current split" },
}
split_bindings["="] = { "<C-w>=", "Make splits equal size" }
wk.register({ s = split_bindings }, { prefix = "<leader>" })

-- Tab management
wk.register({
	t = {
		name = "Tab management",
		o = { "<cmd>tabnew<CR>", "Open new tab" },
		x = { "<cmd>tabclose<CR>", "Close current tab" },
		n = { "<cmd>tabn<CR>", "Close current tab" },
		p = { "<cmd>tabp<CR>", "Go to previous tab" },
		f = { "<cmd>tabnew $<CR>", "Open current buffer in new tab" },
	},
}, { prefix = "<leader>" })

-- Git management
wk.register({
	g = {
		name = "Git management",
		n = { ":Neogit<CR>", "Open NeoGit integration" },
		d = { ":Telescope git_bcommits<CR>", "Open git history for active buffer" },
	},
}, { prefix = "<leader>" })
