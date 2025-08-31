
#2185: WISH: parse return keyword.
================================================================================
Issue is closed, was reported by ifgem and has 6 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/2185>

Behavior: 

```
point: [
    copy left number
    #"x"
    copy right number
    return (reduce ["point" left right])
]
expr: [
    set p1 point 
    ";"
    set p2 point
    return (reduce ["expr" p1 p2])
]

parse "100x100;200x200" expr
["expr" ["point" "100" "100"] [point "100" "100"]]
```

Another example:

```
integer: [
    copy n number
    return (
        to integer! n
    )
]
sub/part "street 100" [set h integer] [h: h + 1] 
"street 101"
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-30T00:25:50Z, greggirwin, commented:
<https://github.com/red/red/issues/2185#issuecomment-243297929>

    R3 added 'return to `parse`, but it broke out of main rule. I've done a number of things in the past to collect data while parsing, and it's a nice idea. You can get close with `collect/keep`, though it's really a collect-as-you-go model (which works if your output is Forth :^), rather than using vars or a stack you can push and pop against (where the return goes). 
    
    I don't know the deeper implications, or what Nenad has in mind for other parse enhancements. e.g. rule-local vars.
    
    We can mock up ideas quickly, and make a list of scenarios.

--------------------------------------------------------------------------------

On 2016-08-30T15:37:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2185#issuecomment-243481845>

    @ifgem What is `sub`? What is `number`? Please provide fully working examples of code when submitting a ticket.
    
    `collect` can already give you similar results, so you should explain what advantage do we gain from a `return` command. If it's the same as in Rebol3, it should be mentioned also. Here is your first example written using `collect/keep` combo:
    
    ```
    point: [
        keep ("point")
        keep 3 skip
        #"x"
        keep 3 skip
    ]
    expr: [
        keep ("expr")
        collect point 
        ";"
        collect point
    ]
    parse "100x100;200x200" [collect expr]
    
    == ["expr" ["point" "100" "100"] ["point" "200" "200"]]
    ```
    
    Notice that `collect` can produce nested blocks if called recursively in the rules.

--------------------------------------------------------------------------------

On 2017-02-22T14:49:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2185#issuecomment-281690027>

    As there was no further discussion about this request, I'm closing this ticket.

