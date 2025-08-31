
#3190: WISH: /ONLY and /CASE refinements for ALTER
================================================================================
Issue is open, was reported by 9214 and has 54 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/3190>

I wish I could use `alter` with `/only` refinement to achieve something like this:
```Red
>> alter [foo bar][foo bar]
== false
>> alter x: [foo bar][foo bar]
== false
>> x
== [bar]
>> alter/only x: [foo bar][foo bar]
== true
>> x
== []
```

[R3's `alter`](http://www.rebol.com/r3/docs/functions/alter.html) also has `/case`, which could be added as a nice bonus.



Comments:
--------------------------------------------------------------------------------

On 2018-01-05T23:55:49Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-355697019>

    If we want to do that, can we de-obfuscate the body as well? :^\

--------------------------------------------------------------------------------

On 2018-01-06T06:03:50Z, dockimbel, commented:
<https://github.com/red/red/issues/3190#issuecomment-355726176>

    @greggirwin That was not my doing. ;-P
      

--------------------------------------------------------------------------------

On 2018-01-06T21:46:13Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-355780333>

    I'm also going to question the design of `alter`, looking at the tests. If given a value that is more than one item long, it only removes the first if the item is found. e.g. alter with [1 2] only removes 1.
    
    `Alter` is currently only used once in %VID.red and once in %view-test.red. 
    
    I'm happy to take this one on Doc. Care to collaborate on the design @9214?
      

--------------------------------------------------------------------------------

On 2018-01-06T21:57:21Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-355781008>

    Should we rename `alter` to `toggle`? I have old notes on that.

--------------------------------------------------------------------------------

On 2018-01-06T22:39:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-355783352>

    Actually, `/only` should be implied. We should be toggling a single value in all cases, yes?

--------------------------------------------------------------------------------

On 2018-01-06T23:25:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-355785848>

    I think I have this in good shape, with bitset!, /case, and /only support. Will post shortly.

--------------------------------------------------------------------------------

On 2018-01-06T23:45:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-355786801>

    ```
    toggle: function [
    	"Toggle a value (append/remove), returning the toggled state (on/off)"
    	input [series! bitset!] "If value is found, remove it; otherwise, append it"
    	value "Must be an integer or char if input is a bitset"
    	/case "Perform a case-sensitive match; ignored for bitset inputs"
    ][
    	; /case is safely ignored for bitsets
    	pos: either case [find/only/case input :value] [find/only input :value]
    	; The easy case is that the value wasn't there. /only is safely ignored for bitsets.
    	; Use `not` instead of `none?`, though, because `find` on bitsets returns a
    	; logic value, not an index.
    	either not pos [append/only input :value  (true)][
    		; Bitset handling is a bit...different. They don't have a current
    		; index, so the `/part` arg for `remove` is the bit index.
    		either bitset? input [remove/part input :value][
    			; If we want to support strings as both inputs and values, we
    			; have to remove more than one item (a char) if value is a string.
    			; But we DON'T want to remove more than one part if the input
    			; isn't a string.
    			either all [any-string? input  any-string? :value][
    				remove/part pos length? value
    			][
    				remove pos
    			]
    		]
    		(false)
    	]
    ]
    alter: :toggle  ; deprecate `alter`
    
    
    orig: copy inp: "abCDcd"
    res: toggle inp val: "cd"
    print [mold orig mold val res mold inp]
    orig: copy inp
    res: toggle inp val: "cd"
    print [mold orig mold val res mold inp]
    
    orig: copy inp: "abCDcd"
    res: toggle/case inp val: "CD"
    print [/case mold orig mold val res mold inp]
    orig: copy inp
    res: toggle/case inp val: "CD"
    print [/case mold orig mold val res mold inp]
    
    orig: copy inp: charset "abCDcd"
    res: toggle inp val: #"c"
    print [mold orig mold val res mold inp]
    orig: copy inp
    res: toggle inp val: #"c"
    print [mold orig mold val res mold inp]
    
    orig: copy inp: "abCDcd"
    res: toggle/case inp val: #"c"
    print [mold orig mold val res mold inp]
    orig: copy inp
    res: toggle/case inp val: #"c"
    print [mold orig mold val res mold inp]
    
    orig: copy inp: charset "abCDcd"
    res: toggle inp val: 97
    print [mold orig mold val res mold inp]
    orig: copy inp
    res: toggle inp val: 97
    print [mold orig mold val res mold inp]
    
    orig: copy inp: charset "abCDcd"
    res: toggle/case inp val: 97
    print [mold orig mold val res mold inp]
    orig: copy inp
    res: toggle/case inp val: 97
    print [mold orig mold val res mold inp]
    
    orig: copy inp: [a b C D c d]
    res: toggle/case inp val: 'c
    print [mold orig mold val res mold inp]
    orig: copy inp
    res: toggle/case inp val: 'c
    print [mold orig mold val res mold inp]
    
    orig: copy inp: [a b C D c d]
    res: toggle/case inp val: 'C
    print [mold orig mold val res mold inp]
    orig: copy inp
    res: toggle/case inp val: 'C
    print [mold orig mold val res mold inp]
    
    orig: copy inp: [a b [C D] [c d]]
    res: toggle inp val: [c d]
    print [mold orig mold val res mold inp]
    orig: copy inp
    res: toggle inp val: [c d]
    print [mold orig mold val res mold inp]
    
    orig: copy inp: [a b [C D] [c d]]
    res: toggle/case inp val: [C D]
    print [mold orig mold val res mold inp]
    orig: copy inp
    res: toggle/case inp val: [C D]
    print [mold orig mold val res mold inp]
    ```

--------------------------------------------------------------------------------

On 2018-01-07T07:03:09Z, 9214, commented:
<https://github.com/red/red/issues/3190#issuecomment-355804249>

    ## TL;DR
    * I'm not sure about naming; `altern` is short for `alternate`, which (for me) means: "change one thing with another", i.e. change absence of value with that value and vise versa. And, semantically, `alternate` implies mutation of the series. `toggle` sounds like a synonym.
    
    * returning `logic!` flag seems more useful, because, in case you want a modified series, you can write:
    ```Red
    also series altern series value
    ```
    since original series itself is modified, and, in case you want to know whenever series was `alter`ed or not, it's hard to figure out without that boolean flag. `logic!` value itself can be used somehow, and that reminds me of discussion with @numberjay about pragmatic returned values :stuck_out_tongue: 
    
    Although, `series` might not be referenced by any word, in that case it will be "lost forever" :confused: 
    
    ## Philosophical rant
    @greggirwin yes, I actually thought that behavior I proposed is implied, i.e. `alter [foo bar][foo bar] == []`, and that `alter/only [foo bar][foo bar]` would yield `[foo bar]`, because it searches for `[foo bar]` block literally.
    
    Not sure about `toggle`, for me it has strong boolean association (on/off, yes/no), while `alter` is a *set operation* by design. It actually depends on existing use-cases. I remembered about `alter` when stumbled upon 
    ```Red
    unless find series element [append series element]
    ``` 
    pattern in my code.
    
    As for returning value... either `none` or modified series, or (un)modified series in any case, just like other set operations (`exclude`, `intersect`, etc) behave? 
    
    Though, in case of other operations, you want to find third set out of two existing sets, but in case of `alter` you want to just modify existing set, and there's no reason to use series returned by `altern`, since it's the same thing that original series already is.
    
    So, if `altern` shouldn't return modified series (set), then what? Obviously, some flag. Then, typical use-case for `altern` would be:
    ```Red
    if altern series value [...]
    ```
    Or `logic!` value returned from `altern` could be directly inserted somewhere, say, in `bitset!`. I can't come up with valid use-cases for that, but my gut tells me that it's more useful.
    
    And if user want to return actual modified series, then:
    ```Red
    also series altern series value
    ```  

--------------------------------------------------------------------------------

On 2018-01-07T07:20:14Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-355804855>

    The series is always modified, yes? So it's either logic or the series we return.
    
    One of the tricky things about this function is that it *looks* like a set operation, but it isn't. If you use it as the only interface to a series, it will be, but if you have an existing series, with a value in it that occurs more than once, it will continue to be removed until the last one is gone, then added back. So `toggle` isn't a great name either, in describing the exact behavior in that sense. But even that behavior could be useful in some cases. Maybe `alter` is the better name after all.

--------------------------------------------------------------------------------

On 2018-01-07T07:21:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-355804881>

    Aside from that, does the above implementation look OK to you?

--------------------------------------------------------------------------------

On 2018-01-07T07:42:04Z, 9214, commented:
<https://github.com/red/red/issues/3190#issuecomment-355805642>

    @greggirwin I've updated my original comment. Yes, it looks fine. :wink: 

--------------------------------------------------------------------------------

On 2018-01-07T07:59:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-355806286>

    Cool, thanks.

--------------------------------------------------------------------------------

On 2018-01-07T08:40:21Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-355808028>

    As a side note on naming, `toggle`  may have other uses, while `alter` probably won't, and as an abbreviated form of `alternate`, it is still a good name. I'll retract my name-change suggestion for now.

--------------------------------------------------------------------------------

On 2018-02-04T20:55:16Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-362938837>

    PR for this is at https://github.com/red/red/pull/3191

--------------------------------------------------------------------------------

On 2020-03-26T15:27:05Z, 9214, commented:
<https://github.com/red/red/issues/3190#issuecomment-604495175>

    @greggirwin would you like to make another stab at this?

--------------------------------------------------------------------------------

On 2020-03-26T20:07:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-604658097>

    What needs to be stabbed? If the earlier code is still OK with you, and we stick with the name `alter`, go for it. `Toggle` may be the better name for bitsets, but that could be a simple alias or wrapper to `alter` as well.

--------------------------------------------------------------------------------

On 2020-03-26T21:17:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/3190#issuecomment-604691455>

    `alter` IMO is the most useless series function. Every time I thought about using it, a minute later I realized there's a better solution.
    
    Besides, it's function is implemented by `difference` more consistently:
    ```
    >> probe difference probe difference probe "abcdefaa" "ab" "ab"
    "abcdefaa"
    "cdef"        ;) removed all "a"s and "b"s
    "cdefab"      ;) added another
    ```
    No single value problem with it, and can be chained.
    
    Maybe that's just me, but I don't understand at all where is it useful to do something like this:
    ```
    >> alter s: "abcdefaa" "ab" s
    == "bcdefaa"        ;) searches for "ab" but only removes "a"
    >> alter s "ab" s
    == "bcdefaaab"      ;) not found "ab" and added it
    ```

--------------------------------------------------------------------------------

On 2020-03-26T21:32:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-604697927>

    I agree that it's not *terribly* useful, as evidenced by how little it has been used historically, and I'm equally OK with removing it, and putting the above in red/code or red/community as an example.

--------------------------------------------------------------------------------

On 2020-03-26T21:33:16Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-604698432>

    Carl's original intent was that of turning values on and off, in the context of a block of words used as flags.

--------------------------------------------------------------------------------

On 2020-03-26T21:39:57Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-604701158>

    @dockimbel @qtxie @9214, what do you think?
    
    The funny thing is that it *seems* like it should be really useful.

--------------------------------------------------------------------------------

On 2020-03-26T21:47:36Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-604703972>

    It's not about performance at all, but readability.

--------------------------------------------------------------------------------

On 2020-03-26T21:50:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/3190#issuecomment-604704899>

    It seems like currently it is about performance:
    ```
    >> clock/times [alter [a b c d e] 'a] 1000000
    984 ms	[alter [b c d e a] 'a]
    == true
    >> clock/times [difference [a b c d e] [a]] 1000000
    5971 ms	[difference [a b c d e] [a]]
    == [b c d e]
    ```
    But I suspect with a bit of hashtable optimization, native should win this battle over function.

--------------------------------------------------------------------------------

On 2020-03-26T22:07:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-604712079>

    I don't think that was part of the design intent though. And, like `reduce/into`, this could be about memory pressure control if you were doing it a lot. Again, I don't have a use case in my history for that, but I can imagine some. e.g. presence tracking.

--------------------------------------------------------------------------------

On 2020-05-03T11:51:30Z, endo64, commented:
<https://github.com/red/red/issues/3190#issuecomment-623097974>

    I'm for returning the modified series and also adding `/same` refinement.
    Here a few more discussion about it: [Gitter](https://gitter.im/red/red?at=5eae8a6ea9de3d01b1e5a34c)

--------------------------------------------------------------------------------

On 2020-08-12T17:17:28Z, 9214, commented:
<https://github.com/red/red/issues/3190#issuecomment-673003838>

    Personally I needed "add if it's not there, otherwise keep as-is" functionality once or twice.

--------------------------------------------------------------------------------

On 2021-10-06T20:44:15Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-937098659>

    1) Let's not change the name, but let's clarify the semantics. If we later want `toggle` to be a set up, we can add that.
    
    2) As @hiiamboris noted elsewhere recently, `/same` is not given first class consideration in many cases, and we should consider it here.
    
    This moves us forward, making `alter` better, in an evolutionary way.

--------------------------------------------------------------------------------

On 2021-10-06T22:29:17Z, greggirwin, commented:
<https://github.com/red/red/issues/3190#issuecomment-937267874>

    We _could_ use refinements for control of set-like operations. e.g., `/all` could imply treating the input like a set. But other set ops don't work that way. And we don't want to use `/only` to mean "alter one instance", because that meaning is totally different than `/only` in other functions. Similarly `alter/set` isn't great, because `set` has a very different meaning in Red.
    
    If we leave the semantics basically as they are, i.e. using the `toggle` example above (along with the `append/remove` note in the doc string), users are in control. It _does_ mean that people can get themselves into trouble by not using `alter` consistently if they _do_ want set-like ops, but it's easy to explain and reason about. We have the same issue with any series ops that expect users not to muck about with them in unsupported ways. 
    
    If that works for commenters here, we just need to add `/same` support and leave the name as `alter`.

