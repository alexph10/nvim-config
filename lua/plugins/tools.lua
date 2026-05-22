return {
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      local devicons = require("nvim-web-devicons")
      devicons.setup({ default = false, color_icons = false })
      -- force every consumer (neo-tree, lualine, bufferline, telescope, dropbar, oil)
      -- to render an empty icon
      local empty = function() return "", "" end
      for _, fn in ipairs({
        "get_icon", "get_icon_by_filetype", "get_icon_color",
        "get_icon_colors", "get_icon_cterm_color",
        "get_icon_name_by_filetype", "get_icon_colors_by_filetype",
        "get_icon_color_by_filetype", "get_icon_cterm_color_by_filetype",
      }) do
        devicons[fn] = empty
      end
    end,
  },

  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
}
