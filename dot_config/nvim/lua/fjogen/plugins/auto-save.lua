return {
	"Pocco81/auto-save.nvim",
	config = function()
		require("auto-save").setup({
			trigger_events = { "InsertLeave", "TextChanged" },
		})
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>as", ":ASToggle<CR>", { desc = "Toggles auto save function" })
	end,
}
