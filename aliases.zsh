# For a full list of active aliases, run `alias`.

source ${ZSH_CUSTOM}/secrets.local.zsh

alias code="cursor"
alias neovim="nvim"
alias vim="nvim"
alias zshrc="code ~/.zshrc"
alias zshconfig="code ~/.zshrc"
alias loadzsh="source ~/.zshrc"
alias python="python3"
alias pip="pip3"
alias claude-sandbox="$projects_dir/claude-container/claude-sandbox.sh"

# Subtext Openclaw commands
alias ocl="ssh root@$subtext_openclaw_server_ip"
alias ocgw="ssh -N -L 18789:127.0.0.1:18789 root@$subtext_openclaw_server_ip"
alias octk="echo $subtext_openclaw_gateway_token | pbcopy"
alias ocui="openclaw tui --url ws:127.0.0.1:18789 --token $subtext_openclaw_gateway_token"
alias ocse="rsync -a --delete --progress --exclude .git $projects_dir/openclaw-extensions/ root@$subtext_openclaw_server_ip:/root/.openclaw/extensions/"