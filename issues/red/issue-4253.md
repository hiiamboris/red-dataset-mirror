
#4253: [View] Base started feeding on text
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4253>

**Describe the bug**

`view [base blue "AAB BBB CCC"]`

Dec 3 2019 build (OK):
![](https://i.gyazo.com/9e9a5a00f33320285509324f70005282.png)

Dec 10 2019 build:
![](https://i.gyazo.com/99ae0ec9dc6114390e39ffa97f95cb20.png)

Dec 12 2019 build:
![](https://i.gyazo.com/5b604fd51fe27d03c0fd9fb9ca349ba7.png)

Dec 20 2019 build:
![](https://i.gyazo.com/ecca2465405fbf44f2e5206cc00783e1.png)

January 8 and 13 2020 build:
![](https://i.gyazo.com/9a37ac77c980ae6731efd18b825d9717.png)

As you can see it is eating more and more letters (about 2 a month), so I expect soon there will be no more left.

**To reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

**Expected behavior**

Like on the 1st screenshot - full string is shown.



Comments:
--------------------------------------------------------------------------------

On 2020-01-21T15:43:28Z, meijeru, commented:
<https://github.com/red/red/issues/4253#issuecomment-576741706>

    On my W10 latest build, it gives 
    ![Capture](https://user-images.githubusercontent.com/743227/72819197-1cc51000-3c6d-11ea-8c9f-5198722022be.JPG)

--------------------------------------------------------------------------------

On 2020-01-21T15:54:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/4253#issuecomment-576747418>

    Then it's likely a W7-only bug ;)

--------------------------------------------------------------------------------

On 2020-03-04T17:12:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/4253#issuecomment-594671157>

    Should be reopened...
    ```
    font1: make font! [name: system/view/fonts/fixed size: 30 color: black]
    view/no-wait [
    	backdrop white
    	box 120x120 "A B C" left top font font1
    ]
    ```
    ![](https://i.gyazo.com/399e1bbaab2f25c27aa2534dea81bf87.png)
    
    Make it a little wider (130x120) and it'll be OK:
    ![](https://i.gyazo.com/00159931e31370855a7a6d30ed8ffe7a.png)

--------------------------------------------------------------------------------

On 2020-03-05T08:36:25Z, loziniak, commented:
<https://github.com/red/red/issues/4253#issuecomment-595097852>

    In Linux/GTK it seems to be ok. Although `view/no-wait [backdrop white  box 100x120 "A B C" left top font font1]` displays nothing, until I execute `view []`, then both windows are displayed at once.
    
    ![Bez nazwy](https://user-images.githubusercontent.com/5331492/75963197-5bcdbe80-5ec5-11ea-9349-d7aaeefd6e38.png)

--------------------------------------------------------------------------------

On 2020-03-05T13:33:02Z, qtxie, commented:
<https://github.com/red/red/issues/4253#issuecomment-595231545>

    @hiiamboris Is it the right behavior as you fixed the base size?

--------------------------------------------------------------------------------

On 2020-03-05T15:32:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4253#issuecomment-595291653>

    @qtxie I expect a clipped result, as with GTK.
    Like this (made using `draw`):
    ![](https://i.gyazo.com/d0a0beae00ee616fd6c0c92969c9aac2.png)

--------------------------------------------------------------------------------

On 2020-03-06T00:01:39Z, qtxie, commented:
<https://github.com/red/red/issues/4253#issuecomment-595506037>

    OK. So it's another trimming style. I'll see how to change it.

