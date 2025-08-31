
#791: After COLLECT INTO <word> evaluated, the <word> block stayed at the tail of the block
================================================================================
Issue is closed, was reported by WayneCui and has 28 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/791>

This occurs with both the interpreter and compiler ( or this is the intended behavior?)

```
Red []
blk: [ 2  #[none] 64  #[none]]
result: copy []
parse blk [
    collect into result [
        any [
            set s integer! keep (s) | skip
        ]
    ]
]
probe result           ;; [ ]
probe tail? result     ;; true
probe head result      ;; [2 64]
```



Comments:
--------------------------------------------------------------------------------

On 2014-04-27T16:03:26Z, dockimbel, commented:
<https://github.com/red/red/issues/791#issuecomment-41500504>

    It is consistent with the case where the result block is not pointing at head, but inconsistent with how `/into` refinement is used in other functions like REDUCE or COMPOSE.

--------------------------------------------------------------------------------

On 2014-04-27T20:59:51Z, dockimbel, commented:
<https://github.com/red/red/issues/791#issuecomment-41508900>

    After this fix, all insertions for COLLECT INTO are happenning on _right_ side of the cursor position of the target block, instead of the _left_ side. PARSE tests were changed accordingly too, look into the commit for more details.

--------------------------------------------------------------------------------

On 2014-04-27T22:16:21Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/791#issuecomment-41511193>

    This is a regression to the original behaviour. You changed it after we discussed that it makes it very hard to find out how many values were inserted. That made it consistent with INSERT and how its return index is often used.
    
    Several of my programs, such as my data format converters, rely on this behaviour and will now break and need a more complex rewrite.

--------------------------------------------------------------------------------

On 2014-04-28T11:04:04Z, dockimbel, commented:
<https://github.com/red/red/issues/791#issuecomment-41546065>

    This is a modification (intentional), not a regression (unintentional). It is true that, in the implementation, it was complicated to make that change because the original cursor position was lost if not moved forward along with inserted values, but I figured out a way to implement it anyway. It looks to me that COLLECT INTO is better being consistent with other functions having a /INTO, like REDUCE, COMPOSE, LOAD, ... Also, the empty block case above makes it clear that implicitely changing the target block cursor position is counter-intuitive.
    
    Here is an example to get back the "after insertion" cursor change behavior:
    
    ```
    result: next [a b c]
    len: length? result
    parse [2 - 3 - 4] [collect into result [some [keep integer! | skip]]]
    ?? result
    len: (length? result) - len
    print [len "values added"]
    result: skip result len            ;-- move block cursor passed inserted values
    ?? result
    ```

--------------------------------------------------------------------------------

On 2014-04-28T18:49:04Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/791#issuecomment-41597664>

    I understand the intentionality, but the intention used to be reversed after I discussed it with you. I also know how to compute the now lost information, but as I said, and as your example shows, that's much more complex, and inefficient, because that information was already known.

--------------------------------------------------------------------------------

On 2014-04-28T21:03:23Z, dockimbel, commented:
<https://github.com/red/red/issues/791#issuecomment-41613256>

    I know that the intention was different when COLLECT INTO was implemented. I think that the changed behavior has more value for the users, as described above.
    
    I am sorry if that breaks your code, but as we are still in alpha stage, we are not bound to provide backward compatibility. Design changes and features fine-tuning are to be expected. So far, such cases were rare and limited, it could have been worse. ;-)

--------------------------------------------------------------------------------

On 2014-04-29T00:25:31Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/791#issuecomment-41630335>

    I don't see why a separate INTO word in the PARSE dialect needs to be compatible at all costs with /into refinements in the DO dialect. As far as I'm concerned, they were perfectly consistent, because my pattern is to implement /into on functions, which behaves like INSERT, by PARSE INTO. That now doesn't work anymore.
    
    I also can't follow why the previous intention was good after we discussed and changed it, based on patterns in actual code I wrote, but the preceding intention is now deemed better and reverted to. That makes it impossible for me to see future cases coming.

--------------------------------------------------------------------------------

On 2014-05-04T20:48:20Z, dockimbel, commented:
<https://github.com/red/red/issues/791#issuecomment-42144478>

    I just stumbled upon this ticket #578 that I forgot it ever existed (5 months, 200 tickets ago...). After re-reading it, I agree that it's a change back to the original behavior. But still the new (and original) behavior is the right one, for several reasons:
    1. INTO is exactly the same feature as /INTO, so the series position should remain unchanged (like for /INTO).
    2. Future consistency with the function version of COLLECT (COLLECT/INTO).
    3. The empty target block case creates a strange counter-intuitive result if the series head is moved after insertions.
    
    The existing functions that have an /INTO option are returning the series past the insertion point, but the original series cursor remains unchanged. That is an handy way, as one can choose which series  cursor is the most useful depending on the use-case. 
    
    Both COLLECT INTO and COLLECT SET were added in order to provide a mode where we return the result of the matching rules instead of the collected block (COLLECT simple form). So we cannot return the same past-insertion series like with /INTO functions, we are left only with the original series which cursor needs to remain untouched (see the 3 reasons above).
    
    My error was changing it in the first place in #578, I should have given it more thoughts.
    
    That said, there is maybe an option to consider which is to support a new **COLLECT AFTER** parse statement that will explicitely ask for changing the original series position past inserted values. That way COLLECT in parse would offer the same possibilities that /INTO functions are offering (both past-insertions and original position).

--------------------------------------------------------------------------------

On 2014-05-04T23:36:07Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/791#issuecomment-42150836>

    There is a fundamental difference between the DO and PARSE dialects. In the DO dialect, you can choose to have an /into refinement return a series index that is different from the input index. In the PARSE dialect, you don't have that option.
    
    Therefore, /into and PARSE COLLECT INTO are not directly comparable, and thus I still think the most consistent behaviour can be argued either way. However, if the previous, most efficient behaviour becomes available again as COLLECT AFTER, that would be OK with me.

--------------------------------------------------------------------------------

On 2014-05-06T09:11:19Z, hostilefork, commented:
<https://github.com/red/red/issues/791#issuecomment-42281096>

    Seems there is a problem with /INTO.
    
    Series positions represent "between" positions.  And /INTO is inherently ambiguous regarding what the result will be.  Hence /INTO and /AFTER are not balanced choices, but /BEFORE and /AFTER are.  You could use the refinement to indicate the choice of which of the two results you desire when the operation is finished.
    
    ```
    >> foo: [a b c]
    >> insert/before next foo [d e]
    == [d e b c]
    
    >> foo: [a b c]
    >> insert/after next foo [d e]
    == [b c]
    ```
    
    In this case, the so-called "INTO" is implied by both /BEFORE and /AFTER.  The refinement is only specifying where you want the result series pointer to be.
    
    Then just sync parse with that.

--------------------------------------------------------------------------------

On 2014-05-06T11:06:54Z, earl, commented:
<https://github.com/red/red/issues/791#issuecomment-42289237>

    @hostilefork I'm not sure INSERT is the best example, because there is no INSERT _without_ an implied /INTO. (Which also entails, that one of /AFTER or /BEFORE is the default behaviour for non-refined INSERT anyway.) To sync the suggested analogy with e.g. COLLECT or REDUCE would lead to e.g. `collect/into/after` and `collect/into/before`. Dependent refinements are a bit smelly.
    
    On the other hand, leaving out the /INTO to just have `collect/after` leaves you with e.g. `collect/after [keep 1 keep 2] [a b]`. I'm not sure that's a strong enough indication that the /AFTER _also_ triggers a "don't create a new series, but just collect into this one" behaviour. But I'll have to give that some more thought.

--------------------------------------------------------------------------------

On 2014-05-06T11:12:21Z, hostilefork, commented:
<https://github.com/red/red/issues/791#issuecomment-42289897>

    Don't know why I said insert, just typing not testing.  _(Actually I do know, typing on the phone and retiring from chat so no RebolBot.)_  Pretend I said reduce or something with an /into refinement.  :/
    
    Trying to simplify too much to make the point.

--------------------------------------------------------------------------------

On 2014-05-07T12:37:04Z, dockimbel, commented:
<https://github.com/red/red/issues/791#issuecomment-42421194>

    _Therefore, /into and PARSE COLLECT INTO are not directly comparable, and thus I still think the most consistent behaviour can be argued either way._
    
    I disagree. COLLECT's INTO option was named like that specifically because the implied semantics were meant to be the same as /INTO (even if the syntax differs due to different dialect contexts). Also, both behavior choices are not equivalent wrt consistency. Here is what would have produced the previous COLLECT INTO behavior compared to the future COLLECT/INTO function:
    
    Parse version:
    
    ```
    result: next [a b c]
    parse [1 2 3] [collect into result [some keep skip]]
    result
    == [b c]
    ```
    
    Red language version:
    
    ```
    result: next [a b c]
    collect/into result [foreach item [1 2 3][keep item]]
    result
    == [1 2 3 4 b c]
    ```
    
    The same inconsistency would be obtained with any other natives supporting /INTO, and I would have been (rightly) flamed for introducing such inconsistent behavior.

--------------------------------------------------------------------------------

On 2014-05-14T09:43:37Z, iArnold, commented:
<https://github.com/red/red/issues/791#issuecomment-43061253>

    Kaj I have some changes in https://github.com/iArnold/red/tree/patch-2 to add an AFTER keyword for collect. Maybe you can give it a quick try?

