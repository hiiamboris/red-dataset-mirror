
#5403: Seeming STACK corruption during tracing
================================================================================
Issue is closed, was reported by hiiamboris and has 18 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5403>

**Describe the bug**

I was testing the control flow transparency using `do/trace` idea when I found out tracer modifying function locals it shouldn't have access to.

This script shows the values of locals before entering trace and before leaving it:
```
Red []

following: function [code [block!] cleanup [block!]] [
	print ["before tracing: code=" mold code "cleanup=" mold cleanup]
	do/trace code does [
		[end]
		print ["in the tracer:  code=" mold :code "cleanup=" mold :cleanup]
		do cleanup
	]
]

following [exit] [print "finished"]
```
Output is:
```
before tracing: code= [exit] cleanup= [print "finished"]
in the tracer:  code= unset cleanup= end
*** Script Error: end has no value
*** Where: do
*** Near : do cleanup
*** Stack: following
```

**To reproduce**

Run the script above.

**Expected behavior**

Should print:
```
before tracing: cleanup= [print "finished"]
in the tracer:  cleanup= [print "finished"]
finished
```

**Platform version**
`Red 0.6.4 for Windows built 10-Oct-2023/18:48:47+03:00  commit #fe4c40b`


Comments:
--------------------------------------------------------------------------------

On 2023-10-12T18:54:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/5403#issuecomment-1760203747>

    https://github.com/red/red/issues/5401 may be relevant here

--------------------------------------------------------------------------------

On 2023-10-13T16:51:57Z, dockimbel, commented:
<https://github.com/red/red/issues/5403#issuecomment-1761817583>

    There is currently no checking of the passed callback spec conformity. In this case, it's expecting a function with 6 arguments and you are providing one with none, so the callback stack frame gets messed up as a result.

--------------------------------------------------------------------------------

On 2023-10-13T16:53:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/5403#issuecomment-1761819107>

    It's irrelevant. Try it.

--------------------------------------------------------------------------------

On 2023-10-13T16:55:46Z, dockimbel, commented:
<https://github.com/red/red/issues/5403#issuecomment-1761821752>

    I've tried it several times, but from the same console session. If I try from a fresh console, I can reproduce the issue even with a proper callback spec. The `exit` call is messing things up.

--------------------------------------------------------------------------------

On 2023-10-13T17:00:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/5403#issuecomment-1761827759>

    Hmm so the tests will require a separate compiled script.

--------------------------------------------------------------------------------

On 2023-10-14T11:54:21Z, dockimbel, commented:
<https://github.com/red/red/issues/5403#issuecomment-1762851990>

    So, what's happening is that when `[exit]` has been evaluated, the `following` function stack frame is released and overwritten by the tracing callback stack frame. The issue is that the `following` function has not exited yet when the tracing callback is called, so that `following` context values node is not reset to `null`. Therefore that context is still "active" and the `code` and `cleanup` words can still be resolved instead of an "context is not defined" error. `cleanup` is pointing to the stack slot where the `end` event argument for the tracing callback lies, causing the odd error.

--------------------------------------------------------------------------------

On 2023-10-14T18:57:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/5403#issuecomment-1763126453>

    I tried to work around that with a wrapper:
    ```
    following: function [code [block!] cleanup [block!]] [
    	print ["before tracing: code=" mold code "cleanup=" mold cleanup]
    	tracer-wrapper code does [
    		[end]
    		print ["in the tracer:  code=" mold :code "cleanup=" mold :cleanup]
    		do cleanup
    	]
    ]
    tracer-wrapper: func [code fun] [do/trace code :fun]
    
    following [exit] [print "finished"]
    ```
    But met the same issue as in #5401:
    ```
    before tracing: code= [exit] cleanup= [print "finished"]
    in the tracer:  code= [exit] cleanup= [print "finished"]
    finished
    *** Script Error: either does not allow unset! for its cond argument
    *** Where: either
    *** Near : unset
    *** Stack:
    ```

--------------------------------------------------------------------------------

On 2023-10-15T13:07:33Z, dockimbel, commented:
<https://github.com/red/red/issues/5403#issuecomment-1763384214>

    That's a side-effect of the main issue. The stack frame above `do/trace` is not unwound, leaving the stack frame's `arguments` and `top` pointer at wrong locations.
    
    Redesiging and simplifying the Red stack is really long-overdue...

--------------------------------------------------------------------------------

On 2023-10-15T13:32:43Z, dockimbel, commented:
<https://github.com/red/red/issues/5403#issuecomment-1763391268>

    The fix for both this ticket and #5401 consists in making `do/trace` fully capture `exit`/`return` exceptions (as if it was a `function!` call), in order to prevent the eventual words inside the tracing callback become orphans from a function context on the stack. Once that callback returns, `do/trace` then re-issues the exception, to be captured by the closest parent `function!` call.
    
    Other exceptions like `break`/`continue` might need the same treatment. I'll investigate that.

