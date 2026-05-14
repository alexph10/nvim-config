return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "C:/User/alexy/Desktop/Website",
      },
    },

    picker = {
      name = "telescope.nvim",
    },

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    note_id_func = function(title)
      return title ~= nil and title:gsub(" ", "-"):lower() or tostring(os.time())
    end,

    notes_subdir = "notes",

    daily_notes = {
      folder = "dailies",
      date_format = "%Y-%m-%d",
    },

    ui = {
      enable = true,
    },
  },
}
