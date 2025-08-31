
#5430: GUI console accepts own `print` as input
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5430>

**Describe the bug**

Whatever is last printed it tries to evaluate.

**To reproduce**

1. `view/no-wait [button "abcde" [print "abcde"]]` in GUI console
2. Click on the button
3. Close the window
4. Observe the output:
   ```
   >> 
   abcde
   *** Script Error: abcde has no value
   *** Where: catch
   *** Near : abcde
   *** Stack:  
   ```

**Expected behavior**

`print` not eaten as input

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5055 date: 20-Nov-2023/4:01:50 commit: #5092db2fb82528f1b72bf2220c81a1627dff0ab5 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-21T19:32:32Z, greggirwin, commented:
<https://github.com/red/red/issues/5430#issuecomment-1821558225>

    I noticed that in your button focus ticket. Good catch.

--------------------------------------------------------------------------------

On 2023-11-22T19:27:06Z, dockimbel, commented:
<https://github.com/red/red/issues/5430#issuecomment-1823386503>

    Regression caused by commit https://github.com/red/red/commit/fe574eacde9f08db2f83ceea579bfbea689f4e25 fixing https://github.com/red/red/issues/4940.

