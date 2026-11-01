# Toolchain

This project containerizes some commonly used development tools on [Docker Hardened Images](https://docs.docker.com/dhi/).

## Images

- [startown/zsh](https://hub.docker.com/r/startown/zsh): [Zsh](https://www.zsh.org) with [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh), [Pure](https://github.com/sindresorhus/pure) prompt, [z](https://github.com/agkozak/zsh-z), [syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), and [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
- [startown/jj](https://hub.docker.com/r/startown/jj): [Jujutsu](https://github.com/jj-vcs/jj), a version control system.
- [startown/uv](https://hub.docker.com/r/startown/uv): [uv](https://github.com/astral-sh/uv), a Python package and project manager, with uvx.
- [startown/workspace-py](https://hub.docker.com/r/startown/workspace-py): a workspace for Python development with the tools above, Git, and Python 3.14.
