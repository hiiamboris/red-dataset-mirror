
#5212: FIND/SAME on blocks never matches
================================================================================
Issue is closed, was reported by dockimbel and has 12 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5212>

**Describe the bug**
`find/same` on block arguments never finds the 2nd argument block in the 1st one.

**To reproduce**
```
blk: [1]
append/only list: make block! 1 blk
find/same list blk
```
results in:
```
none
```

**Expected behavior**
Should return `[[1]]`.

**Platform version**
All.



Comments:
--------------------------------------------------------------------------------

On 2022-09-19T11:13:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/5212#issuecomment-1250881844>

    `find/same/only`

--------------------------------------------------------------------------------

On 2022-09-19T11:21:25Z, dockimbel, commented:
<https://github.com/red/red/issues/5212#issuecomment-1250888921>

    So intuitive that I forgot about that rule! 🙈 

--------------------------------------------------------------------------------

On 2022-09-19T11:23:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/5212#issuecomment-1250890578>

    Regularly being caught by it myself :D

--------------------------------------------------------------------------------

On 2022-09-19T18:13:50Z, greggirwin, commented:
<https://github.com/red/red/issues/5212#issuecomment-1251374423>

    `/same` could imply `/only`. We have a few other cases where one refinement implies another. By definition `/same | same?` means "single value", right?

--------------------------------------------------------------------------------

On 2022-09-19T18:40:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/5212#issuecomment-1251404725>

    no more special cases please, we already have enough :)

--------------------------------------------------------------------------------

On 2022-09-19T20:22:44Z, greggirwin, commented:
<https://github.com/red/red/issues/5212#issuecomment-1251510455>

    So the current behavior means that the values in the `value` are all the same as in the `series`? e.g.
    ```
    a-0: ["A" @aa]
    a-1: copy a-0
    a-2: copy/deep a-0
    
    blk: compose [(a-2) (a-1) (a-0)]
    
    find blk a-0
    find blk a-1
    find blk a-2
    
    find/same blk a-0
    find/same blk a-1
    find/same blk a-2
    ```
    Which gives us both options, at the cost of tripping over it once in a while.

