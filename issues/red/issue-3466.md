
#3466: invalid window positioning after it has been minimized+restored
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3466>

### Steps to reproduce the problem
In the GUI console: `view/no-wait [x: panel [base 100x100 yello green "text" base 100x100 glass green "text"]]  ? (to-image x)`
### Actual behavior
2 windows appear (I arrange them manually so they don't overlap):
![](https://i.gyazo.com/ce840417e23096603c6bdf007b21ca3f.png)

Now minimize the lower window and restore it, and it becomes blank:
![](https://i.gyazo.com/e45fcea613cf857d7cc1cdf35929f626.png)

#### Drag it around and it will draw it's contents totally off like this:
![](https://i.gyazo.com/63e9996168b3819e4bc0d3969e4846d6.png)

#### or this (here `glass` was replaced by `blue` but actual position miscalculation depends on where the window was on screen before it was hidden):
![](https://i.gyazo.com/c58d714dac8c48f325585409cecd9b88.png)

### Expected behavior
1) the contents should be in the window and not away from it
2) the contents should be shown right as the window is restored, not after moving it

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 779 date: 5-Jul-2018/15:38:08 commit: #963ec55a6bab860f8b259246f794bde6ea0172be ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-12T09:11:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/3466#issuecomment-404445567>

    related issues:
    https://github.com/red/red/issues/3336 
    https://github.com/red/red/issues/3465

--------------------------------------------------------------------------------

On 2018-08-05T06:14:11Z, qtxie, commented:
<https://github.com/red/red/issues/3466#issuecomment-410498535>

    @hiiamboris Do you still have this issue after the fix?

--------------------------------------------------------------------------------

On 2018-08-16T09:05:45Z, qtxie, commented:
<https://github.com/red/red/issues/3466#issuecomment-413477365>

    I'll close it as the minimized+restored issue is fixed.

