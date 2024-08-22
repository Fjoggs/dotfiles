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

-- save with ctrl+s
-- keymap.set({ "n", "i" }, "<C-s>", "<esc>:write<CR>", { desc = "Save current buffer" })
keymap.set({ "n", "i" }, "<C-s>", "<esc>:wa<CR>", { desc = "Save all buffers" })

-- flash
local flash = require("flash")
keymap.set({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "Flash" })

keymap.set({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, { desc = "Flash Treesitter" })

keymap.set("o", "r", function()
	flash.remote()
end, { desc = "Remote Flash" })

keymap.set({ "o", "x" }, "R", function()
	flash.treesitter_search()
end, { desc = "Treesitter Search" })

keymap.set("c", "c-s", function()
	flash.toggle()
end, { desc = "Toggle Flash Search" })

-- window management
local split_bindings = {
	name = "Split management",
	v = { "<C-w>v", "Split window vertically" },
	h = { "<C-w>s", "Split window horizontally" },
	e = { ":wincmd =<CR>", "Make splits equal size" },
	x = { "<cmd>close<CR>", "Close current split" },
	m = { "<cmd>MaximizerToggle<CR>", "Maximize/minimize a split window" },
}
split_bindings["="] = { ":wincmd =<CR>", "Make splits equal size" }
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

-- Session management
wk.register({
	w = {
		name = "Sessions management",
		r = { "<cmd>SessionRestore<CR>", "Restore session for cwd" },
		s = { "<cmd>SessionSave<CR>", "Save session for cwd" },
	},
}, { prefix = "<leader>" })

-- Debugger

local dap = require("dap")
local dap_ui_widgets = require("dap.ui.widgets")

keymap.set("n", "<F5>", function()
	dap.continue()
end)
keymap.set("n", "<F8>", function()
	dap.step_over()
end)
keymap.set("n", "<F7>", function()
	dap.step_into()
end)
keymap.set("n", "<F12>", function()
	dap.step_out()
end)
keymap.set("n", "<Leader>b", function()
	dap.toggle_breakpoint()
end)
keymap.set("n", "<Leader>B", function()
	dap.set_breakpoint()
end)
keymap.set("n", "<Leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)

wk.register({
	d = {
		name = "Debugger",
		r = { ":DapToggleRepl<CR>", "Toggles the DAP repl" },
		l = {
			function()
				dap.run_last()
			end,
			"Run last DAP",
		},
		h = {
			function()
				dap_ui_widgets.hover()
			end,
			"Show DAP hover widget",
		},
		p = {
			function()
				dap_ui_widgets.preview()
			end,
			"Show DAP preview widget",
		},
		f = {
			function()
				dap_ui_widgets.centered_float(dap_ui_widgets.frames)
			end,
			"Centered float DAP frames",
		},
		s = {
			function()
				local widgets = dap_ui_widgets
				widgets.centered_float(widgets.scopes)
			end,
			"Centered float DAP scopes",
		},
	},
}, { prefix = "<leader>" })

-- Formatting
wk.register({
	l = {
		name = "Linting",
	},
}, { prefix = "<leader>" })

vim.keymap.set({ "n", "v" }, "<leader>lf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })

local lint = require("lint")
vim.keymap.set("n", "<leader>ll", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })

vim.keymap.set("n", "<leader>ls", function()
	local lint_progress = function()
		local linters = require("lint").get_running()
		if #linters == 0 then
			return "󰦕"
		end
		return "󱉶 " .. table.concat(linters, ", ")
	end
	lint_progress()
end, { desc = "Show linters runnings" })

-- Nvim tree
wk.register({
	e = {
		name = "File tree explorer",
		e = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer" },
		f = { "<cmd>NvimTreeFindFileToggle<CR>", "Toggle file explorer on current file" },
		c = { "<cmd>NvimTreeCollapse<CR>", "Collapse file explorer" },
		r = { "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer" },
	},
}, { prefix = "<leader>" })

-- ¹ is opt+1
keymap.set("n", "¹", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<a-1>", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file

-- smart open
keymap.set("n", "<C-n>", function()
	require("telescope").extensions.smart_open.smart_open()
end, { noremap = true, silent = true })

-- Zen mode
keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle({
		window = {
			width = 0.85, -- width will be 85% of the editor width
		},
	})
end, { desc = "Toggle zenmode" }) --  move current buffer to new tab

-- telescope
wk.register({
	f = {
		name = "Telescope find files/symbols/strings",
		f = { "<cmd>Telescope find_files hidden=true <cr>", "Fuzzy find files in cwd" },
		r = { "<cmd>Telescope oldfiles<cr>", "Fuzzy find recent files" },
		s = { "<cmd>Telescope live_grep<cr>", "Find string in cwd" },
		c = { "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd" },
	},
}, { prefix = "<leader>" })
-- <F36> = CTRL+F12
keymap.set("n", "<F36>", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols in document" })
keymap.set("n", "<C-F12>", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols in document" })

-- <F47> = CTRL+Shift+F12
keymap.set("n", "<F48>", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Find symbols in workspace" })
keymap.set("n", "<C-S-F12", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Find symbols in workspace" })

keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" }) -- show  diagnostics for file

--- Refactor
wk.register({
	r = {
		name = "Refactor",
		e = { ":Refactor extract", "Extract code to function" },
		f = { ":Refactor extract_to_file ", "Extract code to file" },
		v = { ":Refactor extract_var", "Extract value to variable" },
		n = { ":Refactor inline_var", "Inline variable to value" },
		i = { ":Refactor inline_func", "Inline function" },
		b = { ":Refactor extract_block", "Extract block" },
	},
}, { prefix = "<leader>" })
