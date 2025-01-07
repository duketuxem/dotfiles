# Trashed sections

### TL;DR

   ```sh
   echo 'ZDOTDIR="$HOME"/.config/zsh' | sudo tee /etc/zsh/zshenv
   ```

[4](4). **Set the Zsh configuration path**

    This step ensures that the configurations from this repository
    are correctly linked to the dotfiles to be deployed.

    * **System wide**:

        If there is no `/etc/zsh/zshenv` file:

        Create it with the following line: `ZDOTDIR="$HOME"/.config/zsh`.

    * **On a per-user basis**:

        A symbolic link would points to the actual path:

        ```sh
        cd # need to be in $HOME
        ln -s .config/zsh/.zshenv .zshenv
        ```

    You can check the related
    [Zsh README.md](./home/private_dot_config/zsh/README.md#zshenv)
    for more information on this step if you wish.
