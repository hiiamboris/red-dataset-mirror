
#2510: Can't bootstrap red on macOS
================================================================================
Issue is closed, was reported by tekknolagi and has 4 comment(s).
<https://github.com/red/red/issues/2510>

I'm on macOS Sierra, attempting to bootstrap Red. I downloaded rebol as suggested in the README, and attempted to build Red:

```
$ ./rebol
REBOL/Core 2.7.8.2.5 (2-Jan-2011)
Copyright 2011 REBOL Technologies
REBOL is a Trademark of REBOL Technologies
All rights reserved.

Finger protocol loaded
Whois protocol loaded
Daytime protocol loaded
SMTP protocol loaded
ESMTP protocol loaded
POP protocol loaded
IMAP protocol loaded
HTTP protocol loaded
FTP protocol loaded
NNTP protocol loaded
>> do/args %red.r "%tests/hello.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)
REBOL - Security Check:
Script requests permission to execute a system shell command: sw_vers -productVersion
Yes, allow all, no, or quit? (Y/A/N/Q) Y

-=== Red Compiler 0.6.2 ===-

Compiling /Users/emacs/Documents/Dev/red/tests/hello.red ...
...using libRedRT built on 28-Mar-2017/16:02:30-7:00
...compilation time : 18 ms

Target: Darwin

Compiling to native code...
Script: "Red/System Mach-O format emitter" (none)
...compilation time : 940 ms
...linking time     : 44 ms
...output file size : 61440 bytes
...output file      : /Users/emacs/Documents/Dev/red/hello


== none
>> do/args %red.r "%environment/console/console.red"
Script: "Red command-line front-end" (none)
REBOL - Security Check:
Script requests permission to execute a system shell command: sw_vers -productVersion
Yes, allow all, no, or quit? (Y/A/N/Q) Y

-=== Red Compiler 0.6.2 ===-

Compiling /Users/emacs/Documents/Dev/red/environment/console/console.red ...
...using libRedRT built on 28-Mar-2017/16:02:30-7:00
...compilation time : 200 ms

Target: Darwin

Compiling to native code...
*** Compilation Error: undefined symbol: red/unicode/decode-utf8-char
*** in file: %/Users/emacs/Documents/Dev/red/environment/console/POSIX.reds
*** in function: exec/terminal/fd-read
*** at line: 235
*** near: [
    unicode/decode-utf8-char utf-char :len
]
>>
```

But this error comes up.


Comments:
--------------------------------------------------------------------------------

On 2017-03-29T00:35:54Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2510#issuecomment-289946784>

    Max
    
    > On 29 Mar 2017, at 07:13, Max Bernstein <notifications@github.com> wrote:
    > 
    > I'm on macOS Sierra, attempting to bootstrap Red. I downloaded rebol as suggested in the README, and attempted to build Red:
    > 
    ...
    > Compiling to native code...
    > *** Compilation Error: undefined symbol: red/unicode/decode-utf8-char
    > *** in file: %/Users/emacs/Documents/Dev/red/environment/console/POSIX.reds
    > *** in function: exec/terminal/fd-read
    > *** at line: 235
    > *** near: [
    >     unicode/decode-utf8-char utf-char :len
    > ]
    > >>
    > But this error comes up.
    > 
    The console needs to be compiled with the ‘-r’ (for release compiler option) as it needs to access some additional runtime functions.
    
    $ rebol -qs red.r -r environment/console/console.red -o test-console
    
    The GitHub readme needs to be updated.
    
    Regards
    
    Peter
    
    

--------------------------------------------------------------------------------

On 2017-03-29T00:40:22Z, tekknolagi, commented:
<https://github.com/red/red/issues/2510#issuecomment-289947452>

    Excellent, thanks!

