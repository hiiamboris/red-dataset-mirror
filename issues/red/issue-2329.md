
#2329: make/to integer! <issue> does some hex conversion in stead of erroring
================================================================================
Issue is open, was reported by meijeru and has 8 comment(s).
[status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/2329>

This is perhaps a good idea, but it is not in the tables. For the reverse operation, we have `to-hex` already.


Comments:
--------------------------------------------------------------------------------

On 2016-11-18T17:06:48Z, dockimbel, commented:
<https://github.com/red/red/issues/2329#issuecomment-261585352>

    Using issues to represent integers in hex format is a bad fit, especially in Red/R3, as issues are word-like datatypes. We plan to introduce a new way to handle hexadecimals (not using issues), and the `to-hex` function would probably be kept, but would not output an `issue!` anymore. So I think we should not support `to integer! issue!` as it would not be future-proof.

--------------------------------------------------------------------------------

On 2016-11-19T14:22:19Z, meijeru, commented:
<https://github.com/red/red/issues/2329#issuecomment-261716626>

    I see. BTW: If issues are word-like, how come that `#0A` is allowed? I agree that is a bad idea in any case. See:
    
    ```
    red>> to word! #0A
    == 0A
    red>> type? to word! #0A
    == word!
    red>> type? 0A
    *** Syntax Error: invalid integer! at "0A"
    *** Where: do
    ```

--------------------------------------------------------------------------------

On 2017-07-28T15:04:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2329#issuecomment-318676852>

    Those invalid `to word!` conversions are fixed now (#2619).

--------------------------------------------------------------------------------

On 2020-03-21T11:27:52Z, 9214, commented:
<https://github.com/red/red/issues/2329#issuecomment-602030671>

    `issue!` can be converted to `integer!`, `binary!` and `tuple!`, in all cases it's treated as base-16 encoded numeral and only first 4 or 12 "bytes" are taken in `integer!` and `tuple!` cases, respectively.
    
    For me it's in a "nice to have but not of a vital importance" camp and can be removed (should be covered by conversion from `binary!` IMO), but I'd rather see some use-cases and arguments against that. I can imagine that `issue! ↔ tuple!` can be used for color codes.

