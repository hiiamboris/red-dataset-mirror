
#654: The word comment may be used as variable 
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/654>

comment:  1
comment {this now is not a comment anymore}

Same phenomenon in REBOL 2 and 3. Worth a warning perhaps, especially since if etc. may not be redefined!.



Comments:
--------------------------------------------------------------------------------

On 2014-02-14T23:32:20Z, dockimbel, commented:
<https://github.com/red/red/issues/654#issuecomment-35137784>

    `comment` cannot be redefined when compiled since the fix for issue #645. However, it is still possible to redefine it in the interpreter.
    
    In Red 2.0, we should be able to redefine any word, even intrinsic ones.

