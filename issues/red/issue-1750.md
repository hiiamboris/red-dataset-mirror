
#1750: binary! error messages
================================================================================
Issue is closed, was reported by nedzadarek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1750>

I'm using red 0.6 on windows.
Messages are unclear.
Using unsupported characters (`F` in base 2):

```
2#{FF}
; *** Script error: get does not allow string! for its word argument
; *** Where: get
```

Not enough characters (2 instead of 8 - can it be auto inserted?):

```
2#{01}
; *** Script error: get does not allow string! for its word argument
; *** Where: get
```

No error. I don't know too much about 64 bit encoding so I'm not sure about it. Should here be some warning.

```
64#{AA}
; == #{}
```

Explicitly using `16#` raises an error:

```
16#{FF}
; *** Syntax error: invalid integer! at {"16#{FF}"}
; *** Where: do
```

Unsupported encodings:

```
4#{0}
; *** Script error: get does not allow string! for its word argument
; *** Where: get
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-29T14:05:29Z, dockimbel, commented:
<https://github.com/red/red/issues/1750#issuecomment-202909121>

    Good catch thanks! Those binary formats are lacking unit tests.

