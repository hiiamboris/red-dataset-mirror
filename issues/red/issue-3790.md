
#3790: Reaction created with IS containing `collect [keep/only]` produces an error
================================================================================
Issue is closed, was reported by hiiamboris and has 20 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3790>

**Describe the bug**
```
>> make reactor! [n: 3  b: is [collect [repeat x n [keep x]]]]
== make object! [
    n: 3
    b: [1 2 3]
]
>> make reactor! [n: 3  b: collect [repeat x n [keep/only x]]]
== make object! [
    n: 3
    b: [1 2 3]
]
>> make reactor! [n: 3  b: is [collect [repeat x n [keep/only x]]]]
*** Script Error: keep has no value
*** Where: get
*** Stack: react  
```

**Expected behavior**

Third case should give the same result as the other ones.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Jan-2019/9:03:13+03:00 commit #25ef631
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-21T22:37:57Z, 9214, commented:
<https://github.com/red/red/issues/3790#issuecomment-466196417>

    I rather think that `is` [messes up](https://github.com/red/red/blob/master/environment/reactivity.red#L204) any `path!` value, not just `keep/only`.

--------------------------------------------------------------------------------

On 2019-02-21T22:47:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/3790#issuecomment-466199553>

    Right. And it will probably be enough of a fix to use get-words in place of `item/1` at [L201](https://github.com/red/red/blob/master/environment/reactivity.red#L201) and maybe other places

--------------------------------------------------------------------------------

On 2019-02-21T23:12:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/3790#issuecomment-466206945>

    Actually, this whole ticket can serve as an argument in favor of restricting paths from being *always active accessors* to *accessors active only when the function was referred to by a word*.
    
    Like this:
    `c: compose [f: (func [/r][print "invoked"])]`
    
    This is OK:
    ```
    >> c/f
    invoked
    >> c/f/r
    invoked
    ```
    But this is harmful:
    ```
    >> c/2
    invoked
    >> c/2/r
    invoked
    ```
    After all, if @dockimbel makes these mistakes on occasion - everyone will.

--------------------------------------------------------------------------------

On 2019-02-22T00:13:14Z, 9214, commented:
<https://github.com/red/red/issues/3790#issuecomment-466221368>

    ```red
    >> pick c 2
    == func [/r][print "invoked"]
    >> select c 'f
    == func [/r][print "invoked"]
    ```

--------------------------------------------------------------------------------

On 2019-02-22T02:08:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/3790#issuecomment-466244883>

    I believe L300 is the error source.

--------------------------------------------------------------------------------

On 2019-02-22T21:09:30Z, greggirwin, commented:
<https://github.com/red/red/issues/3790#issuecomment-466548772>

    Great research guys. Thanks!

--------------------------------------------------------------------------------

On 2019-09-10T21:59:39Z, dockimbel, commented:
<https://github.com/red/red/issues/3790#issuecomment-530137051>

    > I rather think that is messes up any path! value, not just keep/only.
    
    @9214 Paths processed in reaction blocks are not modified...
    
    > Actually, this whole ticket can serve as an argument in favor of restricting paths from being always active accessors to accessors active only when the function was referred to by a word.
    
    The issue in this ticket is not related to that. It's caused by not taking into account the case where the first word found in a path of length 2 is unset.
    
    > c/f vs c/2
    
    Those two paths are semantically equivalent, so introducing an arbitrary exception there breaks consistency. If you think that you can make a really good case for it, you can try that in a REP.

--------------------------------------------------------------------------------

On 2022-09-14T14:41:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/3790#issuecomment-1246871425>

    > If you think that you can make a really good case for it, you can try that in a REP.
    
    No, I reconsidered some time ago, it's fine as it is ;)
    
    There's a bigger issue with reactivity and any other preprocessing:
    ```
    >> r: reactor [a: 1 b: 2 react [b: collect [keep/only self/a]]]
    == make object! [
        a: 1
        b: [1]
    ]
    >> dump-reactions
    1:---
      Source: object [only]
       Field: only
      Action: [b: collect [keep/only self/a]]
    2:---
      Source: object [a b]
       Field: a
      Action: [b: collect [keep/only self/a]]
    ```
    (reacts to global keep :)
    
    But I don't see a solution yet.

--------------------------------------------------------------------------------

On 2022-09-25T10:14:20Z, dockimbel, commented:
<https://github.com/red/red/issues/3790#issuecomment-1257161701>

    Does not happen anymore, seems it was just a bug:
    ```
    >> r: reactor [a: 1 b: 2 react [b: collect [keep/only self/a]]]
    == make object! [
        a: 1
        b: [1]
    ]
    >> dump-reactions
    1:---
      Source: object [a b]
       Field: a
      Action: [b: collect [keep/only self/a]]
    ```

--------------------------------------------------------------------------------

On 2022-09-25T10:15:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/3790#issuecomment-1257162072>

    Ah sorry, copy/paste problem, `keep: reactor [only: 1]` missing :D
    That is, if I have a global `keep` object, reactivity cannot know that `collect` defines it's own. Which may eventually produce weird results in no so obvious scenarios.

