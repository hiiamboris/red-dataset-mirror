
#419: Immediately casting string constant corrupts address
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/419>

```
Red/System []

p: as byte-ptr! "123"
print-line as-integer p/1
s: as struct! [a [integer!]] "123"
print-line s/a
```

0
0



Comments:
--------------------------------------------------------------------------------

On 2013-02-27T09:27:36Z, PeterWAWood, commented:
<https://github.com/red/red/issues/419#issuecomment-14164327>

    It appears to be the use of a string literal value rather than a string that the complier doesn't like :
    
    Code
    
    ``` rebol
    Red/System []
    
    str: "123"
    p: as byte-ptr! str
    print-line as-integer p/1
    either (as integer! str) = (as integer! p) [print ["ok" lf]] [print ["ko" lf]]
    
    s: as struct! [a [integer!]] str
    print-line s/a
    either (as integer! str) = (as integer! s) [print ["ok" lf]] [print ["ko" lf]]
    ```
    
    Result
    
    ```
    ...compilation time:     101 ms
    ...linking time:         6 ms
    ...output file size:     16384 bytes
    49
    ok
    3355185
    ok
    ```

