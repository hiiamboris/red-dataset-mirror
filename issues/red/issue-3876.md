
#3876: Assigning value to vector/:float: causes crash
================================================================================
Issue is closed, was reported by jlhouchin and has 12 comment(s).
[type.bug]
<https://github.com/red/red/issues/3876>

```
Red []
count: 0.0
vec-size: 100.0
vec: make vector! [float! 64 100]
count: count + 1.0
print count
print vec/:count
val: (1.012345 * (count / vec-size))
print val
vec/:count: val
```
Will compile fine but will crash.

```
1.0
none
0.01012345

*** Runtime Error 1: access violation
*** at: F7EC038Dh
```
Attempting to access the vector's value at vec/:count as a float simply returns none.


Comments:
--------------------------------------------------------------------------------

On 2019-05-14T02:20:25Z, greggirwin, commented:
<https://github.com/red/red/issues/3876#issuecomment-492053109>

    Thanks @jacobdufault. You should get an issue template from github for this project. It helps to use that, so we know platform specific issues, and for general scanning and ticket consistency as we process them. Good to get this ticket logged though. Much appreciated.

--------------------------------------------------------------------------------

On 2019-05-14T02:57:16Z, jlhouchin, commented:
<https://github.com/red/red/issues/3876#issuecomment-492059870>

    I am sorry, but I don't know anything about issue templates or how to get one. Any pointers greatly appreciated.

--------------------------------------------------------------------------------

On 2019-05-14T03:01:55Z, greggirwin, commented:
<https://github.com/red/red/issues/3876#issuecomment-492060641>

    First, let's see if github is doing what we want. If you go to the Issues tab and click on New Issue, then click on Get Started, to start a new bug report, you should see the following text in the form. That's the template.
    
    ---
    
    **Describe the bug**
    A clear and concise description of what the bug is.
    
    **To reproduce**
    Steps to reproduce the behavior:
    1. Go to '...'
    2. Click on '...'
    3. Scroll down to '...'
    4. See error
    
    **Expected behavior**
    A clear and concise description of what you expected to happen.
    
    **Screenshots**
    If applicable, add screenshots to help explain your problem.
    
    **Platform version (please complete the following information)**
    ```
    Run `about` command from Red console and paste the output here.
    ```
    
    ---
    
    If so, the easiest thing to do is go through each section and either fill them in or delete them. e.g. for a non-GUI bug, you rarely need a screenshot. Always run `about` in your REPL to include the Red version you're running.

--------------------------------------------------------------------------------

On 2019-05-14T07:45:24Z, qtxie, commented:
<https://github.com/red/red/issues/3876#issuecomment-492117879>

    It's not a bug in `vector!`. The crashes is happened in `throw-error` when the code is compiled.
    ```
    *** Runtime Error 1: access violation
    *** in file: /D/EE/QW/red/runtime/datatypes/object.reds
    *** at line: 97
    ***
    ***   stack: red/object/rs-select 025CD324h 02885620h
    ***   stack: red/error/reduce 025CD344h 025CD324h
    ***   stack: red/error/form 025CD324h 025CD334h 025CD314h -18
    ***   stack: red/actions/form 025CD324h 025CD334h 025CD314h 0
    ***   stack: red/actions/form* -1
    ***   stack: red/natives/prin* false
    ***   stack: red/natives/print* false
    ***   stack: red/stack/throw-error 025CD354h
    ***   stack: red/fire 0 0019FEE8h
    ***   stack: red/block/eval-path 026D45B4h 025CD334h 025CD324h 00000000h false
    ***   stack: red/actions/eval-path 026D45B4h 026CFF04h 025CD324h 00000000h false
    ***   stack: red/set-path* 026D45B4h 026CFF04h
    ```

--------------------------------------------------------------------------------

On 2019-05-14T10:43:15Z, jlhouchin, commented:
<https://github.com/red/red/issues/3876#issuecomment-492185725>

    Thanks Gregg. Having never done this before I just filed a "normal" issue and not a Bug Report. Which is why I never saw a template. Will do better next time.

--------------------------------------------------------------------------------

On 2021-08-20T11:21:40Z, dockimbel, commented:
<https://github.com/red/red/issues/3876#issuecomment-902623944>

    As a side note, the `vec/:count` expression cannot work with `count` referring to a float value, it has to be an integer if used as an index.

