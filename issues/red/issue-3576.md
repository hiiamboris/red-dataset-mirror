
#3576: hello-world.gui does not compile - *** Script Error: view has no value
================================================================================
Issue is closed, was reported by mrkafk and has 8 comment(s).
<https://github.com/red/red/issues/3576>

**Describe the bug**
Example program does not compile.

**To Reproduce**
1. % cat ./hello-gui.red 
```
    Red [Needs: 'View]
    
    view [text "Hello World!"]
```

2. red -c hello-gui.red

3. 

```
% ./hello-gui 
*** Script Error: view has no value
*** Where: ???
```

**Expected behavior**

hello world displays.


**Debian 9.5 amd64**
```
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> about
Red for Linux version 0.6.3 built 24-Oct-2018/12:01:43+02:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-24T10:49:07Z, 9214, commented:
<https://github.com/red/red/issues/3576#issuecomment-432608297>

    https://github.com/red/red/issues/3557
    
    > The stable and dev (master branch) versions of Red don't include a GUI backend for Linux. There is a WIP backend for GTK on this branch which implements roughly 50% of the features.

--------------------------------------------------------------------------------

On 2019-03-22T16:44:25Z, prnsml, commented:
<https://github.com/red/red/issues/3576#issuecomment-475693265>

    It would be great if that would be mentioned somewhere in tutorial :/

--------------------------------------------------------------------------------

On 2019-03-22T18:02:59Z, greggirwin, commented:
<https://github.com/red/red/issues/3576#issuecomment-475722201>

    @tx8 we'd have to mention it everywhere. But GTK is making fast and amazing progress lately. Check out the Red/GTK chat group in Gitter.

--------------------------------------------------------------------------------

On 2022-04-06T18:19:55Z, DestyNova, commented:
<https://github.com/red/red/issues/3576#issuecomment-1090587036>

    I was thrown off by this too, since GUI components seem to be the first "Hello world" of all the Red tutorials I looked at.
    
    Could we perhaps add a note to the [download page](https://www.red-lang.org/p/download.html) letting users know that the stable version doesn't have GUI support yet? The latest master snapshot works and looks great, but segfaults when quitting the program.

