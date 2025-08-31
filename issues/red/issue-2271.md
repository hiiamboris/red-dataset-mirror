
#2271: Red/system Compiler Internal Error
================================================================================
Issue is closed, was reported by TimeSlip and has 12 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2271>

Compiling to native code...
**\* Red/System Compiler Internal Error: Script Error : decorate-fun expected name argument of type: word
**\* Where: comp-expression
**\* Near:  [decorate-fun expr/1]

I'm getting this when I attempt to compile a .red file which is #including another .red file that itself has an r/s #system #import.

The r/s app compile fine by itself and also compiles fine with a simple view gui.
The larger app, runs fine in the cli, and w/o the r/s code it compiles fine. Only when I add both does it error out.
I've tried using the -u parameter and the same error occurs.
Thank you.



Comments:
--------------------------------------------------------------------------------

On 2016-10-14T06:20:54Z, dockimbel, commented:
<https://github.com/red/red/issues/2271#issuecomment-253719109>

    Thanks for the report, but if you don't provide a code example that triggers the error, this is very little we can do about it.

--------------------------------------------------------------------------------

On 2016-10-14T18:18:31Z, TimeSlip, commented:
<https://github.com/red/red/issues/2271#issuecomment-253881167>

    Yes, I'm trying to create something that is not the entire app Doc. The fact that no one else is reporting this to me means that it is user error which doesn't surprise me all that much.
    Thanks,
    James_Nak

--------------------------------------------------------------------------------

On 2016-10-15T04:24:57Z, TimeSlip, commented:
<https://github.com/red/red/issues/2271#issuecomment-253961917>

    OK, as far as I can tell, the error was caused because I used the following in my script (Which I do often in Rebol). This saves me time when I later encap things.
    
    compile: true
    either compile [
    
    ```
        #include %/o/marcus.png.red
        #include %/l/jamesjeo.red
        #include %/l/jamesmarkjeo.red
        #include %/o/jeopardysound.red  
    ```
    
    ][
    
    ```
    do %/l/marcus.png.red
    do %/l/jamesjeo.red
    do %/l/jamesmarkjeo.red
    ```
    
    ]   

--------------------------------------------------------------------------------

On 2016-10-15T04:26:36Z, TimeSlip, commented:
<https://github.com/red/red/issues/2271#issuecomment-253961976>

    BTW, the file locations, are not the problem because I keep copies of the png data in both places.

--------------------------------------------------------------------------------

On 2016-10-17T10:17:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2271#issuecomment-254168762>

    @TimeSlip I need a way to reproduce the issue, the above code pattern compiles fine.

--------------------------------------------------------------------------------

On 2017-02-17T11:50:27Z, dockimbel, commented:
<https://github.com/red/red/issues/2271#issuecomment-280629855>

    Without a way to reproduce the issue, we cannot process it.

