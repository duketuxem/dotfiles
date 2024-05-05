# Rationale
Zsh is my preferred shell on most of my systems.
I choose not to use a framework since I prefer to maintain control and
independence, keeping features to a minimum.

# Settings
Below is a summary of the settings I have applied to suit my needs.

## XDG support
This is one of my most desired feature, to enforce the use of the
XDG Base Directory specification for applications, so my home folder
is kept clean of those unwanted dot files which can instead
remain under `~/.config`.

Unfortunately, there will still be some remaining
(due to applications using hardcoded path).

### Relevant Files
- `.zprofile` for managing environment variables.
- `aliasrc` for applications requiring command-line switches or functions.

## Prompt
[TODO: Insert a screenshot of the prompt here]
[TODO: Incorporate a Git plugin similar to Oh-My-ZSH]

## Miscellaneous
I aim to use color output wherever possible.

## References
[XDG Base Directory (Arch Linux)](
https://wiki.archlinux.org/title/XDG_Base_Directory)

