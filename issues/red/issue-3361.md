
#3361: Interpreter Gives Correct Results, Compiler Does Not
================================================================================
Issue is closed, was reported by octonion and has 14 comment(s).
[status.built] [status.tested] [type.bug] [status.reviewed] [test.written]
<https://github.com/red/red/issues/3361>

The below code is also on my Github:

https://github.com/octonion/puzzles/tree/master/blackjack/red

### Expected behavior
```
Dealer showing 0 partitions = 417334
Dealer showing 1 partitions = 560954
Dealer showing 2 partitions = 658854
Dealer showing 3 partitions = 679464
Dealer showing 4 partitions = 680299
Dealer showing 5 partitions = 680305
Dealer showing 6 partitions = 680305
Dealer showing 7 partitions = 680305
Dealer showing 8 partitions = 680305
Dealer showing 9 partitions = 680305
Total partitions = 6398430
```
### Actual behavior
```
Dealer showing 0 partitions = 81
Dealer showing 1 partitions = 83
Dealer showing 2 partitions = 88
Dealer showing 3 partitions = 88
Dealer showing 4 partitions = 88
Dealer showing 5 partitions = 88
Dealer showing 6 partitions = 88
Dealer showing 7 partitions = 88
Dealer showing 8 partitions = 88
Dealer showing 9 partitions = 88
Total partitions = 868
```
### Steps to reproduce the problem
```bash
red -c outcomes.red
./outcomes
```
Note - interpreter gives correct results.
### Red and platform version
Red 0.63, Linux Ubuntu 17.10

### Code
```red
Red []

partitions: function [
    cards[any-list!]
    subtotal[integer!]
][
    m: 0
    ; Hit
    repeat i 10 [
        if cards/(i) > 0 [
            total: subtotal + i
            if (total < 21) [
                ; Stand
                m: m + 1
                ; Hit again
                cards/(i): cards/(i) - 1
                m: m + (partitions cards total)
                cards/(i): cards/(i) + 1
            ]
            if (total == 21) [
                ; Stand; hit again is an automatic bust
                m: m + 1
            ]
        ]
    ]
    return m
]

deck: [4 4 4 4 4 4 4 4 4 16]
d: 0

repeat i 10 [
    ; Dealer showing
    deck/(i): deck/(i) - 1
    p: 0
    repeat j 10 [
        deck/(j): deck/(j) - 1
        p: p + (partitions deck j)
        deck/(j): deck/(j) + 1
    ]
    print ["Dealer showing" (i - 1) "partitions =" p]
    d: d + p

    deck/(i): deck/(i) + 1
]

print ["Total partitions =" d]
```




Comments:
--------------------------------------------------------------------------------

On 2018-05-02T07:02:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3361#issuecomment-385883261>

    Results confirmed on Windows, though I haven't dug in to the algo. @octonion, do you have prior experience with this algo that might give you clues about the results? It's not a paren+path issue, as I tweaked that quickly to check.

--------------------------------------------------------------------------------

On 2018-05-02T15:51:05Z, 9214, commented:
<https://github.com/red/red/issues/3361#issuecomment-386026272>

    @octonion meanwhile, can you check if result are different if compilation is done with `-e` flag? That is `./red -r -e ...`

--------------------------------------------------------------------------------

On 2018-05-02T16:20:03Z, dockimbel, commented:
<https://github.com/red/red/issues/3361#issuecomment-386035821>

    It would be helpful if the source code could be narrowed down to point to the expression that is processed in a diverging way between the interpreter and compiler.

--------------------------------------------------------------------------------

On 2018-05-02T16:26:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3361#issuecomment-386037736>

    @9214, it's fine with `-e`, and with a bunch of other changes I tried late last night (e.g. declaring vars, thinking `function` and recursion might change things). I'll try to narrow it down today as well. 

--------------------------------------------------------------------------------

On 2018-05-02T17:55:16Z, octonion, commented:
<https://github.com/red/red/issues/3361#issuecomment-386065169>

    Yes, I've implemented this algorithm many times. This is about the 90th implementation I've done in different programming languages and combinations of programming languages (which are in the same GitHub repo). There's always the possibility that I've done something incorrectly in the Red language, as this was my first Red program.
    
    If I were to make a guess, the speed and numbers it's returning indicate that the recursive call isn't actually occurring, but is being treated as a 0. But note this is only a guess.

--------------------------------------------------------------------------------

On 2018-05-02T19:07:49Z, x8x, commented:
<https://github.com/red/red/issues/3361#issuecomment-386087272>

    problem is somehow with `repeat`, using `foreach`:
    ```red
    fun: function [n][
    	foreach i [1 2] [
    		print [n i]
    		all [n = 1 i = 1 fun 2]
    	]
    ]
    fun 1
    ```
    compiled and run, returns:
    ```
    1 1
    2 1
    2 2
    1 2
    ```
    same result using `forall`:
    ```red
    fun: function [n][
    	i: [1 2]
    	forall i [
    		print [n i/1]
    		all [n = 1 i/1 = 1 fun 2]
    	]
    ]
    fun 1
    ```
    and same result using `loop`:
    ```red
    fun: function [n][
    	i: 0
    	loop 2 [
    		i: i + 1
    		print [n i]
    		all [n = 1 i = 1 fun 2]
    	]
    ]
    fun 1
    ```
    while using repeat:
    ```red
    fun: function [n][
    	repeat i 2 [
    		print [n i]
    		all [n = 1 i = 1 fun 2]
    	]
    ]
    fun 1
    ```
    returns same as above when interpreted, but returns this when compiled:
    ```
    1 1
    2 1
    2 2
    ```

--------------------------------------------------------------------------------

On 2018-05-02T23:12:50Z, greggirwin, commented:
<https://github.com/red/red/issues/3361#issuecomment-386149455>

    @octonion thanks, I had the same thought. Looks like @x8x sleuthed it out.

