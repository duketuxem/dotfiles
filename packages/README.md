#

I wanted to maintain a clear distinction between the config/dots architecture
versus the dependencies of those while still being declarative.

I first came with some over complexified solution in which I wanted to
automate everything once this repository was first `git clone`d.

It is feasible, but there are reasons not to do so:
- First, it's not every day I switch a distro for another.
Even if it's a virtual machine, it is one command to type if
everything is already properly listed.
-

Handling a "profile" notion was way too hard in this approach.

The solution:


## Software list and goal for each
