
#1859: Parse can't handle none
================================================================================
Issue is closed, was reported by shakna-israel and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1859>

According to [Parsing](http://www.rebol.com/docs/core23/rebolcore-15.html#section-2) in the rebol docs, Parse should be able to take `none` as an argument, instead of a rule.

> The parse function splits the input argument, string, into a block of multiple strings, breaking each string wherever it encounters a delimiter, such as a space, tab, newline, comma, or semicolon. The none argument indicates that no other delimiters other than these. 

The example given being

```
probe parse "The trip will take 21 days" none
["The" "trip" "will" "take" "21" "days"]
```

However, running that in red 0.6.0 on OS X El Capitan, with and without compiling, gives:

```
*** Script error: parse does not allow none! for its rules argument
*** Where: parse
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-27T05:13:55Z, dockimbel, commented:
<https://github.com/red/red/issues/1859#issuecomment-214971699>

    As this way of using Parse is not relying on the Parse dialect, in Red, we decided to move this feature to a separate `split` function:
    
    ```
    red>> help split
    
    USAGE:
        split series dlm
    
    DESCRIPTION:
         Break a string series into pieces using the provided delimiters. 
         split is of type: function!
    
    ARGUMENTS:
         series  [any-string!] => String series to split.
         dlm  [string! char!] => Delimiter as a char or string pattern.
    ```
    
    Usage example:
    
    ```
    red>> split "The trip will take 21 days" space
    == ["The" "trip" "will" "take" "21" "days"]
    ```

