
#1722: Console should give error when Red/System Code is encountered
================================================================================
Issue is closed, was reported by ghost and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1722>

Currently there are no checks whether the code to be executed is R/S or not. This might confuse a newbie as he wouldn't know that only Red code can be interpreted, and not R/S.

The console should give an error in case -
-   `do %*.reds` where the `*.reds` file contains the R/S header.
-    A `*.red` file to be executed either through `red *.red` (from system console) or `do %*.red` when it -
  -  `#include`'s a `*.reds` file. (Requires https://github.com/red/red/issues/1601 first)
  - contains `#system`.

Because in these cases the ouput (if any) would be wrong and not expected.

Also, currently `red *.reds` (in system console) gives `*** Error: not a Red program!`. This error should also be changed to show that `R/S code cannot be run in the console.`



Comments:
--------------------------------------------------------------------------------

On 2017-02-16T10:55:30Z, dockimbel, commented:
<https://github.com/red/red/issues/1722#issuecomment-280299392>

    All the suggestions mentioned above should now be implemented.

--------------------------------------------------------------------------------

On 2017-02-16T14:28:18Z, DideC, commented:
<https://github.com/red/red/issues/1722#issuecomment-280344433>

    And what about `routine` definitions ?

--------------------------------------------------------------------------------

On 2017-02-16T15:51:10Z, dockimbel, commented:
<https://github.com/red/red/issues/1722#issuecomment-280369178>

    @DideC 
    ```
    red>> routine [][]
    *** Internal Error: routines require compilation, from OS shell: `red -c <script.red>`
    *** Where: d
    ```

