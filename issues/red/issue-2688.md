
#2688: suffix? allows an email! argument, which makes no sense
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2688>




Comments:
--------------------------------------------------------------------------------

On 2017-06-21T12:04:31Z, dockimbel, commented:
<https://github.com/red/red/issues/2688#issuecomment-310058018>

    Makes sense to me:
    ```
    >> suffix? name@domain.com
    == %.com
    ```

--------------------------------------------------------------------------------

On 2017-06-22T15:56:07Z, greggirwin, commented:
<https://github.com/red/red/issues/2688#issuecomment-310423515>

    The hostname/domain part is dot separated segments, though normally there is just the base name and the TLD. Currently, email! values can have more information after the hostname, which is nice, because they could hold valid XMPP/Jabber IDs and are somewhat extensible. In that case, `suffix?` works the same as it does with files. I think it's worth keeping, but having an example use-case would be nice as well.

