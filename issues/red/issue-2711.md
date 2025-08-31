
#2711: Win 0.6.2: memory issue loading large files
================================================================================
Issue is closed, was reported by michaeldesu and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2711>

Just doing a simple read via 
`s: read request-file`
in the REPL for some text files of size (a) 46Mb, (b) 76Mb, (c) 220Mb and found (b) & (c) fails with:

> *** Internal Error: not enough memory
> *** Where: read

JFYI only


Comments:
--------------------------------------------------------------------------------

On 2017-05-24T05:26:52Z, michaeldesu, commented:
<https://github.com/red/red/issues/2711#issuecomment-303621257>

    I tried red-24may17-3190977 and found that (b) didn't fail now.

--------------------------------------------------------------------------------

On 2017-06-29T03:33:20Z, dockimbel, commented:
<https://github.com/red/red/issues/2711#issuecomment-311853263>

    We tried loading 200MB text files, it loads fine here, as long as you have enough **free contiguous** memory for that.

