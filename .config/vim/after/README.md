# The `after` directory

### Usage

> "Everything in the after directory will be loaded after everything else.

From there, you can override anything you want:
indentation, filetype plugins, or even the external plugins you’ve installed.

For example, I can override Lisp indentation by creating the file
`after/indent/lisp.vim` and setting whatever options or variables
I want to modify.
", [thevaluable.dev](https://thevaluable.dev/vim-runtime-guide-example/)


### Notes

The structure within the `after` directory is the same as the `runtimepath`,
meaning we can override anything after everything got loaded simply by creating
the necessary folder and file content (syntax, plugin, ...)

