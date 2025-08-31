
#1909: Function unique not "uniqueizing" series with blocks as arguments
================================================================================
Issue is closed, was reported by x8x and has 8 comment(s).
[type.wish]
<https://github.com/red/red/issues/1909>

```
unique [[1][1]]
; [[1] [1]]
```

should return:

```
unique [[1][1]]
; [[1]]
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-08T15:44:28Z, x8x, commented:
<https://github.com/red/red/issues/1909#issuecomment-238278712>

    Here is a red level implementation with support for blocks as arguments:
    
    ``` rebol
    unique: func [
        "Returns the data set with duplicates removed."
        series [block! hash! string!]
        /case "Use case-sensitive comparison."
        /skip size "Treat the series as fixed size records."
        return: [block! hash! string!]
        /local
            result
    ][
        result: clear []
        size: (any [size 1]) - 1
        parse series [
            any [
                copy item skip (
                    unless either case [
                        find/case result item
                    ][
                        find result item
                    ][append result item]
                )
                size skip
            ]
        ]
        copy result
    ]
    ```
    
    Tests:
    
    ```
      unique reduce [next [3 2] next [5 2] 3 5 2 3 {aa} 'hh {aA}]
    ;   [[2] 3 5 2 "aa" hh]
      unique/case/skip reduce [next [3 2] next [5 2] 3 5 2 3 {aa} 'hh {aA}] 2
    ;   [[2] 3 2 "aa" "aA"]
    ```

--------------------------------------------------------------------------------

On 2016-08-08T20:09:14Z, meijeru, commented:
<https://github.com/red/red/issues/1909#issuecomment-238360795>

    My 0.6.1. version on W10 has the desired behaviour!
    
    ```
    red>> about
    Red 0.6.1 - 30-Jul-2016/15:18:42+2:00
    red>> unique [[1][1]]
    == [[1]]
    ```

--------------------------------------------------------------------------------

On 2016-08-09T00:54:03Z, x8x, commented:
<https://github.com/red/red/issues/1909#issuecomment-238422521>

    Latest nightly:
    
    ```
    red>> unique [[1][1]]
    == [[1] [1]]
    ```
    
    0.6.1 release:
    
    ```
    red>> unique [[1][1]]
    == [[1]]
    ```
    
    So yes, it looks like a regression for above case, but this is wrong with 0.6.1 release, please try it on W10:
    
    ```
    red>> unique/case/skip reduce [next [3 2] next [5 2] 3 5 2 3 {aa} 'hh {aA}] 2
    == [[2] [2] 3 5 2 3 "aa" hh "aA"]
    ```

--------------------------------------------------------------------------------

On 2018-04-25T04:43:53Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1909#issuecomment-384159141>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

