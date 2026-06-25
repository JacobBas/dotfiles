# Personal Dotfiles

A comprehensive collection of development environment configurations featuring Neovim, Ghostty, WezTerm, and various development tools.

## 🚀 Quick Start

### Prerequisites

Before running the setup, install these essential programs:

#### **Neovim** (Required)
- **macOS**: `brew install neovim`
- **Linux**: Follow [Neovim installation guide](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- **Windows**: Download from [Neovim releases](https://github.com/neovim/neovim/releases)

#### **Ghostty Terminal** (Recommended)
- **macOS**: Download from [Ghostty](https://ghostty.org/download)

#### **Node Version Manager** (Recommended)
- **NVM**: `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash`
- Required for LSP servers and development tools

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/JacobBas-Coalitioninc/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Run the setup script**:
   ```bash
   bash init_config.sh
   ```

3. **Restart your terminal** and enjoy your new development environment!

## 📁 Configuration Structure

```
dotfiles/
├── nvim/                    # Neovim configuration
│   ├── init.lua            # Entry point
│   ├── lua/jazzfish/       # Main config module
│   │   ├── init.lua        # Module initialization
│   │   ├── editor-opts.lua # Editor settings
│   │   ├── lazy.lua        # Plugin management
│   │   ├── remap.lua       # Keybindings
│   │   ├── color.lua       # Colorscheme
│   │   └── snippets/       # Custom snippets
│   └── README.md           # Neovim documentation
├── ghostty/                 # Ghostty terminal config
│   ├── config              # Terminal configuration
│   └── themes/             # Custom Ghostty themes
├── wezterm/                 # WezTerm config (alternative)
├── init_config.sh           # Setup script
├── init_config.ps1          # Windows setup script
└── README.md               # This file
```

## 🛠️ What's Included

### **Neovim Configuration**
A modern, feature-rich Neovim setup with:

- **Plugin Management**: Lazy.nvim for fast, lazy-loading plugin manager
- **Language Support**: LSP with Mason for easy server installation
- **Fuzzy Finding**: Telescope for files, buffers, grep, and more
- **File Navigation**: Harpoon for fast file switching
- **Git Integration**: Fugitive, GitGutter, and Rhubarb
- **Syntax Highlighting**: Treesitter for advanced parsing
- **Autocomplete**: nvim-cmp with LSP integration
- **Snippets**: LuaSnip with custom snippet system
- **Status Line**: Lualine with git info and diagnostics
- **File Explorer**: Oil.nvim for modern file browsing

**Key Features**:
- Modular Lua configuration
- Comprehensive keybindings
- Custom snippet system
- Multiple colorschemes
- Performance optimizations
- Debugging tools

### **Ghostty Terminal**
A fast, native terminal emulator with:

- **Performance**: GPU-accelerated rendering
- **Customization**: Extensive configuration options
- **Sessions**: Built-in session management
- **Themes**: Gruvbox Material light and dark color schemes
- **Shortcuts**: Custom keybindings for productivity

### **Development Tools**
- **Language Servers**: Auto-installed via Mason
- **Formatting**: Built-in and LSP formatting
- **Linting**: Diagnostic integration
- **Debugging**: nvim-dap support

## ⌨️ Keybindings

### **Neovim Leader Key**
The leader is set to `<Space>` and provides access to most functionality.

#### **File Navigation**
- `<leader>ff` - Find files (Telescope)
- `<leader>fb` - Find buffers (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `<leader>t` - Open file explorer (Oil)

#### **File Management**
- `<leader>ha` - Add file to Harpoon
- `<leader>hh` - Toggle Harpoon menu
- `<leader>1-9` - Quick jump to Harpoon files

#### **Window Management**
- `<leader>wv` - Split window vertically
- `<leader>wh` - Split window horizontally
- `<leader>w<arrow>` - Navigate between windows

#### **LSP Commands**
- `K` - Hover documentation
- `gd` - Go to definition
- `gr` - Go to references
- `ga` - Rename symbol

#### **AI-Assisted Copy**
- `<leader>yp` - Copy file path
- `<leader>yn` - Copy current line number
- `<leader>yl` - Copy selected line range
- `<leader>ye` - Copy error context

### **Ghostty Terminal**
- `Ctrl+Shift+T` - New tab
- `Super+Shift+Left` - Previous tab
- `Super+Shift+Right` - Next tab
- `Ctrl+Shift+V` - New vertical split
- `Ctrl+Shift+H` - New horizontal split

## 🎨 Appearance

### **Neovim**
- **Primary Colorscheme**: Gruvbox with custom modifications
- **Alternative**: Custom ACME colorscheme
- **Status Line**: Lualine with git integration
- **Highlights**: Custom syntax highlighting and diagnostics

### **Ghostty**
- **Theme**: Follows the macOS light/dark appearance using custom Gruvbox Material themes
- **Font**: Monospace with ligatures support
- **Icons**: Nerd Fonts for file type icons

## 🚀 Getting Started

### **First Launch**
1. Open Ghostty terminal
2. Type `nvim` to start Neovim
3. Wait for Lazy.nvim to install plugins (first time only)
4. Enjoy your new development environment!

### **Common Commands**
- `nvim .` - Open current directory in Neovim
- `nvim filename` - Open specific file
- `nvim +Oil` - Open file explorer directly

### **Plugin Management**
- `:Lazy` - Open plugin manager
- `:Mason` - Install language servers
- `:LspInfo` - Check LSP status

## 📚 Learning Resources

### **Neovim**
- `:h vim.` - Vim Lua API reference
- `:h nvim_` - Neovim Lua API reference
- `:h lazy.nvim` - Plugin manager docs
- `:h telescope` - Fuzzy finder docs

### **Ghostty**
- `ghostty +show-config` - Show active configuration
- `ghostty +show-config --default --docs` - Show all available options
- [Ghostty Documentation](https://ghostty.org/docs)

### **Development**
- [Neovim Lua Guide](https://github.com/nanotee/nvim-lua-guide)
- [LSP Configuration](https://github.com/neovim/nvim-lspconfig)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## 🔧 Customization

### **Adding Neovim Plugins**
Edit `nvim/lua/jazzfish/lazy.lua`:

```lua
{
    'author/plugin-name',
    config = function()
        require('plugin-name').setup({
            -- your config
        })
    end
},
```

### **Adding Keybindings**
Edit `nvim/lua/jazzfish/remap.lua`:

```lua
vim.keymap.set('n', '<leader>key', function()
    -- your mapping
end, { desc = 'Description' })
```

### **Ghostty Configuration**
Edit `ghostty/config` for terminal customization. The setup script links this directory to `~/.config/ghostty`, so custom themes in `ghostty/themes/` stay in this repo.

## 🐛 Troubleshooting

### **Common Issues**

#### **Neovim**
1. **Plugins not loading**: Run `:Lazy` to check installation
2. **LSP not working**: Run `:Mason` to install language servers
3. **Keybindings not working**: Check `:map` for conflicts
4. **Performance issues**: Check `:checkhealth`

#### **Ghostty**
1. **Font not loading**: Install Nerd Fonts
2. **Colors not working**: Check theme configuration
3. **Shortcuts not working**: Verify keybindings in config

### **Debugging**
- Use `:checkhealth` in Neovim for system health
- Check `:LspInfo` for language server status
- Use debugging snippets (`debug`, `debugvar`, etc.)
- Check Ghostty's active config: `ghostty +show-config`

## 📈 Performance

### **Optimizations**
- **Lazy Loading**: Plugins load only when needed
- **Big File Handling**: Disables features for large files
- **Efficient LSP**: Minimal server configurations
- **Fast Startup**: Optimized plugin loading

### **System Requirements**
- **Neovim**: 0.8+ required
- **Ghostty**: Modern terminal with GPU support
- **Memory**: 2GB+ recommended for development
- **Storage**: 1GB+ for plugins and tools

## 🤝 Contributing

Feel free to customize this configuration:

1. **Fork the repository**
2. **Make your changes**
3. **Test thoroughly**
4. **Document new features**
5. **Submit a pull request**

## 📄 License

This configuration is open source and available under the MIT License.

## 🙏 Acknowledgments

- **Neovim Team** - For the amazing editor
- **Lazy.nvim** - For the fast plugin manager
- **Ghostty Team** - For the fast terminal
- **Plugin Authors** - For the excellent ecosystem

---

**Happy coding! 🚀**

For detailed Neovim documentation, see [nvim/README.md](nvim/README.md).
