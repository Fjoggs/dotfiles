return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    local colors = {
    }

    local my_lualine_theme = {
      normal = {},
      insert = {},
      visual = {},
      command = {},
      replace = {},
      inactive = {},
    },

    lualine.setup()
  end,
}

