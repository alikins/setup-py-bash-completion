Bash completion for setup.py


Usage
----

`setup <tab>` will show you possible setup.py
command to run.

`setup --<tab>` will complete any optional
args.

At the moment, only optional args and commands
are completed. 

Also, the 'setup' script needs to be
in the PATH or a 'setup' alias needs
to exist. 

Installation
-----------

Make sure a "setup" command or alias exists that
runs "python setup.py". A bash alias for
example:

```
    alias setup="python setup.py"
```

Or install the "setup" script into your
path. Note that you are likely to have
something already called "setup"

Once that's done, invoking "setup"
should run the setup.py if it's
in the current dir.


Adding bash completion
----------------------

```
    source ./setup-completion.sh
```

You probably want to install that
to wherever other bash completion modules
are (typically /etc/bash_completion.d)


Performance
----------

It's not particularly fast. But then neither
is 'python setup.py --help-commands', which
is 99% of the work. 

