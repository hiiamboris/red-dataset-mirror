
#1866: return inside parse rule crash REPL, should return error instead
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1866>

``` rebol
  parse "abc" [(return 1)]

*** Runtime Error 1: access violation
*** at: 00028F98h
```

while:

``` rebol
parse "abc" [(break/return 1)]
*** Throw error: no loop to break
*** Where: break
```

this returns an error but quit the REPL



