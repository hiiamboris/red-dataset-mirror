
#92: Enigmatic error involving #include
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/92>

I compiled a file containing `Red/System [ ] #include %test.reds`
where `%test.reds` contains `Red/System [ ] f: func [ ][ ]`

The result was

```
*** Compilation Error: function definition requires a specification block
*** in file: %test.reds
*** at:  [func #script %source.reds [
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-11T15:15:38Z, dockimbel, commented:
<https://github.com/red/red/issues/92#issuecomment-1350036>

    Tested OK.

