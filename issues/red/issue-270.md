
#270: 0MQ sending segfaults on ARM
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/270>

```
pi@raspberrypi /boot/Red $ ./reply-server
0MQ version: 2.2.0

Awaiting requests...
```

```
pi@raspberrypi /boot/Red $ ./request-client
0MQ version: 2.2.0

Connecting to Hello World server...
Sending request 1
Segmentation fault
```

Similar to #269 sending passes a :free callback but shouldn't use it before the crash.



Comments:
--------------------------------------------------------------------------------

On 2012-10-15T01:15:17Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/270#issuecomment-9430291>

    Fixed by #268.

