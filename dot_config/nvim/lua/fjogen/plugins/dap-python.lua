return {
	"mfussenegger/nvim-dap-python",
	config = function()
		require("dap.ext.vscode").load_launchjs()
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

		--local keymap = vim.keymap

		--keymap.set("n", "<leader>dr")
	end,
}
