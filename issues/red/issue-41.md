
#41: aliased type not accepted in struct, crashes compiler
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.tested]
<https://github.com/red/red/issues/41>

According to the specification (4.5.5) one can use an alias name in a struct:

> &lt;variable&gt;: struct &lt;alias&gt;
> &lt;variable&gt;  : a struct variable
> &lt;alias&gt;     : a previously declared alias name

I compiled the following program:

```
str!: struct! [i [integer!]]
s: struct str!
```

with the following result:

```
** Script Error: parse expected input argument of type: series
** Where: comp-struct
** Near: unless parse pos: pc/2 struct-syntax
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-21T10:51:24Z, meijeru, commented:
<https://github.com/red/red/issues/41#issuecomment-1214123>

    see also issue #43

--------------------------------------------------------------------------------

On 2011-05-21T15:19:57Z, dockimbel, commented:
<https://github.com/red/red/issues/41#issuecomment-1214669>

    Your example code is missing the `alias` keyword, it should be:
    `str!: alias struct! [i [integer!]]
    s: struct str!`
    
    Anyway, the compiler should at least report a syntax error, so it needs a fix.

--------------------------------------------------------------------------------

On 2011-05-21T16:52:59Z, dockimbel, commented:
<https://github.com/red/red/issues/41#issuecomment-1214909>

    Tested OK (using the correct syntax I provided above).

