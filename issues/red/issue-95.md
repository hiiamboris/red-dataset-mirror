
#95: #define redefinitions are silently ignored
================================================================================
Issue is closed, was reported by earl and has 4 comment(s).
[status.tested]
<https://github.com/red/red/issues/95>

For multiple `#define`s of the same name, the first definition is used and the subsequent re-defintions are silently ignored:

```
Red/System []
#define foo "a"
#define foo "b"
print foo
```

This results in `a` being printed.

I'd suggest to either use the last instead of the first definition, or to make re-defintion an error.



Comments:
--------------------------------------------------------------------------------

On 2011-06-14T11:33:59Z, earl, commented:
<https://github.com/red/red/issues/95#issuecomment-1365369>

    If we want for the last instead of the first definition to be used, I pushed a fix to that effect to my repo as earl@ff29a9509e02294b64001b07f2de940aaeed6a12 (in the `define` topic branch).

--------------------------------------------------------------------------------

On 2011-06-15T16:09:27Z, earl, commented:
<https://github.com/red/red/issues/95#issuecomment-1374778>

    Fixed in ffde0b7017af43451649.

