
#1129: Console: Crash on file! path TAB key completion
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1129>

Pressing the `TAB` key after a path containing a slash, cause a stack overflow:

``` rebol
red>> %/(tab)
*** Error: arguments stack overflow!
```

Pasting code from clipboard containing comment will crash as well:

``` rebol
red>> %/path(tab);path to file
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-28T06:35:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1129#issuecomment-96945841>

    We will disable TAB-completion on files until we get I/O done.

