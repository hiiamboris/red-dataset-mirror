# How do I set an icon to a view in red program?

**Link:**
<https://stackoverflow.com/questions/65496326/how-do-i-set-an-icon-to-a-view-in-red-program>

**Asked:** 2020-12-29 17:36:25 UTC

------------------------------------------------------------------------

I want to set an icon for the program main window. I found this page
[https://www.red-lang.org/2016/03/060-red-gui-system.html](https://www.red-lang.org/2016/03/060-red-gui-system.html){rel="nofollow noreferrer"}
which says:

> Icons and other \"resources\" are now supported for inclusion in
> Windows executables. They can be set from Red\'s main script header,
> these are the currently supported options:

> Icon: file! or block! of files

> If no Icon option is specified, a default Red icon will be provided.

I don\'t get if I need to do it in the program declaration or elsewhere

    Red [
        needs view
        icon %icon1.ico
    ]
    ; this doesn't seem to work but it also doesn't break the program

I have also tried putting the `icon` line in the block defining the view
but it is breaking the program.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by jakubiszon

The right syntax is:

    Red [
        needs: view
        icon: %icon1.ico
    ]

Also the program needs to be compiled (e.g.
`red -c -t windows program.red`). If the program is launched as a script
(`do %program.red` in red console app) the icon will not be picked up.

------------------------------------------------------------------------

## Comments on question
