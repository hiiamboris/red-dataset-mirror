
#2583: [WISH] reflect on datatype!
================================================================================
Issue is closed, was reported by maximvl and has 4 comment(s).
[type.wish] [status.resolved]
<https://github.com/red/red/issues/2583>

It would be nice to have `reflect` working on `datatype!` so it would be possible to get all datatype fields, if there are any. Something like:
```
>> keys-of pair!
[x y] 
```
This would allow things like auto-completion, help and runtime loops over fields, checks, etc.


Comments:
--------------------------------------------------------------------------------

On 2017-04-16T12:30:08Z, meijeru, commented:
<https://github.com/red/red/issues/2583#issuecomment-294349227>

    There are exactly four datatypes to which this applies, and each has a small number of fixed "fields": time! pair! email! and image!. In my view, reflection is for cases where the number of fields and their names are not fixed in advance and user-definable. See also #2527.  

--------------------------------------------------------------------------------

On 2017-07-28T16:04:14Z, dockimbel, commented:
<https://github.com/red/red/issues/2583#issuecomment-318694109>

    You can find all those accessors listed per datatype in: `system/catalog/accessors` since 0.6.3. The console does auto-complete on them.

