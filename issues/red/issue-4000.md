
#4000: [RPi] LOAD on a very long float literal will crash
================================================================================
Issue is closed, was reported by dockimbel and has 8 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/4000>

@dockimbel I have isolated the test in load-test.red the is giving a segmentation fault:

```text
--test-- "load-41"	--assert "1.0e23"		= mold load "0.99999999999999999999999999999999999999999e+23"
```

Here is confirmation in a Red console running on ARM:
```text
>> mold load "0.99999999999999999999999999999999999999999e+23"
Segmentation fault

```

_Originally posted by @PeterWAWood in https://github.com/red/red/issues/3352#issuecomment-401671356_


Comments:
--------------------------------------------------------------------------------

On 2019-08-20T17:23:57Z, dockimbel, commented:
<https://github.com/red/red/issues/4000#issuecomment-523113560>

    ```
    load "0.99999999999999999999999999999999999999999e+23"
    ```
    is enough to reproduce the crash.

--------------------------------------------------------------------------------

On 2019-08-26T09:11:04Z, qtxie, commented:
<https://github.com/red/red/issues/4000#issuecomment-524785273>

    Looks like a regression. It works fine in an old version of the console (built on Jul 1st). While it crashes in the console built on Jul 10.

--------------------------------------------------------------------------------

On 2019-08-26T19:10:18Z, dockimbel, commented:
<https://github.com/red/red/issues/4000#issuecomment-524990273>

    Seems to be gone using latest commit from `atomic` branch. To be confirmed on master.

--------------------------------------------------------------------------------

On 2019-08-27T16:18:39Z, dockimbel, commented:
<https://github.com/red/red/issues/4000#issuecomment-525376077>

    This issue is gone, so I'm closing this ticket.

