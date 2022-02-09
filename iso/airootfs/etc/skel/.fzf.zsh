# Setup fzf
# ---------
if [[ ! "$PATH" == */home/parseh/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/mmdbalkhi/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/parseh/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/mmdbalkhi/.fzf/shell/key-bindings.zsh"
