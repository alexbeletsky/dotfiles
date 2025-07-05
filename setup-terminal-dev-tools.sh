#!/bin/bash

# Terminal Development Tools Setup Script
# This script installs and configures essential tools for terminal-based development using existing dotfiles

set -e

echo "🚀 Setting up terminal development tools..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed. Please install it first:"
    echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

echo "✅ Homebrew found"

# Update Homebrew
echo "📦 Updating Homebrew..."
brew update

# Install essential tools
echo "🔧 Installing development tools..."

# Core tools
tools=(
    "bat"           # Better cat with syntax highlighting
    "exa"           # Modern ls replacement
    "tree"          # Directory tree viewer
    "git-delta"     # Better git diffs
    "fzf"           # Fuzzy finder
    "ripgrep"       # Better grep
    "fd"            # Better find
    "source-highlight" # Syntax highlighting for less
)

for tool in "${tools[@]}"; do
    if brew list "$tool" &> /dev/null; then
        echo "✅ $tool is already installed"
    else
        echo "📦 Installing $tool..."
        brew install "$tool"
    fi
done

# Configure Git with colors and delta
echo "🎨 Configuring Git..."
git config --global color.ui auto
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global delta.light false
git config --global delta.line-numbers true
git config --global delta.side-by-side true

# Add useful git aliases
echo "🔧 Adding Git aliases..."
git config --global alias.lg "log --oneline --graph --decorate --all"
git config --global alias.st "status -s"
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.visual "!gitk"

# Backup existing aliases if needed
if [ -f ~/.dotfiles/zsh/aliases.zsh ]; then
    cp ~/.dotfiles/zsh/aliases.zsh ~/.dotfiles/zsh/aliases.zsh.bak
    echo "✅ Backed up existing aliases.zsh"
fi

# Update aliases
cat >> ~/.dotfiles/zsh/aliases.zsh << 'EOF'

# Enhanced terminal development tools aliases
# Better file operations with exa
alias ls='exa --color=always --group-directories-first'
alias ll='exa -la --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'

# Better cat using bat
alias cat='bat'
alias less='bat --paging=always'

# Git shortcuts
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'

# File operations
alias ff='find . -name'
alias rg='rg --color=always'
alias fd='fd --color=always'

EOF

# Install fzf key bindings
echo "🔍 Setting up fzf key bindings..."
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish

# Append enhancements to .zshrc
if [ -f ~/.dotfiles/zsh/zshrc.symlink ]; then
    cat >> ~/.dotfiles/zsh/zshrc.symlink << 'EOF'

# Enhanced terminal development tools configuration
# FZF configuration
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Enable fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source highlight for less
export LESSOPEN="| $(brew --prefix)/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

EOF
    echo "✅ Updated .zshrc symlink"
fi

echo "✅ Setup complete! 🎉"
echo ""
echo "📋 What was installed and configured:"
echo "   • bat - Better cat with syntax highlighting"
echo "   • exa - Modern ls replacement"
echo "   • tree - Directory tree viewer"
echo "   • git-delta - Enhanced git diffs"
echo "   • fzf - Fuzzy finder"
echo "   • ripgrep - Better grep"
echo "   • fd - Better find"
echo "   • source-highlight - Syntax highlighting for less"
echo ""
echo "🔧 Git configuration:"
echo "   • Enabled colors for all git commands"
echo "   • Configured delta for better diffs"
echo "   • Added useful aliases (gs, gd, gl, gco, etc.)"
echo ""
echo "🔄 To apply changes, source your .zshrc symlink:"
echo "   source ~/.dotfiles/zsh/zshrc.symlink"
echo "   Or restart your terminal"
echo ""
echo "💡 Try these commands:"
echo "   • ll                    - List files with details"
echo "   • cat filename.js       - View file with syntax highlighting"
echo "   • git diff              - See enhanced git diffs"
echo "   • fzf usage in workflows"
