<div align="center">
  <h1>Dotfiles</h1>
  <p>My personal config for all my favorite software, in one place.</p>
  <!-- Insert the ricing screenshot here -->
</div>

## Motivation

Every time I set up a new machine, obviously none of the tools and
configurations I need are available. Reinstalling the same software suite
repeatedly is frustrating, and managing the corresponding configurations is
even worse.

This repository addresses these issues by centralizing everything at one place,
and allows for a fast deployment and maintenance of the configuration, thanks
to [Chezmoi](https://www.chezmoi.io).

## Features

- Works on your favorite platform, with or without a GUI.
\
  Can be used on a headless server, within your favorite desktop environment,
  or shipped with [dwm](https://github.com/duketuxem/dwm).

- Documented config files and tool scope in the relevant directories.

- Comes with a default sensible home folder directories specification.
\
	Simply remove the empty directories under this `home/`'s folder before
	applying the procedure below.

### CLI Tools

Notable Command Line Interface tools to be used with these dotfiles:

- [bat:](https://github.com/sharkdp/bat) for nice file previews
- [fzf:](https://junegunn.github.io/fzf/) for super powers
- [The Silver Searcher (Ag):](https://github.com/ggreer/the_silver_searcher) for a faster `grep`
- [Syncthing](https://syncthing.net/) for a full background automated files synchronization
- `tree`: because tree is nice too!

#### Tmux as the terminal multiplexer

This is to be documented. TODO

- Prefix is bound to `<C-a>`

#### Vim as the text editor

This could be a whole page, but overall:

- Config from scratch, including:
	- Use of the native vim pack system
	- [X11] Simple Copy/Paste even without `+clipboard`
	- Sensible defaults, like `Y` for `y$`, buffer delete, and so on
	- Most Recent Used (Bro plugin)
	- Custom color theme inspired from tomorrow-night-eighties!
- Plugins to enhance the exeperience even more:
	- Vimwiki
	- Git integration (vim-fugitive / vim-gitgutter)
	- Linter support (ALE)
	- LSP Support (vim-lsp)
	- Autocomplete paths, LSP suggestion (Asyncomplete)
	- FZF integration
	- Lightline and popular themes out of the box (onedark, base16, material...)
	- Colorscheme discovery + a "devtool" for knowing syntax group (F12)

And much more to be discovered.

#### Zsh as the shell

- Vanilla config also from scratch:
	- Support for the [XDG Base Directory Specification](https://wiki.archlinux.org/title/XDG_Base_Directory) as much as possible
	- 100% homemade prompt with command return status, duration time, git
	- Custom bindings (see the README) TODO
	- Custom favzf plugin, [check this out](https://github.com/duketuxem/dotfiles/blob/9b75c2ce09e0e61f67ce7d19b1d6664c1321061f/home/private_dot_config/zsh/dot_zshrc#L542):
 - Light plugins support:
	 - zsh-syntax-highlighting: for a fish shell-like command prevalidation
	 - You-should-use: for alias usage hints

## GUI

- For now, good support for X11, but I am willing to try Hyperland.
- Cool fonts (Code New Roman Nerd Font, Noto, CJK Support)
- More to come

## Getting Started

Convinced? Great!

The installation process requires some manual preliminary checks and actions.

After that, the dotfiles can be automatically deployed onto the host, then some
final adjustments will be made.

### Prerequisites

1. Ensure you have an **up to date** system with **internet access**, and eventually
	reboot to take some changes into considerations.
2. Ensure `curl` and `git` are installed
3. Install `chezmoi`:

	`sh -c "$(curl -fsLS get.chezmoi.io) -b ~/.local/bin"`
4. Then update the `$PATH` variable for chezmoi to be found:

	`export PATH="$PATH:~/.local/bin"`

### Installation

1. Retrieve and access this repository locally:

  ```
  chezmoi init duketuxem
  chezmoi cd
  ```

2. Find your specific platform instructions under the [targets directory](./targets/README.md).

	**Then**, resume from here.

3. Deploy the dotfiles onto the host:

	`chezmoi apply`

4. Change the default shell:

	`chsh -s /bin/zsh`

5. Log off and then log back again to see everything loaded.

## Some post installation steps

Congratulations!

At this point, you already have a working configuration, and can start enjoy
it from your favorite terminal emulator, be the `linux` tty even!

However, if you would like to continue to install some tools, there are some
scripts that can be run: TODO

- Maybe rerun `run_once_after_chezmoi-apply.sh` for matching your git config.
- Desktop: TODO

### Hints

	- **Import your ssh key**


### Desktop installation

If like me, you would like some custom managed software to be installed,
you could use the `setup_desktop.sh` script.

Just review the default parameters on the top in case you don't have `sudo`
or alike installed.

Once you are sure about those settings, just run `./setup_desktop.sh`.



## FAQ

- **Why is this process not fully automated as on some other repos ?**

I deliberately chose to not have a full installation process despite having
started to write one, see the `trash/` folder for some legacy code and reasons
this has been discarded.


## License

This repository is licensed under the [GPL-3.0 license](LICENSE).
