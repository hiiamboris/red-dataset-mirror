
#571: Windows (XP) REPL buffer issue 
================================================================================
Issue is closed, was reported by johnk- and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/571>

Input is handled incorrectly after a certain number of characters.

Simple case below.

red>> none none none none none none none none none none none none none none none none none none none
 none none none none none none none none none none none none none none none none none none none none
 none none none none none print "Hi"
**\* Error: word has no value!
red>> **\* Error: word has no value!
Hi

Alternatively filling the buffer with space characters also causes an issue.

red>>                                                

```
                                              print "Hi"
```

red>> **\* Load Error: string ending delimiter " not found!
H
== ""
red>> red>>



Comments:
--------------------------------------------------------------------------------

On 2013-11-22T00:26:55Z, dockimbel, commented:
<https://github.com/red/red/issues/571#issuecomment-29038766>

    The current poor's man console we have has a line buffer limited to 128 bytes on Windows (including terminal NUL). The buffer will be extended to 16KB, hopefully, it should be enough until we implement the real console.

