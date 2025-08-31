
#3749: [View] `caret-to-offset` is wrong on design level
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.wish] [status.reviewed] [GUI]
<https://github.com/red/red/issues/3749>

**Describe the bug**
```
>> ? caret-to-offset
USAGE:
     CARET-TO-OFFSET face pos

DESCRIPTION: 
     Given a text position, returns the corresponding coordinate relative to the top-left of the layout box. 
     CARET-TO-OFFSET is a function! value.

ARGUMENTS:
     face         [object!] 
     pos          [integer!] 

REFINEMENTS:
     /lower       => lower end offset of the caret.

RETURNS:
     [pair!]
```
This function's spec implies that an integer index [1 .. length + 1] can be **unambiguously** converted into an offset pair, but this is incorrect. In a situation where text is **wrapped**, a single caret index can be attributed to both previous line and the next line, thus **two different offsets** are valid.

Consider: `view [rich-text 70x300 wrap data ["ab"] font-size 70 on-down [print caret-to-offset face offset-to-caret face event/offset]]`
![](https://i.gyazo.com/fc2632e9bccf37c5ba50c089d3f08742.png)
Both caret positions - after `a` and before `b` have index 2, but belong do different lines with different offsets. However, the function will always return the offset for the line below: 9x100.

**Expected behavior**

I propose this function should support a refinement to allow user finer control over what line it actually should return - the one above or the one below.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-21T03:39:59Z, qtxie, commented:
<https://github.com/red/red/issues/3749#issuecomment-455939116>

    > Both caret positions - after a and before b have index 2
    
    The function expects `a text position` according to the description, not a caret position.
    
    I don't see any wrong in _design level_. The returned location (offset) is of the **leading** side of the specified text position. It's well defined and consistent. We can add a refinement to return the location of the **trailing** side of the text position.
    
    ```
    view [
        t: rich-text 180x300 wrap data ["abcabc"] font-size 70
        button "check" [repeat idx 6 [print ["Position:" idx "Offset:" caret-to-offset t idx]]]
    ]
    ```
    ![default](https://user-images.githubusercontent.com/1673525/51451209-2b819a00-1d6f-11e9-9299-615143edf9f7.png)

--------------------------------------------------------------------------------

On 2019-01-21T05:33:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/3749#issuecomment-455953245>

    @qtxie Yes, that would make it flexible enough for text editors.

