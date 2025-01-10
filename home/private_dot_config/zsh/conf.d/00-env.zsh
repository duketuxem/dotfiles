# =============================================================================
# Environment variables - in an interactive context
# =============================================================================

### System:
export EDITOR='vim'
export PAGER='less'
# R: raw-chars
# F: quit-on-EOF
# S: wrap-lines
# X: don't-clear-screen
# g: one-match-color-search
# j: center screen
export LESS='-RFSXg -j.5'

### Custom:
export DISTRO=$(awk -F= '/^ID=/ {gsub(/"/, "", $2); print $2}' /etc/os-release)
## Default apps
export BROWSER='firefox'
export PLAYER='mpv'
# export EXPLORER=''
# export TERMINAL=''

### Preferences
# Dark theme
export QT_STYLE_OVERRIDE='kvantum-dark'
