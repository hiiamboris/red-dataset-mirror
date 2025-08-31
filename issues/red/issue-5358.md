
#5358: `request-file` should check filters length
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/5358>

**Describe the bug**

Any odd number of items in the /filter block results in junk:
![](https://i.gyazo.com/44b0effe1a64fc5bc0881117e18847c3.png)

**To reproduce**

1. e.g. `request-file/filter ["Filter" "*.exe" "Other"]`
2. See extensions combo box

**Expected behavior**

No junk leaked.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-07-31T11:40:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/5358#issuecomment-1658202684>

    Umbrella issue: https://github.com/red/REP/issues/132

--------------------------------------------------------------------------------

On 2023-07-31T17:28:25Z, greggirwin, commented:
<https://github.com/red/red/issues/5358#issuecomment-1658841997>

    I didn't get junk when I ran it here.
    ```
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.0 ahead: 8679 date: 25-Jul-2023/16:27:35 commit: #40096dd12ca9c3b9b47e9eaa995d425b9faf620b ]
    PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
    --------------------------------------------
    ```

--------------------------------------------------------------------------------

On 2023-07-31T18:10:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5358#issuecomment-1658907037>

    junk appears with less than 100% probability

