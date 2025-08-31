
#4944: Numerous inconsistencies between FIND and REPLACE
================================================================================
Issue is closed, was reported by hiiamboris and has 24 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/4944>

**Describe the bug**

The fix for https://github.com/red/red/issues/3703 was not systemic IMO.
We have `replace` treating tag as tag, but `find`/`select` treating it as string.
Compare:
```
;) RED:
>> find "ab<b>b" <b>
== "b<b>b"
>> replace "ab<b>b" <b> '_
== "ab_b"

;) R2:
>> find "ab<b>b" <b>
== "<b>b"
>> replace "ab<b>b" <b> '_
== "ab_b"

;) R3:
>> find "ab<b>b" <b>
== "b<b>b"
>> replace "ab<b>b" <b> '_
== "ab_b"
```
Both Red and R3 show an inconsistency here in how sought value is treated.
I suggest instead of populating special cases we follow R2 example.

**Expected behavior**

As in R2

**Platform version**
```
Red 0.6.4 for Windows built 22-Jul-2021/20:44:06+03:00  commit #3c8d386
```



Comments:
--------------------------------------------------------------------------------

On 2021-08-03T20:35:10Z, greggirwin, commented:
<https://github.com/red/red/issues/4944#issuecomment-892147755>

    Tags have always been an issue. This deserves a design discussion so we can nail it down. Unfortunately, it's tradeoffs either way, but we still have those. They're just not consistent or documented.

--------------------------------------------------------------------------------

On 2021-08-03T20:50:16Z, dockimbel, commented:
<https://github.com/red/red/issues/4944#issuecomment-892156617>

    Red implemented its `find` semantics using R3 as model. I think the R2 model is much more useful, simpler and more predictable.

--------------------------------------------------------------------------------

On 2021-08-03T21:02:43Z, dockimbel, commented:
<https://github.com/red/red/issues/4944#issuecomment-892164068>

    Given how `find` is implemented (one generic implementation for `any-string!`), the same code is used for finding strings/tags inside strings/tags in order to provide a fast but short implementation. Tags do not store their delimiters inside their series buffer, so it might be quite difficult to take such non-present delimiters into accounts... One way to workaround that issue would be to store the angle brackets inside tag's series buffer.

--------------------------------------------------------------------------------

On 2021-08-03T21:38:56Z, greggirwin, commented:
<https://github.com/red/red/issues/4944#issuecomment-892183987>

    ```
    >> find "ab<b>b" form <b>
    == "<b>b"
    >> replace "ab<b>b" form <b> '_
    == "ab_b"
    >> parse "ab<b>b" ["ab" <b> "b"]
    == true
    ```
    `Parse` treats tags as formed, `replace` is a mezz with logic to do the same. `Find` is the odd man out. If we make it treat tags as formed, we don't lose anything, because you can still `to string!` if needed. It's just the more convenient default. It does mean that tag's delimiters are treated differently than strings, in that they are not ignored. That could be viewed as inconsistent, or simply a pragmatic design choice. `Form` includes the brackets, because they _are_ significant, so it's consistent with that.

--------------------------------------------------------------------------------

On 2021-08-04T11:14:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4944#issuecomment-892573433>

    Let this be in the same ticket, as it's another inconsistency of the same nature. **Words:**
    
    ```
    >> replace "abc" quote :a 1
    == "1bc"
    >> replace "abc" quote a: 1
    == "1bc"
    >> replace "abc" quote 'a 1
    == "1bc"
    >> replace "abc" quote a 1
    == "1bc"
    
    >> find "abc" quote a
    == "abc"
    >> find "abc" quote 'a
    == none
    >> find "abc" quote :a
    == none
    >> find "abc" quote a:
    == none
    ```
    My opinion is `find` is wrong here, as without /case it should treat words equally.
    Whatever it does, it just ignores other word types:
    ```
    >> find "'a a: :a" quote 'a
    == none
    >> find "'a a: :a" quote a:
    == none
    >> find "'a a: :a" quote :a
    == none
    ```
    
    And R2 is... surprising, to me at least:
    ```
    >> find "abc" quote a:
    == "abc"
    >> find "abc" quote :a
    == "abc"
    >> find "abc" quote 'a
    == "abc"
    >> find "abc" quote a
    == none        ;) what??
    >> find "abc" 'a
    == "abc"
    ```

--------------------------------------------------------------------------------

On 2021-08-04T11:26:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4944#issuecomment-892580038>

    Inconsistency in **numbers:**
    ```
    >> find "1.023" 1
    == none
    >> find "1.023" 1.0
    == none
    
    >> replace "1.023" 1.0 2
    == "223"
    >> replace "1.023" 1 2
    == "2.023"
    ```
    It's not obvious who's wrong here, but if we make `find string word` work, then numbers should be formed too.
    

--------------------------------------------------------------------------------

On 2021-08-04T11:30:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4944#issuecomment-892582768>

    An argument against forming value automatically in `find`, is because `replace` implementation will have to form it internally anyway, or otherwise it will have to be formed every time we call `find`, and that's a waste of RAM. 
    
    So I wouldn't mind if all those find-non-string-in-string cases fail and demand explicit `form` on user's side. That also removes all possible ambiguities.
    
    R2 however does the ~~forming~~ `to-string`ing:
    ```
    >> find/tail "1.023" 1.0
    == "23"
    >> find/tail "1.023" 1
    == ".023"
    >> find "1 212" [1 2]
    == "12"
    >> find "1 212" form [1 2]
    == "1 212"
    ```

--------------------------------------------------------------------------------

On 2021-08-04T17:50:07Z, greggirwin, commented:
<https://github.com/red/red/issues/4944#issuecomment-892852302>

    > So I wouldn't mind if all those find-non-string-in-string cases fail and demand explicit form on user's side. 
    
    I was thinking this as I read your new finds...er...discoveries. However, from a user's standpoint it makes sense to say "If the series is a string, any non-string value will be formed", because nothing else makes sense. If a particular case doesn't work as expected, users can easily see if the formed value is not what they expected it to be, and fix things up manually to meet their needs.
    
    It hurts _us_ knowing that extra `form` calls are wasteful, especially for strings that aren't at risk of being modified. For blocks, that's _really_ on the user's shoulders to `mold` first if needed.
    
    We can make it consistent, and easy to reason about, at the cost of efficiency. I think that's what we should do here.

--------------------------------------------------------------------------------

On 2021-08-04T17:51:15Z, greggirwin, commented:
<https://github.com/red/red/issues/4944#issuecomment-892853038>

    Unearthing these behaviors and edge cases is enormously helpful @hiiamboris. Thanks for doing that.

--------------------------------------------------------------------------------

On 2021-08-05T18:37:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/4944#issuecomment-893691302>

    Blocks inconsistency:
    ```
    >> replace/case "aAa" ["A"] "x"
    == "axa"
    
    >> find/case "aAa" ["A"]
    == none
    
    ;) R2
    >> find/case "aAa" ["A"]
    == "Aa"
    ```

--------------------------------------------------------------------------------

On 2021-08-05T19:03:26Z, greggirwin, commented:
<https://github.com/red/red/issues/4944#issuecomment-893711457>

    That should also be addressed by a consistent application of `form`.

--------------------------------------------------------------------------------

On 2021-08-09T19:30:36Z, dockimbel, commented:
<https://github.com/red/red/issues/4944#issuecomment-895483919>

    FORMing searched values (including tags) is now implemented.
    
    This fix seems to have awakened #3876 issue, as the corresponding unit test is not passing anymore. A quick look seems to reveal that that issue was never fixed in the first place. I will look into providing a proper fix for it.

