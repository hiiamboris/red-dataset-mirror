
#2573: unmatched multiline end character in block doesn't rise error
================================================================================
Issue is closed, was reported by toomasv and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2573>

On W10 gui-console
```
>> [}]
[
```
As well
```
>> [{}}]
[
```
Also
```
>> ["}]
[
```
Should rise error.


Comments:
--------------------------------------------------------------------------------

On 2019-08-15T16:23:05Z, dockimbel, commented:
<https://github.com/red/red/issues/2573#issuecomment-521703672>

    @qtxie Closing the GUI console in debug mode after inputting `[}]`, results in the Red process continuing in the DOS window, and eating up the memory.

