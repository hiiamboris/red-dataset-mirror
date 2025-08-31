
#2128: help should mention string argument form
================================================================================
Issue is closed, was reported by dander and has 12 comment(s).
[type.review] [status.contribution]
<https://github.com/red/red/issues/2128>

Using `help` with a string argument is a very useful tool for language discovery because it aids in finding related methods. It would be really worthwhile to add mention of it in the default help information.

perhaps

```
red>> help
Use HELP or ? to see built-in info:

    help insert
    ? insert

To see all functions containing a specific substring:

    ? "file"

To see all words of a specific datatype:

    ? native!
    ? function!
    ? datatype!

Other useful functions:

    ?? - display a variable and its value
    probe - print a value (molded)
    source func - show source code of func
    what - show a list of known functions
    about - display version number and build date
    q or quit - leave the Red console
```

I'm not sure if this is the best/correct terminology, but I think "file" is a nice example. I'd be happy to submit a PR if desired.



Comments:
--------------------------------------------------------------------------------

On 2016-07-20T07:18:20Z, pekr, commented:
<https://github.com/red/red/issues/2128#issuecomment-233863052>

    I am really glad, someone found the string form useful. But - I am against that. What I propose is - please, pretty pretty please, turn it into R2 functionality - no string needed, just type whatever you want and please find it as a substring, like a grep. Ppl will sort results out. Simply addition of - please use "file" will cure it only partially. It really affects my live console sessions significantly ...

--------------------------------------------------------------------------------

On 2016-07-20T08:29:36Z, dander, commented:
<https://github.com/red/red/issues/2128#issuecomment-233883842>

    not ever being a Rebol user, I was never aware of that functionality :)

--------------------------------------------------------------------------------

On 2016-07-20T16:45:30Z, greggirwin, commented:
<https://github.com/red/red/issues/2128#issuecomment-234008295>

    R2 only searches by name, while R3 also searches by doc string.

--------------------------------------------------------------------------------

On 2016-07-21T06:17:55Z, pekr, commented:
<https://github.com/red/red/issues/2128#issuecomment-234166533>

    I really want to be able to type just: help to- and get all related functions reported, without the need to type it as a: help "to-" .... most ppl will imo miss it, even if it would be mentioned in a docstring - it pushes you to use a special form. You normally search for: help insert, and not: help "insert" too ....
    
    This ticket is imo a proof, that R2 like functionality (not dismissing the search of docstrings), an usage without the quotes, would be welcomed ...

--------------------------------------------------------------------------------

On 2017-06-03T22:32:26Z, greggirwin, commented:
<https://github.com/red/red/issues/2128#issuecomment-306005332>

    @dander and @pekr, can we close this ticket with the latest help that's in place? 

--------------------------------------------------------------------------------

On 2017-06-18T15:24:36Z, geekyi, commented:
<https://github.com/red/red/issues/2128#issuecomment-309284058>

    Nice. Now both `? file` and `? "file"` works, giving different output.
    I think this can be closed, because @pekr's wish of `? to-` also works (`? "to-"` incidentally, gives the same output in this case)
    
    Thanks so much Gregg, Oldes and anyone else I forgot to mention!
    
    To further clarify, now:
     - `help "file"` is the same as `what/with/spec "file"`
     - `help file` is the same as `what/with "file"`

