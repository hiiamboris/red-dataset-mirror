
#1561: "Hello World" compilation crashes with Rebol/Core
================================================================================
Issue is closed, was reported by Senenmut and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1561>

Hi there. I am new in RED.
Wanna start the simple "Hello World" program in the RED-GitHub repository.

Look at the results.  What have a made false ?  My OS: WinXP

`REBOL/Core 2.7.8.3.1 (1-Jan-2011)
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

> > do/args %red.r "%tests/hello.red"
> > Script: "Red command-line front-end" (none)
> > Script: "Encap virtual filesystem" (21-Sep-2009)
> > ***\* Script Error: Feature not available in this REBOL**
> > *\* Where: context
> > *\* Near: SECURITY_ATTRIBUTES: make struct! [
> >     nLength [integer!]
> >     lpSecurityDescriptor [integer!]
> >     bInheritHandle [int...
> > `

I have strictly followed the instructions on Github  RED package.

Need help in this case.

If the start functions , than i can later try to "compile" it.



Comments:
--------------------------------------------------------------------------------

On 2016-01-29T13:53:24Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1561#issuecomment-176763357>

    I believe your questions have been answered on the Red-Lang mailing list.
    
    I am keeping this issue open as the Red toolchain now requires Rebol/View and the GitHub read links to Rebol/Core.
    
    In future, we would appreciate if you could first raise such issues on the Red-Lang mailing list and get confirmation that there is a problem before opening a GitHub issue.

--------------------------------------------------------------------------------

On 2016-01-29T13:54:42Z, ghost, commented:
<https://github.com/red/red/issues/1561#issuecomment-176763651>

    @Mennohexo There is another way to use Red. Just download the red binaries from http://www.red-lang.org/p/download.html?m=1
    There are downloads for both last major release 0.5.4 as well as latest master branch.

--------------------------------------------------------------------------------

On 2016-01-29T13:55:33Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1561#issuecomment-176764006>

    @dockimbel @qtxie I was going to simply change the link in the GitHub readme but wanted to check if Rebol/View pops up an option to be installed when you first run it.

--------------------------------------------------------------------------------

On 2016-01-30T06:05:24Z, dockimbel, commented:
<https://github.com/red/red/issues/1561#issuecomment-177081263>

    This is a regression, we should be able to run the Red toolchain from Rebol/Core.

--------------------------------------------------------------------------------

On 2016-01-30T06:08:11Z, dockimbel, commented:
<https://github.com/red/red/issues/1561#issuecomment-177082070>

    Tested on Rebol/Core 2.7.6 and 2.7.8, works fine now. The shortly flashing DOS console window is required in such configuration (running Red from sources with /Core).

