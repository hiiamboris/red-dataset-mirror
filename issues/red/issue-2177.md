
#2177: Function `new-line?` always returns `true`
================================================================================
Issue is closed, was reported by rgchris and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2177>

``` rebol
probe new-line? [
    foo
]

probe new-line? [foo]
```

Results in:

```
true
true
```

Expected:

```
true
false
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-19T00:09:07Z, rgchris, commented:
<https://github.com/red/red/issues/2177#issuecomment-240893823>

    Was reviewing Red behaviour compared to Rebol per: http://stackoverflow.com/a/28082933/292969

--------------------------------------------------------------------------------

On 2016-08-21T18:39:34Z, greggirwin, commented:
<https://github.com/red/red/issues/2177#issuecomment-241273915>

    An empty block always returns false, even if it has new-line markers in it. Or, rather, they are removed if the block is empty.
    
    ```
    red>> b: [
    [    
    [    
    [    ]
    == []
    red>> new-line?  b
    == false
    red>> b
    == []
    ```

