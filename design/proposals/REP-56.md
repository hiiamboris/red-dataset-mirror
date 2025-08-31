
#56: WISH: interpreted equivalent of #include (for macro import)
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/REP/issues/56>

I'd like to import macros from another file, and can do that with #include. But I'd like to be able to do that using `do/expand` or something. Like to be able to import these from console, for example.

This is how `do/expand` is different from interpreted `#include`:
Got 3 files here and output of the last two:
```
>type 1.red
Red [] #macro ['NOT-EXPANDED] func [s e] [ [EXPANDED] ]

>type 2.red
Red [] #include %1.red probe [NOT-EXPANDED]

>type 3.red
Red [] do/expand %1.red probe [NOT-EXPANDED]

>red "2.red"
[EXPANDED]

>red "3.red"
[NOT-EXPANDED]
```

I'd like `red "3.red"` to print "EXPANDED" somehow using `do`. In this simple example I can wrap the rest of the code (after `do`) into a `do/expand`, but when I'm importing like 5 files with macros and require another `do/expand` level after each import, it becomes annoying.


Comments:
--------------------------------------------------------------------------------

On 2019-11-07T21:15:16Z, 9214, commented:
<https://github.com/red/REP/issues/56#issuecomment-551267427>

    ```red
    expand probe rejoin [load %1.red [NOT-EXPANDED]]
    ```
    ```red
    [Red [] #macro ['NOT-EXPANDED] func [s e] [[EXPANDED]] [NOT-EXPANDED]]
    [Red [] [EXPANDED]]
    ````

--------------------------------------------------------------------------------

On 2020-02-19T23:16:52Z, hiiamboris, commented:
<https://github.com/red/REP/issues/56#issuecomment-588524244>

    Also this is clearly a lie:
    ```
    Red []
    probe [#include %myfile.red]
    ```
    Output is: `[do %myfile.red]`

