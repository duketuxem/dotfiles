<div align="center">
  <h1>Dotfiles</h1>
  <p>My personal config for all my favorite software, in one place.</p>
  <!-- Insert the ricing screenshot here -->
</div>


## Table of Contents

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

 - The "desktop" profile extends the core setup, adding everything required
 for a graphical user interface (GUI) environment.

### Chezmoi

The configuration in itself is managed thanks to
[Chezmoi](https://www.chezmoi.io).

As opposed to the packages, it is bundled into an indivisible set of files
in the `home` directory.


### Packages table

Dotfiles would not be useful without the associated software installed.

Here is a summary of what is in use and what would be installed.

| Software | Description |
| -- | --|
| TO | DO |


## Getting Started

The installation process requires some manual preliminary checks.

After that, the dotfiles can be deployed onto the host, then some final adjustments will be made.

### Prerequisites

- Ensure you have an **up to date** system with **internet access**
- Ensure `curl` and `git` are installed
- Install `chezmoi`:

  `sh -c "$(curl -fsLS get.chezmoi.io) -b ~/.local/bin"`
- Update the `$PATH` variable for chezmoi to be found:

  `export PATH="$PATH:~/.local/bin"`


### Installation

- Retrieve this repository locally:

  `chezmoi init duketuxem`
- 

### TL;DR


   ```sh
   chezmoi init duketuxem
   chezmoi cd
   # Packages install
   chezmoi apply
   chsh # /bin/zsh
   # Logout and log back
   # Post install steps
   # Install desktop or not
   ```


### Core install

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

4. **Deploy the configuration onto the host**

    The system is now prepared to apply all the configurations from this
    repository. Run the following command to deploy the dotfiles onto the host:

   `chezmoi apply`

5. **Change the default shell to Zsh**

   Finally, enable Zsh to be the user's default shell,
   so everything will be loaded upon login.

   `chsh`, then type `/bin/zsh`.

6. **That's it**

   Log off and then log back again to see everything loaded.

### Some post installation steps

   Here are a few pointers about things we always forget to do/set.

   - **Import your ssh key**

   - **Set some git parameters**

      The `dotfiles` git repository was not configured, you might want to run:

      ```sh
      chezmoi cd

      # use ssh for this repository
      git remote set-url origin git@github.com:USERNAME/dotfiles.git

      # identity setup (global or not depending on your needs)
      git config --global user.name "YOUR NAME"
      git config --global user.email "YOUR EMAIL"
      ```


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


## Additional Notes

- Feel free to modify configurations as per your personal needs.
- Contributions are welcome!
Open an issue or PR if you’d like to improve or customize anything.


## License

This repository is licensed under the [GPL-3.0 license](LICENSE).
