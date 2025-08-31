
#1218: Compile time lexer also mistreats paths with set-word in non-last position
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1218>

Issue #899 (now solved) concerned the run time lexer. However, the compile time lexer, instead of rejecting, e.g. `a/b:/c`or turning it into `a/b/c:` as the run time lexer used to do, simply ignores the colon and produces `a/b/c`.



Comments:
--------------------------------------------------------------------------------

On 2015-06-07T09:51:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1218#issuecomment-109731410>

    Good catch. I somehow missed it during my tests with compiled code...

