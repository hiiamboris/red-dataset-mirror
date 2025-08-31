
#2851: Program not compiling Ubuntu Linux
================================================================================
Issue is closed, was reported by Kingburrito777 and has 6 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2851>

## Currently got red working on the command line with the 062 executable. When I try to compile the hello.red I get this:
![redbad](https://user-images.githubusercontent.com/17525596/27887243-984a9c56-6194-11e7-8d75-99d5e798ecf4.png)

## Running from the terminal works fine:
![redgood](https://user-images.githubusercontent.com/17525596/27887266-b58c8fb8-6194-11e7-9caf-e92eae401357.png)


Installed pre-req:
```
dpkg --add-architecture i386
    apt-get update
    apt-get install libc6:i386 libcurl3:i386
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-06T05:09:21Z, ghost, commented:
<https://github.com/red/red/issues/2851#issuecomment-313296464>

    In your first ss, I don't know why typing `red` onto your console is trying to start `ed` (I am not a linux person), but you need to type the name of the executable which in this case is `red-062`.
      
    So the command would be `red-062 -c hello.red` (or its equivalent on linux).

--------------------------------------------------------------------------------

On 2017-07-06T18:33:03Z, Kingburrito777, commented:
<https://github.com/red/red/issues/2851#issuecomment-313481520>

    @nc-x Thanks man, really cleared that up! 

--------------------------------------------------------------------------------

On 2017-07-25T07:25:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2851#issuecomment-317653291>

    Some Linux distros still include the `red` and `ed` obsolete, 50 years old [line-oriented editors](https://www.computerhope.com/unix/ued.htm), just uninstall them.

