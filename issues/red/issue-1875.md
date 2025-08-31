
#1875: Area face clips some characters with diacritics (Arabic character set) 
================================================================================
Issue is open, was reported by meijeru and has 20 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/1875>

I am reviving an old project (programmed in Euphoria at the time) to display Arabic script -- for teaching purposes. In Red, I can use an `area` face and set the text to a 16-bit character string. Windows will take care of the correct display (ligatures, diacritics). Depending on the font, the diacritics are fully shown OR the text is clipped in height. Not sure whether this is a Red issue or a property of the Windows display routines used. In the Euphoria version I used a RichEdit control, not provided (yet??) by Red.
Test program:

```
Red [ ]
win: layout [arab-text: area 200x100 right font-size: 36]
arab-text/text: "^(0627)^(0644)^(0644)^(0651)^(064F)^(063A)^(064E)^(0629)"
arab-text/font/name: "Courier New"
view win
```

Set the font name to "Arial Unicode MS" and you will see two diacritics on top of each other on the third letter from the right. In other fonts (part of) these diacritics disappear.

For the curious: the text spells "the language" (al-lugha in transcription).



Comments:
--------------------------------------------------------------------------------

On 2016-05-03T11:43:50Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1875#issuecomment-216503531>

    I felt it was worth checking if the issue was caused by the font rather than Red. To do that I made a LiveCode stack that I could run on both OS X and Windows.
    
    The LiveCode stack seems to display the text with all its diacritics using Arial Unicode MS on OS X but not on Windows. (I am using Windows 7). The View and LiveCode displays look very similar on Windows.
    
    I've attached a couple of screenshots.
    
    Note: Screenshots removed, corrected and posted in a new comment

--------------------------------------------------------------------------------

On 2016-05-03T11:50:10Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1875#issuecomment-216505482>

    I thought that both View and LiveCode may have been restricted by the line height. I changed the line height of the LiveCode display to 64pt (from 48pt). It made no difference.

--------------------------------------------------------------------------------

On 2016-05-03T16:22:23Z, meijeru, commented:
<https://github.com/red/red/issues/1875#issuecomment-216583669>

    What you show as being Windows (7) is NOT in Arial Unicode MS font. Your version of Windows 7 must have substituted another font. It would be important to verify that your Windows 7 provides the Arial Unicode MS font. 

--------------------------------------------------------------------------------

On 2016-05-03T23:43:27Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1875#issuecomment-216699648>

    I checked an Arial Unicode MS font was not installed in my version of Windows 7. I have installed it and reproduced the screen shots:
    <img width="478" alt="arial unicode ms os x" src="https://cloud.githubusercontent.com/assets/697434/15001619/c3a7b1fa-11cb-11e6-8158-e755b36b6c18.png">
    <img width="742" alt="arial unicode ms windows" src="https://cloud.githubusercontent.com/assets/697434/15001623/c6688df6-11cb-11e6-91c0-c722245aa56c.png">

--------------------------------------------------------------------------------

On 2016-05-04T02:04:13Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1875#issuecomment-216721541>

    Here are the equivalent screenshots of the same text using Courier New. You can see that both View and LiveCode lose the top diacritic over the middle character in Windows but it is visible in OS X.
    
    (I've submitted a bug report to LiveCode about the different rendering in OS X and Windows. I'll report back if their feedback is helpful.)
    
    <img width="512" alt="courier os x" src="https://cloud.githubusercontent.com/assets/697434/15003541/70e79322-11df-11e6-810b-49ed9789d1b1.png">
    <img width="746" alt="courier windows" src="https://cloud.githubusercontent.com/assets/697434/15003547/747c5356-11df-11e6-91d4-7543c064c0dc.png">

--------------------------------------------------------------------------------

On 2016-05-04T08:49:47Z, meijeru, commented:
<https://github.com/red/red/issues/1875#issuecomment-216793672>

    Thanks for the help. With Courier New the diacritic is only barely visible in OS X though...

--------------------------------------------------------------------------------

On 2016-05-04T09:22:57Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1875#issuecomment-216808886>

    When I added an empty line above the arabic text in OS X, the top diacritic can be seen properly.
    <img width="484" alt="courier os x 2nd line" src="https://cloud.githubusercontent.com/assets/697434/15010075/cd2c228c-121c-11e6-8d3b-e9ffad0c875d.png">

--------------------------------------------------------------------------------

On 2016-05-04T09:24:28Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1875#issuecomment-216809180>

    This leads me to suspect that the problem is related to the height of the area in which text is being rendered or spacing between lines. Though I'm not sure if this the issue with View and Windows.

--------------------------------------------------------------------------------

On 2016-05-04T14:42:19Z, meijeru, commented:
<https://github.com/red/red/issues/1875#issuecomment-216886591>

    With regard to font height, I may recommend study of the Windows `EnumFontFamiliesEx` function. I used it in the Euphoria program I mentioned, in order to discover which fonts there were in my version of the OS that had an Arabic character set, and to set several parameters including font height. I should get around to re-implementing a call to this function from my Red program using Red/System's facilities.

--------------------------------------------------------------------------------

On 2020-03-21T18:46:31Z, 9214, commented:
<https://github.com/red/red/issues/1875#issuecomment-602085950>

    This is what I get with the latest build, W10:
    
    ```red
    view [area "اللُّغَة" right font-name "Courier New" font-size 36]
    ```
    
    ![image](https://user-images.githubusercontent.com/15716466/77234142-7930a700-6bac-11ea-9a56-3225cedd77aa.png)
    
    ```red
    view [area "اللُّغَة" right font-name "Arial Unicode MS" font-size 36]
    ```
    
    ![image](https://user-images.githubusercontent.com/15716466/77234150-877ec300-6bac-11ea-9319-ba5f96536faf.png)

