
#3232: [Wish] Permissions of newly created directory are too open on posix
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
<https://github.com/red/red/issues/3232>

By default, 0777 permissions are used:
https://github.com/red/red/blob/c4f8bbf221728ba84d64a95cd9ea4f310b2ffea5/runtime/simple-io.reds#L564

It would be better to lower it and be able to modify this value from `system/options` (or using some other way?). Is this a candidate for the real IO?


Comments:
--------------------------------------------------------------------------------

On 2018-02-22T18:20:23Z, Oldes, commented:
<https://github.com/red/red/issues/3232#issuecomment-367772850>

    Ok... after some [self study](https://www.avajava.com/tutorials/lessons/how-do-i-set-the-default-file-and-directory-permissions.html), now I know that `umask` is involved and limits the given permissions. So the value is completely fine there.
    
    Still I believe there could be some way how to lower the default permissions using mentioned options, so I keep it open.

--------------------------------------------------------------------------------

On 2018-03-13T10:13:19Z, dockimbel, commented:
<https://github.com/red/red/issues/3232#issuecomment-372614126>

    It would be better to reformulate a new wish ticket if you have a specific proposition, otherwise, better wait for the work on full I/O to make one. In the meantime, I'll close this ticket.

