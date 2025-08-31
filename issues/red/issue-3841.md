
#3841: Try and Attempt do not protect against errors in "reactors"
================================================================================
Issue is open, was reported by PeterWAWood and has 12 comment(s).
[status.impending] [type.documentation]
<https://github.com/red/red/issues/3841>

**Describe the bug**
`attempt` and 'try` do not contain errors in reactive code.
```text
>> a: make reactor! [x: 1 y: 2 total: is [x + y]]
== make object! [
    x: 1
    y: 2
    total: 3
]
>> attempt [a/x: "Fred"]
*** Script Error: + does not allow string! for its value1 argument
*** Where: +
*** Stack: attempt error? 
*** Near: [x + y]
== "Fred"
```
**To reproduce**
Paste the following code in a Red console
`a: make reactor! [x: 1 y: 2 total: is [x + y]]`
`attempt [a/x: "Fred"]`

**Expected behavior**
Errors in reactive code should be contained by `attempt` and `try`.

**Platform version (please complete the following information)**

```
Red 0.6.4 for macOS built 27-Mar-2019/6:31:51+08:00
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-07T09:33:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/3841#issuecomment-480574349>

    @PeterWAWood reactive framework uses `try` itself, where it catches those errors and reports.
    What you want just won't work in the reactivity model we have, because at the time you set a source value `a/x`, you have no guarantee that (1) the reaction will be run before the expression returns and (2) you have no guarantee that the reaction will be run at all.

--------------------------------------------------------------------------------

On 2019-04-18T20:47:09Z, dockimbel, commented:
<https://github.com/red/red/issues/3841#issuecomment-484684294>

    I think error handling for reactors should be described in the Reactivity documentation.
    
    When you write `attempt [a/x: "Fred"]`, you are catching the errors produced by this precise code block. But it also triggers a reactive code that resides elsewhere. So, in order to catch reactive errors, you should add the catching code in the reactive code itself. For example:
    ```
    >> a: make reactor! [x: 1 y: 2 total: is [attempt [x + y]]]
    == make object! [
        x: 1
        y: 2
        total: 3
    ]
    >> a/x: "Fred"
    == "Fred"
    >> a
    == make object! [
        x: "Fred"
        y: 2
        total: none
    ]
    ```
    The reason why the errors are caught by the reactive framework rather than just let them pass through, is to be able to make a better error report, showing the whole reactive block where the error is coming from, as that code is not visible at the code position where the reaction is triggered. It is similar to event handlers in View, an error in an handler function will not be reported by the `view` call that started the event loop.
    
    Though, those are open topics, if a better/simpler model for the end users is possible, it is welcome.

--------------------------------------------------------------------------------

On 2019-04-19T01:28:03Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3841#issuecomment-484739499>

    I feel that this approach may be effective for "programming in the small", it is not really appropriate for "programming in the large". The wide-scale adoption of Red will depend on the availability of publicly available, useful libraries. (How many people would use Python if it wasn't for the volume of libraries, both builtin and external libraries?). 
    
    If user code cannot be protected against errors in library code, it is difficult to see it getting widely adopted. Any library code using reactors would have to be considered unsafe from a user's point of view.

--------------------------------------------------------------------------------

On 2019-04-19T17:33:53Z, greggirwin, commented:
<https://github.com/red/red/issues/3841#issuecomment-484965912>

    @PeterWAWood how is it different from a lib in any other language that can cause an error? Whether a lib using reactors is safe or not depends on if the author handles errors in it themselves. What we may find is that our PitL best practices rely on dialects written for that, to facilitate library safety, and that recommend against using reactivity in libs meant for PitL.

--------------------------------------------------------------------------------

On 2019-04-19T19:25:50Z, dockimbel, commented:
<https://github.com/red/red/issues/3841#issuecomment-484992614>

    > If user code cannot be protected against errors in library code, it is difficult to see it getting widely adopted. Any library code using reactors would have to be considered unsafe from a user's point of view.
    
    Indeed, but the alternative is having the user experience errors without being able to pinpoint from which code it is coming from, due to insufficient contextual information. Anyway, in both cases it is not really satisfying.
    
    In order to get better error report, we would need to figure out a way to map the source code (and dynamically generated code) in a useful way, and provide a meaningful location information in error reports. This is not an easy goal to achieve, as proven by Rebol never going that far.

--------------------------------------------------------------------------------

On 2019-08-14T14:15:09Z, dockimbel, commented:
<https://github.com/red/red/issues/3841#issuecomment-521264111>

    > Any library code using reactors would have to be considered unsafe from a user's point of view.
    
    Actually, it is totally safe, because the reaction errors are caught by the reactive framework, and reported, but they are "disarmed" (they are not propagated outside the framework). So the user code is not interrupted, the error is only producing an error message in the standard output. 
    
    See:
    ```
    >> attempt [a/x: "Fred"] print "ok"
    *** Script Error: + does not allow string! for its value1 argument
    *** Where: +
    *** Stack: attempt error? 
    *** Near: [x + y]
    ok
    ```
    User code is not stopped.

