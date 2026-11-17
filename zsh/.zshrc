export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/opt/homebrew/bin:$PATH"


PROMPT=$'\n%F{cyan}%n (%d):%f\n%F{green}> %f'
zle_highlight=(default:fg=yellow)
preexec() { printf '\e[97m' }
precmd()  { printf '\e[0m' }

# include aliases
source ~/.zsh_aliases

# pnpm
export PNPM_HOME="/Users/amiuser/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$HOME/.local/bin:$PATH"

# llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/Users/amiuser/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

#java env
export JAVA_HOME=$(/usr/libexec/java_home -v 25)
export PATH="$JAVA_HOME/bin:$PATH"
