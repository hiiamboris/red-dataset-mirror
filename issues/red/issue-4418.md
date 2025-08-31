
#4418: Modal popup window closing causes runtime error 95 (macOS only)
================================================================================
Issue is closed, was reported by ralfwenske and has 12 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4418>

**Describe the bug**
Clicking on a button in a modal popup view - when started from a menu event - causes runtime error 95

**To reproduce**
```
Red []
do-quit: does [
    res: false
    view/flags  [
        text "Quit?" return 
        button "OK" [res: true unview] 
        button "Cancel" [res: false unview]
    ][modal popup]
    res
]
view/options  [ title "Test" ][
    menu: [ "File" ["Quit" doquit] ]
    actors: context [
        on-menu: func [f e][
            if e/picked = 'doquit [if do-quit [unview]]
        ]
    ]
]
```
Steps to reproduce the behavior:
1. Click 'Quit' from 'File' menu
2. Click on 'Cancel' or 'OK' in modal popup
3. See error
```
*** Runtime Error 95: no CATCH for THROW
*** at: 0001F3F9h
```

**Expected behavior**
Close popup without error (see prior bug report)

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 17-Apr-2020/13:50:14+10:00 commit #ca0a2d5
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-29T03:32:04Z, qtxie, commented:
<https://github.com/red/red/issues/4418#issuecomment-620971502>

    Maybe related to issue #4375 .

--------------------------------------------------------------------------------

On 2020-04-29T10:41:20Z, ralfwenske, commented:
<https://github.com/red/red/issues/4418#issuecomment-621121190>

    I have run this on GTK also
    ```
    Red 0.6.4 for Linux built 29-Apr-2020/11:52:07+10:00 commit #7f9804b
    ```
    The following app allows three ways to shut it down - all of the to be intercepted:
    ```
    Red [Needs: 'view]
    
    confirm-quit: function [][ 
        res: none
        view/flags [
            title "confirm-quit"
            text "Unsaved data somewhere! Really Quit?" return 
            button "OK" [res: true unview] 
            button "Cancel" [res: false unview]
        ][  modal popup]
        res
    ]
    
    v: layout [ 
        title "Test" 
        size 200x100
        b: button "Quit" [if confirm-quit [unview]]    
    ]
    v/menu: [
        "File" [ 
            "Load" doload
            ---
            "Quit" doquit        
        ]
    ]
    v/actors: make object! [
        on-close: func [f e][if confirm-quit [unview]]
        on-menu: func [f e][
            switch e/picked [
                doload [print "Load called"]
                doquit [if confirm-quit [unview]]
            ]
        ]
    ]
    view/flags v ['resize]
    ```
    Button 'Quit' works fine on both macOS and GTK
    Menu 'Quit' works fine on GTK
    Menu 'Quit' on macOS as described above: Error 95
    X on GTK shows the modal dialog - then clicking any button simply shuts the app down
    X on macOS gives me:
    ```
    2020-04-29 20:35:41.469 console-2020-4-29-15657[69231:1628766] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '_createMenuRef called with existing principal MenuRef already associated with menu'
    *** Call stack at first throw:
    (
            0   CoreFoundation                      0x9397027b __raiseError + 484
            1   libobjc.A.dylib                     0xa6d67c23 objc_exception_throw + 273
            2   CoreFoundation                      0x938fc4c9 +[NSException raise:format:] + 100
            3   AppKit                              0x914c8cee -[NSCarbonMenuImpl _createMenuRef] + 55
            4   AppKit                              0x914c8633 -[NSCarbonMenuImpl _instantiateCarbonMenu] + 134
            5   AppKit                              0x914c85a6 -[NSCarbonMenuImpl setupCarbonMenuBar] + 37
            6   AppKit                              0x914a3e23 -[NSApplication finishLaunching] + 1068
            7   console-2020-4-29-15657             0x000cdfd0 console-2020-4-29-15657 + 839632
    )
    
    *** Runtime Error 17: illegal instruction
    *** at: 93970520h
    ```
    Hope it helps a little...

--------------------------------------------------------------------------------

On 2020-04-29T12:15:54Z, qtxie, commented:
<https://github.com/red/red/issues/4418#issuecomment-621164481>

    @ralfwenske Thanks. That's very helpful. 👍 

--------------------------------------------------------------------------------

On 2020-04-29T12:26:40Z, qtxie, commented:
<https://github.com/red/red/issues/4418#issuecomment-621169806>

    @ralfwenske I spent half a day today didn't figure out what's going wrong. Thanks to your finding, I fixed it in 10min. :-)

--------------------------------------------------------------------------------

On 2020-04-29T12:52:53Z, qtxie, commented:
<https://github.com/red/red/issues/4418#issuecomment-621183984>

    @ralfwenske Returns `continue` in `on-close` function will cancel the window closing.
    ```
    v/actors: make object! [
        on-close: func [f e][unless confirm-quit ['continue]]   ;@@
        on-menu: func [f e][
            switch e/picked [
                doload [print "Load called"]
                doquit [if confirm-quit [unview]]
            ]
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2020-04-30T00:34:00Z, ralfwenske, commented:
<https://github.com/red/red/issues/4418#issuecomment-621542737>

    Glad to be of help @qtxie and happy it's working perfectly now on macOS.
    Thank you very much.
    I couldn't test it yet on GTK branch as the latest atm. is
    `Red 0.6.4 for Linux built 29-Apr-2020/22:04:11+10:00 commit #2dd8767`
    (this one still shuts down on 'Cancel')
    I will close this once I have verified on GTK also.

