
#3010: Parse: collect hangs on "keep not rule"
================================================================================
Issue is closed, was reported by guaracy and has 2 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/3010>

Version:
> about
Red for Linux version 0.6.3 built 29-Aug-2017/10:00:28-03:00

Code:
``` red
digit: charset "0123456798"
s: "123asd456qwe"
parse s [collect any[ keep digit | skip]] ;; ok
parse s [collect any[ keep not digit | skip]] ;; hang
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-03T10:18:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3010#issuecomment-326796184>

    It hangs because `not digit` is not advancing the input (`not` never advances the input), so it creates an infinite loop. You can fix your rule easily:
    ```
    parse s [collect any [not digit keep skip | skip]]
    ```
    Alternatively, you can also use a *complement* charset:
    ```
    not-digit: complement digit
    parse s [collect any [keep not-digit | skip]]
    ```

