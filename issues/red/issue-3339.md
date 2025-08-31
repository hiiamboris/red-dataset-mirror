
#3339: WISH: support of `/reverse` in `find/match`
================================================================================
Issue is closed, was reported by hiiamboris and has 18 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3339>

>     /reverse     => Find the last occurrence of value, from the current index.
>     /match       => Match at current index only and return *tail* of match.

I find this pretty straightforward to support and somewhat useful

### Expected behavior
```
>> find/match/reverse tail "hovercat" "cat"
== ""
>> find/match/reverse skip "hovercat" 5 "over"
== "cat"
```
### Actual behavior
```
>> find/match/reverse tail "hovercat" "cat"
== none
>> find/match/reverse skip "hovercat" 5 "over"
== none
```
### Expected logic
```
true = same?
find/match/reverse where what
all [
    (index? where) >= length? what
    find/match (skip where negate length? what) what
]
```
Gitter discussion: :point_up: [April 20, 2018 6:28 PM](https://gitter.im/red/help?at=5ada07045d7286b43a4ce53a)


Comments:
--------------------------------------------------------------------------------

On 2018-08-15T02:42:32Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3339#issuecomment-413077196>

    This wish should be submitted as an issue in the [Red REP repository](https://github.com/red/REP).
    

--------------------------------------------------------------------------------

On 2018-11-22T23:13:01Z, Oldes, commented:
<https://github.com/red/red/issues/3339#issuecomment-441132351>

    The *expected behavior* above is not correct! It can be done as:
    ```
    >> find/reverse/tail tail "hovercat" "cat"
    == ""
    >> find/reverse/tail skip "hovercat" 5 "over"
    == "cat"
    ```
    But there is a bug in `/match/reverse` combination: https://github.com/red/red/issues/3609

--------------------------------------------------------------------------------

On 2018-11-22T23:35:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/3339#issuecomment-441133878>

    @Oldes it's not *correct* or *wrong*, it's a *wish* ☺
    The point is to compare *in place*, while what you propose will *search* backwards until it finds the substring.

--------------------------------------------------------------------------------

On 2018-12-29T08:56:24Z, dockimbel, commented:
<https://github.com/red/red/issues/3339#issuecomment-450477223>

    This ticket is a mess... It starts with a wrong assumption about what `/match` refinement means. In Rebol, `find` has two modes of operation: *searching* or *matching*. The search mode is the default one. Matching mode is activated by `/match` and only operates on current series position, there is no search happening. See [related Rebol documentation](http://www.rebol.com/docs/core23/rebolcore-6.html#section-7.7) for more details.
    
    Therefore if `/match` is mixed with a searching mode refinement like `/reverse`, the expected result is `none`, indicating that both conditions cannot be satisfied (it is discutable if an error would be more appropriate or not, as there are many possible refinement combinations, making it probably expensive to check all of them exhaustively).
    
    In Red, `/match` has been implemented, but not the related `/any` and `/with` refinements. The `find` action is already overloaded with many refinements, making it potentially confusing for the user, and complicated to implement, because of the high number of possible combinations. My plan for that was to consider implementing a new `match` native, to externalize the matching mode from `find`, and make it easier to use and implement. Though, that would create another difference with Rebol, so the decision was not formed during the work on `find`. Nowadays, I think a separate `match` native is probably a better option for Red.
    
    @hiiamboris The behavior you are asking for is already covered by using `/tail` and `/reverse` together as shown by @Oldes.
    
    @qtxie Please revert the commit you made above, this feature is wrong and should not be implemented. Your code does many changes, so I am not sure if all are related to this wish, or also bugfixes... so I prefer to let you do the revert on it.

--------------------------------------------------------------------------------

On 2018-12-29T09:16:02Z, qtxie, commented:
<https://github.com/red/red/issues/3339#issuecomment-450478415>

    I think what @hiiamboris want is reverse match. It matches the string on current position backward. So
    `find/match/reverse skip "abxxxy" 4 "ab"` will match the nothing.
    This case cannot be covered by using `/tail` and `/reverse`.

--------------------------------------------------------------------------------

On 2018-12-29T10:53:21Z, dockimbel, commented:
<https://github.com/red/red/issues/3339#issuecomment-450484244>

    > I think what @hiiamboris want is reverse match. It matches the string on current position backward. 
    
    Not a "reverse match", he wants a *forward matching* but starting from a *backward position*. Also, his examples can already be accomplished using existing `find` refinements.
    
    > This case cannot be covered by using /tail and /reverse.
    
    True, but it can be covered by just `find/match` and skipping the input series backward using a fixed size, as there is no search involved (as shown by his algorithm `find/match (skip where negate length? what) what`.
    
    Anyway, we should move the matching feature of `find` to a new `match` native. In such case, a `/reverse` refinement could be considered and would probably be more useful to match the series from current position, but in reverse order, going backward.

--------------------------------------------------------------------------------

On 2018-12-29T12:29:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/3339#issuecomment-450489629>

    I fail to see the difference between matching backwards and forward matching from a backward position. It's just an array of chars after all. `/reverse` + `/match` combo does not do anything useful anyway right now, so why on earth not?
    
    `match` native with /reverse support sounds even better to me.

--------------------------------------------------------------------------------

On 2019-01-01T06:51:58Z, dockimbel, commented:
<https://github.com/red/red/issues/3339#issuecomment-450713103>

    > I fail to see the difference between matching backwards and forward matching from a backward position. 
    
    This is what "matching backwards" means to me:
    ```
    match/reverse tail "hello world" "dlrow"
    == "world"
    ```
    And matching from a backward position:
    ```
    match/reverse skip tail "hello world" -5 "world"
    == "world"
    ```
    
    > /reverse + /match combo does not do anything useful anyway right now, so why on earth not?
    
    Because they denote different modes of matching that are incompatible, `/reverse` is a search, while `/match` is a pattern matching with no searching.

--------------------------------------------------------------------------------

On 2019-01-08T08:49:14Z, DideC, commented:
<https://github.com/red/red/issues/3339#issuecomment-452219822>

    Confusion of refinment come from the confusion of functionality (search / match).
    
    Personaly, I never used `find/match` in Rebol and, after a google search to find examples of use case, I realise that the `find/` word before the `match` is confusing at the reading for non expert of the thing.
    
    And I also found old chats that were just what this chat is (imcompatible refinment use)!
    
    So go for a separate `match` function.

