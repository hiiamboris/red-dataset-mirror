
#1777: Multiline text is area is displayed as single string
================================================================================
Issue is closed, was reported by iArnold and has 20 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1777>

Run this code in GUI-console
multi-line-text: {
Hi,

This is

multiline

text in area
}

view [
    multi-line-area: area 200x200
    return
    button "fill area" [multi-line-area/text: multi-line-text ]
    button "empty area" [multi-line-area/text: ""]
]
![2016-04-01_142134](https://cloud.githubusercontent.com/assets/1219809/14206713/4ef9066c-f815-11e5-8782-797c4860a731.png)



Comments:
--------------------------------------------------------------------------------

On 2016-04-01T12:33:32Z, meijeru, commented:
<https://github.com/red/red/issues/1777#issuecomment-204380672>

    This could be related to #1488

--------------------------------------------------------------------------------

On 2016-04-01T14:05:25Z, iArnold, commented:
<https://github.com/red/red/issues/1777#issuecomment-204408783>

    If I Cut&Paste this text from the area and put it into a code editor then I see CR LF markers.

--------------------------------------------------------------------------------

On 2016-04-01T14:37:26Z, meijeru, commented:
<https://github.com/red/red/issues/1777#issuecomment-204419728>

    That itself is not conclusive, since the Cut&Paste could do that !?!

--------------------------------------------------------------------------------

On 2016-04-01T15:44:05Z, iArnold, commented:
<https://github.com/red/red/issues/1777#issuecomment-204442574>

    Perhaps, I have not noticed that before. 
    I have now a script that fills such area/text and that works fine when run from GUI-console but when I have compiled version the area/text remains empty. Unfortunately I cannot access the source now.

--------------------------------------------------------------------------------

On 2016-04-03T11:58:17Z, WiseGenius, commented:
<https://github.com/red/red/issues/1777#issuecomment-204950921>

    @iArnold What happens when you cut that text back from the code editor and paste it back into the `area`?
    For me on Windows, this part of your code gives me all `^/`s:
    
    ```
    red>> multi-line-text: {
    {    Hi,
    {    
    {    This is
    {    
    {    multiline
    {    
    {    text in area
    {    }
    == {^/Hi,^/This is^/multiline^/text in area^/}
    ```
    
    #1488 then explains why this is displayed as one line in the `area`.
    When I cut the text from the `area` and paste it into a code editor, some code editors add the missing `^M` as expected by Windows.
    So when I cut the text back from the editor and paste it back into the `area`, it is displayed as multiline.
    
    For me, this code runs as expected when both interpreted and compiled:
    
    ```
    Red [
        needs: 'View
    ]
    
    multi-line-text: {^M^/Hi,^M^/This is^M^/multiline^M^/text in area^M^/}
    
    view [
        multi-line-area: area 200x200
        return
        button "fill area" [multi-line-area/text: multi-line-text ]
        button "empty area" [multi-line-area/text: ""]
    ]
    ```

--------------------------------------------------------------------------------

On 2016-04-04T07:44:41Z, iArnold, commented:
<https://github.com/red/red/issues/1777#issuecomment-205177672>

    Compiled (left) versus Interpreted (right)
    ![2016-04-04_093209](https://cloud.githubusercontent.com/assets/1219809/14241060/ce4bfa10-fa49-11e5-9cc0-f143aa283eba.png)

--------------------------------------------------------------------------------

On 2016-04-04T07:47:43Z, iArnold, commented:
<https://github.com/red/red/issues/1777#issuecomment-205178208>

    @WiseGenius  When I cut and past directly the right situation stays the same. When I cut and paste to an editor the lines show up and cutting and pasting that I end up with the left.

--------------------------------------------------------------------------------

On 2016-04-04T10:01:39Z, WiseGenius, commented:
<https://github.com/red/red/issues/1777#issuecomment-205225284>

    @iArnold, Yes. The cutting and pasting situation is what I'd currently expect.
    
    I also reproduced the difference in behaviour between compiling and interpreting your original code. Here's the reason:
    
    When the following code is in a file with Windows (CR LF) endings:
    
    ```
    Red []
    
    s: {a
    b}
    
    probe s
    ```
    
    The interpreter gives `"a^/b"` while the compiled executable gives `"a^M^/b"`.
    
    @dockimbel, Which is the correct result?
    
    @iArnold, As for how each result is displayed in the `area`, that's #1488.

--------------------------------------------------------------------------------

On 2016-05-07T10:12:49Z, dockimbel, commented:
<https://github.com/red/red/issues/1777#issuecomment-217626748>

    @WiseGenius `"a^/b"` is the correct result, LF is used for delimiting new-lines in Red (same as Rebol).

--------------------------------------------------------------------------------

On 2016-05-07T15:54:18Z, dockimbel, commented:
<https://github.com/red/red/issues/1777#issuecomment-217646598>

    Fixed by commit [a39c3edb](https://github.com/red/red/commit/dd4009baaab2ed4933dcc23e7813a4f1a39c3edb).

