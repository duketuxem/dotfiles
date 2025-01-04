# ============================================================================
# Environment variables (in an interactive context)
# ============================================================================

## Default applications (system)
export EDITOR='vim'
export PAGER='less'
# Raw-chars/quit-on-EOF/wrap-lines/don't-clear-screen/one-match-color-search
export LESS='-RFSXg'

## Personnal
export BROWSER='firefox'
export PLAYER='mpv'
export DISTRO="$(awk -F= '/^ID=/ {gsub(/"/, "", $2); print $2}' /etc/os-release)"
