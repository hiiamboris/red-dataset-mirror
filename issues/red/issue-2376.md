
#2376: Console compilation error in newest commit
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2376>

I downloaded `red-21dec16-ae52ffe.exe` and compiled it in `C:\Program Files (x86)`. Here is the result:
````
Compiling Red GUI console...
*** Loading Error: file access error: %draw-d2d.reds
*** in file: %/C/Program%20Files%20%28x86%29/Red/modules/view/backends/windows/button.reds
*** at line: 46
```



Comments:
--------------------------------------------------------------------------------

On 2016-12-23T10:48:06Z, meijeru, commented:
<https://github.com/red/red/issues/2376#issuecomment-268972127>

    Interestingly, the line with the error is NOT in `%button.reds` but in `%gui.reds`, so the error message itself is also faulty. It may be significant that the line nr. 46 `#include %draw-d2d.reds` is just after the line `#include %button.reds`

--------------------------------------------------------------------------------

On 2016-12-23T14:39:01Z, meijeru, commented:
<https://github.com/red/red/issues/2376#issuecomment-268999055>

    I notice it has been fixed, but the error message still needs attention ;-)

--------------------------------------------------------------------------------

On 2017-02-13T12:27:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2376#issuecomment-279374904>

    The error message is correct, the file was not included in the Red binary, so the compiler could not access it. I will see if the location report can be improved.

--------------------------------------------------------------------------------

On 2017-03-27T17:24:36Z, meijeru, commented:
<https://github.com/red/red/issues/2376#issuecomment-289523444>

    Should this not be closed? It would improve your record for 0.6.2 ("only" 21 bugs left 😄 )

--------------------------------------------------------------------------------

On 2017-07-28T17:10:05Z, dockimbel, commented:
<https://github.com/red/red/issues/2376#issuecomment-318710227>

    @meijeru As author of a ticket, you should be the one closing it when it has been processed. One less thing for us to do. ;-)

