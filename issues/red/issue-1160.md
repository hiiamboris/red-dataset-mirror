
#1160: Word not defined in a block! when compiling
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1160>

```
Red[] 

abc: 2
print [ABC]
```

will get this error:

```
*** Script error: ABC has no value
*** Where: print
*** Stack: print
```



Comments:
--------------------------------------------------------------------------------

On 2015-05-12T15:50:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1160#issuecomment-101328413>

    Regression caused by Redbin decoder.

