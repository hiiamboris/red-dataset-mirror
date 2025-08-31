
#515: Windows exception not caught
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/515>

**\* Runtime Error 101: no value matched in SWITCH
**\* at: 00419C9Fh

This happened in a Red program on Windows. My guess is that it originates in red-system/runtime/win32.reds/exception-filter which has no switch/default, so it's hard to say what error occurred.

I need to know the exception code, so could that be printed?



Comments:
--------------------------------------------------------------------------------

On 2013-08-13T21:10:13Z, dockimbel, commented:
<https://github.com/red/red/issues/515#issuecomment-22597784>

    Please send me the binary, so I can inspect it to see where does the exception really come from. There is a good chance that your assumption is right, I just need to confirm it.

--------------------------------------------------------------------------------

On 2013-08-14T00:12:06Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/515#issuecomment-22607091>

    It depends on our commercial system running, and one machine out of ten or so that exhibits this problem, so is it any use if you can't reproduce it? I need the exception code exactly to figure out what's wrong on that one machine.

--------------------------------------------------------------------------------

On 2013-08-14T07:03:34Z, dockimbel, commented:
<https://github.com/red/red/issues/515#issuecomment-22618357>

    I just wanted to look at the disassembled code to check if the exception occurs really in red-system/runtime/win32.reds/exception-filter or not. I have no need to run it. Maybe you can provide me with the disassembled code of the function where this exception occurs instead?

--------------------------------------------------------------------------------

On 2013-08-14T13:39:09Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/515#issuecomment-22635821>

    I don't even know where it occurs, except on a machine on the other side of the world. It's in the main code, I don't know in which function, but probably a ROUTINE. I'll mail you the binary later.

--------------------------------------------------------------------------------

On 2013-08-25T15:03:42Z, dockimbel, commented:
<https://github.com/red/red/issues/515#issuecomment-23229186>

    I guess this ticket can be closed now?

