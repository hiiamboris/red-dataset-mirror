
#2394: Switch doesn't work on word! and block! values
================================================================================
Issue is closed, was reported by maximvl and has 8 comment(s).
<https://github.com/red/red/issues/2394>

```
red>> switch 1 [1 [5]]
== 5
red>> switch 'b ['b [5]]
== none
red>> switch [b] [[b] [5]]
== none
```

I suggest to make `switch` work on all comparable types.


Comments:
--------------------------------------------------------------------------------

On 2017-01-01T10:04:51Z, meijeru, commented:
<https://github.com/red/red/issues/2394#issuecomment-269897679>

    Your second example should be `switch 'b [b [5]]` since the labels of the switch alternatives are NOT evaluated. With that change the result is correct: 5. The third example is problematic since the `switch` native allows multiple labels.

--------------------------------------------------------------------------------

On 2017-01-01T18:50:29Z, maximvl, commented:
<https://github.com/red/red/issues/2394#issuecomment-269914505>

    @meijeru thanks for reply, what do you mean by multiple labels?

--------------------------------------------------------------------------------

On 2017-01-01T18:57:05Z, meijeru, commented:
<https://github.com/red/red/issues/2394#issuecomment-269914724>

    This:
    ```
    switch 1 [1 2 [5] 3 4 [6]]
    ```
    for example. It will be impossible to allow blocks as labels because in that case one cannot know whether a block is a label or an alternative.

--------------------------------------------------------------------------------

On 2017-01-02T18:03:37Z, maximvl, commented:
<https://github.com/red/red/issues/2394#issuecomment-270003318>

    Clear enough, last one is subject to another discussion. I'm closing the issue.

