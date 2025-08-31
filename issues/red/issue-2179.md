
#2179: Runtime crash on using word! that was set in parse to opt, any value.
================================================================================
Issue is closed, was reported by ifgem and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2179>

```
parse ["hello" "world"] ["hello" set test opt "world"]
test ;=> "world"

parse ["hello"] ["hello" set test opt "world"]
; and any:
parse ["hello"] ["hello" set test any "world"]
test ;=>
*** Runtime Error 1: access violation
*** at: 004253D3h
```

Expected behavior: return none.



Comments:
--------------------------------------------------------------------------------

On 2016-08-27T11:21:59Z, meijeru, commented:
<https://github.com/red/red/issues/2179#issuecomment-242911653>

    Note: the crash even occurs when `test` is set to a value before calling parse.

--------------------------------------------------------------------------------

On 2016-08-27T17:50:21Z, greggirwin, commented:
<https://github.com/red/red/issues/2179#issuecomment-242931042>

    ```
    red>> o: object [test: none parse ["hello"] ["hello" set test opt "world"]]
    == make object! [
        test: unset
    ]
    red>> o/test
    red>>
    ```

