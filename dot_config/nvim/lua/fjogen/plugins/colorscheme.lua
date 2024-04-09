--return {
-- "folke/tokyonight.nvim",
-- priority = 1000,
-- config = function()
--   vim.cmd("colorscheme tokyonight")
--  end
--}
--return {
--	"marko-cerovac/material.nvim",
--	priority = 1000,
--	config = function()
--		vim.g.material_style = "oceanic"
--		vim.cmd("colorscheme material")
--	end,
--}
return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "cool",
		})
		require("onedark").load()
	end,
}
