# Oh My Zsh Custom Setup

## Prerequisites

Install [Oh My Zsh](https://ohmyz.sh/) if you haven't already:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Setup

Clone this repo to replace the default `custom` folder, then run the setup script:

```bash
rm -rf ~/.oh-my-zsh/custom
git clone https://github.com/danielannan17/zshconfig.git ~/.oh-my-zsh/custom
cd ~/.oh-my-zsh/custom && ./setup.sh
```

## Plugins

### Built-in (shipped with oh-my-zsh)

These don't need installing — just add them to `plugins=()` in `.zshrc`.

- **[git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)** — git aliases and functions
- **[z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)** — directory jumping based on frecency
- **[fzf](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf)** — fuzzy finder integration
- **[thefuck](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/thefuck)** — corrects previous console command. Aliased to `redo`. Quick run with `esc esc` 

### Custom (installed by setup.sh)

These are cloned into `~/.oh-my-zsh/custom/plugins/` by `setup.sh`.

- **[you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use)** — reminds you of existing aliases when you type the full command
- **[zsh-ai](https://github.com/matheusml/zsh-ai)** — AI-powered command suggestions (type `# your query` and press enter)
- **[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)** — fish-like autosuggestions as you type
- **[zsh-completions](https://github.com/zsh-users/zsh-completions)** — additional completion definitions
- **[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)** — syntax highlighting in the terminal (must be last in plugins list)
- **[zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode)** — vim keybindings for zsh

## Patches

Patches in `patches/` are applied automatically by `setup.sh`. 
One file per plugin, named `<plugin-name>.patch`.

- **[zsh-ai.patch](patches/zsh-ai.patch)** — defers API key validation to query time instead of plugin load time
## Theme — Slash

The custom theme at `themes/slash.zsh-theme` provides two prompt styles. Copy the one you want into your `.zshrc`:

- **Timestamp prompt** — Prepends `[HH:MM]` to the prompt, green on success, red on failure (e.g. `[07:11] ➜  ~`)
- **Hostname prompt** — Shows `➜ @hostname directory (git_branch)`, colored green/red based on last command status

## Roadmap

Install **[whai](https://github.com/gael-vanderlee/whai)**  or **[wut](https://github.com/shobrook/wut)** - Would be good for remote instances. Warp doesnt support tmux but will be good for my remotes.