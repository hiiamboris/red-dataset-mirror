
#118: Make PRIN* return a logic! success status
================================================================================
Issue is closed, was reported by earl and has 2 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/118>

Kaj wrote in issue #109: "PRINT returns an integer status code. Actually, I think it would be nice if PRINT and PRIN returned a logic! success status."

This issue was extracted from the side discussion in #109. Please also see the discussion in #109 for other opinions.



Comments:
--------------------------------------------------------------------------------

On 2011-07-06T22:03:38Z, dockimbel, commented:
<https://github.com/red/red/issues/118#issuecomment-1515846>

    I weighted both options: returning a logic! status or returning the argument (like `probe` in REBOL). I chose the latter option, as it can be useful almost daily to every Red/System programmer, while the former option has a probably of being ever used by someone, close to zero. 
    
    In the exceptional case were someone would really need to know if the underlying C-lib functions or OS calls returned an error code, it can be easily verified by replacing the Red/System calls by directly low-level ones.

