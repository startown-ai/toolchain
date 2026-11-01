# Toolchain

This project containerizes some commonly used development tools on [Docker Hardened Images](https://docs.docker.com/dhi/).

## Images

- [startown/zsh](https://hub.docker.com/r/startown/zsh): [Zsh](https://www.zsh.org) with [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh), [Pure](https://github.com/sindresorhus/pure) prompt, [z](https://github.com/agkozak/zsh-z), [syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), and [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
- [startown/jj](https://hub.docker.com/r/startown/jj): [Jujutsu](https://github.com/jj-vcs/jj), a version control system.
- [startown/uv](https://hub.docker.com/r/startown/uv): [uv](https://github.com/astral-sh/uv), a Python package and project manager, with uvx.
- [startown/workspace-py](https://hub.docker.com/r/startown/workspace-py): a workspace for Python development with the tools above, Git, and Python 3.14.

## License

The Dockerfiles and configuration files in this repository are licensed under the [Apache License 2.0](LICENSE).

The images contain third-party software under its own licenses. No third-party code is modified.

| Component | License | License files in the image |
|---|---|---|
| Debian packages from the base image and `apt-get` | Various, per package | `/usr/share/doc/<package>/copyright`, `/usr/share/common-licenses/` |
| Zsh | MIT-Modern-Variant, with some GPL-2.0 completion functions | `/usr/share/doc/zsh/copyright` |
| Oh My Zsh | MIT | `/usr/share/oh-my-zsh/LICENSE.txt` |
| z, zsh-autosuggestions | MIT | `/usr/share/oh-my-zsh/plugins/<plugin>/LICENSE` |
| zsh-syntax-highlighting | BSD-3-Clause | `/usr/share/oh-my-zsh/plugins/zsh-syntax-highlighting/LICENSE` |
| Pure | MIT | `/usr/share/zsh/pure/license` |
| jj | Apache-2.0 | `/opt/jj/share/licenses/jj/` |
| uv, uvx | MIT OR Apache-2.0 | `/opt/uv/share/licenses/uv/` |
| Rust crates compiled into jj and uv | Various permissive licenses and MPL-2.0 | `THIRD-PARTY-LICENSES` in the jj and uv license folders |
| Git | GPL-2.0-only | `/usr/share/doc/git/copyright` |
| tree | GPL-2.0-or-later | `/usr/share/doc/tree/copyright` |
| btop | Apache-2.0 | `/usr/share/doc/btop/copyright` |
| OpenSSH client | SSH-OpenSSH | `/usr/share/doc/openssh-client/copyright` |
| Python | Python-2.0 | `/usr/local/share/licenses/python/` |
| Libraries bundled into Python | Various, including OpenSSL (Apache-2.0) and Berkeley DB (Sleepycat) | `/usr/local/share/licenses/python/` |

In workspace-py, the jj and uv license folders are under `/usr/local/share/licenses/`.
