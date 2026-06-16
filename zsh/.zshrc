#!/bin/zsh

source "$HOME/.config/.dotconfig/zsh/chunks/flags"

# provides auto_load_scripts_in_dir function.
source "$HOME/.config/.dotconfig/zsh/chunks/utils/loader.zsh"
auto_load_scripts_in_dir "$HOME/.config/.dotconfig/zsh/chunks/utils/"

# zsh plugin manager zinit
source "$HOME/.config/.dotconfig/zsh/chunks/zinit"

auto_load_scripts_in_dir "$HOME/.config/.dotconfig/zsh/chunks/autoload/"
auto_load_scripts_in_dir "$HOME/.config/.dotconfig/zsh/completions/"

# loading the keybindings
source "$HOME/.config/.dotconfig/zsh/chunks/keybinds"

# bit
case ":$PATH:" in
  *":/home/saroj/bin:"*) ;;
  *) export PATH="$PATH:/home/saroj/bin" ;;
esac
# bit end

# pnpm
export PNPM_HOME="/home/saroj/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# opencode
export PATH=/home/saroj/.opencode/bin:$PATH
