
#2429: Word 'author is not recognized when View is included
================================================================================
Issue is closed, was reported by meijeru and has 18 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2429>

This is a most curious error, occurring when running the result of compiling the following script:
```
Red [Needs: 'View]
author: "Rudolf"
win: layout [a: area 100x100 ""]
win/menu: ["About" about]
win/actors: make object! [on-menu: func [face event][a/text: author]]
view win
```
The error message on clicking `About` is:
```
*** Script Error: author has no value
*** Where: act
*** Stack: view either do-events set do-event-loop awake set do-actor if set do-safe if print = type? try do act
```
When the variable `author` is replaced by one with another name, no error occurs!


Comments:
--------------------------------------------------------------------------------

On 2017-02-03T14:54:32Z, meijeru, commented:
<https://github.com/red/red/issues/2429#issuecomment-277266788>

    Question of leakage??

--------------------------------------------------------------------------------

On 2017-02-03T16:20:02Z, endo64, commented:
<https://github.com/red/red/issues/2429#issuecomment-277291404>

    Works normal here. Win10 x64.

--------------------------------------------------------------------------------

On 2017-02-03T18:42:44Z, meijeru, commented:
<https://github.com/red/red/issues/2429#issuecomment-277327631>

    I first suspected it was an effect of the IDE used, but the error occurs both with Crimson Editor and with Visual Studio Code. I use `red-25jan17-080ebed.exe`. It also occurs both with `-t MSDOS` and with `-t Windows`. Moreover, it has nothing to do with menus, it also appears when using a button. But in the interpreter: no error.

--------------------------------------------------------------------------------

On 2017-02-03T20:45:49Z, geekyi, commented:
<https://github.com/red/red/issues/2429#issuecomment-277357741>

    Can reproduce. Win 10 x64. No IDE.

--------------------------------------------------------------------------------

On 2017-02-05T18:07:23Z, meijeru, commented:
<https://github.com/red/red/issues/2429#issuecomment-277537082>

    If @endo64 does not have the error, and @geekyi and I have it, and all of us run W10 x64, what could be the differentiating factor?

--------------------------------------------------------------------------------

On 2017-02-06T13:30:12Z, DideC, commented:
<https://github.com/red/red/issues/2429#issuecomment-277680747>

    ON my Win7/64, it compile, but not works as expected : when I click on About, the program leave !
    ```
    red>> about
    Red 0.6.1 - 26-Jan-2017/11:28:57+1:00
    ```
    
    
    Can you check the .exe properties. The only "author" not in a header is in the [`PE.r` file](https://github.com/red/red/blob/5ecc874df1f8abfea524e0947333090943cef480/system/formats/PE.r#L217)

--------------------------------------------------------------------------------

On 2017-02-06T15:44:41Z, meijeru, commented:
<https://github.com/red/red/issues/2429#issuecomment-277721320>

    As noted above, I use `red-25jan17-080ebed.exe`

--------------------------------------------------------------------------------

On 2017-02-12T06:37:44Z, dockimbel, commented:
<https://github.com/red/red/issues/2429#issuecomment-279200264>

    The issue is related to View module compilation. The following reduced version exhibits the same bug:
    ```
    Red [Needs: View]
    
    author: "Rudolf"
    do [author]
    ```
    while the following variation does not:
    ```
    Red []
    
    author: "Rudolf"
    do [author]
    ```
    
    The internal layout of compilation output has been changed for the needs of libRed, so it is probably the cause of this regression.

--------------------------------------------------------------------------------

On 2017-02-27T06:20:56Z, dockimbel, commented:
<https://github.com/red/red/issues/2429#issuecomment-282637837>

    It is a regression caused by the fix for #1829.

