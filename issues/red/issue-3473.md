
#3473: About diaglog with wrong background in Red gui console
================================================================================
Issue is closed, was reported by bitbegin and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3473>

### Expected behavior
text's padding background is same with diaglog background
![default](https://user-images.githubusercontent.com/4469745/42854994-14f996a2-8a71-11e8-8f53-b467b248b972.png)

### Actual behavior
![default](https://user-images.githubusercontent.com/4469745/42855044-42139a48-8a71-11e8-9f7e-e0cea3e35505.png)

### Steps to reproduce the problem
open Red gui console about diaglog
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 794 date: 17-Jul-2018/8:52:28 commit: #f1ec0e8e964afe132ad297ad77ceacb04be2c390 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-20T08:41:35Z, endo64, commented:
<https://github.com/red/red/issues/3473#issuecomment-406531375>

    I confirm that is the case on Win 8.1 (didn't test on Win 10 yet)

--------------------------------------------------------------------------------

On 2018-07-23T08:10:59Z, bitbegin, commented:
<https://github.com/red/red/issues/3473#issuecomment-406975898>

    simple way to reproduce the problem
    
    ```
    view layout [title "About" size 200x200 backdrop 58.58.60 text font-color white "dddd" 150x150]
    ```

