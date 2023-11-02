# Filetype-specific plugins

The `ftplugin/` directory functions similarly to how plugins are loaded from
the `plugin/` directory, except it is checked afterward. This allows one to
either override a global (plugin) behavior or have plugins that specifically
target certain file extensions.

### Usage

Simply create a file with the extension name as the prefix, followed by a .vim
extension.

Examples: `md.vim`, `txt.vim`, `exe.vim` (to trigger an hexadecimal mode on
a binary file and so on...)
