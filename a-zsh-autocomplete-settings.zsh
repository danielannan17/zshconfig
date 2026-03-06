# # Increase delay so autocomplete only triggers when Tab is pressed
# zstyle ':autocomplete:*' min-delay 9999

# # zsh-vi-mode conflicts with zsh-autocomplete so this fixes tab completion.
# # Must be before zsh-autocomplete.
# bindkey -M viins '^i' down-line-or-select
# bindkey -M viins '^[[Z' reverse-menu-complete

# source ${ZSH_CUSTOM}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh 

# # Sets tab functionality to act as normal tab completion
# bindkey -M main '^I'  down-line-or-select
# bindkey -M menuselect '^I' 'down-history'

# # Resets the history-incremental-search-backward binding back to normal
# # zsh-autocomplete overrides this with its own function
# bindkey '^R' fzf-history-widget