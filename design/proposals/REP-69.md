
#69: WISH: currency-of reflector for money! values
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/REP/issues/69>

Operations on `money!` values need to be able to take account of the currency feature. Therefore one needs a reflector, call it `currency-of`. When the currency is indicated on the value, this will yield a `word!` value, else `none`.
```
currency-of USD$1.07 => USD
currency-of $0.00 => none
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-22T21:36:35Z, meijeru, commented:
<https://github.com/red/REP/issues/69#issuecomment-602277187>

    In the light of the continuing discussion on #68, an alternative for my wish would be an _accessor_, call it `/currency`, thus
    ```
    a: USD$1.07
    a/currency => USD
    ```

--------------------------------------------------------------------------------

On 2020-05-02T19:38:16Z, 9214, commented:
<https://github.com/red/REP/issues/69#issuecomment-623003469>

    Can be closed.

