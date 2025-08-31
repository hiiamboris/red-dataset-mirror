
#1886: GUI Hello word on windows 7 - compiled code crash
================================================================================
Issue is closed, was reported by ljgww and has 34 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1886>

Trying GUI Hello word on windows 7 (user has no administration rights)

Example works fine when interpreted:

```
red-060.exe test.red
```

shows console screen and interaction forms in sequence....

compilation

```
red-060.exe -c test.red
```

works fine:

```
C:\Users\xxx\Desktop>red-060.exe -c "test.red"

-=== Red Compiler 0.6.0 ===-

Compiling /C/Users/xxx/Desktop/test.red ...
...compilation time : 682 ms

Compiling to native code...
...compilation time : 21789 ms
...linking time     : 227 ms
...output file size : 429056 bytes
...output file      : C:\Users\xxx\Desktop\test.exe
```

but when compiled, executable flashes (presumably) the console screen. When executed from command prompt reports:

```
C:\Users\xxx\Desktop>test.exe
*** Runtime Error 1: access violation
*** at: 00421D9Eh
```

Are administrative rights required to run compiled red programs ?



Comments:
--------------------------------------------------------------------------------

On 2016-05-06T15:10:53Z, ghost, commented:
<https://github.com/red/red/issues/1886#issuecomment-217469423>

    @ljgww 
    1.  Can you please paste here the code to reproduce the issue?
    2.  Also, instead of red-060.exe download the latest master branch binaries from the Red-Lang website, and test if the issue persists. Here is the direct download link of latest master branch binary -  http://static.red-lang.org/dl/auto/win/red-latest.exe

--------------------------------------------------------------------------------

On 2016-05-06T21:00:07Z, ljgww, commented:
<https://github.com/red/red/issues/1886#issuecomment-217557204>

    code example is on on the home page of red-lang.org web site.
    instead of instructions I have put all code in one test.red and added Red 'header' before 
      Red [
        Title: "Simple hello world script"
      ]
    
    quote:
    
    In case you are reading about Red or Rebol for the first time, here are a few code demos to show how simple, yet efficient, is our approach to GUI programming:
    
    ```
    ;-- GUI Hello word
    view [text "Hello World"]
    
    ;-- Say Hi to the name you type in the field
    view [name: field button "Hi" [print ["Hi" name/text]]]
    
    ;-- Demo simple reactive relations, drag the logo around to see the effect
    view [
     size 300x300
     img: image loose http://static.red-lang.org/red-logo.png
     return
     shade: slider 0%
     return
     text bold font-size 14 center "000x000" 
         react [face/text: form img/offset]
         react [face/font/color: white * shade/data]
    ]
    
    ;-- Simple form editing/validating/saving with styles definitions
    digit: charset "0123456789"
    view [
     style label: text bold right 40
     style err-msg: text font-color red hidden
    
     group-box "Person" 2 [
         origin 20x20
         label "Name" name: field 150 return
         label "Age"  age:  field 40  return
         label "City" city: field 150 return
         err-msg "Age needs to be a number!" react [
             face/visible?: not parse age/text [any digit]
         ]
     ]
     button "Save" [save %person.txt reduce [name/text age/text city/text]]
    ]
    set [name age city] load %person.txt
    ?? name ?? age ?? city
    ```
    
    You can run all those examples by copy/pasting them one-by-one into the Red console for Windows. To get the console, just download it and double-click the Red binary, wait ~20 seconds for the console to be compiled for your OS (yes, that little file contains the full Red toolchain, runtime library and console source code), paste the code and have fun. ;-)

--------------------------------------------------------------------------------

On 2016-05-06T21:02:08Z, ljgww, commented:
<https://github.com/red/red/issues/1886#issuecomment-217557631>

    > 1. Also, instead of red-060.exe download the latest master branch binaries from the Red-Lang website, and test if the issue persists. Here is the direct download link of latest master branch binary - http://static.red-lang.org/dl/auto/win/red-latest.exe
    
    cannot try before Monday, will reflect

--------------------------------------------------------------------------------

On 2016-05-07T05:48:21Z, ghost, commented:
<https://github.com/red/red/issues/1886#issuecomment-217609768>

    Using the latest master branch binaries -
    
    @ljgww I get no crashes in the compiled code, just an error.
    
    @dockimbel This example -
    
    ```
    ;-- Simple form editing/validating/saving with styles definitions
    digit: charset "0123456789"
    view [
     style label: text bold right 40
     style err-msg: text font-color red hidden
    
     group-box "Person" 2 [
         origin 20x20
         label "Name" name: field 150 return
         label "Age"  age:  field 40  return
         label "City" city: field 150 return
         err-msg "Age needs to be a number!" react [
             face/visible?: not parse age/text [any digit]
         ]
     ]
     button "Save" [save %person.txt reduce [name/text age/text city/text]]
    ]
    set [name age city] load %person.txt
    ?? name ?? age ?? city
    ```
    
    does not work anymore ( **NOT EVEN IN THE CONSOLE** ).
    @dockimbel  It gives -
    
    ```
    *** Script error: VID - invalid syntax at: [return label "Age"]
    *** Where: do
    ```
    
    Most probably a regression due to the fix for https://github.com/red/red/issues/1873

--------------------------------------------------------------------------------

On 2016-05-07T06:35:44Z, dockimbel, commented:
<https://github.com/red/red/issues/1886#issuecomment-217611438>

    @ljgww GUI programs in Red require a `Needs: 'View` field in the Red header, otherwise the View module will not be imported for the compilation. Unfortunately, instead of a nice error message, you got a crash, which is caused by a bug (#1754) fixed since the 0.6.0 release.
    
    The correct header to use should then be:
    
    ```
    Red [
        Title: "Simple hello world script"
        Needs: 'View
    ]
    ```

--------------------------------------------------------------------------------

On 2016-05-07T13:59:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1886#issuecomment-217637530>

    For the example above which is not working anymore, the `return` keyword is no more accepted in grid layouts, so when we'll push the next release, we'll need to fix back those examples too. Hmm, actually, I can fix them right now!
    
    EDIT: example fixed now, should work fine with both 0.6.0 and current version.

--------------------------------------------------------------------------------

On 2016-05-08T11:15:18Z, ljgww, commented:
<https://github.com/red/red/issues/1886#issuecomment-217710067>

    @dockimbel I am new to Red, thank you for clarifications. Tried things in haste (possibly not first to be doing that) ;)
    
    Will try tomorrow (new release, more experienced code...) - having no Windows @ home to try it out wish Red to be more Linux-y ;) (patience patience it will come to that in due time).

--------------------------------------------------------------------------------

On 2016-05-08T11:30:00Z, dockimbel, commented:
<https://github.com/red/red/issues/1886#issuecomment-217710565>

    @ljgww No hurry. Just let us know here if that solved your issue.

--------------------------------------------------------------------------------

On 2016-05-09T06:05:43Z, ljgww, commented:
<https://github.com/red/red/issues/1886#issuecomment-217782631>

    Report:
    red-060...
    All what was needed to add to compile was: `Needs: View` in the Red [] section to make compiled variant working.
    
    ```
    Red [
        Title: "Test view"
        Needs: View
    ]
    
    ;-- GUI Hello word
    view [text "Hello World"]
    
    ;-- Say Hi to the name you type in the field
    view [name: field button "Hi" [print ["Hi" name/text]]]
    
    ;-- Demo simple reactive relations, drag the logo around to see the effect
    view [
     size 300x300
     img: image loose http://static.red-lang.org/red-logo.png
     return
     shade: slider 0%
     return
     text bold font-size 14 center "000x000" 
         react [face/text: form img/offset]
         react [face/font/color: white * shade/data]
    ]
    
    ;-- Simple form editing/validating/saving with styles definitions
    digit: charset "0123456789"
    view [
     style label: text bold right 40
     style err-msg: text font-color red hidden
    
     group-box "Person" 2 [
         origin 20x20
         label "Name" name: field 150 return
         label "Age"  age:  field 40  return
         label "City" city: field 150 return
         err-msg "Age needs to be a number!" react [
             face/visible?: not parse age/text [any digit]
         ]
     ]
     button "Save" [save %person.txt reduce [name/text age/text city/text]]
    ]
    set [name age city] load %person.txt
    ?? name ?? age ?? city
    ```
    
    With the code all together one needs to close window of one example to run next one.
    
    All 4 examples behaved correctly with red-060.
    
    Some observations: 
    
    Compiling took a bit longer time (guessing: due linking View lib)
    
    ```
    C:\Users\xxx\Desktop>red-060.exe -c test.red
    
    -=== Red Compiler 0.6.0 ===-
    
    Compiling /C/Users/xxx/Desktop/test.red ...
    ...compilation time : 1174 ms
    
    Compiling to native code...
    ...compilation time : 29751 ms
    ...linking time     : 282 ms
    ...output file size : 585728 bytes
    ...output file      : C:\Users\xxx\Desktop\test.exe
    
    
    C:\Users\xxx\Desktop>"test.exe"
    Hi sdfasd
    Hi sdfasd
    name: "asdfasdf"
    age: "1"
    city: "asdfasdf"
    
    C:\Users\xxx\Desktop>
    ```
    
    Compiling shows linux  like path (cygwin, msys/MinGw), output file shows windows path. First is OK-ay but perhaps would confuse some people who never run unix layer on windows, other paths are correct.
    
    When run from system console, Red's program console output is shown in system console. When run as 'windows program' (double-click), red shows/generates its own console screen and displays result. Wishing there is some control over Red generated console window (setting size, or perhaps, possibility of not showing at all, or hiding in some way, perhaps this is already available by using some specific code technique). I am aware of the fact that run code for 'windows console' and 'windows' programs are different code skeletons. Some programming systems do not provide this optional facility completely ignoring users practical needs (bad example: nw-js has no solution except windows shortcut workaround, nice example is that Go has compiler switch to generate windows specific skeleton instead of console skeleton). There is nothing so annoying as user asking to remove unwanted console screen popping up when running end-user application.
    
    Environment: Windows 7 Professional, Ver 6.1, Build 7601, Service Pack 1.
    
    will now try new compiler version (latest)
    
    Thank you very much for your help. This is great!

--------------------------------------------------------------------------------

On 2016-05-09T06:26:16Z, ghost, commented:
<https://github.com/red/red/issues/1886#issuecomment-217785125>

    @ljgww Compile using `red.exe -t windows -c test.red` so as to not get the console.

--------------------------------------------------------------------------------

On 2016-05-09T06:42:09Z, ljgww, commented:
<https://github.com/red/red/issues/1886#issuecomment-217787282>

    Confirm:
    red-latest
    test-latest.red same code as above.
    
    ```
    C:\Users\xxx\Desktop\RED>red-latest.exe -c test-latest.red
    
    -=== Red Compiler 0.6.0 ===-
    
    Compiling /C/Users/xxx/Desktop/RED/test-latest.red ...
    Compiling compression library...
    ...compilation time : 1257 ms
    
    Compiling to native code...
    ...compilation time : 31000 ms
    ...linking time     : 271 ms
    ...output file size : 605696 bytes
    ...output file      : C:\Users\xxx\Desktop\RED\test-latest.exe
    
    
    C:\Users\xxx\Desktop\RED>test-latest.exe
    Hi ghj
    *** Script error: VID - invalid syntax at: [return label "Age"]
    *** Where: do
    *** Stack: view if set either layout while switch set fetch-options until unless either set switch switch layout while switch either throw-error cause-error do
    ```
    
    Don't fix web site as yet :)
    
    ---
    
    omitting `Needs: View` in header
    
    ```
    C:\Users\xxx\Desktop\RED>red-latest.exe -c test-latest.red
    
    -=== Red Compiler 0.6.0 ===-
    
    Compiling /C/Users/xxx/Desktop/RED/test-latest.red ...
    ...compilation time : 705 ms
    
    Compiling to native code...
    ...compilation time : 20857 ms
    ...linking time     : 206 ms
    ...output file size : 438272 bytes
    ...output file      : C:\Users\xxx\Desktop\RED\test-latest.exe
    
    
    C:\Users\xxx\Desktop\RED>test-latest.exe
    *** Script error: view has no value
    *** Where: ???
    
    C:\Users\xxx\Desktop\RED>
    ```
    
    Observation: was expecting compiler or linker error rather than run-time. But run-time error is much better than crash. However, run-times are is more typical for Python/Perl/Php than for compiled languages - I am guessing Red code is transpiled to Red/System and then it is executed on a lower level and that is actually great from my view point because it adds some dynamics to compiled code.

--------------------------------------------------------------------------------

On 2016-05-09T06:46:30Z, ljgww, commented:
<https://github.com/red/red/issues/1886#issuecomment-217787844>

    `red -t windows -c a.red` 
    Gorgeous! Me like!
    & it works  (to confirm that too)

--------------------------------------------------------------------------------

On 2016-05-09T07:20:51Z, ljgww, commented:
<https://github.com/red/red/issues/1886#issuecomment-217792780>

    red-060 - windows 10 v 1511 build 10586.164
    test.red (same as above) works (compiling, running) - most awesome!

--------------------------------------------------------------------------------

On 2016-05-09T07:53:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1886#issuecomment-217798670>

    _Compiling shows linux like path (cygwin, msys/MinGw), output file shows windows path. First is OK-ay but perhaps would confuse some people who never run unix layer on windows, other paths are correct._
    
    Agreed, I'm fixing it right now.

--------------------------------------------------------------------------------

On 2016-05-09T08:01:43Z, ghost, commented:
<https://github.com/red/red/issues/1886#issuecomment-217800124>

    @dockimbel There's also this -
    
    ```
    λ red.exe -c non-existent-file.red
    Cannot access source file: /C/non-existent-file.red
    ```
    
    which needs fixing.

--------------------------------------------------------------------------------

On 2016-05-09T08:03:56Z, dockimbel, commented:
<https://github.com/red/red/issues/1886#issuecomment-217800524>

    @ljgww Last remark before closing this ticket: when you use the `red-060.exe` binary by double-clicking it to launch the GUI console, by default it will flash a DOS console before opening the Red console. This behavior can be fixed, by a function call from Red console:
    
    ```
    red>> help "flip"
         flip-exe-flag    =>  Flip the sub-system for the red.exe between console and GUI modes (Windows only)
    red>> help flip-exe-flag
    
    USAGE:
        flip-exe-flag path
    
    DESCRIPTION:
         Flip the sub-system for the red.exe between console and GUI modes (Windows only). 
         flip-exe-flag is of type: function!
    
    ARGUMENTS:
         path  [file!] => Path to the red.exe.
    
    red>> flip-exe-flag %./
    ```
    
    Usually, that local path is enough, if the `red.exe` file is not found, then just use a absolute path (hint: Red uses Unix-style paths).

--------------------------------------------------------------------------------

On 2016-05-09T08:04:29Z, ghost, commented:
<https://github.com/red/red/issues/1886#issuecomment-217800622>

    @ljgww
    
    > I am guessing Red code is transpiled to Red/System 
    
    Exactly. Red code is first compiled to R/S code which is then compiled to native machine code.

