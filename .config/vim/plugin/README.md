# The `plugin` directory

### Usage

> "Vim's functionality can be extended by adding plugins.  A plugin is nothing
more than a Vim script file that is loaded automatically when Vim starts.  You
can add a plugin very easily by dropping it in your plugin directory.
" [:h plugin]()

### In my case

I see this folder like an old fashioned way of extending vim's functionnality.

My plugin manager handles everything, using `.vim_plug` to cache the plugins
repositories, it is way more convenient than just throwing some pieces
of vim scripts one by one into that folder...

It could be used to test a script in an "isolated" loading point though.

