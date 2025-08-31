
#2180: Parse doesn't look for a rule in object!.
================================================================================
Issue is closed, was reported by ifgem and has 4 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/2180>

same: `iis: object [rule: [integer! integer! string!]]`

Rebol2, Rebol3:

```
parse [1 2 "hello"] [iis/rule] ;=> true
parse [1 2 "hello"] iis/rule   ;=> true
```

Red:

```
parse [1 2 "hello"] [iis/rule] ;=> false
parse [1 2 "hello"] iis/rule   ;=> true
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-28T10:56:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2180#issuecomment-242968484>

    Paths are not part of Parse dialect. They are considered for future Parse extensions, though, no decision has been made yet. Allowing it would lead to design issues then the path evaluates to a function.

--------------------------------------------------------------------------------

On 2018-04-25T04:57:15Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2180#issuecomment-384160710>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

