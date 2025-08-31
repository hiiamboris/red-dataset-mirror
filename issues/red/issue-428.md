
#428: Crash on possible memory corruption in GTK-browser environment
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 90 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/428>

I'm getting a weird crash if I load the following in the GTK-browser:

```
function [] [
    [text]
]
```

bash-4.0# ./GTK-browser test.red 

**\* Runtime Error 1: access violation
**\* at: 08063687h

It doesn't happen if I load it in the console.

This fixes it:

```
function [] [
    text: ""
    [text]
]
```

But this doesn't:

```
function [] [
    text: none
    [text]
]
```



Comments:
--------------------------------------------------------------------------------

On 2013-03-13T20:40:07Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-14867072>

    Could you show me a probing of the data passed to LOAD native in GTK-browser code?

--------------------------------------------------------------------------------

On 2013-03-13T20:48:35Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14867527>

    Good guess; something odd is going on there:
    
    {function [] [
    /[text]
    ]
    }
    
    It comes from my READ function. I'll see if I can find out more.

--------------------------------------------------------------------------------

On 2013-03-13T20:58:02Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14868023>

    This seems to be an unrelated bug in PROBE. When I do this:
    
    ```
    forall script [prin script/1]
    ```
    
    I get the real text:
    
    ```
    function [] [
        [text]
    ]
    ```

--------------------------------------------------------------------------------

On 2013-03-13T21:05:48Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-14868462>

    From console-pro? If I try from compiler with the following code:
    
    ```
    probe script: load {function [] [
    /[text]
    ]
    }
    do [forall script [prin script/1]]
    ```
    
    I get:
    
    ```
    [function [] [/ [text]]]
    function/ text
    ```
    
    Now from console:
    
    ```
    red>> script: load {function [] [ /[text] ] }
    == [function [] [/ [text]]]
    red>> forall script [prin script/1]
    function/ textred>>
    ```

--------------------------------------------------------------------------------

On 2013-03-13T21:09:59Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14868686>

    No, I'm testing within GTK-browser, as you asked.
    
    The point is, there is no / in the input: it's another bug in PROBE.

--------------------------------------------------------------------------------

On 2013-03-13T21:13:16Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14868858>

    You asked for the data passed to LOAD, so I'm showing the input string value.

--------------------------------------------------------------------------------

On 2013-03-13T21:15:37Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14869015>

    Here's a probe of the output of load/all:
    
    [function [] [[text]]]

--------------------------------------------------------------------------------

On 2013-03-13T21:20:54Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-14869304>

    So PROBE is inserting the slash and not your READ function?

--------------------------------------------------------------------------------

On 2013-03-13T21:22:53Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14869425>

    Yes: #429

--------------------------------------------------------------------------------

On 2013-03-13T21:52:52Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-14870964>

    #429 fixed, let me know if that it fixes this one too.

--------------------------------------------------------------------------------

On 2013-03-13T22:16:32Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14872178>

    It fixes MOLD TAB, but introduces a new bug.
    
    But it has nothing to do with the rest of this bug, #428.

--------------------------------------------------------------------------------

On 2013-03-13T22:57:38Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-14874036>

    Could you compile your code with the "-d" option to see the error location?

--------------------------------------------------------------------------------

On 2013-03-13T23:10:28Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14874579>

    When I try to compile GTK-browser with -d I get #411 again. You may want to take this as an opportunity to look at that bug. The current state of the source triggers it.

--------------------------------------------------------------------------------

On 2013-03-13T23:12:06Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-14874639>

    Was #411 the Rebol/View 2.7.8 related issue?

--------------------------------------------------------------------------------

On 2013-03-13T23:15:59Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14874769>

    Yes.

--------------------------------------------------------------------------------

On 2013-03-14T02:10:22Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14882845>

    Oddly, the #411 error now persists over the last few check-ins, so it is more persistent against those code changes, and I still can't make a debug build.

--------------------------------------------------------------------------------

On 2013-03-15T21:02:58Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-14984731>

    The current Red happens to not trigger #411 on GTK-browser, so I could get the debug trace:
    
    Symbols
    Literals
    Declarations
    Functions
    Main program
    
    **\* Runtime Error 1: access violation
    **\* in file: block.reds
    **\* at line: 34

--------------------------------------------------------------------------------

On 2013-03-17T00:40:04Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15014992>

    On http://red.esperconsultancy.nl/examples/IDE.red where I found this bug, I get:
    
    Symbols
    Literals
    Declarations
    Functions
    Main program
    
    **\* Runtime Error 1: access violation
    **\* in file: string.reds
    **\* at line: 88

--------------------------------------------------------------------------------

On 2013-03-17T00:56:35Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15015175>

    In both cases, the crash happens in GET_BUFFER in rs-head.

--------------------------------------------------------------------------------

On 2013-03-18T22:50:06Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15087192>

    The current Red code still crashes on http://red.esperconsultancy.nl/examples/IDE.red

--------------------------------------------------------------------------------

On 2013-03-18T23:03:35Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15087772>

    Trying to reproduce it...

--------------------------------------------------------------------------------

On 2013-03-18T23:33:06Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15088982>

    I can load the IDE.red script with no problem in the GTK-browser. When I paste the following code in the first input field and click on [do]:
    
    ```
    function [] [
        [text]
    ]
    ```
    
    The browser quits and an error is the DOS console:
    
    ```
    C:\Dev\Red\red\tests\Kaj\test\MSDOS\Red>GTK-browser.exe
    Box: skipping unknown dialect word "label".
    *** Error: undefined context for word 'text
    ```

--------------------------------------------------------------------------------

On 2013-03-18T23:37:11Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15089131>

    Please update my bindings to the latest state, otherwise we'll get different results. The label error is because you're loading a newer script into an older version of the GTK binding.
    
    I've got a debug log with verbosity 1 of almost 20 thousand lines. How much of it do you need?

--------------------------------------------------------------------------------

On 2013-03-18T23:42:46Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15089329>

    As I reported in #432, the simple reduction I originally reported here does not trigger the bug anymore in the current Red version. Also, it happened when starting it directly with GTK-browser, not in IDE.red in GTK-browser.

--------------------------------------------------------------------------------

On 2013-03-18T23:42:50Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15089333>

    Just look for the "**\* Error" pattern for locating the "word has no value" error and try to see if you can locate (if possible) from which part of the source code it is generated.

--------------------------------------------------------------------------------

On 2013-03-18T23:44:15Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15089387>

    I'm not getting that; I'm getting the crash.

--------------------------------------------------------------------------------

On 2013-03-18T23:48:38Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15089538>

    It ends like this:
    
    word/get
    stack/push*
    _context/get
    stack/mark
    stack/push
    stack/push*
    stack/unwind
    native/equal?
    actions/compare
    datatype/compare
    stack/unwind
    stack/unwind-last
    stack/unwind
    stack/unwind
    logic/true?
    logic/false?
    stack/reset
    stack/mark
    stack/mark
    stack/push
    stack/push*
    
    **\* Runtime Error 1: access violation
    **\* in file: string.reds
    **\* at line: 88

--------------------------------------------------------------------------------

On 2013-03-18T23:51:45Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15089643>

    I have updated the bindings a few hours ago, if I try it again, the update process just lists all items and exit after a couple of seconds. I have wiped out the folder and am downloading everything again right now to be sure to have last version.

--------------------------------------------------------------------------------

On 2013-03-18T23:52:58Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15089683>

    Does the crash happen in interpreted code? If it is so, it will be much harder to locate using such output as we won't have the commented source code as hints.

--------------------------------------------------------------------------------

On 2013-03-18T23:57:57Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15089880>

    I have recompiled GTK-browser from a freshly downloaded full repo, I still get exactly the same behavior and errors.
    
    I'm compiling from: `do/args %red.r "%red/tests/Kaj/GTK/examples/GTK-browser.red"` and getting:
    
    ```
    C:\Dev\Red\red\tests\Kaj\test\MSDOS\Red>GTK-browser.exe
    Box: skipping unknown dialect word "label".
    *** Error: undefined context for word 'text
    ```

--------------------------------------------------------------------------------

On 2013-03-19T00:06:35Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15090124>

    The examples that crash are interpreted, but the crash report is in the compiled runtime, in GET_BUFFER in rs-head. Not sure if you consider that interpreted or not.

--------------------------------------------------------------------------------

On 2013-03-19T00:10:39Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15090254>

    The crash in GET_BUFFER is a consequence of a corrupted arguments stack, the issue is happening before that. If the "root" code on top of the call stack is interpreted, you won't have source code lines printed in the output among the other logs (only the compiler generates the code for inlining source code in debug output). That is why I was asking.

--------------------------------------------------------------------------------

On 2013-03-19T00:10:42Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15090255>

    LABEL was implemented a week ago. It's on-line:
    
    http://red.esperconsultancy.nl/Red-GTK/timeline
    
    And it works on a freshly compiled browser:
    
    bash-4.0# ./GTK-browser http://red.esperconsultancy.nl/examples/IDE.red
    
    **\* Runtime Error 1: access violation
    **\* at: 080658AAh

--------------------------------------------------------------------------------

On 2013-03-19T00:12:26Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15090300>

    If you go into GTK/ manually and do
    
    fossil update
    
    do you get merge conflicts or other warnings?

--------------------------------------------------------------------------------

On 2013-03-19T00:14:18Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15090345>

    I have the same exact GTK.red file with `label` defined inside. This is what a fossile update outputs here:
    
    ```
    C:\Dev\Red\red\tests\Kaj\GTK>fossil update
    Autosync:  http://red.esperconsultancy.nl/Red-GTK
                    Bytes      Cards  Artifacts     Deltas
    Sent:             130          1          0          0
    Received:        3022         66          0          0
    Total network traffic: 298 bytes sent, 2030 bytes received
    -------------------------------------------------------------------------------
    checkout:     0c8335c77e253071dc3dce9b17261bbc2ac34c14 2013-03-12 22:18:57 UTC
    tags:         trunk
    comment:      Saner error messages (user: Kaj de Vos)
    changes:      None. Already up-to-date
    ```

--------------------------------------------------------------------------------

On 2013-03-19T00:24:14Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15090656>

    Then you must somehow not use that source file or the compiled GTK-browser.

--------------------------------------------------------------------------------

On 2013-03-19T00:31:35Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15090888>

    Was the wrong binary issue...sorry.
    
    When using the right one, I get the following error when hitting [Go]:
    
    ```
    C:\Dev\Red\red\tests\Kaj\test\MSDOS\Red>GTK-browser.exe
    
    *** Runtime Error 1: access violation
    *** at: 0041D0A7h
    ```
    
    Is that the right error to investigate?

--------------------------------------------------------------------------------

On 2013-03-19T00:33:49Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15090962>

    Yep. Although it's odd that you would get the binary from the test/ repository. Binaries only end up there with my build.r script.

--------------------------------------------------------------------------------

On 2013-03-19T00:35:10Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15091002>

    I've copied it there from my own build folder else it would miss the required libs.

--------------------------------------------------------------------------------

On 2013-03-19T00:37:00Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15091058>

    Oh, right, on Windows.
    
    Actually, it's not supposed to crash on its own, only when loaded with IDE.red. But it might be the same bug.

--------------------------------------------------------------------------------

On 2013-03-19T00:46:23Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15091358>

    I'm getting this from probe stats/info within IDE.red:
    
    [[[3277 1723 5000]] [[321116 203172 524288]] []]

--------------------------------------------------------------------------------

On 2013-03-19T00:52:00Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15091518>

    Seems royally within spec; no extra segment, right?

--------------------------------------------------------------------------------

On 2013-03-19T02:01:11Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15093433>

    It's perfect, 3277 is the number of allocated series while 321116 is the amount of bytes allocated for these series. The last numbers are the total number of series slots (5000) and series buffer (512KB) available in the frames. The memory manager is able to allocate new ones when required, but it is highly untested code for now. As you can see, Red tries to have a low memory footprint (it could be even lower when we'll optimize it).
    
    So the memory manager is not the cause of the crashes.

--------------------------------------------------------------------------------

On 2013-03-21T16:49:10Z, dockimbel, commented:
<https://github.com/red/red/issues/428#issuecomment-15250634>

    Fixed by commit [0bacb29b](https://github.com/dockimbel/Red/commit/0bacb29b6a7f96e0595bddb0efe3be102e41384d).
    
    Can you confirm it is working fine now?

--------------------------------------------------------------------------------

On 2013-03-23T01:58:37Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/428#issuecomment-15329311>

    Lots of bugs were found and fixed to straighten all this out, but everything seems to work now.

