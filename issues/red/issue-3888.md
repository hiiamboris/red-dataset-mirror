
#3888: Failed to access GUI api on linux from GTK branch
================================================================================
Issue is closed, was reported by beenotung and has 10 comment(s).
[status.resolved] [type.alien]
<https://github.com/red/red/issues/3888>

**Describe the bug**
I am on the current GTK branch (last commit: c494addcb21b583c0b108ce33a8531df5131ca8f) . I am trying to use GUI feature in red on linux but failed.

When I build the CLI console, it said:
```
$ ./console
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> view []
*** Script Error: view has no value
*** Where: catch
*** Stack:  

```
when I build GUI console, it said:
```
$ ./gui-console
*** Runtime Error 1: access violation
*** at: 08126A88h
```

**To reproduce**
Steps to reproduce the behavior:
1. Clone the red repo
2. Checkout the GTK branch
3. Launch the rebol console
4. Run `do/args %red.r "-r %environment/console/CLI/console.red"`
5. Quit the rebol console
6. Run the red cli console `./console`
7. Run `view []`
> Result: Failed, as above description
8. Launch the rebol console
9. Run `do/args %red.r "-r %environment/console/GUI/gui-console.red"`
10. Quit the rebol console
11. Run the red gui console `./gui-console`
> Result: Failed, as above description

**Expected behavior**
A clear and concise description of what you expected to happen.
1. The view module should be loaded for red.
2. The GUI console should be able to launch without error.

<!--
**Screenshots**
If applicable, add screenshots to help explain your problem.
-->

**Platform version (please complete the following information)**
Red about:
```
Red 0.6.4 for Linux built 22-May-2019/12:37:26+08:00
```
OS: Archlinux 64-bit (lib32-gtk3 installed)
WM: awesome v4.3 (Compiled against Lua 5.3.5)


Comments:
--------------------------------------------------------------------------------

On 2019-05-22T06:31:01Z, rebolek, commented:
<https://github.com/red/red/issues/3888#issuecomment-494670658>

    You need to build `%environment/console/CLI/console-view.red` or manually add `Needs: View` to header.

--------------------------------------------------------------------------------

On 2019-05-22T10:42:10Z, meijeru, commented:
<https://github.com/red/red/issues/3888#issuecomment-494750227>

    If @rebolek 's suggestion is the solution, this is not an issue proper, in fact. 

--------------------------------------------------------------------------------

On 2019-05-22T12:40:25Z, rebolek, commented:
<https://github.com/red/red/issues/3888#issuecomment-494784944>

    Right, this is not an issue, CLI console is not meant to be able to run View scripts. `console-view.red` is workaround for GTK version, as GUI console doesn't work there yet.
    Also I believe that GTK problems should be reported to https://github.com/rcqls/red as it's community effort, not official Red branch.

--------------------------------------------------------------------------------

On 2019-05-22T14:59:10Z, meijeru, commented:
<https://github.com/red/red/issues/3888#issuecomment-494840563>

    @greggirwin For your attention.

--------------------------------------------------------------------------------

On 2019-05-22T16:17:22Z, dockimbel, commented:
<https://github.com/red/red/issues/3888#issuecomment-494872555>

    @rebolek Correct, GTK-related issues should be opened in https://github.com/rcqls/red repo for now.
    
    As @rebolek offered a solution, I am closing this ticket.

