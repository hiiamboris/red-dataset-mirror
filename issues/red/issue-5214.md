
#5214: Rich-text "auto-centers" when over a background with alpha channel
================================================================================
Issue is closed, was reported by luce80 and has 52 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5214>

**Describe the bug**
When a transparent background is specified the rich-text is "automatically" centered

**To reproduce**
```
view [rich-text "Message to display" 255.255.255.255]
```
**Expected behavior**
The text should be left-aligned as that is default alignment as shown when no color or no-alpha channel is specified
```
view [rich-text "Message to display" 255.255.255]
```
**Screenshots**
https://files.gitter.im/55b1d8290fc9f982beaacceb/br1X/image.png

**Platform version**
```
>> about
Red 0.6.4 for Windows built 18-Sep-2022/3:17:02+02:00  commit #5035ab9
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-21T21:04:33Z, qtxie, commented:
<https://github.com/red/red/issues/5214#issuecomment-1254226350>

    Why not make it center by default? It's centered in `base` face.
    
    If we all agree that left-aligned should be the default, I'll do the change.

--------------------------------------------------------------------------------

On 2022-09-21T21:48:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1254262228>

    I'm for consistency. But I think left alignment default comes from use of rich-text faces inside `draw` (which itself I see as a problem, see https://github.com/red/REP/issues/124), where it makes sense.

--------------------------------------------------------------------------------

On 2022-09-21T22:54:01Z, greggirwin, commented:
<https://github.com/red/red/issues/5214#issuecomment-1254314903>

    For now I would have transparent behavior match non-transparent behavior. It's paragraph oriented, which implies left alignment in general (ignoring right-to-left G18N issues).
    
    Boris' research and comments are important, but I don't think now is the time to redesign it. When we do, let's come at it with clear use cases, and decide which fall inside and outside the eventual target scope. e.g. rich text to build a Red browser is great, document oriented, and needs to support inline links. The wild and wooly things `spaces` can do drags it toward a wormhole. I suspect there's a point of no return in the design where really advanced things fall out of scope, and a higher level elides elements as they become too small to be useful, etc.

--------------------------------------------------------------------------------

On 2022-09-22T18:06:50Z, luce80, commented:
<https://github.com/red/red/issues/5214#issuecomment-1255375179>

    In the same episode:
    ```
    view [rich-text "⚠️" font-size 40 glass]
    ```
    ![image](https://user-images.githubusercontent.com/17967405/191819654-c2ec6ab3-4ace-4487-90ce-713a59b35b24.png)
    ```
    view [rich-text "⚠️" font-size 40]
    ```
    ![image](https://user-images.githubusercontent.com/17967405/191819871-e2b7c59f-0f2c-40a1-8bdf-40b9db8ae711.png)

--------------------------------------------------------------------------------

On 2022-09-22T18:22:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1255390991>

    That looks like with transparency it's not a D2D but GDI face. Which is probably related to anti-aliasing glitches.

--------------------------------------------------------------------------------

On 2022-09-22T21:35:22Z, qtxie, commented:
<https://github.com/red/red/issues/5214#issuecomment-1255578463>

    It's a known issue. When using `face/text` only without `face/draw`, we use GDI+ to draw on the DC. That is no heavy D2D objects need to be created. It's an optimization (seems to be a premature one 😅 ). So it should be quite efficient to create _a lot of_ transparent faces to show the text. That's mainly used for writing our own `text` face to replace the native one.
    
    I think we can change it to use D2D to see if the overhead really causes some issues in real-world code.

--------------------------------------------------------------------------------

On 2022-09-23T07:17:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1255872454>

    If it's called `rich-text` it should be one ;)

--------------------------------------------------------------------------------

On 2022-09-23T09:04:34Z, qtxie, commented:
<https://github.com/red/red/issues/5214#issuecomment-1255965465>

    Well. The current way gives more options to the user. If you want to draw colored emoji, use `draw`. While if you just want simple text like `text` face (also use less resources and faster), use `face/text`.

--------------------------------------------------------------------------------

On 2022-09-23T09:39:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1255998216>

    For simple text we have a `base` face. Which I suppose is the same currently as `rich-text` :)

--------------------------------------------------------------------------------

On 2022-09-23T16:48:13Z, greggirwin, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256436989>

    I'll say again:
    
    > let's come at it with clear use cases,
    
    - Browser with embedded links (@toomasv did this simply, and nicely for help in DiaGrammar, though it still needs cursor changes on mouse-over testing)
    - Syntax highlighting in consoles, editors, and other tooling like terminals
    - Presentation software
    - Reporting/Dashboards
    - Tables/Spreadsheets
    - Word Processor/WYSIWYG editor
    - Markdown rendering
    - Rich email/messaging/chat
    - UI popups
    - ...
    
    Inline vs block elements is one distinction, but how content is created and maintained and how the code is structured to deal with it are others.

--------------------------------------------------------------------------------

On 2022-09-23T17:03:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256450116>

    How is this even related to whether rich-text face centers it's /text facet or not by default?

--------------------------------------------------------------------------------

On 2022-09-23T17:54:43Z, luce80, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256510623>

    The default text alignment is not the main problem. My last two examples shows that:
    I can not rely on a default `rich-text` alignment because it varies when alpha channel is specified
    I can not rely on colored `rich-text` emojis (preferable) because it varies when alpha channel is specified
    I can not rely on right `rich-text` emojis because a "strange rectangle" could appear when alpha channel is specified
    
    Should I really write:
    ```
    ft: make font! [size: 40]
    view [base 150x150 glass draw [font ft text 0x0 "⚠️"]]
    ```
    instead ?
    I can live with that but should be documented and perhaps an error "do not use rich-text or emojis with alpha channel" should appear.

--------------------------------------------------------------------------------

On 2022-09-23T18:19:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256530502>

    Note: you can never rely on multiple codepoint emojis to render without block boxes I'm afraid. What W11 may support, W10 may not, Android of some versions may not, while others will, and so on. And emoji look itself will highly vary across platforms depending on the emoji font used there.

--------------------------------------------------------------------------------

On 2022-09-23T18:20:42Z, greggirwin, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256531438>

    > How is this even related to whether rich-text face centers it's /text facet or not by default?
    
    How it behaves depends on how we expect to use it. Or when to use `base` vs `draw` vs `rich-text`.

--------------------------------------------------------------------------------

On 2022-09-23T18:22:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256532741>

    @greggirwin I think everything you mentioned should be using `draw`. Except popups probably.

--------------------------------------------------------------------------------

On 2022-09-23T18:29:47Z, greggirwin, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256538892>

    If @dockimbel and @qtxie agree with you, with my guess being that rich popups have little value if they contain only rich text, then we can pretty much drop `rich-text`. My feeling is that using `draw` for most of those scenarios means you'll simply end up reinventing `rich-text`.

--------------------------------------------------------------------------------

On 2022-09-23T18:40:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256547546>

    We can't drop it because it's used by `draw` currently. Besides I think the main point of having `rich-text` in VID is simply to automate it's `/data` processing by `rtd-layout`. Which is even stronger point that `box` serves (just color override).

--------------------------------------------------------------------------------

On 2022-09-23T23:46:53Z, qtxie, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256801396>

    The `rich-text!` in `draw` is a graphic object, not a face! in view, like text, image. Even it uses the same object layout as face!, they are two different objects. like image! and image face.
    
    We can add more features to `rich-text face`, for example, edit mode, scrolling. like an area face but with rich text format support.

--------------------------------------------------------------------------------

On 2022-09-24T04:17:27Z, qtxie, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256851796>

    Looks like there is a bug in string!. The length should be 1.
    ```
    >> length? "⚠️"
    == 2
    ```

--------------------------------------------------------------------------------

On 2022-09-24T07:15:20Z, qtxie, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256890774>

    > In the same episode:
    > 
    > ```
    > view [rich-text "⚠️" font-size 40 glass]
    > ```
    > 
    > ![image](https://user-images.githubusercontent.com/17967405/191819654-c2ec6ab3-4ace-4487-90ce-713a59b35b24.png)
    > 
    > ```
    > view [rich-text "⚠️" font-size 40]
    > ```
    > 
    > ![image](https://user-images.githubusercontent.com/17967405/191819871-e2b7c59f-0f2c-40a1-8bdf-40b9db8ae711.png)
    
    @luce80 Your text contains a `VARIATION SELECTOR-16` (UTF-8: EFB88F) char. https://www.fileformat.info/info/unicode/char/fe0f/index.htm
    
    ```
    >> to-binary "⚠️"
    == #{E29AA0EFB88F}
    >> to-binary #"⚠"
    == #{E29AA0}
    ```
    

--------------------------------------------------------------------------------

On 2022-09-24T08:04:43Z, qtxie, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256902595>

    @hiiamboris Two tests failed due to this change. Would you please update the tests?
    ```
    ~~~started test~~~ base-self-test
    ===group=== color rendering check
    --test-- crc-11 - base, preset colors bgnd alpha FAILED**************
    --test-- crc-11 - base, preset colors both alpha FAILED**************
    ```

--------------------------------------------------------------------------------

On 2022-09-24T08:06:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256903193>

    But I'm testing `base` not `rich-text`

--------------------------------------------------------------------------------

On 2022-09-24T08:11:03Z, qtxie, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256904031>

    @hiiamboris They use the same code path for drawing.

--------------------------------------------------------------------------------

On 2022-09-24T08:17:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256905638>

    Funny I have only one test failing, `--test-- tic-5 to-image of an image font alpha FAILED**************`

--------------------------------------------------------------------------------

On 2022-09-24T08:36:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5214#issuecomment-1256910867>

    Nevermind @qtxie, false alarms, I can't reproduce those failures even `tic-5`.

--------------------------------------------------------------------------------

On 2022-09-24T21:28:11Z, qtxie, commented:
<https://github.com/red/red/issues/5214#issuecomment-1257068100>

    @hiiamboris Good! Thanks for checking it.

