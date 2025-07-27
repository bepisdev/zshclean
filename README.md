# zshclean

**zshclean** is a Zsh plugin designed to help you keep your `$HOME` directory tidy by removing temporary files and common system clutter. It supports both macOS and Linux, safely deleting common cache, history, swap, and log files with a single command.

## Features

- Cleans up Zsh, Vim, Neovim, and system temp files in your home directory
- Supports both macOS and Linux (auto-detects OS)
- Handles both files and directories, with support for wildcards/globs
- Simple usage: just run `zshclean`

## Installation

You can use zshclean with popular Zsh plugin managers or by sourcing the plugin manually.

### Using [zplug](https://github.com/zplug/zplug)

Add this to your `.zshrc`:

```zsh
zplug "yourusername/zshclean"
```

### Using [Oh My Zsh](https://ohmyz.sh/)

Clone the repo into your custom plugins directory:

```sh
git clone https://github.com/yourusername/zshclean ~/.oh-my-zsh/custom/plugins/zshclean
```

Then add `zshclean` to your `plugins` array in `.zshrc`:

```zsh
plugins=(... zshclean)
```

### Using [antigen](https://github.com/zsh-users/antigen)

Add the following to your `.zshrc`:

```zsh
antigen bundle yourusername/zshclean
```

Then reload your shell or run:

```zsh
antigen apply
```

### Using [zinit](https://github.com/zdharma-continuum/zinit)

Add this to your `.zshrc`:

```zsh
zinit light yourusername/zshclean
```

## Usage

After installation, simply run:

```zsh
zshclean
```

This will delete common temporary files and directories from your `$HOME` directory according to your OS.

## Todo

- [x] Flags to inspect target files/directories
- [ ] Functions to configure and modify the target file lists
