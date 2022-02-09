# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mmdbalkhi/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/mmdbalkhi/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mmdbalkhi/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/mmdbalkhi/.fzf/shell/key-bindings.bash"
