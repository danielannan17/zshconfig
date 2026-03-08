# Put your custom themes in this folder.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization#overriding-and-adding-themes
#

# Show time in prompt, green if successful, red if failed E.g. [07:11] ➜  ~
PROMPT="%(?:%{$fg_bold[green]%}[%D{%H:%M}] :%{$fg_bold[red]%}[%D{%H:%M}] )"$PROMPT

# PROMPT that shows host name
PROMPT='%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )%{$fg[yellow]%}@%m %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
