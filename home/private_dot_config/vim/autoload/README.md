# The `autoload` directory

### Usage

> "Autoload lets you delay loading code until it's actually needed.
You'll take a slight performance hit overall, but if your users don't always
use every single bit of code in your plugin, autoloading can be a huge speedup.
", [Learn vimscript the hard way](https://learnvimscriptthehardway.stevelosh.com/chapters/53.html)


### Examples

This folder may contain a plugin manager like vim-plug,
and it should be loaded only when explicitely called from the vimrc file.
To my understanding it is a lazy-loading like feature.
