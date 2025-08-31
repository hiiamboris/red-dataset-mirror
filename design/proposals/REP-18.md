
#18: WISH: /CASE and /TAIL refinements for REPLACE
================================================================================
Issue is open, was reported by 9214 and has 24 comment(s).
[Wish]
<https://github.com/red/REP/issues/18>

Original issue: https://github.com/red/red/issues/2845

Title.
```red
alphabet: {AaBbCc}
replace alphabet #"a" 1
probe alphabet
```
Results in
```red
"1aBbCc"
```

And as of now it's impossible to replace the lowercase `a`, because `/case` refinement is absent. For the sake of compatability, I propose to implement `/tail` too, thus making `replace` identical to R2 version:
```red
REFINEMENTS:
     /all -- Replace all occurrences
     /case -- Case-sensitive replacement
     /tail -- Return target after the last replacement position
```



Comments:
--------------------------------------------------------------------------------

On 2018-10-20T19:59:22Z, Palaing, commented:
<https://github.com/red/REP/issues/18#issuecomment-431613474>

    Rebol's version of `replace` (`source replace`) seems to work fine in Red. It has /case, /tail and even allows a function as third argument.

--------------------------------------------------------------------------------

On 2018-10-21T18:38:12Z, endo64, commented:
<https://github.com/red/REP/issues/18#issuecomment-431692930>

    @Palaing In Red's version there is also a `deep` refinement which is very useful. Red's version also supports `parse` rules. So Rebol's version is a bit limited.
    
    I've added `case` refinement and will do PR, 

--------------------------------------------------------------------------------

On 2018-10-21T18:56:00Z, endo64, commented:
<https://github.com/red/REP/issues/18#issuecomment-431694280>

    Here is my PR, @9214 @greggirwin can you please check? Note that didn't add `tail` yet. https://github.com/red/red/pull/3573

--------------------------------------------------------------------------------

On 2018-10-27T07:06:00Z, endo64, commented:
<https://github.com/red/REP/issues/18#issuecomment-433597430>

    This can be closed now as `/case` added to `replace`. We can create another one for `/tail`.

--------------------------------------------------------------------------------

On 2019-02-23T19:50:55Z, hiiamboris, commented:
<https://github.com/red/REP/issues/18#issuecomment-466685666>

    Don't wanna make a separate wish for this...
    I'd like to also have `/only` refinement for `replace` on blocks. It would then treat the replacement block as a single value.
    
    My example:
    ```
    #macro LEN3?: func [waht [path! word! block!]] [
    	replace/deep [((length? waht) / 3)] 'waht reduce [waht]
    ]
    ```
    Here I have to use `reduce [waht]` to do what could have been done by `replace/deep/only`.

--------------------------------------------------------------------------------

On 2019-02-27T22:28:44Z, greggirwin, commented:
<https://github.com/red/REP/issues/18#issuecomment-468056555>

    Adding `/only` support to `replace` makes a lot of sense. We don't have a lot of tests for `replace` right now, so step 1, IMO, is to make sure we have good coverage for the current behavior. Then it seems like it could use a review, to see if we can simplify things a bit, and add comments. It's got a lot of subtlety in there already, and this will add more. `system/words/all` is used enough that a local shortcut also makes sense to me.

--------------------------------------------------------------------------------

On 2019-06-07T18:56:55Z, hiiamboris, commented:
<https://github.com/red/REP/issues/18#issuecomment-500000664>

    Another point is deep replacement vs using a parse rule: :point_up: [June 7, 2019 9:33 PM](https://gitter.im/red/red?at=5cfaade69b50f639359be956)

--------------------------------------------------------------------------------

On 2019-06-07T19:05:37Z, greggirwin, commented:
<https://github.com/red/REP/issues/18#issuecomment-500003524>

    Looking at the original ticket, `/tail` is a tough call. I don't recall ever using it, but there is no good way to get that info otherwise. Only needed for advanced processing, but then is it useful with `/deep` or `/all`? What are the top use cases or examples?

--------------------------------------------------------------------------------

On 2019-06-07T19:11:28Z, hiiamboris, commented:
<https://github.com/red/REP/issues/18#issuecomment-500005356>

    R2:
    ```
    >> replace/all/tail "acbcd" "c" "-"
    == "d"
    ```
    with `/deep` it should probably error out, and if one day somebody finds a meaning for that - we add it.

--------------------------------------------------------------------------------

On 2019-06-07T19:18:26Z, greggirwin, commented:
<https://github.com/red/REP/issues/18#issuecomment-500007448>

    I understand *how* it works, but how/where has anyone used it in the real world? In a search of R2 code here, I found zero instances of it. And that includes all Rebol SDKs, IOS worlds, and a lot of other code.

--------------------------------------------------------------------------------

On 2019-06-07T19:50:57Z, hiiamboris, commented:
<https://github.com/red/REP/issues/18#issuecomment-500016843>

    And what about `replace` without `/all` refinement - what is the use case for it? Does just `replace` make more sense than `replace/tail`? The latter at least I can imagine being used in a loop, even intermittent with `find/tail` maybe. And will it hurt to return `/tail` by default when `/all` is not used?

--------------------------------------------------------------------------------

On 2019-06-07T21:21:00Z, greggirwin, commented:
<https://github.com/red/REP/issues/18#issuecomment-500042828>

    The most common use case for `replace` is `replace/all`, but reversing the logic and having a `/first` refinement (or other name) would a) be a huge Rebol incompatibility, and b) not fit quite as nicely with other uses of single vs `/all` behavior. Tough decision, even then, because I've tripped over that myself more than once. 
    
    I also think the vast majority of `replace` calls don't chain the return value. Only a few cases turned up where "replace/all replace/all" was found. The common pattern is strictly imperative. Call it, then call it again. 

