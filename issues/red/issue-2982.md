
#2982: Crash when defining function
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
<https://github.com/red/red/issues/2982>

See this code:
```
>> *-: :-
== make op! [[
    "Returns the difference between two values" 
    ...
>>     -: make op! func [x y][
[            if not equal? length? x length? y [
[                return none
[            ]
[    
[            collect [forall x [keep subtract x/1 y/1]]
[        ]
== make op! [[x y]]
>> **-: :-
== make op! [[x y]]
>> -: func [x y][either all [block? x block? y][x **- y][x *- y]]
```

This crashes interpreter under W10 VM, under Linux it crashes also with this error message:
```
*** Script Error: length? does not allow integer! for its series argument
*** Where: length?
*** Stack: 
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-14T05:26:27Z, dockimbel, commented:
<https://github.com/red/red/issues/2982#issuecomment-329376308>

    I cannot reproduce any crash using that code, testing both on Win7 and Win10 using the latest commit.

--------------------------------------------------------------------------------

On 2017-09-14T08:38:03Z, rebolek, commented:
<https://github.com/red/red/issues/2982#issuecomment-329414169>

    I can confirm that it works fine using latest commit. Thanks!

