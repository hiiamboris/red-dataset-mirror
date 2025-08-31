
#524: FINDing shifted string! doesn't match UCS-2 string!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/524>

```
Red []

r: routine [
    s [string!]
    /local series p
][
    s/header: TYPE_STRING
    s/head: 0
    s/cache: null

    series: GET_BUFFER (s)
    p: as byte-ptr! series/offset
    p/1: #"B"
    p/2: null-byte
    series/flags: series/flags and flag-unit-mask or UCS-2
    series/tail: as cell! 2 + series/offset
]

s: make string! 4
r s
?? s
probe find s "B"
probe find s next "AB"
```

s: "B"
"B"
none

Is something wrong with my UCS-2 creation routine? It seems unlikely, as the unshifted case just works.



Comments:
--------------------------------------------------------------------------------

On 2013-09-03T02:48:19Z, PeterWAWood, commented:
<https://github.com/red/red/issues/524#issuecomment-23687128>

    It seems fine in the Red console (unless it is a recently introduced regression):
    
    ```
    red>> s: "B"
    == "B"
    red>> find s "B"
    == "B"
    red>> find s "b"
    == "B"
    red>> find s next "AB"
    == "B"
    red>> find s next "ab"
    == "B"
    ```

--------------------------------------------------------------------------------

On 2013-09-03T10:19:09Z, dockimbel, commented:
<https://github.com/red/red/issues/524#issuecomment-23702295>

    FIND on UCS-2 strings seems buggy indeed, as shown by this simple example:
    
    ```
    s: "^(1234)B"
    ?? s
    probe find s "B"
    probe find s next "AB"
    ```
    
    outputs:
    
    ```
    s: "^(1234)B"
    "B"
    none
    ```
    
    About your routine:
    - The first 3 lines (s/*:) shouldn't be needed
    - Currently, all strings need to end with a NUL character (^(0000) for UCS-2 and ^(00000000) for UCS-4) which can be handled using this internal function (to be added after your _series/tail_ update):
    
    ```
    string/add-terminal-NUL as byte-ptr! series/tail GET_UNIT(series)
    ```

--------------------------------------------------------------------------------

On 2013-09-03T17:28:43Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/524#issuecomment-23731066>

    Thanks. I suppose the first three lines aren't needed when I use
    
    `make string! 4`
    
    but that's just an example. What if the string has been used before and needs to be reset?

