
#3945: [Compiler] Does not recognize refinements introduced in interpreted code
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/3945>

History: https://github.com/red/red/pull/3781/files/d0cab8c6b89a88a30b5a598751f9c86877b087ac#r305997806 
https://github.com/red/red/issues/3733

**Describe the bug**

When a function is defined in interpreted code with a refinement, compiled code cannot use this refinement.

**To reproduce**
```
Red []
do [f: func [/q] bind [1] context []]
f/q
```
`red -r -d 2.red & 2.exe`:
```
root: 2542/4332, runs: 0, mem: 1090516 => 1048380, mark: 7.0ms, sweep: 0.0ms
root: 2542/4332, runs: 1, mem: 1087500 => 1087500, mark: 9.0ms, sweep: 0.0ms
*** Script Error: path none is not valid for function! type
*** Where: eval-path
*** Stack:
```

**Expected behavior**

Should work as in the interpreter, calling `f` with `q = yes`

**Platform version (please complete the following information)**
```
latest
```



Comments:
--------------------------------------------------------------------------------

On 2019-07-25T16:56:28Z, greggirwin, commented:
<https://github.com/red/red/issues/3945#issuecomment-515123448>

    I don't think so @hiiamboris. You could change what is inside the `do` block at any time, and the compiler wouldn't know about that.

--------------------------------------------------------------------------------

On 2019-07-25T17:00:32Z, greggirwin, commented:
<https://github.com/red/red/issues/3945#issuecomment-515125036>

    Another way to say it is that, by using `do`, you are clearly stating that the code is intentionally dynamic. Only a JIT compiler could then know what `f` is during a call to it.

--------------------------------------------------------------------------------

On 2019-07-25T21:52:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/3945#issuecomment-515228897>

    @dockimbel requested that I open this ticket :) Or at least that's how it seemed to me.
    I realize it's a long way from being implemented though... Another way for it to work is that compiler would wrap the code that it cannot compile into a do-block, but I don't know... 
    Feel free to close it if you so wish.

--------------------------------------------------------------------------------

On 2019-07-25T22:40:00Z, 9214, commented:
<https://github.com/red/red/issues/3945#issuecomment-515240434>

    @hiiamboris this is an interesting idea, with the caveat that instead of catching static errors it shifts all of them to running time. Also, note that prior to compiler regression fix your snippet segfaulted, and now it's an expected error.

--------------------------------------------------------------------------------

On 2019-07-25T23:24:49Z, greggirwin, commented:
<https://github.com/red/red/issues/3945#issuecomment-515250856>

    @hiiamboris I saw Doc request a ticket, but didn't know it was this one. Thanks.
    
    Shifting the errors, to runtime, as @9214 says, is not a bad solution. Red is already so dynamic, that you need to program with that in mind. 

--------------------------------------------------------------------------------

On 2019-08-14T13:02:13Z, dockimbel, commented:
<https://github.com/red/red/issues/3945#issuecomment-521236276>

    The argument block to `do` is interpreted, so the compiler is considering it as data, and therefore cannot know that `f/q` is a function call with a refinement. 
    
    It is good to have this ticket anyway, to document that behavior and catch eventual duplicated. I will mark it as `deferred`, as a JIT-compiler in the future might be able to handle such case.

