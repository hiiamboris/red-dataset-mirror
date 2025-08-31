
#2503: [feature request] Better handling of newlines for VID "text"
================================================================================
Issue is open, was reported by maximvl and has 24 comment(s).
[status.waiting] [GUI]
<https://github.com/red/red/issues/2503>

Currently `text` doesn't calculate size for multiline text correctly:

![text-line-bug](https://cloud.githubusercontent.com/assets/949890/24334227/44635212-1267-11e7-81af-92bcc0720979.PNG)

It would be nice to handle such cases automatically.


Comments:
--------------------------------------------------------------------------------

On 2018-12-01T12:36:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/2503#issuecomment-443423221>

    @qtxie what do you think if we use [DrawText](https://docs.microsoft.com/en-us/windows/desktop/api/winuser/nf-winuser-drawtext) and [boundingRect](https://developer.apple.com/documentation/foundation/nsstring/1524729-boundingrect) for the purpose of calculating the size of multiline text?
    
    Also related is https://github.com/red/red/issues/3548

--------------------------------------------------------------------------------

On 2018-12-11T16:03:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/2503#issuecomment-446257081>

    Actually, just checked myself: on Mac `size-text` splits text into lines and returns the proper result.
    Even more, `a: base 100x100 "a^/b^/c"` draws a single string "abc" on screen but `size-text a` accounts for 3 lines.
    
    So it will be logical to use DrawText on Windows to obtain the size. @qtxie is it by design that `base` does not split the provided text into lines? I think it should.

--------------------------------------------------------------------------------

On 2018-12-11T18:54:26Z, greggirwin, commented:
<https://github.com/red/red/issues/2503#issuecomment-446318203>

    In R2, the basic `text` style formatted without newline by default. You had to use the `as-is` facet to render newlines. I don't thinks `as-is` is planned for Red though.

--------------------------------------------------------------------------------

On 2018-12-11T18:56:01Z, greggirwin, commented:
<https://github.com/red/red/issues/2503#issuecomment-446318746>

    Newlines should be rendered if they are in the text. If you don't want them, you can always pre-process the text. The R2 behavior may have been an internal optimization.

--------------------------------------------------------------------------------

On 2018-12-12T02:18:08Z, qtxie, commented:
<https://github.com/red/red/issues/2503#issuecomment-446436431>

    @hiiamboris 
    > what do you think if we use DrawText and boundingRect for the purpose of calculating the size of multiline text?
    
    Yes, it would work.
    
    > is it by design that base does not split the provided text into lines?
    
    I think it should render the newlines by default.

--------------------------------------------------------------------------------

On 2018-12-14T16:54:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/2503#issuecomment-447384834>

    I've started playing with DrawText. I think it will be okay for most cases, but it certainly has bugs when used in a tight window with both word-break and line-break on:
    - when I specify DT_CALCRECT flag to calculate the text size, it forgets that ^/ is also a break point (counts only spaces/tabs), so the calculation and the actual layout do not align
    - it produces different number of lines when line feed follows a space depending on horizontal alignment
    - I tried to use it on a memory DC to avoid DT_CALCRECT bugs, but the returned height value does not take word break mode into account at all, so it is not an option...
    
    Poor MS guys. How can one ruin such a simple algorithm so heavily is beyond me.

--------------------------------------------------------------------------------

On 2018-12-15T15:34:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/2503#issuecomment-447576716>

    To put the current state of text rendering on Windows on file, and later reference... here's a fistful of screenshots. This is reason enough for me to abandon GDI text output in favor of GDI+ (only need to solve https://github.com/red/red/issues/3465).
    
    Arrangement:
    
    2 text rectangle sizes: 100x100 and 30x100
    
    4 windows of each rectangle size:
    1) 1st uses solid text & backdrop (this triggers the GDI rendering code - [DrawText](https://docs.microsoft.com/en-us/windows/desktop/api/winuser/nf-winuser-drawtext)) - this is the 0.6.4/master
    2) 2nd uses alpha = 1 (this triggers the GDI+ code - [GdipDrawString](https://docs.microsoft.com/en-us/previous-versions//ms535991%28v=vs.85%29)) - 0.6.4/master
    3) 3rd is DrawText again - what is achievable using DT_CALCRECT - my locally modified branch
    4) 4rd is same as 3, but a space is added before each line break char ("^/" -> " ^/") - this does not affect GDI+ code, that's why I'm posting it for GDI only
    
    2 grids: wrapping off and on
    
    Each grid is 4x4 matrix with flags:
    - horizontally: default, left, center, right
    - vertically: default, top, middle, bottom
    
    ### 100x100
    
    1) GDI. Let's face it: left side is useless. Right side could care less about vertical alignment (DrawText documented behavior), which gives us a hint: maybe that's why R2 didn't implement line wrapping by default. Tab chars are eaten.
    ![](https://i.gyazo.com/d949ef3c7bc9bf5fdcd68e6d72bc45ba.png)
    
    2) GDI+. Left side is OK. Right side is no different. `wrap` flag was never accounted for (but it's super easy to fix). Tab chars are eaten (harder to fix, may not be worth it).
    ![](https://i.gyazo.com/0a64851f992eab3e31a059ff5a0306de.png)
    
    3) GDI improved - no extra spaces. Totally OK, for now.
    ![](https://i.gyazo.com/a38ebcb224539bd18f8ee4556628133c.png)
    
    4) GDI improved - with extra spaces. Strings anchored to the right are misaligned because of that.
    ![](https://i.gyazo.com/627a4fc65295b5f565dd38f0a2174458.png)
    
    
    ### 30x100
    
    1) GDI. Same.
    ![](https://i.gyazo.com/3fb1f00f18da85be4a00753b61d5de9e.png)
    
    2) GDI+. Same.
    ![](https://i.gyazo.com/25d5480562b2b8de39329019f14dfc73.png)
    
    3) GDI improved - no extra spaces. Note the last column - mistreatment of line breaks between DT_CALCRECT on and off drove the whole effort to hell.
    ![](https://i.gyazo.com/18554fc437a60d158635b433c0289738.png)
    
    4) GDI improved - with extra spaces. Vertical alignment is OK, but extra lines are inserted with `right` flag.
    ![](https://i.gyazo.com/0f8299df602b0d0d7b0794c1d14713a4.png)
    

--------------------------------------------------------------------------------

On 2018-12-15T19:21:28Z, greggirwin, commented:
<https://github.com/red/red/issues/2503#issuecomment-447591700>

    :+1::+1::+1: I had  to grow a new hand to give more thumbs up. The visualization helps so much. And the concrete breakdown up front, of what's being tested. Good stuff.

--------------------------------------------------------------------------------

On 2018-12-30T16:15:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/2503#issuecomment-450570760>

    https://github.com/red/red/pull/3683 partially fixes this (for Windows systems).
    What's left is to bring MacOS backend to support the same wrapping rules: "^/" should always start a new line, `sp` and `tab` - depending on the `wrap` flag of the `para` facet.
    
    See also https://github.com/red/red/issues/2757

--------------------------------------------------------------------------------

On 2019-07-30T06:29:42Z, bitbegin, commented:
<https://github.com/red/red/issues/2503#issuecomment-516282708>

    Duplicate of #3760 

--------------------------------------------------------------------------------

On 2019-07-30T08:10:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/2503#issuecomment-516313789>

    @bitbegin I do not think that a fix for Windows may cover this issue on other platforms, including MacOS. So it is premature to close it.

--------------------------------------------------------------------------------

On 2022-12-27T18:52:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/2503#issuecomment-1366105136>

    The fix for Windows regressed between `red-view-09sep22-2ba818862.exe` and `red-view-11sep22-85fa7e783.exe`

