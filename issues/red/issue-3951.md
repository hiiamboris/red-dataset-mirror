
#3951: Regression: parse-macros don't get substituted anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3951>

:point_up: [July 27, 2019 2:11 PM](https://gitter.im/red/bugs?at=5d3c316c8aab922429ccc272)

**Describe the bug**
Somewhere after July 1st and before July 23rd parse-pattern macros got broken.

**To reproduce**
run this code with `red --cli 1.red` or as `do %1.red`:
```
Red []
#macro [path!] function [s e] [print ["ATE" s/1] []]
invalid/path
```
It displays: 
```
*** Script Error: invalid has no value
*** Where: catch
*** Stack:
```

**Expected behavior**
It should display `ATE invalid/path`

**Platform version (please complete the following information)**
latest



Comments:
--------------------------------------------------------------------------------

On 2019-07-28T19:01:38Z, greggirwin, commented:
<https://github.com/red/red/issues/3951#issuecomment-515786646>

    https://github.com/red/red/commit/6e3a460d29153bed585efbd16041e5ab1754e9db is parse related. If not there, then in the batch of regression fixes perhaps.

--------------------------------------------------------------------------------

On 2019-07-31T09:23:28Z, 9214, commented:
<https://github.com/red/red/issues/3951#issuecomment-516770889>

    OTOH, `expand [#macro path! func [s e][[]] a/b]` works as expected, so this issue seems to be related to file preprocessing only.
    
    Surprisingly, the culprit is `[]` in Red header. Try to remove it from the original example.
    ```red
    >> load %test.red
    == [Red [] 
        #macro path! func [s e] [[]] a/b 'c/d
    ]
    >> expand load %test.red () ; with header
    [Red [] a/b 'c/d]
    >> expand skip load %test.red 2 () ; skip header
    ['c/d]
    >> expand head change/part load %test.red 'foo 2 () ; change header to an arbitrary value
    [foo 'c/d]
    >> expand head change/part load %test.red [foo []] 2 () ; change to something with [] in it
    [foo [] a/b 'c/d]
    ```

--------------------------------------------------------------------------------

On 2019-08-03T04:06:15Z, 9214, commented:
<https://github.com/red/red/issues/3951#issuecomment-517892275>

    I also vaguely recall having a similar issue back in February when testing https://github.com/red/red/issues/3771, but at that time I ruled it out as a PEBKAC on my side.

--------------------------------------------------------------------------------

On 2019-08-08T14:08:47Z, dockimbel, commented:
<https://github.com/red/red/issues/3951#issuecomment-519533965>

    @hiiamboris As the macros are mostly useful for compilation, the interpreter does not run the preprocessor by default. So when you interpreter the script from command-line or using `do`, macros won't get expanded. `do` has an `/expand` refinement for that, or you can use the `expand` function shortcut:
    ```
    >> #macro [path!] function [s e] [print ["ATE" s/1] []]
    == func [s e][print ["ATE" s/1] []]
    >> invalid/path
    *** Script Error: invalid has no value
    *** Where: catch
    *** Stack:  
    
    >> expand [#macro [path!] function [s e] [print ["ATE" s/1] []]
    [    invalid/path]
    ATE invalid/path
    []
    == []
    ```
    I don't remember the macros ever get expanded by default from the interpreter, but my memory could be wrong there. 

--------------------------------------------------------------------------------

On 2019-08-08T15:58:33Z, 9214, commented:
<https://github.com/red/red/issues/3951#issuecomment-519580092>

    @dockimbel nevertheless, this doesn't explain the following heisenbug. Here's an old build from May:
    ```red
    >> about
    Red 0.6.4 for Windows built 14-May-2019/21:12:30+05:00 commit #587a64a
    
    >> expand [#macro word! func [s e]['OK] WTF]()
    [OK]
    >> expand [[] #macro word! func [s e]['OK] WTF]()
    [[] OK]
    >> expand [#macro word! func [s e]['OK] WTF []]()
    [OK []]
    ```
    
    Everything works as expected. Now, compare it with the fresh build:
    ```red
    >> about
    Red 0.6.4 for Windows built 8-Aug-2019/12:28:05+05:00 commit #2331e25
    
    >> expand [#macro word! func [s e]['OK] WTF]()
    [OK]
    >> expand [[] #macro word! func [s e]['OK] WTF]()
    [[] WTF]
    >> expand [#macro word! func [s e]['OK] WTF []]()
    [OK []]
    ```
    i.e. `block!` or `paren!` that precede macro definition simply break preprocessor. And this is why macros don't work with Red scripts (as @hiiamboris originally reported) - because they contain a mandatory Red header (with `block!`) followed by macro definitions.

--------------------------------------------------------------------------------

On 2019-08-08T20:12:03Z, dockimbel, commented:
<https://github.com/red/red/issues/3951#issuecomment-519669916>

    @9214 Indeed. This [commit](https://github.com/red/red/commit/6e3a460d29153bed585efbd16041e5ab1754e9db) caused the regression.

