
#114: Segfault on passing callback
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/114>

I'm having no luck trying a callback, on Linux. It segfaults, and it seems to do that on passing the callback. The callback itself is never reached. Here's the import that takes the callback:

```
_zmq-as-message: "zmq_msg_init_data" [  ; Convert to new message.
    message     [message!]
    data        [binary!]
    size        [size!]
    free        [function! [data [binary!] hint [handle!]]]
    hint        [handle!]
    return:     [integer!]
]
```

The callback:

```
zmq-free-data: func [  ; Free data buffer.
    [callback]
    data        [binary!]
    hint        [handle!]
][
    free data
]
```

Here's how it's passed:

```
either as-logic _zmq-as-message message data size :zmq-free-data none [
```

The alternative is to pass `null`, which works. However, passing the callback generates an executable that's three bytes larger, so that doesn't seem right.



Comments:
--------------------------------------------------------------------------------

On 2011-06-27T01:59:24Z, earl, commented:
<https://github.com/red/red/issues/114#issuecomment-1444837>

    Here's a reduced testcase: https://gist.github.com/12072bf7775cf18a8cd4 (for Linux, requires `libzmq.so` to run).
    
    The callback is called just fine, but seems to corrupt something while running. When running the example linked to above, I get the following output:
    
    ```
    $ ./a.out
    alloc
    init
    init-rc: 0
    close
    free (42) 
    freed
    Segmentation fault
    $
    ```
    
    So the segfault occurs either in the callback's epilog (unlikely), or inside the caller (after returning from the callback). Most likely the segfault is due to clobbering registers or stack mangling (i.e. an ABI violation) which happened in the callback and then trips up the caller.

--------------------------------------------------------------------------------

On 2011-06-27T11:17:48Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/114#issuecomment-1446602>

    It still segfaults in the examples for the 0MQ binding.
    
    In my testing, a PRINT in the callback wasn't executed, so the segfault occurred there at the latest.

--------------------------------------------------------------------------------

On 2011-06-27T11:56:53Z, dockimbel, commented:
<https://github.com/red/red/issues/114#issuecomment-1446814>

    Tested Andreas' gist on Windows 7, no segfault:
    
    ```
    C:\Dev\Red\red-system\builds>test
    alloc
    init
    init-rc: 0
    close
    free (42)
    freed
    close-rc: 0
    done
    ```

--------------------------------------------------------------------------------

On 2011-06-28T20:03:46Z, earl, commented:
<https://github.com/red/red/issues/114#issuecomment-1458590>

    With those two fixes, the examples now work for me correctly on Linux with the `zmq-free-data` callback enabled.

--------------------------------------------------------------------------------

On 2011-06-28T22:02:18Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/114#issuecomment-1459408>

    Yes, the full 0MQ binding also works now. Thanks!

--------------------------------------------------------------------------------

On 2011-06-28T22:03:24Z, dockimbel, commented:
<https://github.com/red/red/issues/114#issuecomment-1459414>

    Many thanks to Andreas for taking the time to debug and fix my errors.

