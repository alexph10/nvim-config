# Neovim Configuration

A comprehensive Neovim configuration with enhanced language support for game development, web development, and general programming.

## Features

### Language Support
- **Rust**: rustaceanvim, rust-analyzer LSP, cargo integration, debugging
- **C/C++**: Enhanced clangd with Windows paths, clangd_extensions, improved debugging
- **C#**: OmniSharp LSP, .NET debugging support
- **Python**: pyright LSP, debugging with debugpy
- **JavaScript/TypeScript**: TypeScript tools, Node.js debugging
- **Web Development**: React, Next.js, Tailwind CSS support
- **Game Development**: Unity (C#), Godot (GDScript), Unreal Engine (C++)
- **Shaders**: GLSL, HLSL, WGSL syntax support

### Key Plugins
- **Plugin Manager**: Lazy.nvim
- **Theme**: Moonbow + Gruvbox with contrast controls
- **LSP**: Mason for automatic tool installation
- **Completion**: nvim-cmp with multiple sources
- **Fuzzy Finding**: Telescope
- **File Navigation**: Neo-tree, Harpoon
- **Git Integration**: Fugitive, Diffview
- **Debugging**: nvim-dap with UI and virtual text
- **Formatting**: none-ls (null-ls replacement)

### Key Mappings
- **Leader Key**: Space
- **LSP**: `gd` (go to definition), `gr` (references), `K` (hover), `<leader>ca` (code actions)
- **Debugging**: `F5` (continue), `F10` (step over), `F11` (step into), `<leader>b` (breakpoint)
- **Theme**: `<leader>tc` (toggle contrast), `<leader>tb` (toggle background)
- **Git**: `<leader>gd` (diffview), `<leader>gs` (fugitive)
- **CMake**: `<leader>cg` (generate), `<leader>cb` (build), `<leader>cr` (run)

## Installation

1. **Backup your existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   # On Windows: move %LOCALAPPDATA%\nvim %LOCALAPPDATA%\nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone https://github.com/alexph10/nvim-config ~/.config/nvim
   # On Windows: git clone https://github.com/alexph10/nvim-config %LOCALAPPDATA%\nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```
   
   Lazy.nvim will automatically install all plugins on first launch.

4. **Install language servers** (optional):
   Most language servers will be installed automatically via Mason, but you can manually install additional tools:
   ```
   :Mason
   ```

## Requirements

- Neovim >= 0.9.0
- Git
- A Nerd Font (for icons)
- Node.js (for some language servers)
- Python 3 (for Python development)
- Rust (for Rust development)
- .NET SDK (for C# development)

## Additional Scripts

This configuration also includes some utility Python scripts:

- `image_to_ascii.py`: Convert images to ASCII art
- `color_ascii_converter.py`: Convert ASCII art with color support

## Structure

```
nvim/
├── init.lua              # Main configuration file
├── lazy-lock.json        # Plugin version lock file
├── requirements.txt      # Python dependencies for scripts
└── README.md            # This file
```

## Customization

The configuration is modular and can be easily customized:

- **Theme**: Toggle between Moonbow and Gruvbox themes using `<leader>tt`
- **Language Support**: Add new language servers in the LSP configuration
- **Keymaps**: Modify keybindings in the keymaps section
- **Plugins**: Add/remove plugins in the Lazy.nvim configuration

## Troubleshooting

1. **Plugin issues**: Try `:Lazy sync` to update plugins
2. **LSP issues**: Check `:LspInfo` and `:Mason` for language server status
3. **Health check**: Run `:checkhealth` to diagnose configuration issues

## License

This configuration is open source and available under the MIT License.
