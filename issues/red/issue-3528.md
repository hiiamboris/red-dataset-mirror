
#3528: WISH: PARSE could accept paths 
================================================================================
Issue is open, was reported by Oldes and has 10 comment(s).
[type.wish]
<https://github.com/red/red/issues/3528>

### Expected behavior (as in Rebol)
```
>> rules: [end: [to end]]
== [end: [to end]]
>> parse "foo" [rules/end]
== true

>> chars: object [digit: charset [#"0" - #"9"]]
== make object! [
    digit: make bitset! #{000000000000FFC0}
]
>> parse "123" [some chars/digit]
== true
```
### Actual behavior

Now above cases fails in Red. With it one could write parse rules library of some kind.



Comments:
--------------------------------------------------------------------------------

On 2018-09-04T04:42:22Z, 9214, commented:
<https://github.com/red/red/issues/3528#issuecomment-418239422>

    This ticket belongs [here](https://github.com/red/REP/issues).

--------------------------------------------------------------------------------

On 2018-12-13T16:32:36Z, dockimbel, commented:
<https://github.com/red/red/issues/3528#issuecomment-447033900>

    The second example can already be achieved by binding the rule to the object context (using `bind`).
    
    Though, for sake of compatibility, we could add such feature, but resolving paths inside tight loop like in the above example will have an impact on performances (resolving a path is costly compared relatively to other Parse commands).

--------------------------------------------------------------------------------

On 2020-03-22T11:14:30Z, 9214, commented:
<https://github.com/red/red/issues/3528#issuecomment-602182950>

    I briefly recall a conversation about how Parse can use dedicated modules of grammars and what support at the dialect level this will need. Does anyone want to bounce ideas around, to put this ticket into a perspective?

--------------------------------------------------------------------------------

On 2021-07-03T13:13:36Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/3528#issuecomment-873406536>

    It would be nice to have paths supported for RULES but also for SET too. It would help a lot to simplify target setting in objects, blocks and maps:
    
    Here are 2 examples where you validate and set structured data:
    
    (Part of the code made from @toomasv )
    ```
    options: [size 300x200 position above backgroud-color red]
    
    between?: func [data min-test max-test][
        all [min-test <= data max-test >= data]
    ]
    
    valid?: func [data test-name] [
        switch test-name [
            size [all [between? data/x 250 500 between? data/y 200 400]] 
            position [find [above below left right] data]
        ]
    ]
    
    struct: [size none position none color [background none text none]] 
    
    parse options [
        'size set struct/size pair! if (valid? struct/size 'size) 
        'position set struct/position word! if (valid? struct/position 'position)
        'backgound-color set struct/color/background word! if (valid? struct/color/background 'colors)
    ] 
    ```
    This is valid for Objects too, when using binding adds complication and slowness.
    
    ```
    ;.... (beginning of code omitted)
    
    struct: make object! [size: none position: 'above color: make object! [background: none text: none]] 
    parse options [
        'size set struct/size pair! if (valid? struct/size 'size) 
        'position set struct/position word! if (valid? struct/position 'position)
        'backgound-color set struct/color/background word! if (valid? struct/color/background 'colors)
    ] 
    ```
    
     About the parsing slowdown when using paths, it will happen only when the developer voluntarily uses them, so no speed loss if you use words. There is consensus that the advantage in power and expressiveness will greatly benefit Red developers.
    
    Regards,
       Giuseppe Chillemi

--------------------------------------------------------------------------------

On 2021-07-03T17:33:30Z, greggirwin, commented:
<https://github.com/red/red/issues/3528#issuecomment-873442081>

    Consensus means at least a few of us (myself included) think this is worth supporting. The added hit _checking_ for paths should be small, as they are not evaluated until matched.  If that is not the case, then we do need to profile the impact. Probably still worth it.

