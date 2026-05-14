return {
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  },

  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
}
