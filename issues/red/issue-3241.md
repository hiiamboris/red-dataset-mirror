
#3241: Modified key in a map type looses association with value
================================================================================
Issue is open, was reported by Oldes and has 8 comment(s).
[status.waiting]
<https://github.com/red/red/issues/3241>

```
>> m: make map! ["aa" [1 2]]
== #(
    "aa" [1 2]
)
>> append first words-of m "Z"
== "aaZ"
>> m
== #(
    "aaZ" [1 2]
)
>> m/("aaZ")
== none
```

### Expected behavior
`m/("aaZ")` should return `[1 2]`

### Actual behavior
`m/("aaZ")`  returns `none`

### Red version and build date, operating system with version.

0.6.3



Comments:
--------------------------------------------------------------------------------

On 2018-03-01T19:18:33Z, Oldes, commented:
<https://github.com/red/red/issues/3241#issuecomment-369699934>

    Also... at this moment, `copy` of map value does not copy keys, just values. Should not it copy also keys?
    ```
    >> m: make map! ["aa" [1 2]] n: copy/deep m
    == #(
        "aa" [1 2]
    )
    >> probe same? (first words-of m) (first words-of n)
    true
    == true
    >> probe same? (first values-of m) (first values-of n)
    false
    == false
    ```

--------------------------------------------------------------------------------

On 2018-03-01T19:56:34Z, rebolek, commented:
<https://github.com/red/red/issues/3241#issuecomment-369711603>

    Interesting.
    
    ```
    >> m: #("aa" [1 2] "aaZ" [3 4])
    == #(
        "aa" [1 2]
        "aaZ" [3 4]
    )
    >> append first words-of m "Z"
    == "aaZ"
    >> m
    == #(
        "aaZ" [1 2]
        "aaZ" [3 4]
    )
    >> m/("aaZ")
    == [3 4]
    ```

--------------------------------------------------------------------------------

On 2018-03-01T21:10:45Z, greggirwin, commented:
<https://github.com/red/red/issues/3241#issuecomment-369731931>

    ```
    >> m: make map! ["aa" [1 2]] n: copy/deep m
    == #(
        "aa" [1 2]
    )
    >> append first words-of m "Z"
    == "aaZ"
    >> m
    == #(
        "aaZ" [1 2]
    )
    >> n
    == #(
        "aaZ" [1 2]
    )
    ```
    However, things break if you mod keys that way. That is, the key is no longer associated with the value.
    ```
    >> m/("aaZ")
    == none
    >> select m "aaZ"
    == none
    ```

--------------------------------------------------------------------------------

On 2018-03-13T10:10:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3241#issuecomment-372613411>

    IIRC, we have discussed that in another ticket. We should make those series key immutable once we get `protect` support (with modules in 0.8.0).

