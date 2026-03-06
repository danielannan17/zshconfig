# Oh My Zsh Custom Setup

## Setup

Run `setup.sh` to install custom plugins and apply patches.

```bash
./setup.sh
```

## Plugins

### Built-in (shipped with oh-my-zsh)

These don't need installing — just add them to `plugins=()` in `.zshrc`.

- **[git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)** — git aliases and functions
- **[z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)** — directory jumping based on frecency
- **[fzf](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf)** — fuzzy finder integration

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
