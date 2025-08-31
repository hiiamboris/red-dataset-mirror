
#43: alias with self-referencing structs is broken
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.tested]
<https://github.com/red/red/issues/43>

The line

```
str!: alias struct! [i [integer!] s [str!]]
```

does not compile

```
*** Compilation Error: invalid struct syntax: [str!]
```

A simple inversion of the lines

```
unless parse pos: pc/3 struct-syntax [throw-error ["invalid struct syntax:" mold pos]
repend aliased-types [to word! pc/-1 reduce [pc/2 pc/3]]
```

will solve the problem, I think (the parse needs the alias word to be defined!)



Comments:
--------------------------------------------------------------------------------

On 2011-05-21T16:53:21Z, dockimbel, commented:
<https://github.com/red/red/issues/43#issuecomment-1214913>

    Tested OK.

--------------------------------------------------------------------------------

On 2011-06-03T20:35:47Z, meijeru, commented:
<https://github.com/red/red/issues/43#issuecomment-1299268>

    The error is still there.

--------------------------------------------------------------------------------

On 2011-06-03T20:39:35Z, dockimbel, commented:
<https://github.com/red/red/issues/43#issuecomment-1299287>

    Confirmed, new issue has been opened: #72

