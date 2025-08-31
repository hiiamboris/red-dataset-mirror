
#4798: On-deep-change* with wrong signature
================================================================================
Issue is closed, was reported by zwortex and has 4 comment(s).
<https://github.com/red/red/issues/4798>

When on-deep-change* is defined with a wrong signature, there is no warning triggered.

```
;; No warning when too little arguments (i.e. misuse on-change* signature)
obj: make object! [
    a: "Obj"
    s: copy []
   on-deep-change*: function [word old new][
        print ["Hello:"]
        print "Word" probe word ; word is owner
   ]
]
append obj/s 1

;; No warning either when too many arguments ...
obj: make object! [
    a: "Obj"
    s: copy []
    on-deep-change*: function [owner word target action new index part one-too-many][
        print ["Hello:"]
        print "Owner" probe owner
        print "Word" probe word
        print "Part" probe part
        print "One too many" probe one-too-many
   ]
]
append obj/s 1
```


Comments:
--------------------------------------------------------------------------------

On 2021-01-14T17:25:23Z, greggirwin, commented:
<https://github.com/red/red/issues/4798#issuecomment-760342936>

    It's not just on-deep-change, which is a function like any other. Red's free ranging evaluation is a deep and fundamental part of the language's design. And while you might want to enforce strict naming of args to avoid issues like this, Red's approach to naming args means that you also have the flexibility to use names you want, because they may be clearer in different cases where functions may be substituted or used as arguments.
    
    So what do we do? This is where tooling, linters, etc. can be used. Those can be targeted to check for specific cases without affecting Red in general. Bring it up on Gitter, in red/red, and let's see what others suggest.

--------------------------------------------------------------------------------

On 2021-01-14T17:47:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/4798#issuecomment-760355713>

    @greggirwin  One reason I disagree is that type-checking for `on-change*` and `on-deep-change*` exists:
    ```
    >> object [on-change*: none]
    *** Script Error: cannot set on-change* field to none! datatype
    *** Where: make
    *** Stack: object  
    ```
    So it can be extended with spec checks just as well.
    
    Another reason is that these functions already produce [quite a lot of weird bugs](https://github.com/red/red/issues?q=is%3Aissue+is%3Aopen+on-deep-change) so strictness should be a positive factor in this case.

