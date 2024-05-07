return {
	"folke/zen-mode.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		vim.keymap.set("n", "<leader>z", function()
			require("zen-mode").toggle({
				window = {
					width = 0.85, -- width will be 85% of the editor width
				},
			})
		end, { desc = "Toggle zenmode" }) --  move current buffer to new tab
	end,
}
