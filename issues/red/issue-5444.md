
#5444: Some lexer tracer's deadlock scenarios
================================================================================
Issue is closed, was reported by hiiamboris and has 22 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5444>

**Describe the bug**

Quoting docs:
> If an error event is ignored, the input does not advance automatically, it’s up to the callback function to set the input series to the right position for resuming the processing. Failure to do so can result in infinite loops.

So only `error` event may need manual advancement if ignored. Other events are expected to continue regardless of the value returned by the tracing function.

However lexer often deadlocks when tracer returns `false`. I don't have a full picture of these cases, but accidentally found a few:

**To reproduce**

Run any of these snippets:
```
transcode/trace "a/b:" func [e i t l k] [
	[open close]
	print [e tab k tab mold i]
	e = 'close
]
```
```
transcode/trace "a/b: " func [e i t l k] [
	[open close]
	print [e tab k tab mold i]
	no
]
```
Lexer will deadlock internally, never reaching the trace function again. Results respectively are:
```
open    1x1     "a/b:"
close   3x4     ":"
```
```
open    1x1     "a/b: "
close   3x4     ": "
```

**Expected behavior**

Should continue lexing, dropping values, as documentation states `false : drop` for these events:

<img width=600 src=https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/HtFfF8h.png />

**Platform version**
```
Red 0.6.4 for Windows built 22-Nov-2023/17:24:25+03:00  commit #34f26df
```


Comments:
--------------------------------------------------------------------------------

On 2023-12-17T16:16:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/5444#issuecomment-1859213989>

    Also I don't know if it's a bug or by design but I expected lexer to report `1x4` (and `1x5`?) pairs on `CLOSE` events here:
    ```
    >> transcode-trace "a/b"
    PRESCAN  path!        1x2          1    "a/b"
    OPEN     path!        1x1          1    "a/b"
    SCAN     word!        1x2          1    "/b"
    LOAD     word!        a            1    "/b"
    PRESCAN  word!        3x4          1    ""
    SCAN     word!        3x4          1    ""
    LOAD     word!        b            1    ""
    CLOSE    path!        3x4          1    ""
    == [a/b]
    >> transcode-trace "a/b:"
    PRESCAN  path!        1x2          1    "a/b:"
    OPEN     path!        1x1          1    "a/b:"
    SCAN     word!        1x2          1    "/b:"
    LOAD     word!        a            1    "/b:"
    PRESCAN  word!        3x4          1    ":"
    SCAN     word!        3x4          1    ":"
    LOAD     word!        b            1    ":"
    CLOSE    set-path!    3x4          1    ":"
    == [a/b:]
    ```
    Otherwise user has to make own stack of opens and closes.
    
    Another note: in the `a/b:` case the end index `5` was strangely never reported in pair values. Tracer won't be able to distinguish it from whitespace.

--------------------------------------------------------------------------------

On 2023-12-19T14:28:08Z, dockimbel, commented:
<https://github.com/red/red/issues/5444#issuecomment-1862861883>

    > Expected behavior:  Should continue lexing, dropping values, as documentation states false : drop for these events:
    
    The documentation also adds in the "Notes" section below that table:
    > If an open event is dropped, the corresponding close event should also be dropped.

--------------------------------------------------------------------------------

On 2023-12-19T14:35:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/5444#issuecomment-1862873513>

    Didn't notice :)
    What should happen if I don't follow this guideline?
    I expect lexer should generate an error event about unclosed bracket (or what should it be in the path case?)

--------------------------------------------------------------------------------

On 2023-12-19T14:36:04Z, dockimbel, commented:
<https://github.com/red/red/issues/5444#issuecomment-1862875429>

    Undefined behavior for now. I'm looking into it to see if it can be improved.

--------------------------------------------------------------------------------

On 2023-12-19T14:38:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/5444#issuecomment-1862879182>

    To drop an `open` event I think should mean that we don't enter a new series and continue loading into the same series.

--------------------------------------------------------------------------------

On 2023-12-19T15:34:36Z, dockimbel, commented:
<https://github.com/red/red/issues/5444#issuecomment-1862993497>

    That's the case already. See this [example](https://github.com/red/code/blob/master/Scripts/lexer/flatten.red).

--------------------------------------------------------------------------------

On 2023-12-19T15:45:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/5444#issuecomment-1863011999>

    So to actually drop a list we need to open it as `true` and close as `false`, right? Because if it's opened as `false` then it will be separate values already appended. And open as `false` + close as `true` makes no sense for lists? Does it make sense for strings?
    
    Something to be documented there, as it's unclear.
    
    Also unclear what it means to drop value on `prescan`. Because `prescan` doesn't know the full length of the value yet.

--------------------------------------------------------------------------------

On 2023-12-19T16:08:18Z, dockimbel, commented:
<https://github.com/red/red/issues/5444#issuecomment-1863056373>

    The fix avoids the deadlock by raising an error event if the returned values for `open` and `close` events do not match.
    
    ```
    transcode/trace "a/b:" func [e i t l k] [
        [open close]
        print [e tab k tab mold i]
        no
    ]
    ```
    output:s
    ```
    open 	1x1 	"a/b:"
    close 	3x5 	""
    == [a b]
    ```
    ```
    transcode/trace "a/b:" func [e i t l k] [
        [open close]
        print [e tab k tab mold i]
        yes
    ]
    ```
    outputs:
    ```
    open 	1x1 	"a/b:"
    close 	1x5 	""
    == [a/b:]
    ```
    
    Though, this needs more testing as paths have special code paths in the lexer. 

--------------------------------------------------------------------------------

On 2023-12-19T16:15:32Z, dockimbel, commented:
<https://github.com/red/red/issues/5444#issuecomment-1863069255>

    > So to actually drop a list we need to open it as true and close as false, right?
    
    After the fix, different returned values for `open/close` values will result in an `error` event. I still need to think this through a bit more before closing this ticket. I'm not sure that "dropping a list" is a feature that the lexer should support.

--------------------------------------------------------------------------------

On 2023-12-19T16:43:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/5444#issuecomment-1863117448>

    Now it does:
    ```
    transcode/trace "a/b: " func [e i t l k] [
    	[open close]
    	print [e tab k tab mold i]
    	no
    ]
    ```
    ```
    open    1x1     "a/b: "
    close   3x5     " "
    *** Syntax Error: (line 1) invalid path at a/b:
    *** Where: transcode
    *** Near : transcode/trace "a/b: " func [e i t l k]
    *** Stack:
    ```
    Why invalid?

--------------------------------------------------------------------------------

On 2024-02-07T19:05:24Z, dockimbel, commented:
<https://github.com/red/red/issues/5444#issuecomment-1932690692>

    I have provided a more detailed description of OPEN/CLOSE events in the following commits:
    https://github.com/red/docs/commit/16f61b9ff8b532d267b98241d30611afb3e1c8eb
    https://github.com/red/docs/commit/286ae10ee729989b1478de38ef34e793718e115d

