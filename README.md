# Dotfiles

My personal dotfiles for Unix-like systems, managed with **GNU Stow**.  
Each top-level directory in this repo represents a *package* (e.g., `nvim`, `zsh`, `git`, `ghostty`) that can be symlinked into `$HOME`.

## 🧱 Structure

```
dotfiles/
nvim/        → ~/.config/nvim
zsh/         → ~/.zshrc
ghostty/     → ~/.config/ghostty
git/         → ~/.gitconfig
tmux/        → ~/.tmux.conf
````

Inside each folder, the directory structure mirrors exactly where it should appear in `$HOME`.

## 📦 Installation (using GNU Stow)

Clone the repo:

```
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Install the packages you want:

```
stow nvim
stow zsh
stow git
stow ghostty
```

Or install everything:

```
stow */
```

This creates symlinks in `$HOME` pointing back to the files in this repo.

## 🔁 Updating

Edit files normally (either in `~/dotfiles/...` or through `$HOME`).
Because everything is symlinked, both paths point to the same place.

Commit and push changes:

```
cd ~/dotfiles
git add .
git commit -m "Update configs"
git push
```

On another machine:

```
cd ~/dotfiles
git pull
stow */
```

## 🧩 Host-specific configuration

Machine-specific overrides live in `*.local` files and are ignored by Git.
Examples:

* `~/.zshrc.local`
* `~/.config/nvim/local/<hostname>.lua`

This keeps secrets and machine-specific paths out of version control.

## 🛠 Requirements

* GNU Stow
* Git
* A Unix-like system (Linux or macOS)

