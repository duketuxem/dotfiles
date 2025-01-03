<div align="center">
  <h1>Dotfiles</h1>
  <p>My personal config for all my favorite software, in one place.</p>
  <!-- Insert the ricing screenshot here -->
</div>

---

### Table of Contents

- [Introduction](#introduction)


## Introduction

Every time I set up a new machine, none of the tools and
configurations I need are available. Reinstalling the same software suite
repeatedly is frustrating, and managing the corresponding configurations is
even worse.

This repository addresses these issues by centralizing everything at one place.

This can be seen as a package that provides a fully customized
desktop environment experience—not in the exact sense of KDE or GNOME,
but in a similar spirit.

All dependencies, in the form of software packages, are organized into two
conceptual layers, referred to as "profiles" in the following sections.
These profiles are defined as follows:

 - The "core" profile provides a minimal setup tailored for
 a command-line interface (CLI) workflow.

 - The "desktop" profile extends the core setup, adding everything required for a graphical user interface (GUI) environment.

### Chezmoi

The configuration is managed thanks to [Chezmoi](https://www.chezmoi.io)
and is bundled into an indivisible set of files in the `home` directory.


### Packages table

Dotfiles would not be useful without the associated software installed.

Here is a summary of what is in use and what would be installed.

| Software | Description |
| -- | --|
| TO | DO |


## Installation


### Requirements

- (Virtual) machine with internet access
- Any *NIX-based **up to date** system (Linux, macOS, BSD, ...)
- `chezmoi` and `git` installed

### Steps

1. **Clone this repository with Chezmoi**

   `chezmoi init duketuxem`

2. **Navigate to the initialized repository**

   `chezmoi cd`

3. **Install the relevant packages**

   a. Refer to the [packages/README.md](./packages/README.md#installation)
   for platform-specific instructions on installing the "core"
   profile packages.

   b. Optionally, repeat the process for the "desktop" profile
   to set up a GUI environment.

4. **Set the Zsh configuration path**

    This step ensures that the configurations from this repository
    are correctly linked to the dotfiles to be deployed.

    * **System wide**:

        If there is no `/etc/zsh/zshenv` file:

        Create it with the following line: `ZDOTDIR="$HOME"/.config/zsh`.

        `echo 'ZDOTDIR="$HOME"/.config/zsh' | sudo tee /etc/zsh/zshenv`

    * **On a per-user basis**:

        A symbolic link would points to the actual path:

        ```sh
        cd # need to be in $HOME
        ln -s .config/zsh/zshenv .zshenv
        ```

    You can check the related
    [Zsh README.md](./home/private_dot_config/zsh/README.md#zshenv)
    for more information on this step if you wish.

5. **Deploy the configuration onto the host**

    The system is now prepared to apply all the configurations from this
    repository. Run the following command to deploy the dotfiles onto the host:

   `chezmoi apply`

6. **Change the default shell to Zsh**

   Finally, enable Zsh to be the user's default shell, so everything will be loaded upon login.

   `chsh`, then type `/bin/zsh`.

7. **Log off and then log back again**

   All set!


### Additional Notes

- Feel free to modify configurations as per your personal needs.
- Contributions are welcome! Open an issue or PR if you’d like to improve or customize anything.


## License

This repository is licensed under the [GPL-3.0 license](LICENSE).
