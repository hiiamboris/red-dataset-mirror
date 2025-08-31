
#3280: Strange output about what happens on the source in Win1251 encoding
================================================================================
Issue is closed, was reported by Oleg-N-Cher and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3280>

I accidentally tried to open a source file in the Win1251 encoding instead of UTF-8. And that's what happened:

> *** Error: cannot access argument file:
> Face.red
> --== Red 0.6.3 ==-- 
> Type HELP for starting information. 
> 
> >>

Red certainly was not meant to work in Win1251 encoding, but exception handling/error reporting can be more informative to help understand what is really happening, not confuse.
I attach the file that reproduces this behavior.

[Face.zip](https://github.com/red/red/files/1844939/Face.zip)



Comments:
--------------------------------------------------------------------------------

On 2018-03-25T04:15:50Z, dockimbel, commented:
<https://github.com/red/red/issues/3280#issuecomment-375944292>

    Thank you for providing a test file.

