-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme tokyonight")
-- 		-- vim.cmd("colorscheme tokyonight-day")
-- 	end,
-- }
-- return {
-- 	"marko-cerovac/material.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.material_style = "oceanic"
-- 		vim.cmd("colorscheme material")
-- 	end,
-- }
--
-- return {
-- 	"sainnhe/edge",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme edge")
-- 	end,
-- }
-- lua/plugins/rose-pine.lua
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine-dawn")
-- 	end,
-- }
return {
	dependencies = {
		"hrsh7th/nvim-cmp",
		"sainnhe/edge",
		"marko-cerovac/material.nvim",
		"navarasu/onedark.nvim",
	},
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		-- styles "dark", "darker", "cool", "deep", "warm", "warmer"
		require("onedark").setup({
			style = "dark",
		})
		require("onedark").load()
	end,
}
