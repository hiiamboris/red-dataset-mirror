
#4759: Draw's default font is DPI-dependent
================================================================================
Issue is closed, was reported by hiiamboris and has 48 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/4759>

**Describe the bug**

`img: draw 76x25 [pen off fill-pen red box 0x0 75x24 pen violet text 5x3 "Img-button"]`
As was revealed [in chat](https://gitter.im/red/help?at=5fd5c0c30697c1210dbaf1bc), when `font` is not specified explicitly, result varies even on W10:
from ![](https://i.gyazo.com/ea7c54924e5c3a51daeedfc0b6c9db63.png) to ![](https://i.gyazo.com/42902771c924476fbdd02ccffa3f042b.png)

**Expected behavior**

Same result on the same OS, reasonably consistent across various platforms.

**Platform version**
```
Red 0.6.4 for Windows built 4-Dec-2020/7:41:48+03:00 commit #382dd4e
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-15T19:27:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4759#issuecomment-745514357>

    Latest D2D build 1280aaf shows no text at all, just a red box. @qtxie

--------------------------------------------------------------------------------

On 2021-09-27T02:22:14Z, qtxie, commented:
<https://github.com/red/red/issues/4759#issuecomment-927456350>

    @hiiamboris I got this by using the latest Red.
    ![image](https://user-images.githubusercontent.com/1673525/134836448-45f97afd-5bf9-4b94-a024-2d3fa8f6ad63.png)
    
    On Windows, the default font size in DRAW is using `system/view/fonts/size`. And the default font name is `system/view/fonts/system`. So it depends on the OS settings.
    
    If we want same result on Windows, What default font should we use?

--------------------------------------------------------------------------------

On 2021-09-27T08:07:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4759#issuecomment-927630663>

    I never had the issue. Let's ask @Oldes if he can still reproduce the buggy behavior.

--------------------------------------------------------------------------------

On 2021-09-27T10:42:58Z, Oldes, commented:
<https://github.com/red/red/issues/4759#issuecomment-927743402>

    I can reproduce the buggy behavior. For example now I see this:
    ![image](https://user-images.githubusercontent.com/454805/134893563-8ed2638a-05bd-4a73-8a40-389087c5571a.png)
    
    It is enough to change display resolution between the image drawings.
    ![image](https://user-images.githubusercontent.com/454805/134893735-5b5f6ef9-d241-4e68-910b-d72ca426c44d.png)

--------------------------------------------------------------------------------

On 2021-09-27T10:48:50Z, Oldes, commented:
<https://github.com/red/red/issues/4759#issuecomment-927746596>

    But I think that source of the problem is, that Red is not listening to scaling change events... Console is broken as well, when I change scaling from my default 150% to 100%. The caret position is scaled down, but font is still with the same size and so is off.

--------------------------------------------------------------------------------

On 2021-09-27T10:56:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4759#issuecomment-927751096>

    So if you run console after the change it's good, but if you change resolution while console is running it becomes broken?

--------------------------------------------------------------------------------

On 2021-09-27T10:57:02Z, Oldes, commented:
<https://github.com/red/red/issues/4759#issuecomment-927751244>

    Also... I don't think the current scaling of the entire content is the correct way... because that way everything is blurred, when not using 100% scaling, which is too small on high-resolution displays. For example this is result for 200% (after restarting Red console, which seems to set correct default sizes):
    ![image](https://user-images.githubusercontent.com/454805/134895506-f51e7048-8c22-434c-9d3f-fd3b6d8e11f8.png)

--------------------------------------------------------------------------------

On 2021-09-28T02:18:30Z, qtxie, commented:
<https://github.com/red/red/issues/4759#issuecomment-928632119>

    > But I think that source of the problem is, that Red is not listening to scaling change events...
    
    The event is handled on top-level window only. Missing code to propagate it to the child faces.
    
    > img: draw 76x25 [pen off fill-pen red box 0x0 75x24 pen violet text 5x3 "Img-button"]
    
    We create a 76x25 pixels image in this case, blurring is expected if scaling it.

--------------------------------------------------------------------------------

On 2021-09-29T02:41:55Z, qtxie, commented:
<https://github.com/red/red/issues/4759#issuecomment-929777230>

    > I can reproduce the buggy behavior. For example now I see this: 
    > ![image](https://user-images.githubusercontent.com/454805/134893563-8ed2638a-05bd-4a73-8a40-389087c5571a.png)
    
    How to reproduce it? It works as expected on my Win10.

--------------------------------------------------------------------------------

On 2021-09-29T09:50:23Z, Oldes, commented:
<https://github.com/red/red/issues/4759#issuecomment-930023021>

    @qtxie my default scaling is 150%, to get the image above, I just open Red console, change scaling to 200% and run the code above. When I restart Red after scaling change, the result is like the second mentioned screenshot.

--------------------------------------------------------------------------------

On 2021-09-29T09:59:37Z, Oldes, commented:
<https://github.com/red/red/issues/4759#issuecomment-930029612>

    > We create a 76x25 pixels image in this case, blurring is expected if scaling it.
    
    And I believe, that it would be better not to create 76x25 image, but instead have 152x50 when there is scaling involved (with other sizes also scaled) and so have crystal clear image and not a blurred one as it is now. But I understand, that in this case it is a nonsense as the image is created out of `view` and so it should be 76x25. But than the window content should not be scaled.
    
    I mean, that even when I have scaling 200%, I want to be able use all pixels of the screen (2560x1440 in my case). Now I cannot. With my default scaling I can work only with screen of size 1706x960 and again, have everything blurred.

--------------------------------------------------------------------------------

On 2021-09-29T10:06:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/4759#issuecomment-930034590>

    Perhaps we should save screen DPI with the image we make, make this DPI accessible using image accessors, and have an option in Draw's `image` command to automatically scale the image depending on difference in it's DPI and current screen DPI?

--------------------------------------------------------------------------------

On 2021-09-29T10:15:58Z, Oldes, commented:
<https://github.com/red/red/issues/4759#issuecomment-930041967>

    I would prefer to have windows not scaled as it is now. Or have it possible to turn the scaling off.
    When I do: `view [box red 200x200]`, I want to have the box (when I do a screenshot) having size 200x200 and not 300x300 as it is now with my default scaling.

--------------------------------------------------------------------------------

On 2021-09-29T10:22:06Z, Oldes, commented:
<https://github.com/red/red/issues/4759#issuecomment-930046439>

    The problem is, that (if I'm not wrong) if the window is scaled or not is defined in the application manifest and so cannot be changed on runtime. I bet that current setting means, that application is not DPI aware and so it leaves it on OS to scale everything.

--------------------------------------------------------------------------------

On 2021-09-29T10:23:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4759#issuecomment-930047072>

    But then you'll have to deal with the scaling manually in all programs, putting View way behind it's competitors.

--------------------------------------------------------------------------------

On 2021-09-29T10:24:07Z, Oldes, commented:
<https://github.com/red/red/issues/4759#issuecomment-930047798>

    I should correct myself... current setting is something in between, because native widgets are clear (not blurred).

--------------------------------------------------------------------------------

On 2021-09-29T10:26:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4759#issuecomment-930049138>

    > 
    > 
    > The problem is, that (if I'm not wrong) if the window is scaled or not is defined in the application manifest and so cannot be changed on runtime. I bet that current setting means, that application is not DPI aware and so it leaves it on OS to scale everything.
    
    No, this change was deliberate. https://github.com/red/red/commit/b3da143e621e8b254c8e9e8a7a9b4652dfc30d04

--------------------------------------------------------------------------------

On 2021-09-29T10:26:55Z, Oldes, commented:
<https://github.com/red/red/issues/4759#issuecomment-930049745>

    I don't know View competitors, but I'm pretty sure, that when I do `view [image img]`, I want to see the image without scaling, unless I define the scaling myself.

--------------------------------------------------------------------------------

On 2021-09-29T10:29:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/4759#issuecomment-930051576>

    > I don't know View competitors, but I'm pretty sure, that when I do `view [image img]`, I want to see the image without scaling, unless I define the scaling myself.
    
    That reasoning may apply to e.g. image viewer program's default scaling.
    But if you're displaying an image e.g. on a button you want it to scale with the button proportionally. To avoid visible blurring you just have to use higher-res (like 4x) image in the first place.

--------------------------------------------------------------------------------

On 2021-09-29T18:39:05Z, greggirwin, commented:
<https://github.com/red/red/issues/4759#issuecomment-930443760>

    Can we list a few competitors, and see how they do it?

--------------------------------------------------------------------------------

On 2021-09-29T18:48:54Z, greggirwin, commented:
<https://github.com/red/red/issues/4759#issuecomment-930450634>

    There is a central tension here as well. The explosion of ultra high res displays doesn't benefit all content or use cases equally. You can increase font size, and scale vector elements, but scaling up raster images is going to create artifacts no matter what. This is why we have things like 1Kx1K icons and mobile apps that are hundreds of MB largely due to resources. `</rant>`

--------------------------------------------------------------------------------

On 2021-09-29T19:10:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/4759#issuecomment-930465926>

    > Can we list a few competitors, and see how they do it?
    
    [WinForms](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/forms/autoscale?view=netdesktop-5.0) automatically scales the window and you can control scaling application and limits for each widget.
    [WPF](https://docs.microsoft.com/en-us/windows/win32/hidpi/declaring-managed-apps-dpi-aware) (and later tech: UWP, MAUI) draws everything as vectors and even under the magnifying glass it will look sharp:
    ![](https://lh3.googleusercontent.com/-7ZHsHMvohDc/WbFbZQFQj_I/AAAAAAAANqs/tqSOu4dR-goj6Dx5JMdvPEMoEleCYnTLgCHMYCw/Magnifier_magnifier_withborder_thumb%255B2%255D?imgmax=800)
    Though one has to make the app "per-monitor" DPI aware if one expects it to scale sharply when it's moved at runtime from one monitor to another.

--------------------------------------------------------------------------------

On 2021-09-29T19:39:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4759#issuecomment-930485329>

    > For the most part, automatic scaling works as expected in Windows Forms. However, font scheme changes can be problematic.
    
    :^)
    
    The WinForms page outlines some good details about how they approach it. e.g. design time container resolutions.

--------------------------------------------------------------------------------

On 2022-09-07T04:01:10Z, qtxie, commented:
<https://github.com/red/red/issues/4759#issuecomment-1238880346>

    1. Image! is independent of view. It works with raw pixels. Making a 4x4 image, result in a 4 pixels x 4 pixels image.
    2. View scales the faces according to the OS's DPI setting. One can scale down it by using `system/view/metrics/dpi` if needed.
    ```
    pixel-sz: img/size * (100.0 / system/view/metrics/dpi)
    view [image pixel-sz img]
    ```
    
    The original issue (font issue) is fixed on my Win10. I'll close this issue.

