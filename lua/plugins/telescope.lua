return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local fb_actions = require("telescope._extensions.file_browser.actions")

      require("telescope").setup({
        defaults = {
          prompt_prefix = "> ",
          selection_caret = "> ",
          path_display = { "truncate" },
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            ".cache",
            "%.o",
            "%.a",
            "%.out",
            "%.class",
            "%.pdf",
            "%.mkv",
            "%.mp4",
            "%.zip"
          },
          mappings = {
            i = {
              ["<C-n>"] = "move_selection_next",
              ["<C-p>"] = "move_selection_previous",
              ["<C-c>"] = "close",
              ["<Down>"] = "move_selection_next",
              ["<Up>"] = "move_selection_previous",
              ["<CR>"] = "select_default",
              ["<C-x>"] = "select_horizontal",
              ["<C-v>"] = "select_vertical",
              ["<C-t>"] = "select_tab",
              ["<C-u>"] = "preview_scrolling_up",
              ["<C-d>"] = "preview_scrolling_down",
              ["<PageUp>"] = "results_scrolling_up",
              ["<PageDown>"] = "results_scrolling_down",
              ["<Tab>"] = "toggle_selection",
              ["<S-Tab>"] = "toggle_selection",
              ["<C-q>"] = "send_to_qflist",
              ["<M-q>"] = "send_selected_to_qflist",
              ["<C-l>"] = "complete_tag",
              ["<C-_>"] = "which_key",
            },
            n = {
              ["<esc>"] = "close",
              ["<CR>"] = "select_default",
              ["<C-x>"] = "select_horizontal",
              ["<C-v>"] = "select_vertical",
              ["<C-t>"] = "select_tab",
              ["<Tab>"] = "toggle_selection",
              ["<S-Tab>"] = "toggle_selection",
              ["<C-q>"] = "send_to_qflist",
              ["<M-q>"] = "send_selected_to_qflist",
              ["j"] = "move_selection_next",
              ["k"] = "move_selection_previous",
              ["H"] = "move_to_top",
              ["M"] = "move_to_middle",
              ["L"] = "move_to_bottom",
              ["<Down>"] = "move_selection_next",
              ["<Up>"] = "move_selection_previous",
              ["gg"] = "move_to_top",
              ["G"] = "move_to_bottom",
              ["<C-u>"] = "preview_scrolling_up",
              ["<C-d>"] = "preview_scrolling_down",
              ["<PageUp>"] = "results_scrolling_up",
              ["<PageDown>"] = "results_scrolling_down",
              ["?"] = "which_key",
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            additional_args = function()
              return { "--hidden" }
            end
          },
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                ["<A-c>"] = fb_actions.create,
                ["<S-CR>"] = fb_actions.create_from_prompt,
                ["<A-r>"] = fb_actions.rename,
                ["<A-m>"] = fb_actions.move,
                ["<A-y>"] = fb_actions.copy,
                ["<A-d>"] = fb_actions.remove,
                ["<C-o>"] = fb_actions.open,
                ["<C-g>"] = fb_actions.goto_parent_dir,
                ["<C-e>"] = fb_actions.goto_home_dir,
                ["<C-w>"] = fb_actions.goto_cwd,
                ["<C-t>"] = fb_actions.change_cwd,
                ["<C-f>"] = fb_actions.toggle_browser,
                ["<C-h>"] = fb_actions.toggle_hidden,
                ["<C-s>"] = fb_actions.toggle_all,
              },
              ["n"] = {
                ["c"] = fb_actions.create,
                ["r"] = fb_actions.rename,
                ["m"] = fb_actions.move,
                ["y"] = fb_actions.copy,
                ["d"] = fb_actions.remove,
                ["o"] = fb_actions.open,
                ["g"] = fb_actions.goto_parent_dir,
                ["e"] = fb_actions.goto_home_dir,
                ["w"] = fb_actions.goto_cwd,
                ["t"] = fb_actions.change_cwd,
                ["f"] = fb_actions.toggle_browser,
                ["h"] = fb_actions.toggle_hidden,
                ["s"] = fb_actions.toggle_all,
              },
            },
          },
        }
      })

      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("ui-select")
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  -- preview code actions
  {
    "aznhe21/actions-preview.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("actions-preview").setup({
        backend = { "telescope" },
        telescope = vim.tbl_extend(
          "force",
          require("telescope.themes").get_dropdown(), {}
        ),
      })
      vim.keymap.set({ "n", "v" }, "<leader>ca", require("actions-preview").code_actions, { desc = "Code actions (preview)" })
    end,
  },
}
