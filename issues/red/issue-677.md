
#677: UTF-8 cache of strings contains closing " or } (one character too many)
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/677>

Given a Red value of type string!, one can easily print out the UTF-8 cache by calling the following routine:

```
prin-utf8: routine [
    c [value!]  ; converted to red-value!
    /local s
][
    s: as byte-ptr! c/data3 ; third word of payload is ptr to utf-8 cachee
    while [s/1 <> null-byte] [
        prin " " prin-hex-chars as integer! s/1 2
        s: s + 1
    ]
]
```

prin-utf8 "abc" gives 61 62 63 22 and prin-utf8 {abc} gives 61 62 63 7D

prin-utf8 %abc gives 61 62 63 as it should



Comments:
--------------------------------------------------------------------------------

On 2014-02-08T12:09:48Z, dockimbel, commented:
<https://github.com/red/red/issues/677#issuecomment-34542360>

    I cannot reproduce that behavior using the last version from master branch, using the following compiled program:
    
    ```
    Red []
    
    prin-utf8: routine [
        c [value!]  ; converted to red-value!
        /local s
    ][
        s: as byte-ptr! c/data3 ; third word of payload is ptr to utf-8 cachee
        while [s/1 <> null-byte] [
            prin " " prin-hex-chars as integer! s/1 2
            s: s + 1
        ]
    ]
    
    prin-utf8 "abc"
    print ""
    prin-utf8 {abc}
    print ""
    prin-utf8 %abc
    ```
    
    gives me the following output:
    
    ```
     61 62 63
     61 62 63
     61 62 63
    ```

--------------------------------------------------------------------------------

On 2014-02-12T12:18:04Z, dockimbel, commented:
<https://github.com/red/red/issues/677#issuecomment-34863309>

    If I compile the above routine and run the printing tests from console, I get a wrong output (but different from yours):
    
    ```
    red>> prin-utf8 "abc"
     61 62 63 22 0A 0A== "abc"
    red>> prin-utf8 {abc}
     61 62 63 7D 0A 0A== "abc"
    red>> prin-utf8 %abc
     61 62 63 0A 0A== %abc
    ```
    
    This is a side-effect of how the runtime lexer processes UTF-8 input string cache values. It currently avoids making a copy of the input stream for the cached part, so the ending NUL character is then missing.
    
    Given that the current runtime lexer will be soon rewritten and replaced by a fully Unicode-aware version and that the UTF-8 is still an experimental feature I am not sure we will keep for the 1.0, I will not make any changes in the current codebase wrt this issue.

