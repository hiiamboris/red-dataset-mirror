
#709: Add a hint on how to quit Red console
================================================================================
Issue is closed, was reported by iArnold and has 6 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/709>

C:\cursuspb\project\red>console.exe

-=== Red Console alpha version ===-
Type HELP for starting information.

red>> help
Use HELP or ? to see built-in info:

```
help insert
? insert
```

To see all words of a specific datatype:

```
? native!
? function!
? datatype!
```

Other debug functions:

```
?? - display a variable and its value
probe - print a value (molded)
source func - show source code of func
what - show a list of known functions
system/version - display version number and build date
```

red>>

No hint how to quit the console.
("what" does show "quit" but you have to find it in a long list of functions and it is not clear from this that it also applies for the console)



Comments:
--------------------------------------------------------------------------------

On 2014-03-04T13:05:06Z, PeterWAWood, commented:
<https://github.com/red/red/issues/709#issuecomment-36621646>

    The current console is a temporary solution that Nenad created quickly to give people something to "play" with. It has been requested that bug reports not be created about issues with it (of which there are many).
    
    Nenad has plans to write a "proper" console, hopefully in the near future, unless somebody with the necessary skills can volunteer to take on the job.

--------------------------------------------------------------------------------

On 2014-03-04T14:13:19Z, dockimbel, commented:
<https://github.com/red/red/issues/709#issuecomment-36627081>

    The addition of the HELP system is recent, I agree that `quit` should be mentioned also. So, I propose two changes:
    - Rename "Other debug functions" to "Other useful functions" or something better.
    - Add an entry for `quit` at the bottom of that list.
    
    I leave it to you to do these changes and send a PR to master branch. ;-)
    
    BTW, thanks to @PeterWAWood for preprocessing the new issues, it is really helpful! (even if I had to reopen this one).

--------------------------------------------------------------------------------

On 2014-03-04T18:50:07Z, iArnold, commented:
<https://github.com/red/red/issues/709#issuecomment-36659301>

    Work in progress..

