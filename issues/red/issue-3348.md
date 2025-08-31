
#3348: It is not possible to set a newline at tail of a block using new-line function
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
<https://github.com/red/red/issues/3348>

This works:
```
>> b: [1 2] new-line next b true append b 3 b 
== [1 
2 3 
] 
```
But this does not works:
```
>> b: [1 2] new-line tail b true append b 3 b 
== [1 2 3]
```
Expected result is:
```
== [1 2
3]
```

PS: Rebol3 has same problem. https://github.com/rebol/rebol-issues/issues/2303


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T02:00:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3348#issuecomment-384137138>

    What you expect is not possible. The new-line marker is stored with the word/slot, not the series itself, so when you use `tail`, there is nothing for `new-line` to work against. It's like saying `new-line [] on`.

