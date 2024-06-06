<div align="center">
    <h1>Dotfiles</h1>
    <p>My personnal config for all my favorite softwares, at one location.</p>
    <!-- Insert the ricing screenshot -->
</div>


## Table of contents

+ [Introduction](#introduction)
+ [Requirements](#requirements)

## Introduction

Every time I come to use a new set up (virtual) machine, obvioulsy nothing I
want is there... Having to reinstall the same software suite repeatedly is
frustrating, and managing the corresponding configuration for those
applications is even worse.

This repository solves those issues at keeping my configuration and the related
software suite at a central place.


## Requirements

- Any Linux (still a WIP for maximum compatibility) or Windows (coming soon)
- Internet access in the box
- /!\ An updated system (followed by a reboot just in case) /!\
- Installed [Chezmoi](https://www.chezmoi.io/) & `git`

### On Linux

First, let's install the missing packages:

1. `chezmoi init duketuxem`
2. `chezmoi cd`
3. `./install-packages.sh`
4. Choose core or desktop (core is for headless/tty, desktop for graphical use)
5. The relevant packages should be installed!
6. You can `exit` the shell since it was spawned by chezmoi

Finally, let's deploy all the config on the target:

1. `chezmoi apply`

### On Windows

This is to be done.


