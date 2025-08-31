
#1221: appending hash!s and map!s to map!s
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1221>

This looks right:

```
red>> append #(a 1) [b 2]
== #(
    a: 1
    b: 2
)
```

Shouldn't this give the same result?:

```
red>> append #(a 1) make hash! [b 2]
*** Script error: invalid argument: b 2
*** Where: append
```

Should this give the same result?:

```
red>> append #(a 1) #(b 2)
*** Script error: invalid argument: b: 2
*** Where: append
```



Comments:
--------------------------------------------------------------------------------

On 2015-06-08T01:05:38Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1221#issuecomment-109819721>

    This behaviour is implied by the help for append. /Only applies only to blocks. The implication being that all other types are treated as single values:
    
    ```
    red>> ? append
    
    USAGE:
        append series  value  /part  length  /only  /dup  count
    
    DESCRIPTION:
         Inserts value(s) at series tail; returns series head. 
         append is of type: action!
    
    ARGUMENTS:
         series  [series! bitset! map!]
         value  [any-type!]
    
    REFINEMENTS:
         /part => Limit the number of values inserted.
             length  [number! series!]
         /only => Insert block types as single values (overrides /part).
         /dup => Duplicate the inserted values.
             count  [number!]
    ```
    
    The treatment of string! is the same:
    
    ```
    red>> append #(a 1) "b 2"
    *** Script error: invalid argument: b 2
    *** Where: append
    ```
    
    Neither map! or hash! are block!s:
    
    ```
    red>> block? #(1 2)
    == false
    red>> block? make hash! [1 2]
    == false
    ```

--------------------------------------------------------------------------------

On 2015-06-08T01:07:57Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1221#issuecomment-109819840>

    I have not closed this issue as I suspect the following case needs to be reviewed. The behaviour may be desirable but the block! has not been treated as a single value.
    
    ```
    red>> append/only #(a 1) [b 2]
    == #(
        a: 1
        b: 2
    )
    ```

--------------------------------------------------------------------------------

On 2015-06-08T08:40:30Z, dockimbel, commented:
<https://github.com/red/red/issues/1221#issuecomment-109908715>

    `append` on maps has been replaced by `extend` which is a much better fit:
    
    ```
    red>> help extend
    
    USAGE:
        extend obj  spec  /case
    
    DESCRIPTION:
         Extend an object or map value with list of key and value pairs.
         extend is of type: native!
    
    ARGUMENTS:
         obj  [object! map!]
         spec  [block! hash! map!]
    
    REFINEMENTS:
         /case => Use case-sensitive comparison.
    ```
    
    Moreover, now `hash!` and `map!` are supported as arguments.

