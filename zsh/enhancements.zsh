# Zsh enhancements - autosuggestions and syntax highlighting
# These enhance the interactive shell experience. Each plugin is sourced from
# the first location found, so it works on macOS (Homebrew) and Linux (Oh My
# Zsh custom plugins, apt, pacman) alike.

_omz_custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Load zsh-autosuggestions from the first available location
for _p in \
  /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  "$_omz_custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
do
  if [[ -f $_p ]]; then source $_p; break; fi
done

# Load zsh-syntax-highlighting from the first available location
# (keep it last so it wraps the widgets defined above)
for _p in \
  /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  "$_omz_custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
  /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
do
  if [[ -f $_p ]]; then source $_p; break; fi
done

unset _p _omz_custom

# Configure autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Configure syntax highlighting
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
