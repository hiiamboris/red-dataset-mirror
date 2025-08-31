
#3452: save will not work on binary destination
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/3452>

### Expected behavior
`save #{ } "abc"` should result in a UTF-8 encoded binary value, as a logical counterpart of `load <binary>`
### Actual behavior
```
>> save #{} " abc"
*** Script Error: suffix? does not allow binary! for its path argument
*** Where: suffix?
*** Stack: save suffix?  
```
### Steps to reproduce the problem
execute above code
### Red and platform version
any, as is evident from the source of save


Comments:
--------------------------------------------------------------------------------

On 2018-07-02T21:22:31Z, meijeru, commented:
<https://github.com/red/red/issues/3452#issuecomment-401940473>

    `save` also admits `none` for its destination argument, and that gives the same `suffix?` error; besides, it is not clear what the point is of having a `none` destination

--------------------------------------------------------------------------------

On 2018-07-02T21:25:49Z, meijeru, commented:
<https://github.com/red/red/issues/3452#issuecomment-401941435>

    Duplicates 2668 (my own 👎 ). My only excuse is that this has not at all been reacted on.

