
#3544: Wait is not interrupted by Escape key in the Red console
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/3544>

### Expected behavior
Pressing the escape key while the console is "waiting" interrupts `wait`.
### Actual behavior
The escape key is ignored in the cli console on macOS and does not interrupt the `wait` function.
The escape key does not interrupt the 'wait' function but is processed by the GUI console after the `wait` function has completed (both Windows 7 and macOS). 
### Steps to reproduce the problem
Enter `wait 30` in a Red console and immediately press the escape key.
### Red and platform version
```
commit 51240a02fecf996a35cc79c398c95bf7764493e0 (HEAD -> master, upstream/master, origin/master, origin/HEAD)
Date:   Mon Sep 24 17:34:26 2018 -0600

Windows 7 x64
macOS 10.12.6
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-13T11:37:09Z, dockimbel, commented:
<https://github.com/red/red/issues/3544#issuecomment-446938031>

    Escape key interception for interrupting `wait` or just evaluation process is a planned feature that is not yet implemented 

