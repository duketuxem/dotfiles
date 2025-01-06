# ============================================================================
# Environment variables (in an interactive context)
# ============================================================================

## System:
export EDITOR='vim'
export PAGER='less'
# Raw-chars/quit-on-EOF/wrap-lines/don't-clear-screen/one-match-color-search
export LESS='-RFSXg'

### Custom:
export DISTRO="$(awk -F= '/^ID=/ {gsub(/"/, "", $2); print $2}' /etc/os-release)"
## Defaults
export BROWSER='firefox'
export PLAYER='mpv'
# export EXPLORER=''
# export TERMINAL=''
