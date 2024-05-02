return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme tokyonight")
		-- vim.cmd("colorscheme tokyonight-day")
	end,
}
--return {
--	"marko-cerovac/material.nvim",
--	priority = 1000,
--	config = function()
--		vim.g.material_style = "oceanic"
--		vim.cmd("colorscheme material")
--	end,
--}
-- return {
-- 	"navarasu/onedark.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		-- styles "dark", "darker", "cool", "deep", "warm", "warmer"
-- 		require("onedark").setup({
-- 			style = "dark",
-- 		})
-- 		require("onedark").load()
-- 	end,
-- }
