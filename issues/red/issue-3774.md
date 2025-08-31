
#3774: Unexplained behavior when using "until" loop
================================================================================
Issue is closed, was reported by pimgeek and has 8 comment(s).
<https://github.com/red/red/issues/3774>

**Describe the bug**
 "until" loop shows weird behavior

**To reproduce**
just run the following red script
```red
Red[]

num: 4
until [
  prin "x"
	num: num - 1
	num == 0
]
```

**Expected behavior**
expect until loop to print 4 "x", but the actual result has 8 "x".

**Screenshots**
![image](https://user-images.githubusercontent.com/1609306/52251667-358fc500-2939-11e9-9cce-45c972512c1f.png)

**Platform version**
```
Red 0.6.4 for Windows built 22-Nov-2018/8:40:38+08:00 commit #755eb94

Win 10 Home Edition (1809 / 17763.292)
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-05T05:26:38Z, 9214, commented:
<https://github.com/red/red/issues/3774#issuecomment-460517560>

    This has nothing to do with `until` or any other looping construct; most likely the issue is in buffered output of GUI console engine.
    
    @pimgeek can you reproduce this bug with the [latest build](https://static.red-lang.org/dl/auto/win/red-latest.exe)?

--------------------------------------------------------------------------------

On 2019-02-05T09:31:34Z, pimgeek, commented:
<https://github.com/red/red/issues/3774#issuecomment-460569443>

    > This has nothing to do with `until` or any other looping construct; most likely the issue is in buffered output of GUI console engine.
    > 
    > @pimgeek can you reproduce this bug with the [latest build](https://static.red-lang.org/dl/auto/win/red-latest.exe)?
    
    I can reproduce this bug with `gui-console-2019-2-4-67544.exe`, but when I use `console-2019-2-4-67544.exe` or `console-2018-11-22-8164.exe` to execute the same script, the bug cannot be reproduced. 😄

--------------------------------------------------------------------------------

On 2019-02-05T21:11:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3774#issuecomment-460805330>

    This has been fixed: https://github.com/red/red/issues/3761
    
    Only the GUI console is affected.

--------------------------------------------------------------------------------

On 2019-02-05T21:12:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3774#issuecomment-460805654>

    ```
    >> num: 4
    until [
      prin "x"
    	num: num - 1
    	num == 0
    ]
    xxxx== true
    >> about/debug
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.0 ahead: 4043 date: 18-Jan-2019/21:36:17 commit: #05a4bd8c2c82fc6b232f9d500a92a7abbc85da84 ]
    PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
    --------------------------------------------
    ```

