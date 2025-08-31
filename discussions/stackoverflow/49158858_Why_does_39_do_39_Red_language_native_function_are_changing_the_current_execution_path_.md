# Why does &#39;do&#39; (Red language native function) are changing the current execution path?

**Link:**
<https://stackoverflow.com/questions/49158858/why-does-do-red-language-native-function-are-changing-the-current-execution>

**Asked:** 2018-03-07 18:24:16 UTC

------------------------------------------------------------------------

**Introduction**

Let\'s assume that we have a project with structure like that:

    project/
    ├── a.red
    │
    └───modules/
        ├── b.red
        └── c.red

Source code:

    ; -------- a.red --------
    Red [ File: %a.red ]

    b: do %modules/b.red
    print b

    c: do %modules/c.red
    print c

    ; -------- modules/b.red --------
    Red [ File: %b.red ]

    return "B module loaded"

    ; -------- modules/c.red --------
    Red [ File: %c.red ]

    return "C module loaded"

What I am trying to do is:

-   load files `modules/b.red` and `modules/c.red` into file `a.red`
-   print loaded and evaluated content

I am using
\"**[do](http://www.red-by-example.org/#do){rel="nofollow noreferrer"}**\"
and
\"**[do-file](http://www.red-by-example.org/#do-file){rel="nofollow noreferrer"}**\"
functions from Red, but unexpectedly they change the current execution
path after loading the first file from the `modules` subdirectory.

    >> do %a.red
    B module loaded
    *** Access Error: cannot open: %modules/c.red
    *** Where: read
    *** Stack: do-file context do-file  

As you can see `modules/b.red` file was successfully loaded, but
`modules/c.red` not.

------------------------------------------------------------------------

**Attempts**

Take a look at interesting output from the
\"**[pwd](http://www.red-by-example.org/#pwd){rel="nofollow noreferrer"}**\"
function, which displays the current path. After evaluating
`modules/b.red` the path was changed, so I also changed
`do %modules/c.red` to `do %c.red` to make it work.

    ; -------- a.red (modified) --------
    Red [ File: %a.red ]

    print pwd
    b: do %modules/b.red
    print b

    print pwd
    c: do %c.red
    print c

Execution:

    >> do %a.red
    %/home/mateusz/Red/project/
    B module loaded
    %/home/mateusz/Red/project/modules/
    C module loaded

The same situation I noticed with equivalent
\"**[do-file](http://www.red-by-example.org/#do-file){rel="nofollow noreferrer"}**\"
Red function.

I was using Red version: **0.6.3**.

------------------------------------------------------------------------

**Questions**

Does somebody know why the
\"**[do](http://www.red-by-example.org/#do){rel="nofollow noreferrer"}**\"
function are changing the current execution path?

Maybe it is some issue or convention taken from Rebol ?

Any alternative solutions (if they does exists) will also be helpful.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Peter W A Wood

The issue you are facing is that you are calling `return` at the end of
your scripts in the module/ directory. This is circumventing the end of
script processing so the current working directory is not getting re-set
at the end of the script.

`return` is only designed to be called from within a function.

*Comment by Mateusz Palichleb:* Yes, exactly the `return` was the cause.
I looked inside the **do-file** function implementation in Red source
code, and that `return` affect exit before re-setting path to the the
initial folder. Thank you!

*Comment by Gregg Irwin:* Note also that an issue has been opened for
this, so it can be investigated further, and potentially change this
behavior.

------------------------------------------------------------------------

## Comments on question

*Comment by Mateusz Palichleb:* I have not looked into Red\'s source
code before, so according to your suggestion I checked it and finally I
found the answer. Thanks to you, I discovered a new way of looking for
answers - directly in the source code of Red ;)
