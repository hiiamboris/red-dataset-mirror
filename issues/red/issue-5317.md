
#5317: Red language on macOS: Alert from within a modal window locks the application
================================================================================
Issue is closed, was reported by pierre2red and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI] [GUI.macOS]
<https://github.com/red/red/issues/5317>

**Describe the bug**
On macOS, if you use "alert" from within a modal window, the alert will display, but the whole application is then locked.  You can't close the alert, either by clicking the "Close" button, or by clicking the "x" icon.  The same thing happens if you use a home-grown modal window instead of the alert.

**To reproduce**
Run the following code on macOS:

`Red [needs: 'view]`

`view/flags [`
    `    title "Modal test"`    
    `    size 250x100`
    `    below`
    `    text "This window is modal"`
    `    button "Show an alert" [ alert "Can you close this ?" ]`
`] [ modal ]`

Click the "Show an alert" button, then try to close the alert message.

**Expected behavior**
The alert message will not close, and you are forced to quit the entire application.

**Screenshots**
If applicable, add screenshots to help explain your problem.
N/A

**Platform version**
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4668 date: 17-Apr-2023/12:25:59 commit: #59eaf9a634c8ce701748068629d25594086ca044 ]
PLATFORM: [ name: "macOS Mojave" OS: 'macOS arch: 'x86-64 version: 10.14.6 build: "18G9323" ]
--------------------------------------------


Comments:
--------------------------------------------------------------------------------

On 2023-05-19T09:56:09Z, pierre2red, commented:
<https://github.com/red/red/issues/5317#issuecomment-1554325838>

    Thank you Qingtian - what a fast response !
    
    Best wishes
    
    Pete
    ________________________________
    From: Qingtian ***@***.***>
    Sent: 19 May 2023 03:33
    To: red/red ***@***.***>
    Cc: pierre2red ***@***.***>; Author ***@***.***>
    Subject: Re: [red/red] Red language on macOS: Alert from within a modal window locks the application (Issue #5317)
    
    
    Closed #5317<https://github.com/red/red/issues/5317> as completed.
    
    —
    Reply to this email directly, view it on GitHub<https://github.com/red/red/issues/5317#event-9285401515>, or unsubscribe<https://github.com/notifications/unsubscribe-auth/A6S7FJUW3E54FYDGKHS4F63XG3SZLANCNFSM6AAAAAAYGHFFHE>.
    You are receiving this because you authored the thread.Message ID: ***@***.***>

