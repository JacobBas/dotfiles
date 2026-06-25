#!/bin/bash

# =============================================================================
# DOTFILES SETUP SCRIPT
# =============================================================================
# This script sets up symbolic links for Neovim, WezTerm, and Ghostty configurations
# on Unix systems (macOS and Linux)

set -e  # Exit on any error

echo "🚀 Setting up dotfiles configuration..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to create backup of existing config
create_backup() {
    local config_path="$1"
    local backup_path="${config_path}.backup.$(date +%Y%m%d_%H%M%S)"
    
    if [[ -e "$config_path" ]]; then
        print_warning "Existing configuration found at $config_path"
        print_status "Creating backup at $backup_path"
        mv "$config_path" "$backup_path"
    fi

    return 0
}

# Function to create symbolic link
create_symlink() {
    local source="$1"
    local target="$2"
    local target_dir="$(dirname "$target")"
    
    # Create target directory if it doesn't exist
    if [[ ! -d "$target_dir" ]]; then
        print_status "Creating directory: $target_dir"
        mkdir -p "$target_dir"
    fi
    
    # Leave already-correct links alone so this script is safe to rerun.
    if [[ -L "$target" ]]; then
        local current_target
        current_target="$(readlink "$target")"

        if [[ "$current_target" == "$source" ]]; then
            print_success "Already linked '$target' to '$source'"
            return 0
        fi

        print_warning "Existing symlink found at $target -> $current_target"
        rm "$target"
    else
        # Create backup if target exists
        create_backup "$target"
    fi
    
    # Create symbolic link
    print_status "Creating symbolic link: $source -> $target"
    ln -sf "$source" "$target"
    
    if [[ -L "$target" ]]; then
        print_success "Linked '$source' to '$target'"
    else
        print_error "Failed to create symbolic link: $source -> $target"
        return 1
    fi
}

# Function to setup Neovim configuration
setup_neovim() {
    print_status "Setting up Neovim configuration..."
    
    local nvim_source="$PWD/nvim"
    local nvim_target="$HOME/.config/nvim"
    
    if [[ ! -d "$nvim_source" ]]; then
        print_error "Neovim configuration directory not found: $nvim_source"
        return 1
    fi
    
    create_symlink "$nvim_source" "$nvim_target"
    
    # Check if Neovim is installed
    if ! command -v nvim &> /dev/null; then
        print_warning "Neovim is not installed. Please install it first:"
        echo "  macOS: brew install neovim"
        echo "  Linux: Follow https://github.com/neovim/neovim/wiki/Installing-Neovim"
    else
        print_success "Neovim configuration setup complete"
    fi
}

# Function to setup WezTerm configuration
setup_wezterm() {
    print_status "Setting up WezTerm configuration..."
    
    local wezterm_source="$PWD/wezterm"
    local wezterm_target="$HOME/.config/wezterm"
    
    if [[ ! -d "$wezterm_source" ]]; then
        print_warning "WezTerm configuration directory not found: $wezterm_source"
        print_status "Skipping WezTerm setup..."
        return 0
    fi
    
    create_symlink "$wezterm_source" "$wezterm_target"
    
    # Check if WezTerm is installed
    if ! command -v wezterm &> /dev/null; then
        print_warning "WezTerm is not installed. You can install it from:"
        echo "  https://wezfurlong.org/wezterm/install/"
    else
        print_success "WezTerm configuration setup complete"
    fi
}

# Function to setup Ghostty configuration
setup_ghostty() {
    print_status "Setting up Ghostty configuration..."

    local ghostty_source="$PWD/ghostty"
    local ghostty_target="$HOME/.config/ghostty"

    if [[ ! -d "$ghostty_source" ]]; then
        print_warning "Ghostty configuration directory not found: $ghostty_source"
        print_status "Skipping Ghostty setup..."
        return 0
    fi

    create_symlink "$ghostty_source" "$ghostty_target"

    if ! command -v ghostty &> /dev/null; then
        print_warning "Ghostty is not installed. You can install it from:"
        echo "  https://ghostty.org/download"
    else
        print_success "Ghostty configuration setup complete"
    fi
}

# Function to setup optional XDG configuration directories
setup_optional_config() {
    local name="$1"
    local source="$PWD/$name"
    local target="$HOME/.config/$name"

    print_status "Setting up $name configuration..."

    if [[ ! -d "$source" ]]; then
        print_status "$name configuration directory not found; skipping..."
        return 0
    fi

    create_symlink "$source" "$target"
}

setup_kitty() {
    setup_optional_config "kitty"
}

setup_helix() {
    setup_optional_config "helix"
}

verify_symlink() {
    local name="$1"
    local source="$2"
    local target="$3"

    if [[ ! -L "$target" ]]; then
        print_error "$name configuration not properly linked"
        return 1
    fi

    local current_target
    current_target="$(readlink "$target")"

    if [[ "$current_target" != "$source" ]]; then
        print_error "$name configuration points to '$current_target', expected '$source'"
        return 1
    fi

    print_success "$name configuration linked"
    return 0
}

# Function to verify installations
verify_setup() {
    print_status "Verifying setup..."
    
    local errors=0
    
    # Check Neovim config
    if ! verify_symlink "Neovim" "$PWD/nvim" "$HOME/.config/nvim"; then
        errors=$((errors + 1))
    fi
    
    # Check WezTerm config (if exists)
    if [[ -d "$PWD/wezterm" ]]; then
        if ! verify_symlink "WezTerm" "$PWD/wezterm" "$HOME/.config/wezterm"; then
            errors=$((errors + 1))
        fi
    fi

    # Check Ghostty config (if exists)
    if [[ -d "$PWD/ghostty" ]]; then
        if ! verify_symlink "Ghostty" "$PWD/ghostty" "$HOME/.config/ghostty"; then
            errors=$((errors + 1))
        fi
    fi
    
    # Check Kitty config (if exists)
    if [[ -d "$PWD/kitty" ]]; then
        if ! verify_symlink "Kitty" "$PWD/kitty" "$HOME/.config/kitty"; then
            errors=$((errors + 1))
        fi
    fi
    
    # Check Helix config (if exists)
    if [[ -d "$PWD/helix" ]]; then
        if ! verify_symlink "Helix" "$PWD/helix" "$HOME/.config/helix"; then
            errors=$((errors + 1))
        fi
    fi
    
    if [[ $errors -eq 0 ]]; then
        print_success "All configurations verified successfully!"
    else
        print_error "Found $errors configuration issue(s)"
        return 1
    fi
}

# Main execution
main() {
    echo "=========================================="
    echo "  DOTFILES SETUP SCRIPT"
    echo "=========================================="
    echo ""
    
    # Ensure we're in the dotfiles directory
    if [[ ! -f "init_config.sh" ]]; then
        print_error "Please run this script from the dotfiles directory"
        exit 1
    fi
    
    # Setup configurations
    setup_neovim
    setup_wezterm
    setup_ghostty
    setup_kitty
    setup_helix

    # Verify setup
    verify_setup
    
    echo ""
    echo "=========================================="
    print_success "Setup complete! 🎉"
    echo "=========================================="
    echo ""
    echo "Next steps:"
    echo "1. Restart your terminal"
    echo "2. Open Neovim: nvim"
    echo "3. Wait for Lazy.nvim to install plugins (first time only)"
    echo "4. Enjoy your new development environment!"
    echo ""
    echo "For detailed documentation, see:"
    echo "  - README.md (this repository)"
    echo "  - nvim/README.md (Neovim configuration)"
    echo ""
}

# Run main function
main "$@"
