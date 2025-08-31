
#2080: Unable to compile red with rebol from https://github.com/rebol/rebol
================================================================================
Issue is closed, was reported by vrthra and has 12 comment(s).
<https://github.com/red/red/issues/2080>

I am trying to compile `red` for a 64bit linux machine using rebol from `https://github.com/rebol/rebol`. I built rebol, which produced a binary `r3`. Now, running `r3` from red

```
$ r3
**************************************************************************
**                                                                      **
**  REBOL 3.0 [Alpha Test]                                              **
**                                                                      **
**    Copyright: 2016 REBOL Technologies                                **
**               All rights reserved.                                   **
**    Website:   www.REBOL.com                                          **
**                                                                      **
**    Version:   2.101.0.4.4                                            **
**    Platform:  Linux libc6-2-11-x86                                   **
**    Build:     25-Jun-2016/20:44:02                                   **
**    Warning:   For testing purposes only. Use at your own risk.       **
**                                                                      **
**    Language:  none                                                   **
**    Locale:    none                                                   **
**    Home:      /rebol-night**
**                                                                      **
**************************************************************************
SECURE is disabled
Important notes:
  * Sandbox and security are not available.
  * Direct access to TCP HTTP required (no proxies).
  * Default web browser must be available.
Special functions:
  Chat - open DevBase developer forum/BBS
  Docs - open DocBase document wiki (web)
  Bugs - open CureCode bug database (web)
  Demo - run demo launcher (from rebol.com)
  Help - show built-in help information
  Upgrade - check for newer releases
  Changes - what's new about this version (web)
>> do %run-all.r
Script: "Builds and Runs All Red and Red/System Tests" Version: 0.3.0 Date: none
Making /Development/red/system/tests/source/units/auto-tests/byte-auto-test.reds  - it will take a while
** Syntax error: invalid "word" -- "=<"
** Where: to case load -apply- do if make-if-needed? catch either either -apply- do catch either either -apply- do
** Near: (line 63) =<
>>
```

What am I doing wrong?



Comments:
--------------------------------------------------------------------------------

On 2016-06-30T04:49:44Z, ghost, commented:
<https://github.com/red/red/issues/2080#issuecomment-229558706>

    @vrthra You need Rebol 2. Rebol 3 won't work.
    Here are the instructions - 
    https://github.com/red/red#running-red-from-the-sources

--------------------------------------------------------------------------------

On 2016-06-30T04:54:44Z, vrthra, commented:
<https://github.com/red/red/issues/2080#issuecomment-229559195>

    But the linked `rebol` is 32 bit and wont run on my machine.
    
    ```
    $ file ./releases/rebol-core/rebol
    ./releases/rebol-core/rebol: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 2.6.8, stripped
    ```
    
    Is there any thing I can do?

--------------------------------------------------------------------------------

On 2016-06-30T04:57:45Z, ghost, commented:
<https://github.com/red/red/issues/2080#issuecomment-229559485>

    Try this - http://www.rebol.com/downloads/v278/rebol-core-278-4-10.tar.gz
    Maybe it works (I am on windows, so you better wait for someone using linux to help you out).
    
    Or else you can use red binaries, no need for rebol. Here are the download links with instructions - http://www.red-lang.org/p/download.html

--------------------------------------------------------------------------------

On 2016-06-30T05:11:26Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2080#issuecomment-229560914>

    Rahul
    
    > On 30 Jun 2016, at 12:57, nc-x notifications@github.com wrote:
    > 
    > Try this - http://www.rebol.com/downloads/v278/rebol-core-278-4-10.tar.gz
    > Maybe it works (I am on windows).
    > 
    > Or else you can use red binaries, no need for rebol. Here are the download links with instructions - http://www.red-lang.org/p/download.html
    > 
    > —
    > You are receiving this because you are subscribed to this thread.
    > Reply to this email directly, view it on GitHub, or mute the thread.
    > 
    > Did you follow the instructions at the bottom of the Red download page:
    
    (*) For Linux 64-bit distros, you need to install 32-bit supporting libraries. So, for Debian-based distros, install them using:
        $ sudo apt-get install ia32-libs libc6-i386 libcurl3
    
    If you are using a Debian 7+ or Ubuntu 13.10+ version, you should use the multiarch way:
        $ dpkg --add-architecture i386
        $ apt-get update
        $ apt-get install libc6:i386 libcurl3:i386
    
    Regards
    
    Peter

--------------------------------------------------------------------------------

On 2016-06-30T05:14:55Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2080#issuecomment-229561286>

    > On 30 Jun 2016, at 12:57, nc-x notifications@github.com wrote:
    > 
    > Try this - http://www.rebol.com/downloads/v278/rebol-core-278-4-10.tar.gz http://www.rebol.com/downloads/v278/rebol-core-278-4-10.tar.gz
    > Maybe it works (I am on windows).
    > 
    > Even if Rebol2 64-bit runs, Red needs a 32-bit LibC. I don’t think this will solve the problem.
    > 
    > Or else you can use red binaries, no need for rebol. Here are the download links with instructions - http://www.red-lang.org/p/download.html http://www.red-lang.org/p/download.htmlThe Red binaries will not run on a 64-bit system without the 32-bit libraries. The Red binaries include the Rebol 2 interpreter.
    
    Regards
    
    Peter

--------------------------------------------------------------------------------

On 2016-06-30T05:19:58Z, vrthra, commented:
<https://github.com/red/red/issues/2080#issuecomment-229561876>

    Oh ok. I did not see that (about 32 bit only) in the github page, and missed it.

