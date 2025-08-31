
#432: Crash on memory corruption in console-pro environment
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 18 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/432>

This looks like the same bug as #428 but on a different example in a different environment. I can't reduce this further; any small change makes the problem disappear, even in the comments:

```
alert: func ["Flashes an alert message to the user. Waits for a user response."
    /local line
][
]

_view: function ["Displays a window face."
    view-face       [block! string!]  ; object!
    /new            "Creates a new window and returns immediately"
;   /offset xy      [pair!] "Offset of window on screen"
    /options opts   [block! word!] "Window options [no-title no-border resize]"
    /title text     [string!] "Window bar title"
][
    alert reduce [
;       either string? view-face [view-face] [mold view-face]
    ]
]

print ""
```

console-pro compiled with -d:

bash-4.0# ~/Red/common/examples/console-pro test.red
Symbols
Literals
Declarations
Functions
Main program

**\* Runtime Error 1: access violation
**\* in file: block.reds
**\* at line: 34



Comments:
--------------------------------------------------------------------------------

On 2013-03-18T10:15:32Z, dockimbel, commented:
<https://github.com/red/red/issues/432#issuecomment-15047212>

    I don't know if it's related to hitting memory boundaries, but in current version, the memory manager is not fully completed and untested for bigger usages. As you are loading tons of code, you might be hitting one of the current limitations. You should check your memory usage to see if it's related to that using:
    
    ```
    #system [#if debug? = yes [memory-stats 2]]
    ```
    
    Insert this line as close as possible to the crashing point, compile using `-d` option and send me back the output, so I can check if it's a memory management issue.

--------------------------------------------------------------------------------

On 2013-03-18T16:47:56Z, dockimbel, commented:
<https://github.com/red/red/issues/432#issuecomment-15066215>

    I get this output, testing with latest commits: 
    
    ```
    C:\Dev\Red\red\tests\Kaj\test\MSDOS\Red>console-pro test.red
    *** Error: word has no value!
    
    
    -=== Red Console pre-alpha version ===-
    (only Latin-1 input supported)
    
    red>>
    ```
    
    Can you give it a try with latest commits too?

--------------------------------------------------------------------------------

On 2013-03-18T22:48:51Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/432#issuecomment-15087135>

    The symptom of crashing is indeed gone, but the bug is not. Note that there is no undefined word in the example, so the new error message seems to be a bug to me.
    
    Further, in #428, the crash on the minimal example is gone, but IDE.red still crashes in GTK-browser.
    
    This is why I am pushing for such heisenbugs to be tracked before the code changes and they go back into hiding. It's now harder to debug, because instead of three cases, only one case shows in the current code.

--------------------------------------------------------------------------------

On 2013-03-18T23:01:22Z, dockimbel, commented:
<https://github.com/red/red/issues/432#issuecomment-15087687>

    The error message is produced when you try to assign a word to an unset! value. It could be anywhere in your code, you can try setting `verbosity` to 1 in runtime/red.reds and recompile with `-d` to try locating the source (expect a big log output, better redirect it to a file).

--------------------------------------------------------------------------------

On 2013-03-18T23:10:25Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/432#issuecomment-15088089>

    That's very unlikely, because a number of other scripts run fine in console-pro, and what's more, the errors appear and disappear with only the underlying Red runtime changing.

--------------------------------------------------------------------------------

On 2013-03-18T23:22:19Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/432#issuecomment-15088561>

    I wanted to try getting the memory stats you suggested above, but since the crashing scripts are interpreted, I would have to compile the test code into console-pro or GTK-browser, and then I can't really get it near the crashing point.

--------------------------------------------------------------------------------

On 2013-03-18T23:36:11Z, dockimbel, commented:
<https://github.com/red/red/issues/432#issuecomment-15089083>

    See the last commit, I have added a native STATS to simplify the process, just run `probe stats/info` when needed you should get only two blocks with 3 values each (used, free, total). If you get more then you have passed the current tested limits of the memory manager.

--------------------------------------------------------------------------------

On 2013-03-21T17:00:59Z, dockimbel, commented:
<https://github.com/red/red/issues/432#issuecomment-15251412>

    If I run the above code snippet with latest commits, I don't get a segfault anymore, just a "word has no value" warning:
    
    ```
    C:\Dev\Red\red\tests\Kaj\test\MSDOS\Red>console-pro test.red
    Symbols
    Literals
    Declarations
    Functions
    Main program
    
    *** Error: word has no value!
    
    -=== Red Console pre-alpha version ===-
    (only Latin-1 input supported)
    
    red>> 
    ```
    
    Do we consider this ticket fixed?

--------------------------------------------------------------------------------

On 2013-03-23T02:02:16Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/432#issuecomment-15329358>

    Lots of bugs were found and fixed to straighten all this out, but everything seems to work now.

