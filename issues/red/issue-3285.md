
#3285: WISH: compiler should allow custom typesets in the function spec block
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[status.reviewed] [type.task.wish] [type.compiler]
<https://github.com/red/red/issues/3285>

Currently, in all 0.6.3 versions this won't compile:
```
Red []

t!: make typeset! [number! none!]
f: func [t [t!]] []
```
producing:
```
Compiling D:\usr\redtest\2\ticket10.red ...
...using libRedRT built on 27-Mar-2018/3:35:35+3:00
*** Compilation Error: invalid datatype name: t!
*** in file: D:\usr\redtest\2\ticket10.red
*** near: [t [t!]]
```
It would be helpful for shortening func specs to have custom typesets in the code to be compiled.


Comments:
--------------------------------------------------------------------------------

On 2018-11-20T20:11:11Z, meijeru, commented:
<https://github.com/red/red/issues/3285#issuecomment-440413523>

    Curiously, the interpreter _does_  accept this without problems.

--------------------------------------------------------------------------------

On 2018-11-21T00:37:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3285#issuecomment-440481885>

    Without reading the code, I imagine this is another limitation that will have to wait for 2.0. That is, the compiler can only know about static typesets, and likely works from the standard list currently. To support new and dynamic typesets, it would have to do things differently. It would be interesting to see if it works when you modify existing typesets. e.g.
    ```
    >> any-word!: union any-word! make typeset! [refinement!]
    == make typeset! [word! set-word! lit-word! get-word! refinement!]
    ```

--------------------------------------------------------------------------------

On 2018-11-21T00:37:47Z, greggirwin, commented:
<https://github.com/red/red/issues/3285#issuecomment-440482001>

    And good for a Known Limitations wiki entry.

