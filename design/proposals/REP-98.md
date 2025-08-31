
#98: WISH: Store error value and type in the error! object on incorrect argument type
================================================================================
Issue is open, was reported by henrikmk and has 12 comment(s).
<https://github.com/red/REP/issues/98>

For the case of:

```
>> f: func [a [integer!]] [a]
== func [a [integer!]][a]
>> f now
*** Script Error: f does not allow date for its a argument
*** Where: f
*** Stack: f
```

You cannot see the value that NOW produced at the moment the error occurs. The output type of NOW is known, because it's a mature and simple function, but for complex scenarios, the output of the function might be wrong and that data is lost, when the error occurs.

The problem is particularly egregious for hard-to-reproduce cases, like networking code, because you have no option for tracing back what happened in the function, and you must insert debug output and run (many) more test cycles.

It doesn't make sense that the offending input value and its type isn't available for inspection, since it should already be "close by" in memory and is extremely useful information.

Extend the error! object with two extra fields:

```
make object! [
    code: none
    type: none
    id: none
    arg1: none
    arg2: none
    arg3: none
    arg4: none
    arg5: none
    near: none
    where: none
    stack: none
]
```

ARG4 will store the offending data type.
ARG5 will store the offending value.


Comments:
--------------------------------------------------------------------------------

On 2021-02-16T17:57:26Z, greggirwin, commented:
<https://github.com/red/REP/issues/98#issuecomment-780013763>

    I absolutely agree that the better error info we can provide, the more helpful it is to the user.
    
    I haven't looked at the code, or thought this through, but the first things that come to mind are:
    
    1) The values may be large, and complex, so we need to think about how to form those errors. e.g. does it help to see just the first part of a molded object or series? To some extent, and you could still introspect manually to see it all.
    2) It may not be clear that holding on to an error value will affect things like GC and ownership. Imagine a stack of errors you've collected, to be nice to the user when showing a final stack-trace. 
    3) What does the new func spec for `cause-error` look like? Do we add a refinement so it doesn't break all the code that uses it today, or live with the breakage? It's a smallish number in the Red code base, but will also break user code. If we're going to break it, now is better than later of course.

--------------------------------------------------------------------------------

On 2021-02-16T18:04:05Z, hiiamboris, commented:
<https://github.com/red/REP/issues/98#issuecomment-780018057>

    Re: 3> I'd argue that if user code relies on particular format in `system/catalog/errors` to stay unchanged, it's a poorly designed user code, alpha or not.

--------------------------------------------------------------------------------

On 2021-02-16T18:52:47Z, greggirwin, commented:
<https://github.com/red/REP/issues/98#issuecomment-780046474>

    I'm not talking about `system/catalog/errors`, just the `cause-error` func. If we want to add more info there, so it can be used to `make` errors and include it, that breaks things. Unless we co-opt `arg3`.

--------------------------------------------------------------------------------

On 2021-02-16T19:38:07Z, hiiamboris, commented:
<https://github.com/red/REP/issues/98#issuecomment-780071054>

    just extend it with 
    ```
    arg4: fourth args
    arg5: fifth args
    ```
    what's the problem?

--------------------------------------------------------------------------------

On 2021-02-16T19:46:01Z, greggirwin, commented:
<https://github.com/red/REP/issues/98#issuecomment-780075702>

    Yes, that's what I meant. I said `arg3` but meant `args`. The question being if that's the best way to do it. It's certainly the easiest.

--------------------------------------------------------------------------------

On 2021-02-17T23:43:09Z, dockimbel, commented:
<https://github.com/red/REP/issues/98#issuecomment-780927402>

    > ARG4 will store the offending data type.
    > ARG5 will store the offending value.
    
    If you have the value, you don't need the type also reported, as it would be redundant information.

