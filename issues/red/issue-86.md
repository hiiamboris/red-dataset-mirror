
#86: Result value of function is last expression evaluated, even if followed by other elements 
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built]
<https://github.com/red/red/issues/86>

The documentation points out that a `return` statement is not necessary if the function evaluates an appropriate expression before the end of its body. The example (`percent?` function) seems to suggest that this expression must be the very last element, but in actual fact any number of statements, aliases etc. may follow. Should this not be made clear in the docs, or should one rather change the rules?



Comments:
--------------------------------------------------------------------------------

On 2011-06-09T14:23:52Z, meijeru, commented:
<https://github.com/red/red/issues/86#issuecomment-1334517>

    BTW sorry to fire so many issues at you, but since you are approaching beta stage, it seems best to have them all out.

--------------------------------------------------------------------------------

On 2011-06-09T14:34:53Z, dockimbel, commented:
<https://github.com/red/red/issues/86#issuecomment-1334599>

    Many issues: well, as long as it is not nitpicking, they should be posted here (or on the mailing-list, if it doesn't imply a fix).
    
    About the issue itself: I do not think that the specification draft needs to be changed, because it is a side-effect of the current implementation. It should be documented in a "Red/System User Manual" which would take into account all the implementation specific issues/pitfalls, but such document does not exists yet, nor do I plan to write one until the whole Red/System rewrite in Red. If someone wants to write one now, I would be glad to reference it from red-lang.org.

--------------------------------------------------------------------------------

On 2011-06-09T14:50:58Z, dockimbel, commented:
<https://github.com/red/red/issues/86#issuecomment-1334693>

    On second thought, I will insert a "implementation-specific" note about that in the specification, as I did for other cases.

--------------------------------------------------------------------------------

On 2011-06-20T17:26:32Z, dockimbel, commented:
<https://github.com/red/red/issues/86#issuecomment-1404243>

    Note added to specification draft.

