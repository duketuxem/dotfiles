# ============================================================================
# Fish-like syntax pre-validation
# ============================================================================

# Fish-like syntax pre-validation (should be last)
# debian:
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null || \
	# gentoo:
	source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh 2>/dev/null || \
	# void:
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null || \
	echo "Plugin zsh-syntax-highlighting not found..."
