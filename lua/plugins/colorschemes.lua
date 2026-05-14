return {
  -- gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 999,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true,
        contrast = "",
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
    end,
  },

  -- rose-pine (dawn variant with red accents)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 999,
    config = function()
      require("rose-pine").setup({
        variant = "dawn",
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = false,
        disable_italics = false,
        groups = {
          background = "base",
          background_nc = "_experimental_nc",
          panel = "surface",
          panel_nc = "base",
          border = "highlight_med",
          comment = "muted",
          link = "iris",
          punctuation = "subtle",
          error = "love",
          hint = "iris",
          info = "foam",
          warn = "gold",
          headings = {
            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
          }
        },
        highlight_groups = {
          CursorLine = { bg = "surface" },
          StatusLine = { fg = "love", bg = "love", blend = 10 },
          Search = { fg = "base", bg = "love" },
          IncSearch = { fg = "base", bg = "love" },
          Visual = { bg = "love", blend = 20 },

          LineNr = { fg = "muted" },
          CursorLineNr = { fg = "love", bold = true },
          SignColumn = { fg = "love" },
          FoldColumn = { fg = "love" },

          WinSeparator = { fg = "love" },
          VertSplit = { fg = "love" },
          FloatBorder = { fg = "love", bg = "surface" },
          NormalFloat = { bg = "surface" },
          Pmenu = { fg = "text", bg = "surface" },
          PmenuSel = { fg = "base", bg = "love" },
          PmenuSbar = { bg = "overlay" },
          PmenuThumb = { bg = "love" },

          NeoTreeWinSeparator = { fg = "love", bg = "base" },
          NeoTreeBorder = { fg = "love", bg = "base" },
          NeoTreeNormal = { bg = "base" },
          NeoTreeNormalNC = { bg = "base" },
          NeoTreeDirectoryIcon = { fg = "love" },
          NeoTreeDirectoryName = { fg = "love" },
          NeoTreeFileIcon = { fg = "rose" },
          NeoTreeFileName = { fg = "text" },
          NeoTreeGitModified = { fg = "love" },
          NeoTreeGitAdded = { fg = "foam" },
          NeoTreeGitDeleted = { fg = "love" },

          Terminal = { bg = "base" },

          TelescopeBorder = { fg = "love", bg = "surface" },
          TelescopeNormal = { bg = "surface" },
          TelescopeSelection = { fg = "text", bg = "love", blend = 20 },
          TelescopeSelectionCaret = { fg = "love" },
          TelescopeMultiSelection = { fg = "love" },
          TelescopeTitle = { fg = "love", bold = true },
          TelescopePromptTitle = { fg = "base", bg = "love" },
          TelescopeResultsTitle = { fg = "love" },
          TelescopePreviewTitle = { fg = "love" },

          DiagnosticError = { fg = "love" },
          DiagnosticWarn = { fg = "gold" },
          DiagnosticInfo = { fg = "foam" },
          DiagnosticHint = { fg = "iris" },
          DiagnosticUnderlineError = { undercurl = true, sp = "love" },
          DiagnosticUnderlineWarn = { undercurl = true, sp = "gold" },

          GitSignsAdd = { fg = "foam" },
          GitSignsChange = { fg = "rose" },
          GitSignsDelete = { fg = "love" },

          TabLine = { fg = "subtle", bg = "overlay" },
          TabLineFill = { bg = "base" },
          TabLineSel = { fg = "text", bg = "love", bold = true },

          -- syntax (gruvbox-style palette)
          Keyword = { fg = "#d3869b", bold = true },
          Conditional = { fg = "#d3869b", bold = true },
          Repeat = { fg = "#d3869b", bold = true },
          Statement = { fg = "#d3869b", bold = true },
          Exception = { fg = "#fb4934", bold = true },
          Label = { fg = "#d3869b", bold = true },

          Function = { fg = "#fabd2f", bold = true },
          ["@function"] = { fg = "#fabd2f", bold = true },
          ["@function.call"] = { fg = "#fabd2f" },
          ["@method"] = { fg = "#fabd2f", bold = true },
          ["@method.call"] = { fg = "#fabd2f" },
          ["@function.builtin"] = { fg = "#fe8019", bold = true },

          Identifier = { fg = "#83a598" },
          ["@variable"] = { fg = "#83a598" },
          ["@parameter"] = { fg = "#8ec07c" },
          ["@field"] = { fg = "#83a598" },
          ["@property"] = { fg = "#83a598" },
          ["@variable.builtin"] = { fg = "#d3869b", bold = true },

          Type = { fg = "#8ec07c", bold = true },
          ["@type"] = { fg = "#8ec07c", bold = true },
          ["@type.builtin"] = { fg = "#8ec07c", bold = true },
          ["@constructor"] = { fg = "#fe8019", bold = true },
          StorageClass = { fg = "#d3869b", bold = true },
          Structure = { fg = "#8ec07c", bold = true },
          Typedef = { fg = "#8ec07c", bold = true },

          String = { fg = "#b8bb26" },
          ["@string"] = { fg = "#b8bb26" },
          Character = { fg = "#b8bb26" },
          ["@string.escape"] = { fg = "#fb4934", bold = true },
          ["@string.regex"] = { fg = "#fe8019" },
          ["@string.special"] = { fg = "#d3869b" },

          Constant = { fg = "#fb4934", bold = true },
          Number = { fg = "#fe8019" },
          Float = { fg = "#fe8019" },
          Boolean = { fg = "#fb4934", bold = true },
          ["@constant"] = { fg = "#fb4934", bold = true },
          ["@number"] = { fg = "#fe8019" },
          ["@constant.builtin"] = { fg = "#d3869b", bold = true },
          ["@constant.macro"] = { fg = "#fe8019", bold = true },

          Operator = { fg = "#fe8019", bold = true },
          ["@operator"] = { fg = "#fe8019", bold = true },

          Comment = { fg = "#928374", italic = true },
          ["@comment"] = { fg = "#928374", italic = true },
          ["@comment.todo"] = { fg = "#fabd2f", bold = true, bg = "#3c3836" },
          ["@comment.warning"] = { fg = "#fe8019", bold = true, bg = "#3c3836" },
          ["@comment.error"] = { fg = "#fb4934", bold = true, bg = "#3c3836" },
          ["@comment.note"] = { fg = "#83a598", bold = true, bg = "#3c3836" },
          ["@comment.fixme"] = { fg = "#d3869b", bold = true, bg = "#3c3836" },

          PreProc = { fg = "#8ec07c", bold = true },
          Include = { fg = "#d3869b", bold = true },
          Define = { fg = "#8ec07c", bold = true },
          Macro = { fg = "#fe8019", bold = true },
          PreCondit = { fg = "#d3869b", bold = true },

          Special = { fg = "#d3869b" },
          Delimiter = { fg = "#fe8019" },
          ["@punctuation.delimiter"] = { fg = "#fe8019" },
          ["@punctuation.bracket"] = { fg = "#fb4934", bold = true },
          ["@punctuation.special"] = { fg = "#d3869b" },

          Tag = { fg = "#fb4934", bold = true },
          ["@tag"] = { fg = "#fb4934", bold = true },
          ["@tag.attribute"] = { fg = "#fabd2f" },
          ["@tag.delimiter"] = { fg = "#fe8019" },

          ["@text.strong"] = { fg = "#fb4934", bold = true },
          ["@text.emphasis"] = { fg = "#d3869b", italic = true },
          ["@text.title"] = { fg = "#fabd2f", bold = true },
          ["@text.uri"] = { fg = "#83a598", underline = true },
          ["@text.literal"] = { fg = "#b8bb26" },
          ["@text.reference"] = { fg = "#8ec07c" },

          -- javascript / typescript
          ["@keyword.function.javascript"] = { fg = "#d3869b", bold = true },
          ["@keyword.export.javascript"] = { fg = "#fe8019", bold = true },
          ["@keyword.import.javascript"] = { fg = "#8ec07c", bold = true },

          -- python
          ["@keyword.function.python"] = { fg = "#d3869b", bold = true },
          ["@keyword.import.python"] = { fg = "#8ec07c", bold = true },
          ["@decorator.python"] = { fg = "#fabd2f", bold = true },

          -- rust
          ["@keyword.function.rust"] = { fg = "#d3869b", bold = true },
          ["@type.rust"] = { fg = "#8ec07c", bold = true },
          ["@attribute.rust"] = { fg = "#fabd2f" },

          -- c / c++
          ["@type.qualifier.c"] = { fg = "#d3869b", bold = true },
          ["@storageclass.cpp"] = { fg = "#d3869b", bold = true },

          -- lsp semantic
          ["@lsp.type.class"] = { fg = "#8ec07c", bold = true },
          ["@lsp.type.enum"] = { fg = "#fabd2f", bold = true },
          ["@lsp.type.interface"] = { fg = "#83a598", bold = true },
          ["@lsp.type.struct"] = { fg = "#8ec07c", bold = true },
          ["@lsp.type.parameter"] = { fg = "#8ec07c" },
          ["@lsp.type.variable"] = { fg = "#83a598" },
          ["@lsp.type.property"] = { fg = "#83a598" },
          ["@lsp.type.enumMember"] = { fg = "#fe8019" },
          ["@lsp.type.function"] = { fg = "#fabd2f", bold = true },
          ["@lsp.type.method"] = { fg = "#fabd2f", bold = true },
          ["@lsp.type.macro"] = { fg = "#fe8019", bold = true },
          ["@lsp.type.keyword"] = { fg = "#d3869b", bold = true },
          ["@lsp.type.comment"] = { fg = "#928374", italic = true },
          ["@lsp.type.namespace"] = { fg = "#d3869b", bold = true },
          ["@lsp.type.decorator"] = { fg = "#fabd2f", bold = true },
          ["@lsp.type.typeParameter"] = { fg = "#8ec07c", italic = true },

          Error = { fg = "#fb4934", bold = true, bg = "#3c3836" },
          Warning = { fg = "#fabd2f", bold = true },
          Info = { fg = "#83a598" },
          Hint = { fg = "#8ec07c" },

          Normal = { fg = "#ebdbb2" },
          NormalNC = { fg = "#ebdbb2" },

          DiffAdd = { fg = "#b8bb26", bg = "#3c3836" },
          DiffChange = { fg = "#fabd2f", bg = "#3c3836" },
          DiffDelete = { fg = "#fb4934", bg = "#3c3836" },
          DiffText = { fg = "#fabd2f", bg = "#504945", bold = true }
        }
      })
    end,
  },

  -- bg.nvim (loads images from ~/.config/nvim/bg/)
  {
    "typicode/bg.nvim",
    lazy = false,
  },

  -- melange
  {
    "savq/melange-nvim",
    priority = 1001,
  },

  -- lush (dep for serendipity)
  {
    "rktjmp/lush.nvim",
    lazy = false,
    priority = 1003,
  },

  -- serendipity. Upstream is mis-packaged: theme lives in a nested
  -- serendipity.nvim/ subdir, so we splice that onto rtp and call lush directly.
  {
    "AustinMay1/Serendipity.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1002,
    config = function()
      local nested = vim.fn.stdpath("data") .. "/lazy/Serendipity.nvim/serendipity.nvim"
      vim.opt.rtp:append(nested)

      vim.o.background = "dark"
      vim.g.colors_name = "serendipity"
      require("lush")(require("lush_theme.serendipity_midnight"))
    end,
  },

  -- monokai pro
  {
    "loctvl842/monokai-pro.nvim",
    priority = 998,
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
        terminal_colors = true,
        devicons = true,
        styles = {
          comment = { italic = true },
          keyword = { italic = true },
          type = { italic = true },
          storageclass = { italic = true },
          structure = { italic = true },
          parameter = { italic = true },
          annotation = { italic = true },
          tag_attribute = { italic = true },
        },
        filter = "pro",
        day_night = {
          enable = false,
          day_filter = "pro",
          night_filter = "spectrum",
        },
        inc_search = "background",
        background_clear = {
          "toggleterm",
          "telescope",
        },
        plugins = {
          bufferline = {
            underline_selected = false,
            underline_visible = false,
          },
          indent_blankline = {
            context_highlight = "default",
            context_start_underline = false,
          },
        },
      })
    end,
  },
}
