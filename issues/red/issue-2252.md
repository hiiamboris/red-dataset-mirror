
#2252: read https:// segfaults on 64 Bit Linux
================================================================================
Issue is closed, was reported by IngoHohmann and has 10 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/2252>

--== Red 0.6.1 ==-- 
Type HELP for starting information. 

red>> read https://www.gitter.im

**\* Runtime Error 32: segmentation fault
**\* at: F72CFE49h

With red built from source from commit 5ec74dc650c5790d341db0f014de94b59604acad



Comments:
--------------------------------------------------------------------------------

On 2016-10-03T12:12:55Z, qtxie, commented:
<https://github.com/red/red/issues/2252#issuecomment-251090904>

    I cannot reproduce it in my Ubuntu 15.04 32 bit VM and Debian 8 64 bit VM. 
    
    Would you please compile the console in debug mode (add `-d` in the command line) ? To see if it can give us some detail information.

--------------------------------------------------------------------------------

On 2017-02-20T13:44:46Z, qtxie, commented:
<https://github.com/red/red/issues/2252#issuecomment-281082726>

    Cannot reproduce this issue. I close it now. Please reopen it if it still occur in your Linux box.

--------------------------------------------------------------------------------

On 2017-10-04T17:13:03Z, cnasc, commented:
<https://github.com/red/red/issues/2252#issuecomment-334225382>

    I've just experienced this issue on Fedora 26 with Red 0.6.3. 
    
    ```
    >> read https://google.com
    *** Runtime Error 32: segmentation fault
    *** at: F5ACEC8Ah
    ```
    
    I tried compiling the console from git master with "-r -d %environment/console/console.red"
    
    Running with the compiled exe gives the same segfault and a line that says "Cannot determine source file/line info."
    
    Let me know if I compiled incorrectly or if there are any other steps I can take to help track this down. 

--------------------------------------------------------------------------------

On 2017-10-05T23:54:54Z, cnasc, commented:
<https://github.com/red/red/issues/2252#issuecomment-334623228>

    Just to be extra sure I could reproduce reliably, I gave it another try on a fresh VM on a different computer.
    
    Details: Fedora 26, 64-bit running on VMWare Fusion on macOS.
    Immediately after installing, I updated the system and downloaded the 32-bit supporting libraries. Then I downloaded the Red binary and ran it. The following are my results:
    ```
    [chris@localhost Downloads]$ ./red-063 
    --== Red 0.6.3 ==-- 
    Type HELP for starting information. 
    
    >> read http://google.com
    *** Access Error: invalid UTF-8 encoding: #{A050726F}
    *** Where: read
    *** Stack:  
    
    >> read https://google.com
    
    *** Runtime Error 32: segmentation fault
    *** at: F5A83C8Ah
    ```
    
    So this is certainly puzzling, because now I run into issues with `read` with both http (should I open a separate issue for that?) and https urls.
    
    One more session:
    ```
    [chris@localhost Downloads]$ ./red-063 
    --== Red 0.6.3 ==-- 
    Type HELP for starting information. 
    
    >> read http://bing.com
    == {<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "h...
    >> read https://bing.com
    
    *** Runtime Error 32: segmentation fault
    *** at: F5A8AC8Ah
    ```
    Works fine with http here, but https still breaks.

--------------------------------------------------------------------------------

On 2018-10-29T00:19:55Z, qtxie, commented:
<https://github.com/red/red/issues/2252#issuecomment-433756184>

    Fixed in the latest version.

