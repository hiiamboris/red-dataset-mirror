
#13: Argument type checking in Red/System compiler functions
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built]
<https://github.com/red/red/issues/13>

It occurred to me that, while most compiler functions are defined with type restrictions on their arguments, there are quite a few for which this is not the case. Example: `set-last-type: func [spec]`, where one could have had `func [spec [block!]]`, I suppose. Good for error detection and for documentation purposes, don't you agree?. 



Comments:
--------------------------------------------------------------------------------

On 2011-04-21T17:27:58Z, dockimbel, commented:
<https://github.com/red/red/issues/13#issuecomment-1040289>

    Agreed. I will make a pass through the current codebase to improve that and will pay more attention for new functions.

--------------------------------------------------------------------------------

On 2011-04-23T22:33:57Z, dockimbel, commented:
<https://github.com/red/red/issues/13#issuecomment-1048651>

    Suggestion implemented. Thanks!

