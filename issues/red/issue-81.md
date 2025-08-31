
#81: The pseudo-type function! [...], when used in struct!, gives unhelpful error message
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/81>

See the following output:

```
s: struct [f [function! [i [integer!]]]]

** User Error: store-global unexpected type!
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-08T19:07:48Z, dockimbel, commented:
<https://github.com/red/red/issues/81#issuecomment-1329057>

    This is an internal error message (should not happen). This issue is a direct consequence of issue #80.

--------------------------------------------------------------------------------

On 2011-06-08T20:19:01Z, dockimbel, commented:
<https://github.com/red/red/issues/81#issuecomment-1329555>

    This case now gives an `invalid struct syntax` compilation error.
    
    Tested OK.

