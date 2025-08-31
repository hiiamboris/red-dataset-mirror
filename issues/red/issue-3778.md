
#3778: Clipboard doesn't work consistently under Windows when compiled
================================================================================
Issue is closed, was reported by Senenmut and has 30 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3778>

write-clipboard "ABC" only works in interpreted mode and not compiled .exe Windows
```write-clipboard "ABC"```


Comments:
--------------------------------------------------------------------------------

On 2019-02-09T23:02:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/3778#issuecomment-462087373>

    works fine for me compiled on W7

--------------------------------------------------------------------------------

On 2019-02-10T09:50:00Z, 9214, commented:
<https://github.com/red/red/issues/3778#issuecomment-462118342>

    Any time you submit an issue, please make an effort to fill a more detailed bug report and to use the [standard issue template](https://github.com/red/red/blob/master/.github/ISSUE_TEMPLATE/bug_report.md) (which was automatically suggested to you on submission).
    
    Moreso, I cannot reproduce your problem neither with MSDOS nor with Windows (and not even with WindowsXP) as compilation targets, neither in release nor in development mode.
    
    In light of the above (and taking @hiiamboris' message into account), the issue can be dismissed, and OP is recommended to confirm his findings in [/bugs](https://gitter.im/red/bugs) room (preferrably by multiple members and on multiple platforms) before opening tickets - that would save everyone's time and energy. 
    

--------------------------------------------------------------------------------

On 2019-02-10T16:10:13Z, Senenmut, commented:
<https://github.com/red/red/issues/3778#issuecomment-462147136>

    again.
    write-clipboard "ABC" is not working in compied .exe Windows.
    Description 
    Ingredients - Windows XP SP3 - red-064.exe
    If you have a red programming script with the command ```write-clipboard "ABC"``` that is
    activated in your script with a button then this is already done in INTERPRETED mode.
    When you compile the program with  - c flag or with -r -t Windows then the windows .exe is ready compiled and working correct.
    Only the clipboard command is NOT working.
    You can check it out with the windows text editor.
    Type some text and COPY it with the mouse context menue. Then this text is alredy in clipboard
    everyone knows. Pasting it in editor more times.
    Now , if you press the button of your red program that intention is to OVERWRITE the clipboard with the letters ABC , it is NOT working.
    I have checked this out on two different computers.

--------------------------------------------------------------------------------

On 2019-02-10T22:16:35Z, endo64, commented:
<https://github.com/red/red/issues/3778#issuecomment-462181757>

    Worked for me on Win10:
    
    My `test.red` script:
    ```
    Red [Needs: View]
    write-clipboard "ABC"
    ```
    
    Compiled and tested:
    ```
    red -t msdos -c test.red
    test.exe
    ```
    
    `ABC` was set into clipboard.

--------------------------------------------------------------------------------

On 2019-02-10T22:34:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3778#issuecomment-462184600>

    I confirmed the bug in chat and asked @Mennohexo to file a ticket. I agree that following the submission format and providing more info would help.
    
    This doesn't show the problem:
    ```
    write-clipboard "ABC"
    print read-clipboard
    ```
    
    But this does:
    ```
    write-clipboard ""
    print read-clipboard
    write-clipboard "ABC"
    print read-clipboard
    ```
    On Win10 here. Similarly, under View you can show the problem:
    
    No problem:
    ```
    Red [needs: view]
    write-clipboard "ABC"
    view compose [text (read-clipboard)]
    ```
    Problem:
    ```
    Red [needs: view]
    write-clipboard ""
    print read-clipboard
    write-clipboard "ABC"
    view compose [text (read-clipboard)]
    ```
    
    So we need to refine the ticket description and do a little more digging.

--------------------------------------------------------------------------------

On 2019-02-10T22:37:14Z, greggirwin, commented:
<https://github.com/red/red/issues/3778#issuecomment-462184979>

    If I do this:
    ```
    write-clipboard "XX"
    print read-clipboard
    write-clipboard "ABC"
    view compose [text (read-clipboard)]
    ```
    It shows "XX" as the result. So there's something about multiple writes to the clipboard.

--------------------------------------------------------------------------------

On 2019-02-10T22:44:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3778#issuecomment-462186158>

    If I do this:
    ```
    write-clipboard ""
    print read-clipboard
    write-clipboard "ABC"
    print read-clipboard
    write-clipboard "XX"
    print read-clipboard
    write-clipboard "ABCDEF"
    print read-clipboard
    write-clipboard ""
    print read-clipboard
    write-clipboard "XX"
    print read-clipboard
    ```
    I get varying results on successive runs of the exe:
    ```
    D:\Red\temp\menohexo>clipboard-test.exe
    
    
    XX
    none
    none
    none
    
    D:\Red\temp\menohexo>clipboard-test.exe
    
    
    XX
    none
    none
    XX
    
    D:\Red\temp\menohexo>clipboard-test.exe
    
    ABC
    XX
    XX
    
    XX
    
    ```

--------------------------------------------------------------------------------

On 2019-02-10T22:50:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3778#issuecomment-462186986>

    If I insert a `wait 0.1` between each command, it solves the problem.

--------------------------------------------------------------------------------

On 2019-02-10T23:01:32Z, greggirwin, commented:
<https://github.com/red/red/issues/3778#issuecomment-462188777>

    The result of `SetClipboardData` is not being checked at all, for Windows. I think writing should use the result of `SetClipboardData` as its result, to indicate whether it succeeded, rather than always returning true (or false if the `OpenClipboard` fails.
    
    And those `none` values in the above example indicate that `OpenClipboard` failed.

--------------------------------------------------------------------------------

On 2019-02-11T03:57:44Z, 9214, commented:
<https://github.com/red/red/issues/3778#issuecomment-462213980>

    From MS docs I skimmed yesterday: write to clipboard will fail if it is occupied by other  process/application. That would explain why `wait 0.1` does the trick.

--------------------------------------------------------------------------------

On 2019-02-11T20:26:10Z, Senenmut, commented:
<https://github.com/red/red/issues/3778#issuecomment-462481169>

    Thank you for that trick. I will use this in my code and close my little application.
    The easiest app is ready then.
    It is really important that no credit card passwords are in the clipboard anymore.
    Even if the computer was not connected to the internet.

--------------------------------------------------------------------------------

On 2019-02-11T21:54:30Z, Senenmut, commented:
<https://github.com/red/red/issues/3778#issuecomment-462510064>

    Hi , i checked it out. Sorry does not work at the time. Clipboard data is still there.
    My code waits 1 and overrides 3 times.
    Here is the exact code -
    `if X = 0 [
                 write-clipboard "ABC"
                 wait 1
                 write-clipboard "XXX"
                 wait 1
                 write-clipboard "ABC"          
                                
             view [ title "Checkout clearance"    
            text-list 750x60 font-size 10 bold data "You have successfully logged out from this computer ! "
                                                                        " Please press the LOGOUT button."
                    button 100x100 font-size 10 bold  "LOGOUT" [quit]
                   ]
             ]
    
    `

--------------------------------------------------------------------------------

On 2019-02-11T21:59:49Z, Senenmut, commented:
<https://github.com/red/red/issues/3778#issuecomment-462511797>

    sorry , here in one piece of cake.
    
    `````
    if X = 0 [
                  write-clipboard "ABC"
                  wait 1
                  write-clipboard "XXX"
                  wait 1
                  write-clipboard "ABC"
    
                  view [ title "Checkout clearance"    
             text-list 750x60 font-size 10 bold data "You have successfully logged out from this computer ! "
                                                                         " Please press the LOGOUT button."
                 button 100x100 font-size 10 bold  "LOGOUT" [quit]
                          ]
               ]
    `````
    

--------------------------------------------------------------------------------

On 2019-02-12T13:24:16Z, Senenmut, commented:
<https://github.com/red/red/issues/3778#issuecomment-462757339>

    hi , i changed my code back to old version for logout. in the download application , not gist.
    `````
    if X = 0 [
    view [ title "LOGOUT PROCEDURE"
    below
    area 750x60 font-size 10 bold "Please --MARK AND COPY-- this text with right mouse button                  
                                                               ! Then KLICK the NEXT button."   
    below
    button 60x60 font-size 10 bold  "NEXT" [unview] 
                    ]
                                  
                                                        
    view [ title "Checkout clearance"    
    field 750x60 font-size 10 bold "You have successfully logged out from this computer ! Please press the  
                                                            LOGOUT button."
                    button 60x60 font-size 10 bold  "LOGOUT" [quit]
                   ]
             ]
    `````
    
    

--------------------------------------------------------------------------------

On 2019-02-18T02:39:16Z, qtxie, commented:
<https://github.com/red/red/issues/3778#issuecomment-464559575>

    ```
    write-clipboard ""
    print read-clipboard
    write-clipboard "ABC"
    print read-clipboard
    ```
    The code above failed with the `Access Denied` error. The access to the clipboard is not guarentee to be success. The user should check the return value of those functions. I pushed a fix to return `false` if any error occurs in `read-clipboard` and `write-clipboard`.

