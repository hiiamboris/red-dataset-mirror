
#3160: Error running on linux (Solus 3)
================================================================================
Issue is closed, was reported by unreadable and has 2 comment(s).
<https://github.com/red/red/issues/3160>

### Expected behavior
Open a simple window
### Actual behavior
Compiles fine, but on the runtime throws the following error:
### Steps to reproduce the problem
	Red [Needs: 'View]
    view [text "Hello World!"]
	
Save it in a gui.red file then `red -c gui.red`

    ./gui
	*** Script Error: view has no value
	*** Where: ???

### Red version and build date, operating system with version.
red-063, December 22, 2017, Solus 3




Comments:
--------------------------------------------------------------------------------

On 2017-12-22T09:36:48Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3160#issuecomment-353560336>

    There is no GUI backend for Linux yet. Work has started in the GTK git branch but it is a long way from complete.

