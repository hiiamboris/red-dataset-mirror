
#3862: [Compiler] weird complaint about `single?` func
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/3862>

**Describe the bug**

This code cannot be compiled w/o encapping (`red -c 1.red` or `red -r 1.red`):
```
Red []
x: [1]
if single? x [print "TRUE"]
```
Compiler shows an error:
```
Compiling D:\devel\red\red-av\1.red ...                                    
...using libRedRT built on 22-Apr-2019/18:51:22                            
*** Compilation Error: expected a block for IF-BODY instead of word! value 
*** in file: D:\devel\red\red-av\1.red                                     
*** near: [x [print "TRUE"]]                                               
```
Same error appears if `unless` is used in place of `if`.

`single?` is one of the latter additions defined [here](https://github.com/red/red/blob/6dcea4a482a8528d0dab8bf18f2b63785375e689/environment/functions.red#L1051) as `single?: last?: func [...]`

However the same code compiles if `last?` is used instead of `single?`. It also compiles with many other functions from `help "?"` output that I have tried.

It also compiles if the block `x` is inlined as `if single? [1] ...`.

Changing the order `single?: last?: ..` to `last?: single?: ..` doesn't help - it still works with `last?` but not with `single?`

**Expected behavior**

Should compile.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 22-Apr-2019/19:40:30+03:00 commit #9ac4430
```



Comments:
--------------------------------------------------------------------------------

On 2019-05-01T12:58:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3862#issuecomment-488275811>

    The way the `single?` function is defined is not compatible with the compiler:
    ```
    single?: last?: func [
    ```
    The compiler processes those runtime source files specifically to extract function definitions, and you are not allowed to carelessly change those core files. Currently, the compiler only recognizes `name: func` and `name: :other-name` patterns for defining functions.
    
    Whoever made that addition in the runtime code should now fix it (trivial fix) to be compatible with the compiler.

--------------------------------------------------------------------------------

On 2019-05-01T18:31:49Z, greggirwin, commented:
<https://github.com/red/red/issues/3862#issuecomment-488370022>

    @dockimbel, I wouldn't call it a careless change. It's a compiler limitation we didn't know about, and has been in place without issue for 2 months. Why does Red build successfully with it, but not user apps?

--------------------------------------------------------------------------------

On 2019-05-01T18:35:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3862#issuecomment-488371077>

    Ah, likely because nobody used `single?` yet. 

--------------------------------------------------------------------------------

On 2019-05-01T18:45:10Z, greggirwin, commented:
<https://github.com/red/red/issues/3862#issuecomment-488374238>

    Added a note to the Compiler Limitations wiki page about it.

--------------------------------------------------------------------------------

On 2019-05-01T19:02:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/3862#issuecomment-488381269>

    Works for me.

