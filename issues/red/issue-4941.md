
#4941: Cannot use `expand-directives` within #do scope
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4941>

**Describe the bug**

I noticed my `assert.red` file is included only 126 times [during Red boot](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/everything.red) (which only takes 20 seconds), so I tried to replace `#include` with my own.
But it's not cooperating.

**To reproduce**

Create the following script:
```
Red []
#do [do/expand []]
```
or
```
Red []
#do [expand-directives []]
```
Run it and it displays some weird error in the preprocessor:
```
*** Script Error: invalid /part argument: []
*** Where: remove
*** Stack: expand-directives expand
```

**Expected behavior**

No errors. I need macros from the file expanded and remembered by the preprocessor.

**Platform version**
```
Red 0.6.4 for Windows built 22-Jul-2021/20:44:06+03:00  commit #3c8d386
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-31T19:36:06Z, dockimbel, commented:
<https://github.com/red/red/issues/4941#issuecomment-890395420>

    Are you compiling the script?

--------------------------------------------------------------------------------

On 2021-07-31T19:36:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4941#issuecomment-890395506>

    Nope, running

