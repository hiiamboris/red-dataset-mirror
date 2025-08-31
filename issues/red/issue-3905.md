
#3905: Restrict `compose` to block arg
================================================================================
Issue is closed, was reported by greggirwin and has 8 comment(s).
<https://github.com/red/red/issues/3905>

**Describe the bug**

`Compose` allows any type in the spec, but the body only supports blocks. This was initially done to match R3, which acts as a pass-thru for non-block args, but Red behaves differently.

**To reproduce**
>> compose ""
*** Script Error: expected block! not string!
*** Where: compose
*** Stack:  

>> compose 1
*** Script Error: expected block! not integer!
*** Where: compose
*** Stack:  

**Expected behavior**

Should enforce block arg in spec.

**Platform version (please complete the following information)**

All




Comments:
--------------------------------------------------------------------------------

On 2019-05-30T06:22:08Z, endo64, commented:
<https://github.com/red/red/issues/3905#issuecomment-497218834>

    @greggirwin I think `FIX: ` in the title should go to a commit message :)

--------------------------------------------------------------------------------

On 2019-05-30T15:45:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3905#issuecomment-497377372>

    Fixed.

--------------------------------------------------------------------------------

On 2019-06-01T12:43:06Z, dockimbel, commented:
<https://github.com/red/red/issues/3905#issuecomment-497942210>

    @greggirwin Is there anything else to do for this ticket or can it be closed now?

--------------------------------------------------------------------------------

On 2019-06-01T15:10:22Z, greggirwin, commented:
<https://github.com/red/red/issues/3905#issuecomment-497952449>

    Should be good to go. Just merge the PR.

