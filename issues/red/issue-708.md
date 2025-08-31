
#708: system/words shows 1 line of information
================================================================================
Issue is closed, was reported by iArnold and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/708>

red>> system
Please specify a system refinement value (/version, /words, or /platform).
red>> system/platform
== Windows
red>> system/version
== "0.4.1, 4-Mar-2014/13:10:20+1:00"
red>> system/words
== [datatype! unset! none! logic! block! string! integer! symbol! con...
red>>

(How to see more information here?)



Comments:
--------------------------------------------------------------------------------

On 2014-03-04T12:57:06Z, PeterWAWood, commented:
<https://github.com/red/red/issues/708#issuecomment-36621085>

    The behaviour is the same as Rebol. For more information read this thread on the mailing list - https://groups.google.com/forum/#!topic/red-lang/4e-YpR8nIxA
    
    Please do not file bug reports to ask how to do something.

--------------------------------------------------------------------------------

On 2014-03-04T13:05:04Z, iArnold, commented:
<https://github.com/red/red/issues/708#issuecomment-36621645>

    Right, I know how to do 
    foreach word system/words [print word] 
    but not every user that starts out with Red will have this knowledge. I am making this and other points only to help make the experience for the starting user better.
    After seeing the line above the average newbie will have a "That is not very helpful" experience.

--------------------------------------------------------------------------------

On 2014-03-04T14:05:09Z, dockimbel, commented:
<https://github.com/red/red/issues/708#issuecomment-36626373>

    Typical path followed by a newcomer:
    
    ```
    >> red
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> help
    Use HELP or ? to see built-in info:
    
        help insert
        ? insert
    
    To see all words of a specific datatype:
    
        ? native!
        ? function!
        ? datatype!
    
    Other debug functions:
    
        ?? - display a variable and its value
        probe - print a value (molded)
        source func - show source code of func
        what - show a list of known functions
        system/version - display version number and build date
    
    red>> what
    on-parse-event
    make    => Returns a new value made from a spec for that value's type.
    comment
    reflect => Returns internal details about a value via reflection.
    form    => Returns a user-friendly string representation of a value.
    mold    => Returns a source format string representation of a value.
    ...
    ```
    
    **How to see more information here?**
    `system/words` returns a block! value. How do you see the whole block if it's too long to fit on one line? You use PROBE.

