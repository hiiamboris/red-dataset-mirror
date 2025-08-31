
#193: Using atexit() binding crashes
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/193>

```
Red/System []

#include %../C-library.reds

test: does [print "Exit"]

print on-quit as-integer :test
```

trueExit
**\* Runtime Error 16: invalid virtual address
**\* at: B767916Dh

This happens at least on Linux, and on Syllable using __cxa_atexit(). Setting the exit handler is OK, and it executes on quit, but after that it causes the crash.



Comments:
--------------------------------------------------------------------------------

On 2012-01-05T17:45:21Z, dockimbel, commented:
<https://github.com/red/red/issues/193#issuecomment-3373283>

    Well, I have a good and a bad news. :-)
    
    Good news: there is no error in the compiler, you just forgot to use the `cdecl` function attribut for the `test` function, which is required here, because it is called back by a C function.
    
    Bad news: you missed it and I have missed it too when analyzing this report and only realized that when I examined the ASM output for the function, which was obviously missing some code parts. We are the programmers writing the most code for Red/System, yet we forgot about that! :-) So, this means that we are clearly needing either a better documentation (with perhaps a `Callback` header somewhere), or a better syntax for not forgetting about such things. 
    
    What do you (and others) think?

--------------------------------------------------------------------------------

On 2012-01-05T21:45:53Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/193#issuecomment-3376870>

    Oops, sorry about that.
    
    Other than changing the compiler to use cdecl for all functions, I'm not sure what could be done about this. And that would prevent using fastcall later. Detecting passing a function to a system function already proved to be too problematic.
    
    I think after a few more occasions we will start associating crashes with calling conventions immediately. It's just that everybody will have to go through that.

--------------------------------------------------------------------------------

On 2012-01-06T03:05:05Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/193#issuecomment-3380234>

    Confirmed working on x86 Linux and Syllable.

