return {
	"mfussenegger/nvim-dap-python",
	config = function()
		require("dap.ext.vscode").load_launchjs()
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

		vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
		vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
		vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "⊙︎", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
		)

		local keymap = vim.keymap

		keymap.set("n", "<F5>", function()
			require("dap").continue()
		end)
		keymap.set("n", "<F8>", function()
			require("dap").step_over()
		end)
		keymap.set("n", "<F7>", function()
			require("dap").step_into()
		end)
		keymap.set("n", "<F12>", function()
			require("dap").step_out()
		end)
		keymap.set("n", "<Leader>b", function()
			require("dap").toggle_breakpoint()
		end)
		keymap.set("n", "<Leader>B", function()
			require("dap").set_breakpoint()
		end)
		keymap.set("n", "<Leader>lp", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		keymap.set("n", "<Leader>dr", function()
			require("dap").repl.open()
		end)
		keymap.set("n", "<Leader>dl", function()
			require("dap").run_last()
		end)

		keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end)

		keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end)

		keymap.set("n", "<Leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end)

		keymap.set("n", "<Leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)
	end,
}
