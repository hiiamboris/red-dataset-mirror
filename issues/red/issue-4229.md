
#4229: [View] Regression: `base` text alignment is broken again
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4229>

**Describe the bug**

`view [base right bottom purple "mytext" 50x400 base middle center purple "mytext" 50x400]`
Up to Dec 3 2019 (when it was working):
![](https://i.gyazo.com/da54154ab72876e82f597b2a34bea38a.png)

Then Dec 10-12:
![](https://i.gyazo.com/73d3fda8f92f69c4fdb8bbae70d19cab.png)

And since Dec 20:
![](https://i.gyazo.com/586a868d5446ab9babe91e032e955756.png)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00
With 125% scale factor
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-09T14:54:11Z, 9214, commented:
<https://github.com/red/red/issues/4229#issuecomment-572596797>

    All `base-self-test.red` tests related to text positioning failed last time I ran them.

--------------------------------------------------------------------------------

On 2020-01-09T15:32:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/4229#issuecomment-572614216>

    Indeed..
    `** - base-self**************************************305 / 493 **`
    And Actions can't catch that cause VM is set up at 100% scale.

--------------------------------------------------------------------------------

On 2020-01-10T06:35:41Z, pekr, commented:
<https://github.com/red/red/issues/4229#issuecomment-572894970>

    Is text widget based upon a base? Several users spotted non-pleasant text alignment of VID text element, when followed by field or button. It looks nicer, if shifted by 3 pixels vertically:
    
    `view [style text: text on-created [face/offset: face/offset + 0x3] text right "Test text alignment:" field button "OK" []]`
    
    It might get tricky with various font sizes, but I still think that in a default mode, it could be better aligned by default ....

--------------------------------------------------------------------------------

On 2020-01-10T10:13:22Z, meijeru, commented:
<https://github.com/red/red/issues/4229#issuecomment-572973495>

    My experience is 4 pixels rather than 3, but it may depend on scaling (?).

--------------------------------------------------------------------------------

On 2020-01-10T10:32:03Z, pekr, commented:
<https://github.com/red/red/issues/4229#issuecomment-572980133>

    You might be right ... I have a 3K display set to FullHD resolution and 125% scaling, so scaling should probably be included into some calculation of offset ....

--------------------------------------------------------------------------------

On 2020-01-10T17:25:42Z, greggirwin, commented:
<https://github.com/red/red/issues/4229#issuecomment-573128572>

    `Text` is a native widget, not based on `base`, so we can't control internal facets in detail; only what the API offers. It would be great if everything worked magically, but that may not be possible, with all the system settings that may affect it. If we choose to adjust the outside position, the text may align, but then other issues will come up that may be more work for users to get around. Buttons have similar issues, which Red already deals with, because some OSs reserve space around them for a "glow" effect. 

--------------------------------------------------------------------------------

On 2020-01-30T09:23:38Z, qtxie, commented:
<https://github.com/red/red/issues/4229#issuecomment-580161267>

    Fixed by this commit: 6991283d4d90ff7a119873748cb490dad150691a

