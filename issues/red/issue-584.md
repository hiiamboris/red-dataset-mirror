
#584: [ char is not escaped inside string input in console
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/584>

```
red>> {ab[c}
[
```



Comments:
--------------------------------------------------------------------------------

On 2013-12-01T12:17:29Z, dockimbel, commented:
<https://github.com/red/red/issues/584#issuecomment-29572596>

    While testing that I have found another runtime lexer error:
    
    ```
    red>> {abc^}}
    == "abc="
    ```

