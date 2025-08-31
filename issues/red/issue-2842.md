
#2842: Wish: Rename the /seek refinement in READ function to /skip, and support /at refinement.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/2842>

I would like Read to remove /seek refinement, and support /skip and /at, so I can:
```Red
>> write %test.txt "ABCDEFG"
>> read/at %test.txt 4
== "DEFG"
>> read/skip %test.txt 4
== "EFG"
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T06:21:06Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2842#issuecomment-384173199>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

