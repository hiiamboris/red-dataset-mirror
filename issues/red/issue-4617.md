
#4617: [crashed] when *copy some code to cli console*
================================================================================
Issue is closed, was reported by bitbegin and has 14 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/4617>


**Describe the bug**

crashed when *copy some code to cli console*

**To reproduce**
Steps to reproduce the behavior:
1. open cli console
2. copy this code to console
![copy](https://user-images.githubusercontent.com/4469745/89848673-52a1f580-dbb9-11ea-91ba-3a270a610c39.jpg)
3. the cli console crashed

[lexer-test.txt](https://github.com/red/red/files/5054365/lexer-test.txt)



**Expected behavior**
no crash

**Screenshots**

```
*** Runtime Error 1: access violation
*** in file: /D/vmware/focal-share/red/runtime/unicode.reds
*** at line: 814
***
***   stack: red/unicode/cp-to-utf16 91 00000000h
***   stack: terminal/emit-red-char 91
***   stack: terminal/emit-red-string 0052AFD0h 120 false
***   stack: terminal/refresh
***   stack: terminal/console-edit 027E5344h
***   stack: terminal/edit 027E5344h false
***   stack: _read-input 027E5344h false
***   stack: ask
***   stack: ctx||465~run 028CB6E4h
***   stack: ctx||465~launch 028CB6E4h
***   stack: ctx||484~launch 028CB19Ch
```
or
```
--== Red 0.6.4 ==--
Type HELP for starting information.

>> lex: function [
[        event    [word!]                                    ;-- eve
*** Runtime Error 1: access violation
*** at: 00425750h
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 11-Aug-2020/2:00:51
```



Comments:
--------------------------------------------------------------------------------

On 2020-10-23T18:04:02Z, dockimbel, commented:
<https://github.com/red/red/issues/4617#issuecomment-715493521>

    Is it still possible to reproduce this crash now? (I can't)

--------------------------------------------------------------------------------

On 2020-10-29T07:38:19Z, bitbegin, commented:
<https://github.com/red/red/issues/4617#issuecomment-718428828>

    still exists with commit `c65468f8f57e0efb7f1d5802384f667978f39f98`
    
    * built command: `do/args %red.r "-r -d environment/console/cli/console.red"`
    * copy from vscode
    * terminal: windows terminal
    
    ```
    ❯ .\console
    --== Red 0.6.4 ==--
    Type HELP for starting information.
    
    >> lex: function [
    [        event    [word!]                                    ;-- eve
    *** Runtime Error 1: access violation
    *** in file: /D/vmware/focal-share/red/runtime/unicode.reds
    *** at line: 814
    ***
    ***   stack: red/unicode/cp-to-utf16 91 00000000h
    ***   stack: terminal/emit-red-char 91
    ***   stack: terminal/emit-red-string 0052CE08h 120 false
    ***   stack: terminal/refresh
    ***   stack: terminal/console-edit 029153F4h
    ***   stack: terminal/edit 029153F4h false
    ***   stack: _read-input 029153F4h false
    ***   stack: ask
    ***   stack: ctx||466~run 00F0B5FCh
    ***   stack: ctx||466~launch 00F0B5FCh
    ***   stack: ctx||485~launch 00F0B0ACh
    ```

--------------------------------------------------------------------------------

On 2021-09-20T17:39:50Z, dockimbel, commented:
<https://github.com/red/red/issues/4617#issuecomment-923138176>

    @qtxie Can you reproduce it?

--------------------------------------------------------------------------------

On 2021-09-20T19:04:08Z, greggirwin, commented:
<https://github.com/red/red/issues/4617#issuecomment-923197709>

    I can't dupe it here with a recent build.

--------------------------------------------------------------------------------

On 2021-09-21T02:35:46Z, qtxie, commented:
<https://github.com/red/red/issues/4617#issuecomment-923548326>

    Yes. Still crashes on master branch.
    ```
    --== Red 0.6.4 ==--
    Type HELP for starting information.
    
    >> lex: function [
    [        event    [word!]                                    ;-- eve
    *** Runtime Error 1: access violation
    *** in file: /D/EE/QW/red/runtime/unicode.reds
    *** at line: 814
    ***
    ***   stack: red/unicode/cp-to-utf16 91 00000000h
    ***   stack: terminal/emit-red-char 91
    ***   stack: terminal/emit-red-string 004EAA9Ch 120 false
    ***   stack: terminal/refresh
    ***   stack: terminal/console-edit 05176094h
    ***   stack: terminal/edit 05176094h false
    ***   stack: _read-input 05176094h false
    ***   stack: ask
    ***   stack: ctx||451~run 0101B594h
    ***   stack: ctx||451~launch 0101B594h
    ***   stack: ctx||470~launch 0101AFA8h
    ```

--------------------------------------------------------------------------------

On 2021-09-21T03:15:05Z, qtxie, commented:
<https://github.com/red/red/issues/4617#issuecomment-923574958>

    But it works fine magically after I run it several times. 😓 

--------------------------------------------------------------------------------

On 2021-09-27T07:52:45Z, qtxie, commented:
<https://github.com/red/red/issues/4617#issuecomment-927619956>

    Add code to check the return value of the `allocate`: be07d6d36bb30031fad97e1755c4f89cbd75339a.

