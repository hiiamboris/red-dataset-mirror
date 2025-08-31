
#58: WISH: foreach support also objects
================================================================================
Issue is open, was reported by Oldes and has 6 comment(s).
<https://github.com/red/REP/issues/58>

In `Rebol3` it is possible to use `foreach` on object types:
```
>> c: object [a: 1 b: 2] foreach [key value] c [print [key "=>" value]]
a => 1
b => 2
```
It requires two words else it throws an error:
```
>>  c: object [a: 1 b: 2] foreach [key value foo] c [print [key "=>" mold value]]
** Script error: invalid argument: foo
** Where: foreach
** Near: foreach [key value foo] c [print [key "=>" mold value]]
```
Or one word (used as a key):
```
>>  c: object [a: 1 b: 2] foreach key c [print key]
a
b
```


Comments:
--------------------------------------------------------------------------------

On 2019-12-04T09:44:04Z, hiiamboris, commented:
<https://github.com/red/REP/issues/58#issuecomment-561559247>

    Related https://github.com/red/red/issues/617

--------------------------------------------------------------------------------

On 2019-12-04T12:46:05Z, 9214, commented:
<https://github.com/red/REP/issues/58#issuecomment-561628086>

    I'd say not related but duplicated...

--------------------------------------------------------------------------------

On 2019-12-04T22:28:46Z, greggirwin, commented:
<https://github.com/red/REP/issues/58#issuecomment-561868779>

    Is there any downside to supporting this convenience? `Foreach` isn't too complex today. It would be nice not to have redundant blocks for `block!` and `word !` specs, but I doubt anyone wants to take the efficiency hit for that savings. Then it falls to `foreach-next-block`, which just gets a new clause for objects.

