
#5060: `insert/part` does not work with negative `length`
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/5060>

Currently:
```red
a: make block! 0
b: at [1 2 3 4 5 6 7 8 9] 5
insert/part a b -2
a ;== [5 6 7 8 9] ;<---- it should be [3 4], like in Rebol!
```


Comments:
--------------------------------------------------------------------------------

On 2022-02-01T10:01:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5060#issuecomment-1026663499>

    dupe of https://github.com/red/red/issues/4106

