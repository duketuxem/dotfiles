# -----------------------------------------------------------------------------
# Global options
# -----------------------------------------------------------------------------

# Propose completion of dotfiles
setopt GLOBDOTS


# -----------------------------------------------------------------------------
# Completion init
# -----------------------------------------------------------------------------

### Explicitely load the complist module (for menu-select)
# Need to be called before compinit is initialized
zmodload zsh/complist
# Required variable to be set to the value of $LS_COLORS
ZLS_COLORS="${LS_COLORS}"
# Since we're here, just set up ahead
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

### Make sure the caching directory is not the zsh config folder and use it
[[ ! -d "$XDG_CACHE_HOME/zsh" ]] && mkdir -p "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' use-cache on

### Load the completion module
# Mark compinit as a zsh builtin function (otherwise looked as an executable)
autoload -Uz compinit
# Run the compinit function and respect the XDG_* dirs spec
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"


# -----------------------------------------------------------------------------
# Completion settings
# -----------------------------------------------------------------------------

### Completer control functions - ZSHCOMPSYS(1)
# _expand_alias:
# Need to be before _complete
#
# _complete:
# Trigger the actual completion system
#
# _extensions:
# Typing '*.' then tab will list all the current file types in the directory
#
# _approximate:
# Correct 'tyest' to 'test' using tab for a directory to change to, for example
zstyle ':completion:*' completer 			\
					_expand_alias	\
					_complete 	\
					_extensions 	\
					_approximate


### Menu
# Use list for any completion
zstyle ':completion:*' menu select
# Sort list by size then modification time
zstyle ':completion:*' file-sort size change #reverse
zstyle ':completion:*' group-name ''	# Split aliases/cmds/..  by section
# Sections
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
# Group by (not sure that it works)
# zstyle ':completion:*:*:-command-:*:*' group-order 			\
# 							aliases 	\
# 							builtins 	\
# 							functions 	\
# 							commands
# ls -l output format in any case (no trigger on numeric threshold)
# -> Does not keep the colors unfortunately... TODO: Search a replacement ?
# zstyle ':completion:*' file-list all

### Misc
# Show all the possibilities for a: 'cd -'
zstyle ':completion:*' complete-options true
# Supposed to show command option descriptions ?
zstyle ':completion:*' verbose yes


# reference:
# zstyle :completion:<function>:<completer>:<command>:<argument>:<tag>
