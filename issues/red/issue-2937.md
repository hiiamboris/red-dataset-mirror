
#2937: Buttons are wrongly re-ordered
================================================================================
Issue is open, was reported by ghost and has 8 comment(s).
[GUI]
<https://github.com/red/red/issues/2937>

Buttons (designed across) from left to right:

'New', 'Edit', 'Delete', 'Cancel', 'Save'

are re-ordered to:

'New', 'Edit', 'Cancel', 'Save', 'Delete'



Comments:
--------------------------------------------------------------------------------

On 2020-07-15T10:18:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/2937#issuecomment-658683685>

    `view collect [foreach n ["New" "Edit" "Delete" "Cancel" "Save"] [keep 'button keep n]]`

--------------------------------------------------------------------------------

On 2020-07-15T10:33:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/2937#issuecomment-658690576>

    MS contradicts itself (about "Help"), as usual:
    
    [From here](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/bb246415(v=vs.85))
    ![](https://i.gyazo.com/8506d278157841de07c2c7ee802aa610.png) 
    
    [From here](https://docs.microsoft.com/en-us/windows/win32/uxguide/win-dialog-box)
    ![](https://i.gyazo.com/fc5111f3c475ec473493c46da9b6b6e9.png) 
    
    But otherwise, `Yes` -> `No` -> `Cancel` -> `Apply`. VID treats both "Delete" and "Cancel" as the same button, which is an oversight.

--------------------------------------------------------------------------------

On 2020-07-15T18:20:24Z, greggirwin, commented:
<https://github.com/red/red/issues/2937#issuecomment-658925667>

    @hiiamboris your example, and reading the tickets and rule code made me think of something else.
    
    `view collect [foreach n ["New" "Edit" "Delete" "Cancel" "Save"] [keep 'button keep n keep 50 + random 100]]`
    
    If we don't also enforce sizes, or add more logic, the results aren't good. 

--------------------------------------------------------------------------------

On 2020-07-15T19:25:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/2937#issuecomment-658959830>

    Nice find (;

