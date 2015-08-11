# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

bindkey -v                                          # Use vi key bindings
bindkey '^r' history-incremental-search-backward    # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.

# emacs style
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# Inserts sudo at the beginning of a line
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^s" insert-sudo

bindkey '^[[1;5D' backward-word

# Go forward one word
bindkey '^[[1;5C' forward-word


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

