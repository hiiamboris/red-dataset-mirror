
#1122: Console: ESC key to terminate running code, exit from multiline edits
================================================================================
Issue is closed, was reported by x8x and has 18 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1122>

Sometimes we do mistakes in code and generate infinite loops, it would be nice if the `ESC` key would terminate running code in the console.

In this case:

``` rebol
red>> parse {12^/34^/56} [collect some [keep to [lf skip | end]]]
^[^[^[^C%
```

pressing ESC key will print `^[` in the console, `CONTROL-C` will be needed to terminate the console.

Here:

``` rebol
red>> [
[    ;press ESC nothing happen
[    ]
== []
```

I would assume that we could return to prompt with `ESC` after the open bracket, but have to match open brackets with closing brackets to return to prompt.



Comments:
--------------------------------------------------------------------------------

On 2015-04-27T09:48:27Z, dockimbel, commented:
<https://github.com/red/red/issues/1122#issuecomment-96587154>

    It is not a good solution to use ESC or any other key to interrupt a native code loop like that one used in Parse. If we added support for that, we would need to check for the key stroke on every native loop, totally killing the performances.
    
    Though, ESC key could be implemented in the interpreter to exit from Red-level loops, but still it might not work 100% of the time.

--------------------------------------------------------------------------------

On 2015-04-27T09:52:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1122#issuecomment-96587687>

    For the empty block issue, it works well in the DOS console, but not on Linux.

--------------------------------------------------------------------------------

On 2015-04-27T11:10:55Z, dockimbel, commented:
<https://github.com/red/red/issues/1122#issuecomment-96611242>

    Let me know if it works fine now on Mac OSX too.

--------------------------------------------------------------------------------

On 2015-04-27T13:25:38Z, x8x, commented:
<https://github.com/red/red/issues/1122#issuecomment-96652017>

    All good, escaping now. Wondering, with an open bracket, `CONTROL-C` does't do anything, is that by design? Or should it always exit the console?

--------------------------------------------------------------------------------

On 2015-04-27T14:44:05Z, x8x, commented:
<https://github.com/red/red/issues/1122#issuecomment-96681250>

    Re: "Though, ESC key could be implemented in the interpreter to exit from Red-level loops, but still it might not work 100% of the time."
    
    I think in the console it should! After all, in the console we are either testing code or manually handling stuffs (red/console as a shell..) . In both cases losing the context of the console is worse then a small hit in performance.
    Not sure but wouldn't be possible to query the system keys buffer only once every second instead of in every native loop?

--------------------------------------------------------------------------------

On 2015-04-28T03:07:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1122#issuecomment-96894078>

    _Not sure but wouldn't be possible to query the system keys buffer only once every second instead of in every native loop?_
    
    You can query that, but there are still no way to interrupt the native loops when you want. Anyway, as I said, it might not work 100% of the time, but it should work fine 99.99% of it. ;-)

--------------------------------------------------------------------------------

On 2015-04-30T18:57:20Z, x8x, commented:
<https://github.com/red/red/issues/1122#issuecomment-97927369>

    Please add it to feature requests list. Thank you!

--------------------------------------------------------------------------------

On 2016-04-18T11:28:10Z, mydoghasworms, commented:
<https://github.com/red/red/issues/1122#issuecomment-211338467>

    @dockimbel I'm not sure I understood this discussion correctly, but it would be useful in the console to be able to interrupt any running process. 
    
    In the Rebol console, you can interrupt a process with the Escape key. E.g. the following infinite loop will be interrupted with the Esc key:
    
    `while [true] []`
    
    Currently in the Red console, Esc does not interrupt the execution. At least in Windows; you have to kill the process. (I thought that's what this issue was originally logged about, but maybe I missed something?).

--------------------------------------------------------------------------------

On 2016-04-19T07:40:47Z, xqlab, commented:
<https://github.com/red/red/issues/1122#issuecomment-211777612>

    maybe there can be a system/console/break flag as in Rebol, that determines, if you can break or not.

