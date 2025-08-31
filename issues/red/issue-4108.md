
#4108: FORALL inside reactor does not reset series' index back to head
================================================================================
Issue is open, was reported by 9214 and has 16 comment(s).
[type.design]
<https://github.com/red/red/issues/4108>

**Describe the bug**
At the end of its normal execution, `forall` typically resets index of a series over which it iterates back to head; however, this is not the case inside a reactive object.

**To reproduce**
The following snippet
```red
r: reactor [
    a: [b]
    c: is [forall a [] none]
    probe tail? a
]
```
yields `true`.

**Expected behavior**
`a` is reset back to head, `tail? a` returns `false`.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Oct-2019/16:07:30+01:00 commit #62ca5aa
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-29T22:04:59Z, greggirwin, commented:
<https://github.com/red/red/issues/4108#issuecomment-547650255>

    Duped. Good catch!

--------------------------------------------------------------------------------

On 2019-10-29T23:49:51Z, endo64, commented:
<https://github.com/red/red/issues/4108#issuecomment-547678477>

    Why it is called twice?
    
    ```
    r: reactor [
        a: []
        c: is [print "IS" forall a [] none]
    ]
    
    ;output
    ;IS
    ;IS
    ```
    
    If you change/remove `forall` it's called once.
    Here is another example:
    
    ```
    r: reactor [
        a: []
        i: 1
        c: is [print i forall a [] i: i + 1 none]
    ]
    
    ;output
    1
    1  ;<-- Notice this!
    3
    == make object! [
        a: []
        i: 3
        c: none
    ]
    
    ```

--------------------------------------------------------------------------------

On 2019-10-30T09:04:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/4108#issuecomment-547802814>

    @endo64 
    In your last example both `a` and `i` are reactive sources to `c`. Two reactions: `i -> c` and `a -> c`.
    Step by step:
    1. Initial `is` is entered
    2. `print 1`
    3. `forall a` sets `a` to itself, triggering `a -> c`
    3.1. `print 1`
    3.2. `forall a` cannot set `a` anymore, because it's locked by the unfinished `a -> c`, preventing an infinite loop
    3.3. `i: 2` schedules `i -> c` to occur after `a -> c`
    4. `i: 3` changes `i` but does not schedule a new `i -> c` to prevent an infinite loop
    5. we're entering `i -> c` reaction
    6. `print 3`
    7. `forall a` changes `a` to itself but does not schedule `a -> c` since we never finished the chain caused by a change in `a`, to prevent an infinite loop
    8. `i: i + 1` does not change `i` because it's locked by `i -> c`, so `i` remains `3`
    9. you get your reactor molded
    
    Reactivity is dangerous ;)
    You can explain the 1st snippet now the same way.
    
    And this is the cause of the issue @9214 reports: `forall` cannot change `a` when in a reaction caused by `a`.
    To fix it one should either use `set-quiet` here: https://github.com/red/red/blob/62ca5aa9647eeba9ea8fc64ab83f14dc27408c49/runtime/natives.reds#L373
    Or set the `series/head` directly as it does while looping.
    
    Main question is: do we want `forall c` to trigger reactions set on `c` and when? It's already kind of a hack that it does not.

--------------------------------------------------------------------------------

On 2019-10-30T14:02:04Z, endo64, commented:
<https://github.com/red/red/issues/4108#issuecomment-547918827>

    @hiiamboris Thanks for the explanations, `forall` triggering reactions looks too dangerous :)

--------------------------------------------------------------------------------

On 2019-10-30T16:46:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4108#issuecomment-548002928>

    I'm for consistency :) I think that `forall` should trigger the reactions on every iteration after the 1st (right now it only does so when it finishes). 
    When you don't want that, work around by creating a local word, assigning the series to it.
    If you just don't want `forall c` to make `c` a reactive source, work around with `forall ('c)` (`is` does not collect get- or lit-words).

--------------------------------------------------------------------------------

On 2019-10-30T17:20:04Z, meijeru, commented:
<https://github.com/red/red/issues/4108#issuecomment-548018989>

    Worth a guru meditation, or other suitable wki entry, I should think

--------------------------------------------------------------------------------

On 2019-10-30T17:45:07Z, greggirwin, commented:
<https://github.com/red/red/issues/4108#issuecomment-548030745>

    @meijeru +1. This would also be a great test for a linter rule. @9214 and/or @hiiamboris would you like to add `linter` to your task list?
    
    In the early days of VB, cascading event issues were a huge, confusing problem. Bad enough if you wrote all the code yourself, but as soon as things grew, or if more than one person was involved, it was easy to create event whirlpools. 
    
    There is more than one way to address this. We can, in some cases and tools, detect cycles and warn users, like a spreadsheet does. That's the easy one. Acyclic frameworks are another. It gets much harder when you think of WWR (World Wide Reactivity), because there may be intentional scenarios, feedback loops, etc. where it's used. There we can use things like backpressure and system wide analysis and visualization to help deal with and identify them.

--------------------------------------------------------------------------------

On 2023-11-29T18:24:17Z, dockimbel, commented:
<https://github.com/red/red/issues/4108#issuecomment-1832472338>

    ```
    r: reactor [
        a: [b]
        relate c: [forall a [] none]
        probe tail? a
    ]
    ```
    returns `false` now.

