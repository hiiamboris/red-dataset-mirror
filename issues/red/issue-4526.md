
#4526: [Compiler] Internal error `defer needs a value`
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/4526>

**Describe the bug**

Compile this:
```
Red []                                 
c: context [++: make op! func [x y] []]
```
Compiler says:
```
-=== Red Compiler 0.6.4 ===-

Compiling D:\devel\red\red-src\red-master\environment\reactivity-bug2.red ...
*** Red Compiler Internal Error: Script Error : defer needs a value
*** Where: comp-word
*** Near:  [defer: fetch-functions skip pc -2]
```

**Expected behavior**

Compiles.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-09T13:51:41Z, 9214, commented:
<https://github.com/red/red/issues/4526#issuecomment-656140301>

    The same error blocks me from compiling a 750LOC test suite.

--------------------------------------------------------------------------------

On 2020-08-14T15:51:19Z, 9214, commented:
<https://github.com/red/red/issues/4526#issuecomment-674139861>

    I can no longer reproduce the original error message, although I know what's causing it. @hiiamboris?
    https://github.com/red/red/blob/b58f46e9b8ac78d6b609fbccf133adf492432c36/compiler.r#L1410

--------------------------------------------------------------------------------

On 2020-08-14T19:34:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4526#issuecomment-674239856>

    Bad if issues go away by themselves. Means they hide deeper.
    Anyway:
    ```
    Red []                                 
    c: context [**: make op! func [x y] []]
    ```
    *** Red Compiler Internal Error: Script Error : defer needs a value
    *** Where: comp-word
    *** Near:  [defer: fetch-functions skip pc -2]
    ```

