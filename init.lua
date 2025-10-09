-- LazyVim Configuration with Gruvbox, Neo-tree, Plenary, and Terminal
-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"

-- Font settings for GUI Neovim (Neovide, nvim-qt, etc.)
if vim.g.neovide then
  -- Neovide-specific font settings
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
elseif vim.g.fvim_loaded then
  -- FVim-specific font settings
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
elseif vim.g.nvui then
  -- Nvui-specific font settings
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
else
  -- General GUI font setting (works with nvim-qt and others)
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
end

-- Setup plugins
require("lazy").setup({
  -- Plenary (required by many plugins)
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  -- Gruvbox colorscheme (disabled - melange is now default)
  {
    "ellisonleao/gruvbox.nvim",
    priority = 999, -- Lower priority than melange
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
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
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
      -- Commented out to allow melange as default
      -- vim.o.background = "light" -- or "dark" for dark mode
      -- vim.cmd([[colorscheme gruvbox]])
    end,
  },

  -- Rose Pine colorscheme (Dawn variant with custom accent colors)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 999,
    config = function()
      require("rose-pine").setup({
        variant = "dawn", -- auto, main, moon, or dawn
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
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
          -- Enhanced red accent highlights
          CursorLine = { bg = "surface" },
          StatusLine = { fg = "love", bg = "love", blend = 10 },
          Search = { fg = "base", bg = "love" },
          IncSearch = { fg = "base", bg = "love" },
          Visual = { bg = "love", blend = 20 },
          
          -- Red accent for important UI elements
          LineNr = { fg = "muted" },
          CursorLineNr = { fg = "love", bold = true },
          SignColumn = { fg = "love" },
          FoldColumn = { fg = "love" },
          
          -- Enhanced borders with red accents
          WinSeparator = { fg = "love" },
          VertSplit = { fg = "love" },
          FloatBorder = { fg = "love", bg = "surface" },
          NormalFloat = { bg = "surface" },
          Pmenu = { fg = "text", bg = "surface" },
          PmenuSel = { fg = "base", bg = "love" },
          PmenuSbar = { bg = "overlay" },
          PmenuThumb = { bg = "love" },
          
          -- Neo-tree with red accents
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
          
          -- Terminal colors
          Terminal = { bg = "base" },
          
          -- Telescope with red accents
          TelescopeBorder = { fg = "love", bg = "surface" },
          TelescopeNormal = { bg = "surface" },
          TelescopeSelection = { fg = "text", bg = "love", blend = 20 },
          TelescopeSelectionCaret = { fg = "love" },
          TelescopeMultiSelection = { fg = "love" },
          TelescopeTitle = { fg = "love", bold = true },
          TelescopePromptTitle = { fg = "base", bg = "love" },
          TelescopeResultsTitle = { fg = "love" },
          TelescopePreviewTitle = { fg = "love" },
          
          -- Diagnostic colors with red emphasis
          DiagnosticError = { fg = "love" },
          DiagnosticWarn = { fg = "gold" },
          DiagnosticInfo = { fg = "foam" },
          DiagnosticHint = { fg = "iris" },
          DiagnosticUnderlineError = { undercurl = true, sp = "love" },
          DiagnosticUnderlineWarn = { undercurl = true, sp = "gold" },
          
          -- Git signs with red accents
          GitSignsAdd = { fg = "foam" },
          GitSignsChange = { fg = "rose" },
          GitSignsDelete = { fg = "love" },
          
          -- Tabs and buffers with red accents
          TabLine = { fg = "subtle", bg = "overlay" },
          TabLineFill = { bg = "base" },
          TabLineSel = { fg = "text", bg = "love", bold = true },
          
          -- VIBRANT SYNTAX HIGHLIGHTING - Gruvbox Dark Style with Maximum Colors!
          -- Keywords and control flow (BRIGHT MAGENTA/PURPLE)
          Keyword = { fg = "#d3869b", bold = true }, -- Gruvbox bright purple
          Conditional = { fg = "#d3869b", bold = true }, -- Gruvbox bright purple
          Repeat = { fg = "#d3869b", bold = true }, -- Gruvbox bright purple
          Statement = { fg = "#d3869b", bold = true }, -- Gruvbox bright purple
          Exception = { fg = "#fb4934", bold = true }, -- Gruvbox bright red
          Label = { fg = "#d3869b", bold = true }, -- Gruvbox bright purple
          
          -- Functions and methods (BRIGHT YELLOW/GOLD)
          Function = { fg = "#fabd2f", bold = true }, -- Gruvbox bright yellow
          ["@function"] = { fg = "#fabd2f", bold = true }, -- Gruvbox bright yellow
          ["@function.call"] = { fg = "#fabd2f" }, -- Gruvbox bright yellow
          ["@method"] = { fg = "#fabd2f", bold = true }, -- Gruvbox bright yellow
          ["@method.call"] = { fg = "#fabd2f" }, -- Gruvbox bright yellow
          ["@function.builtin"] = { fg = "#fe8019", bold = true }, -- Gruvbox bright orange
          
          -- Variables and identifiers (BRIGHT BLUE)
          Identifier = { fg = "#83a598" }, -- Gruvbox bright blue
          ["@variable"] = { fg = "#83a598" }, -- Gruvbox bright blue
          ["@parameter"] = { fg = "#8ec07c" }, -- Gruvbox bright green
          ["@field"] = { fg = "#83a598" }, -- Gruvbox bright blue
          ["@property"] = { fg = "#83a598" }, -- Gruvbox bright blue
          ["@variable.builtin"] = { fg = "#d3869b", bold = true }, -- Gruvbox bright purple
          
          -- Types and classes (BRIGHT CYAN/AQUA)
          Type = { fg = "#8ec07c", bold = true }, -- Gruvbox bright green
          ["@type"] = { fg = "#8ec07c", bold = true }, -- Gruvbox bright green
          ["@type.builtin"] = { fg = "#8ec07c", bold = true }, -- Gruvbox bright green
          ["@constructor"] = { fg = "#fe8019", bold = true }, -- Gruvbox bright orange
          StorageClass = { fg = "#d3869b", bold = true }, -- Gruvbox bright purple
          Structure = { fg = "#8ec07c", bold = true }, -- Gruvbox bright green
          Typedef = { fg = "#8ec07c", bold = true }, -- Gruvbox bright green
          
          -- Strings (BRIGHT GREEN)
          String = { fg = "#b8bb26" }, -- Gruvbox bright green
          ["@string"] = { fg = "#b8bb26" }, -- Gruvbox bright green
          Character = { fg = "#b8bb26" }, -- Gruvbox bright green
          ["@string.escape"] = { fg = "#fb4934", bold = true }, -- Gruvbox bright red for escapes
          ["@string.regex"] = { fg = "#fe8019" }, -- Gruvbox bright orange
          ["@string.special"] = { fg = "#d3869b" }, -- Gruvbox bright purple
          
          -- Constants and numbers (BRIGHT RED/ORANGE)
          Constant = { fg = "#fb4934", bold = true }, -- Gruvbox bright red
          Number = { fg = "#fe8019" }, -- Gruvbox bright orange
          Float = { fg = "#fe8019" }, -- Gruvbox bright orange
          Boolean = { fg = "#fb4934", bold = true }, -- Gruvbox bright red
          ["@constant"] = { fg = "#fb4934", bold = true }, -- Gruvbox bright red
          ["@number"] = { fg = "#fe8019" }, -- Gruvbox bright orange
          ["@constant.builtin"] = { fg = "#d3869b", bold = true }, -- Gruvbox bright purple
          ["@constant.macro"] = { fg = "#fe8019", bold = true }, -- Gruvbox bright orange
          
          -- Operators (BRIGHT ORANGE/RED)
          Operator = { fg = "#fe8019", bold = true }, -- Gruvbox bright orange
          ["@operator"] = { fg = "#fe8019", bold = true }, -- Gruvbox bright orange
          
          -- Comments (GRAY but with vibrant special comments)
          Comment = { fg = "#928374", italic = true }, -- Gruvbox gray
          ["@comment"] = { fg = "#928374", italic = true }, -- Gruvbox gray
          ["@comment.todo"] = { fg = "#fabd2f", bold = true, bg = "#3c3836" }, -- Bright yellow TODO
          ["@comment.warning"] = { fg = "#fe8019", bold = true, bg = "#3c3836" }, -- Bright orange WARNING
          ["@comment.error"] = { fg = "#fb4934", bold = true, bg = "#3c3836" }, -- Bright red ERROR
          ["@comment.note"] = { fg = "#83a598", bold = true, bg = "#3c3836" }, -- Bright blue NOTE
          ["@comment.fixme"] = { fg = "#d3869b", bold = true, bg = "#3c3836" }, -- Bright purple FIXME
          
          -- Preprocessor and macros (BRIGHT AQUA/CYAN)
          PreProc = { fg = "#8ec07c", bold = true }, -- Gruvbox bright aqua
          Include = { fg = "#d3869b", bold = true }, -- Gruvbox bright purple for includes
          Define = { fg = "#8ec07c", bold = true }, -- Gruvbox bright aqua
          Macro = { fg = "#fe8019", bold = true }, -- Gruvbox bright orange
          PreCondit = { fg = "#d3869b", bold = true }, -- Gruvbox bright purple
          
          -- Special characters and delimiters (RAINBOW COLORS!)
          Special = { fg = "#d3869b" }, -- Gruvbox bright purple
          Delimiter = { fg = "#fe8019" }, -- Gruvbox bright orange
          ["@punctuation.delimiter"] = { fg = "#fe8019" }, -- Gruvbox bright orange
          ["@punctuation.bracket"] = { fg = "#fb4934", bold = true }, -- Gruvbox bright red for brackets
          ["@punctuation.special"] = { fg = "#d3869b" }, -- Gruvbox bright purple
          
          -- HTML/XML Tags (BRIGHT COLORS)
          Tag = { fg = "#fb4934", bold = true }, -- Gruvbox bright red
          ["@tag"] = { fg = "#fb4934", bold = true }, -- Gruvbox bright red
          ["@tag.attribute"] = { fg = "#fabd2f" }, -- Gruvbox bright yellow
          ["@tag.delimiter"] = { fg = "#fe8019" }, -- Gruvbox bright orange
          
          -- Markup and documentation (VIBRANT)
          ["@text.strong"] = { fg = "#fb4934", bold = true }, -- Gruvbox bright red
          ["@text.emphasis"] = { fg = "#d3869b", italic = true }, -- Gruvbox bright purple
          ["@text.title"] = { fg = "#fabd2f", bold = true }, -- Gruvbox bright yellow
          ["@text.uri"] = { fg = "#83a598", underline = true }, -- Gruvbox bright blue
          ["@text.literal"] = { fg = "#b8bb26" }, -- Gruvbox bright green
          ["@text.reference"] = { fg = "#8ec07c" }, -- Gruvbox bright aqua
          
          -- Language-specific vibrant colors
          -- JavaScript/TypeScript
          ["@keyword.function.javascript"] = { fg = "#d3869b", bold = true },
          ["@keyword.export.javascript"] = { fg = "#fe8019", bold = true },
          ["@keyword.import.javascript"] = { fg = "#8ec07c", bold = true },
          
          -- Python
          ["@keyword.function.python"] = { fg = "#d3869b", bold = true },
          ["@keyword.import.python"] = { fg = "#8ec07c", bold = true },
          ["@decorator.python"] = { fg = "#fabd2f", bold = true },
          
          -- Rust
          ["@keyword.function.rust"] = { fg = "#d3869b", bold = true },
          ["@type.rust"] = { fg = "#8ec07c", bold = true },
          ["@attribute.rust"] = { fg = "#fabd2f" },
          
          -- C/C++
          ["@type.qualifier.c"] = { fg = "#d3869b", bold = true },
          ["@storageclass.cpp"] = { fg = "#d3869b", bold = true },
          
          -- Enhanced LSP semantic highlighting (MAXIMUM COLORS)
          ["@lsp.type.class"] = { fg = "#8ec07c", bold = true }, -- Bright aqua
          ["@lsp.type.enum"] = { fg = "#fabd2f", bold = true }, -- Bright yellow
          ["@lsp.type.interface"] = { fg = "#83a598", bold = true }, -- Bright blue
          ["@lsp.type.struct"] = { fg = "#8ec07c", bold = true }, -- Bright aqua
          ["@lsp.type.parameter"] = { fg = "#8ec07c" }, -- Bright aqua
          ["@lsp.type.variable"] = { fg = "#83a598" }, -- Bright blue
          ["@lsp.type.property"] = { fg = "#83a598" }, -- Bright blue
          ["@lsp.type.enumMember"] = { fg = "#fe8019" }, -- Bright orange
          ["@lsp.type.function"] = { fg = "#fabd2f", bold = true }, -- Bright yellow
          ["@lsp.type.method"] = { fg = "#fabd2f", bold = true }, -- Bright yellow
          ["@lsp.type.macro"] = { fg = "#fe8019", bold = true }, -- Bright orange
          ["@lsp.type.keyword"] = { fg = "#d3869b", bold = true }, -- Bright purple
          ["@lsp.type.comment"] = { fg = "#928374", italic = true }, -- Gray
          ["@lsp.type.namespace"] = { fg = "#d3869b", bold = true }, -- Bright purple
          ["@lsp.type.decorator"] = { fg = "#fabd2f", bold = true }, -- Bright yellow
          ["@lsp.type.typeParameter"] = { fg = "#8ec07c", italic = true }, -- Bright aqua
          
          -- Additional vibrant highlights for maximum color!
          Error = { fg = "#fb4934", bold = true, bg = "#3c3836" },
          Warning = { fg = "#fabd2f", bold = true },
          Info = { fg = "#83a598" },
          Hint = { fg = "#8ec07c" },
          
          -- Make everything more vibrant!
          Normal = { fg = "#ebdbb2" }, -- Gruvbox light foreground
          NormalNC = { fg = "#ebdbb2" },
          
          -- Diff colors (BRIGHT)
          DiffAdd = { fg = "#b8bb26", bg = "#3c3836" },
          DiffChange = { fg = "#fabd2f", bg = "#3c3836" },
          DiffDelete = { fg = "#fb4934", bg = "#3c3836" },
          DiffText = { fg = "#fabd2f", bg = "#504945", bold = true }
        }
      })
    end,
  },

  -- bg.nvim - Background image plugin
  {
    "typicode/bg.nvim",
    lazy = false,
    config = function()
      -- bg.nvim will automatically look for images in ~/.config/nvim/bg/
      -- You can place your background images there
    end,
  },

  -- Melange colorscheme
  {
    "savq/melange-nvim",
    priority = 1001, -- Higher priority than other themes
    config = function()
      -- Set background to dark for melange
      vim.o.background = "dark"
      -- Apply melange colorscheme
      vim.cmd([[colorscheme melange]])
    end,
  },

  -- Monokai Pro colorscheme
  {
    "loctvl842/monokai-pro.nvim",
    priority = 998,
    config = function()
      require("monokai-pro").setup({
        transparent_background = false,
        terminal_colors = true,
        devicons = true, -- highlight the icons of `nvim-web-devicons`
        styles = {
          comment = { italic = true },
          keyword = { italic = true }, -- any other keyword
          type = { italic = true }, -- (preferred) int, long, char, etc
          storageclass = { italic = true }, -- static, register, volatile, etc
          structure = { italic = true }, -- struct, union, enum, etc
          parameter = { italic = true }, -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        },
        filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        -- Enable this will disable filter option
        day_night = {
          enable = false, -- turn off by default
          day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
          night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
        },
        inc_search = "background", -- underline | background
        background_clear = {
          -- "float_win",
          "toggleterm",
          "telescope",
          -- "which-key",
          -- "renamer",
          -- "notify",
          -- "nvim-tree",
          -- "neo-tree",
          -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
        },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "notify"
        plugins = {
          bufferline = {
            underline_selected = false,
            underline_visible = false,
          },
          indent_blankline = {
            context_highlight = "default", -- default | pro
            context_start_underline = false,
          },
        },
      })
    end,
  },

  -- Neo-tree file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = false,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          container = {
            enable_character_fade = true
          },
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            with_expanders = nil,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              added     = "",
              modified  = "",
              deleted   = "✖",
              renamed   = "",
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },
        },
        window = {
          position = "left",
          width = 30,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<space>"] = {
              "toggle_node",
              nowait = false,
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["a"] = {
              "add",
              config = {
                show_path = "none"
              }
            },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          }
        },
        nesting_rules = {},
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true,
            hide_by_name = {
              "node_modules"
            },
            hide_by_pattern = {
              "*.meta",
              "*/src/*/tsconfig.json",
            },
            always_show = {
              ".gitignored"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db"
            },
            never_show_by_pattern = {
              ".null-ls_*",
            },
          },
          follow_current_file = {
            enabled = false,
            leave_dirs_open = false,
          },
          group_empty_dirs = false,
          hijack_netrw_behavior = "open_default",
          use_libuv_file_watcher = false,
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["/"] = "fuzzy_finder",
              ["D"] = "fuzzy_finder_directory",
              ["#"] = "fuzzy_sorter",
              ["f"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["["] = "prev_git_modified",
              ["]"] = "next_git_modified",
            }
          },
          commands = {}
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          group_empty_dirs = true,
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            }
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"]  = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            }
          }
        }
      })
    end,
  },

  -- Terminal integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end,
  },

  -- Web devicons
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  },

  -- UI component library
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },

  -- Alpha dashboard for home page
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- ASCII art from actual hill1.jpg image
      dashboard.section.header.val = {
        "%%%#+*+*******************=+**%##***#########*#####**#+*###*#############%%##%%%",
        "%%%#*+********************++**###**#################*####################%%##%%%",
        "%%###*************************###*##############*#####**##########%%%%##%%%##%%%",
        "%%*###***+********************#######################++*##########%%%%%%%%%#%%%%",
        "%#####**%##*************##****#####################*#+*###########%%%%%%%%%%%%%%",
        "%##*#***%%#+************###***##########*##%######*+#**############%%%%%%%%%%%%%",
        "%##*#****#+*************#%##**#####*##############**#++############%%%%%%%%###%%",
        "%*#*#**#*++*******=******#%#***%%%##**##*#%##########+=############%%%%%%%%%%%%%",
        "#+#*******=*******=*******#%#**%%%%%####*#%#####*#*+#***###########%%%%%%%%%%%%%",
        "%**#****=*****************#%#**%%%%%%###########+#*+###############%%%%##%%%%%%%",
        "%#+*##*#=*#****************%%**%#%%#%%%%####%%%##%###%#####*#######%%%%**%%%#%%%",
        "##**##*#+******************#%##%#%%%%%%%####%%%##%########**#####%%%%%%##%%##%%%",
        "#****#*#*******************#%##%%%%%%%%%%%##%%%##%##%#####**#####%%%%%%%#%%%%%#%",
        "#+=+*##+*++**************++*%##%%%%%%%##%%##%%###%######*##*+###%%%###%%*##%%%%%",
        "#+--+##*=+-*=-+*******+**++#%##%%#%%%%##%%*#%%####+#####+###*+##%%%####**=*%#%%%",
        "#+:.-**#+::=+:+*++****+=*=+*#%%%%###%%#%%#*%%%%##%*#####*#**#-*%%%%%%%%**++%#%%%",
        "#=-:-=-+*+-=-:=*+=++**==*-=+#%%%%#%#%%%%%#*%%%%##%##****+*#+=-=%#%%#*####+*%%%%%",
        "#+=-+++===--=:-+-=++-=:-:-=+*%%#%%%#%%%%%#*%#%%#%%#*+=**=*=--=-+#%%%%#*##*%%%%%%",
        "#++=:+**=.-=**-====*-:=-.-=+*#%%%%%%%%%%%##%%%##%%#**+++=**+#*+#%##%%%*%#%%%%%%%",
        "#*==-::--=+*=**===---++==-=+**#%%%%%%%%%%##%%%%#%####**#+--=*++++*##%*=*=+%%%%%%",
        "#*#+++-=:---++**-+=++---==*#***%%%%%%%%%%#%%%%%%##**#+*#*+=*%+=+*###%##+#%##%%%#",
        "#=+##*--=====*+#*=+#=-==#++#***%%%%%%%%%%#%#%#%######*##+++*%**###*#%***%%%%%%%%",
        "######---===-*-=#*+---==*+*####%%##%%%#%%%%%%##########*+**#%+-****%#+=*##%%%%%%",
        "####*+=---=-===**#=+=*+*%**#%%#%%##%%#%%%#%%%%%%########**++%*+##++#*+=%**%###%%",
        "#*+#+-=--::=*=+==**%%*-+**#%%%%%%%#%%%%%#*#%%%%%%##%%%##**++%****+-==+*#*++#%%%%",
        "#++**#+:----==*==+*%++**##%%%%%%%%%%%%%#%%#%%%%%%##%%%%%+***#*+**#+++**##+=*%%%%",
        "#*+***+-:---#*=-*#=++#***#%%%%%%%#%%%%#%%%%#%%#%##%%%%%%###*+*+*##*+++**##+=#%%%",
        "#+++==+-..:=%#+-**=*##***#%%%%%%%%#%%%%%%%%#%%#%%%%%%####%#*+**+***#+=*+#*+*#%#%",
        "##***=-.:===+=--*+=%##**#%%%%%#%%%%#%%%#%%%%%%#%%%%#%####%#***+:-+-=*******+**#%",
        "#+++--*:++-=*+:*=--+++**#%%%%###%%%%%%%#%#%%%%%%%%%%%#######-+*+++=*%%%#***-###%",
        "#*+#+:==#*=+++-*+===+***#%%%%#%#%%%%%%##%%#%%%#%%%%%####%##*+*+=*##%#+##*%**#%#%",
        "#*++---*#*+==+:=:==+****#%%%%%%%#%%%%%#%%%%%%%%%%%%%####%%#%#*+-*####*###*###%#%",
        "##+=*::*#**+*===--**++**%%%%**%%%%%#%%#%%%%#%%%##%%%%%%%%#####*=*####%%%%++=###%",
        "%**#+:-****+*+***-+****#%%%%+*%%%%%%%%%#%%%%%%#%%%%%%%%#######*+#####%%#%***#%%%",
        "%###-=+#*+*******=-**++#%%%%**%%%%#%%%%##%%%###%%%%%%%%##%#%##**#####%%#%%%#*%##",
        "%###-=+#***+*****=+++**#%%%##*%%%%%#%##%%%%%%%%%%%%%%%%##%#%#########%%%%#%%*%%%",
        "####=**#*********+*+***%%%%%#+%%%#%%%%%##%%%%%%%##%%%%##%%%%####+####%%%##%%*%%#",
        "####*##****************%##%%%#%%%%%%%%%##%%%%%#%**%%%%%%##%#%###=***#%*%#%%%#%%#",
        "#######****************%#*%%%#%%%%%%%%%%%%%%%%%###%%%##%##%#%###****#*+#%%%%#%%%",
        "%######***************#%#*%%%##%%#%%%%%%%%%##%%%#%%%%##%%%#%#%##*+****#%*+%%#%%%",
        "%######***************#%%%%%%##%%%%@%#%%%%%%#%%%%%%#%##%%%*%#%###**####%#+%%%%%%",
        "%########***#*+*******#%%##%%###%%%%%%%%%%%%%%%%%%%%%%##%%##%%#*##*##*#%%%%%%%%%",
        "%########***#*+*******#%*##%%%%#%%%%%%%%%%%%%%%%%##%%%#*#%%%%%#*#%###%*#%%%%%%%%",
        "%%#######****#********%%+%%%*%%%%%@@@@%%%%%%%%%%%#%%%####%%%%%%*#%%%#%=#%%%%%%%%",
        "%%########************%%#%%%*%#%%%%%%%%%%%%%%%%%%%######%%##%%%##%%%*%*%%%%%%%%%",
        "%%#########**********##%%%%%#%%%%%%%%%%%%%%%%#%%%%#####%%%####%##%%@@%%%%%%%%%%%",
        "%%%#######***********#%%#%%#%%%%%%%@%%%%%%%%%%%%%%%%###%%##%%%%##%%%%%###%%%%%#*",
        "%%%########**##*******%%%%##%%#%%%@@@@%%%%%%%%%%%%%####%%#%%%%#%*%+%###**%%@%%%+",
        "#%%%#########+********#%#%%%*##%%%%%@%%%%%%%%%%%%%%##%%%%%%%%%#%%%#%**%**#%@%%%%",
        "#%%%########*=+******#%%%#%%+#%%%%%%%%%%%#%%%%%%%%%**%%%%%%%%##%%%#%#%%##*%@%%%%",
      }

      -- Menu buttons
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
      }

      -- Footer
      local function footer()
        local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
        local version = vim.version()
        local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
        return datetime .. "   " .. nvim_version_info
      end

      dashboard.section.footer.val = footer()

      -- Custom highlight groups for REALLY RED ASCII art
      vim.api.nvim_set_hl(0, "AsciiRed", { fg = "#FF0000" })     -- Pure Red
      vim.api.nvim_set_hl(0, "AsciiOrange", { fg = "#FF2200" })  -- Red-Orange  
      vim.api.nvim_set_hl(0, "AsciiYellow", { fg = "#FF4400" })  -- Red-Yellow
      vim.api.nvim_set_hl(0, "AsciiGray", { fg = "#CC0000" })    -- Dark Red
      vim.api.nvim_set_hl(0, "AsciiDark", { fg = "#880000" })    -- Very Dark Red
      vim.api.nvim_set_hl(0, "DashboardButtons", { fg = "#FF3333" }) -- Bright Red
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#FF1111" })  -- Intense Red
      
      -- Apply color highlighting based on image analysis
      dashboard.section.header.opts.hl = "AsciiRed"
      dashboard.section.buttons.opts.hl = "DashboardButtons"
      dashboard.section.footer.opts.hl = "DashboardFooter"

      -- Layout
      dashboard.config.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }

      -- Disable folding on alpha buffer
      vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
      ]])

      alpha.setup(dashboard.config)
    end,
  },

  -- Which-key for keybinding help
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      
      -- Modern which-key v3 setup
      wk.setup({
        preset = "modern",
        delay = 300,
        expand = 1,
        notify = true,
        triggers = {
          { "<auto>", mode = "nxsot" },
        },
        spec = {},
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
          ellipsis = "…",
          mappings = true,
          rules = {},
          colors = true,
          keys = {
            Up = " ",
            Down = " ",
            Left = " ",
            Right = " ",
            C = " ",
            M = " ",
            D = " ",
            S = " ",
            CR = " ",
            Esc = " ",
            ScrollWheelDown = " ",
            ScrollWheelUp = " ",
            NL = " ",
            BS = " ",
            Space = " ",
            Tab = " ",
            F1 = "",
            F2 = "",
            F3 = "",
            F4 = "",
            F5 = "",
            F6 = "",
            F7 = "",
            F8 = "",
            F9 = "",
            F10 = "",
            F11 = "",
            F12 = "",
          },
        },
        win = {
          border = "rounded",
          padding = { 1, 2 },
          title = true,
          title_pos = "center",
          zindex = 1000,
          bo = {},
          wo = {},
        },
        layout = {
          width = { min = 20 },
          spacing = 3,
        },
        keys = {
          scroll_down = "<c-d>",
          scroll_up = "<c-u>",
        },
        sort = { "local", "order", "group", "alphanum", "mod" },
        expand = 0,
        replace = {
          key = {
            function(key)
              return require("which-key.view").format(key)
            end,
          },
          desc = {
            { "<Plug>%(.*)%)", "%1" },
            { "^%+", "" },
            { "<[cC]md>", "" },
            { "<[cC][rR]>", "" },
            { "<[sS]ilent>", "" },
            { "^lua%s+", "" },
            { "^call%s+", "" },
            { "^:%s*", "" },
          },
        },
      })
      
      -- Register key groups
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>b", group = "Buffer" },
        { "<leader>d", group = "Debug" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "Harpoon" },
        { "<leader>l", group = "LSP" },
        { "<leader>n", group = "New/Create" },
        { "<leader>p", group = "Project" },
        { "<leader>t", group = "Terminal" },
        { "<leader>w", group = "Window" },
        { "<leader>c", group = "Colorscheme" },
      })
    end,
  },

  -- Lualine statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "gruvbox",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      })
    end,
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query",
          "javascript", "typescript", "python", "rust",
          "go", "html", "css", "json", "yaml",
          "markdown", "markdown_inline", "bash"
        },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end,
  },

  -- LuaSnip snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- nvim-cmp completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?`.
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':'.
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  },

  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = "❯ ",
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
              return {"--hidden"}
            end
          },
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                ["<A-c>"] = require("telescope._extensions.file_browser.actions").create,
                ["<S-CR>"] = require("telescope._extensions.file_browser.actions").create_from_prompt,
                ["<A-r>"] = require("telescope._extensions.file_browser.actions").rename,
                ["<A-m>"] = require("telescope._extensions.file_browser.actions").move,
                ["<A-y>"] = require("telescope._extensions.file_browser.actions").copy,
                ["<A-d>"] = require("telescope._extensions.file_browser.actions").remove,
                ["<C-o>"] = require("telescope._extensions.file_browser.actions").open,
                ["<C-g>"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
                ["<C-e>"] = require("telescope._extensions.file_browser.actions").goto_home_dir,
                ["<C-w>"] = require("telescope._extensions.file_browser.actions").goto_cwd,
                ["<C-t>"] = require("telescope._extensions.file_browser.actions").change_cwd,
                ["<C-f>"] = require("telescope._extensions.file_browser.actions").toggle_browser,
                ["<C-h>"] = require("telescope._extensions.file_browser.actions").toggle_hidden,
                ["<C-s>"] = require("telescope._extensions.file_browser.actions").toggle_all,
              },
              ["n"] = {
                ["c"] = require("telescope._extensions.file_browser.actions").create,
                ["r"] = require("telescope._extensions.file_browser.actions").rename,
                ["m"] = require("telescope._extensions.file_browser.actions").move,
                ["y"] = require("telescope._extensions.file_browser.actions").copy,
                ["d"] = require("telescope._extensions.file_browser.actions").remove,
                ["o"] = require("telescope._extensions.file_browser.actions").open,
                ["g"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
                ["e"] = require("telescope._extensions.file_browser.actions").goto_home_dir,
                ["w"] = require("telescope._extensions.file_browser.actions").goto_cwd,
                ["t"] = require("telescope._extensions.file_browser.actions").change_cwd,
                ["f"] = require("telescope._extensions.file_browser.actions").toggle_browser,
                ["h"] = require("telescope._extensions.file_browser.actions").toggle_hidden,
                ["s"] = require("telescope._extensions.file_browser.actions").toggle_all,
              },
            },
          },
        }
      })
      
      -- Load extensions
      require("telescope").load_extension("file_browser")
      require('telescope').load_extension('projects')
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "pyright",
          "ts_ls",
          "html",
          "cssls",
          "jsonls",
        },
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP servers setup
      local servers = {
        "lua_ls",
        "rust_analyzer",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- Lua language server specific config
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Global mappings
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end,
  },

  -- Indent blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = { enabled = false },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      })
    end,
  },

  -- AdvancedNewFile for quick file and folder creation
  {
    "Mohammed-Taher/AdvancedNewFile.nvim",
    config = function()
      -- Plugin loads automatically, no additional setup required
    end,
  },

  -- Oil.nvim - File manager as a buffer
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
      })
    end,
  },

  -- Telescope File Browser extension
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  -- Project.nvim - Automatic project detection
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml", "go.mod", "requirements.txt", "pyproject.toml" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = 'global',
        datapath = vim.fn.stdpath("data"),
      })
    end,
  },

  -- Harpoon - Quick file navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({
        settings = {
          save_on_toggle = false,
          sync_on_ui_close = false,
          key = function()
            return vim.loop.cwd()
          end,
        }
      })
    end,
  },

  -- Templates.nvim - File templates
  {
    "glepnir/template.nvim",
    cmd = {'Template','TemProject'},
    config = function()
      require('template').setup({
        temp_dir = vim.fn.stdpath("config") .. "/templates",
        author = "Your Name",
        email = "your.email@example.com",
      })
    end,
  },

  -- Mkdir.nvim - Auto-create directories when saving files
  {
    "jghauser/mkdir.nvim",
    config = function()
      -- Automatically creates missing directories when saving files
      -- No additional configuration needed
    end,
  },

  -- DAP UI for debugging
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        expand_lines = vim.fn.has("nvim-0.7") == 1,
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 0.25,
            position = "bottom",
          },
        },
        controls = {
          enabled = true,
          element = "repl",
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "▶▶",
            terminate = "⏹",
          },
        },
        floating = {
          max_height = nil,
          max_width = nil,
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil,
          max_value_lines = 100,
        }
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
})

-- Key mappings
-- File Explorer
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus Neo-tree" })

-- Terminal
vim.keymap.set("n", "<C-\\>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Telescope fuzzy finder
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>fc", ":Telescope commands<CR>", { desc = "Commands" })
vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fs", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in current buffer" })

-- DAP Debugging
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc = "Debug: Continue" })
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "Debug: Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { desc = "Debug: Open REPL" })
vim.keymap.set("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", { desc = "Debug: Run Last" })
vim.keymap.set("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", { desc = "Debug: Toggle UI" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==gv", { desc = "Move text down" })
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==gv", { desc = "Move text up" })
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move text up" })
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move text up" })

-- Clear search highlighting
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlighting" })

-- Quick save and quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })

-- AdvancedNewFile keymap
vim.keymap.set("n", "<leader>nf", ":AdvancedNewFile<CR>", { desc = "Create new file/folder" })

-- Oil.nvim - File manager as buffer
vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory in Oil" })
vim.keymap.set("n", "<leader>-", ":Oil .<CR>", { desc = "Open current directory in Oil" })

-- Telescope File Browser and Projects
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", { desc = "File browser" })
vim.keymap.set("n", "<leader>fB", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "File browser (current file)" })
vim.keymap.set("n", "<leader>pp", ":Telescope projects<CR>", { desc = "Switch projects" })
vim.keymap.set("n", "<leader>pf", ":Telescope find_files<CR>", { desc = "Find project files" })

-- Harpoon - Quick file navigation
vim.keymap.set("n", "<leader>ha", function() require("harpoon"):list():append() end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Harpoon quick menu" })
vim.keymap.set("n", "<leader>h1", function() require("harpoon"):list():select(1) end, { desc = "Harpoon file 1" })
vim.keymap.set("n", "<leader>h2", function() require("harpoon"):list():select(2) end, { desc = "Harpoon file 2" })
vim.keymap.set("n", "<leader>h3", function() require("harpoon"):list():select(3) end, { desc = "Harpoon file 3" })
vim.keymap.set("n", "<leader>h4", function() require("harpoon"):list():select(4) end, { desc = "Harpoon file 4" })
vim.keymap.set("n", "<C-S-P>", function() require("harpoon"):list():prev() end, { desc = "Harpoon previous" })
vim.keymap.set("n", "<C-S-N>", function() require("harpoon"):list():next() end, { desc = "Harpoon next" })

-- Templates
vim.keymap.set("n", "<leader>ft", ":Template<CR>", { desc = "Insert template" })
vim.keymap.set("n", "<leader>fT", ":TemProject<CR>", { desc = "Project template" })

-- Colorscheme keymaps
vim.keymap.set("n", "<leader>cr", ":colorscheme rose-pine<CR>", { desc = "Rose Pine Dawn colorscheme" })
vim.keymap.set("n", "<leader>cg", function()
  vim.o.background = "light"
  vim.cmd("colorscheme gruvbox")
end, { desc = "Gruvbox Light colorscheme" })
vim.keymap.set("n", "<leader>cgd", function()
  vim.o.background = "dark"
  vim.cmd("colorscheme gruvbox")
end, { desc = "Gruvbox Dark colorscheme" })
vim.keymap.set("n", "<leader>cm", ":colorscheme monokai-pro<CR>", { desc = "Monokai Pro colorscheme" })
vim.keymap.set("n", "<leader>cme", ":colorscheme melange<CR>", { desc = "Melange colorscheme" })
vim.keymap.set("n", "<leader>ct", ":Telescope colorscheme<CR>", { desc = "Choose colorscheme" })

-- Set default colorscheme to Melange dark (already set in plugin config above)
-- vim.o.background = "dark"
-- vim.cmd("colorscheme melange")
