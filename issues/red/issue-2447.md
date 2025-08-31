
#2447: Unable first run (compile) in Linux 64
================================================================================
Issue is closed, was reported by lpvm and has 6 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/2447>

In Linux 64 bits, when running $ ./red-16feb17-878e22b for the first time (compiling) it complains about ~/.red/console-2017-2-16-60339: undefined symbol: dlopen.

After dropping a line in gitter chat, I was lead to https://gitter.im/red/red?at=58a6078e21d548df2c1baa30, so it seems that some Linux distros are affected by this.

As written by Nenad:

Fev 17 09:30
@opsaaspo It seems that on your platform, dlopen() is located in ld-linux.so instead of libc.so, as in most Linux distros. Red imports it from libc by default. You can change that in the sources to make it work on your distro. We might add a compilation option to let the user configure it more easily.

I'd be grateful if that compilation option could be added.
Thanks.


Comments:
--------------------------------------------------------------------------------

On 2017-02-22T05:46:31Z, qtxie, commented:
<https://github.com/red/red/issues/2447#issuecomment-281575794>

    @lpvm Please let me know if the fix works for you.

--------------------------------------------------------------------------------

On 2017-02-22T09:31:42Z, opsaaspo, commented:
<https://github.com/red/red/issues/2447#issuecomment-281616317>

    Hi,
    
    I've asked question here https://gitter.im/red/red?at=58ab5e1a872fc8ce6260247b and got answer here https://gitter.im/red/red?at=58ab69adaa800ee52cc03990 .  I've tried to do it  but I've got error when I've tried to do :
    > do/args %red.r "%environment/console/console.red"
    
    I've used [rebol2](http://www.rebol.com/downloads/v278/rebol-core-278-4-10.tar.gz).
    I think the problem was related to the fact that I have not yet figured out what to add to LIBLD in section #import in the file libc.reds. As a result, I don't know, it helped me or not.
    
    FYI: The red-22feb17-27f2a57 is running on Ubuntu 64 bit without problem. 
    
    PS: I did it on 21 February.

--------------------------------------------------------------------------------

On 2017-02-22T16:57:53Z, lpvm, commented:
<https://github.com/red/red/issues/2447#issuecomment-281730988>

    YES!  It works!
    
    ```
    $ ./red-22feb17-ab9a3c0 
    Compiling compression library...
    Compiling Red console...
    --== Red 0.6.1 ==-- 
    Type HELP for starting information. 
    
    red>> 
    ```
    
    Thank you so much!  Keep up with the excellent work!  Have a nice day!

