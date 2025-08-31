
#4280: [View] custom font resets alignment for BUTTON, CHECK and RADIO
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4280>

**Describe the bug**

On Windows, changing any font settings of the `button`, `check` or `radio` face resets its text alignment.

**To reproduce**

```red
view [button "THIS" right button "THAT" right font-color red]
```

On a quick glance, it looks like `process-custom-draw` [applies](https://github.com/red/red/blob/master/modules/view/backends/windows/events.reds#L828) DrawText transforms without honoring `para!` settings.

**Expected behavior**

I expect text alignment to remain unaltered.

**Screenshots**

Without custom font:

![image](https://user-images.githubusercontent.com/15716466/73770328-815b9100-477c-11ea-83d1-a6226d651011.png)

With custom font:

![image](https://user-images.githubusercontent.com/15716466/73770235-596c2d80-477c-11ea-9bb7-c421042e5527.png)

**Platform version**

```
Red 0.6.4 for Windows built 4-Feb-2020/16:11:59+01:00 commit #811db99
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-29T15:53:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4280#issuecomment-605657829>

    I suggest reopening as while the provided snippet works, the default (unspecified) alignment is still overridden:
    ![](https://i.gyazo.com/dfc7d7969601489c65eee4187099b713.png)
    `view [button 80x50 "THIS" button 80x50 "THAT" font-color yello]`
    
    ```

