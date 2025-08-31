
#135: Problem compiling under REBOL/Core v2.7.8 on Windows/XP
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/135>

Running the unit tests under REBOL/Core on Windows/XP SP3 raises the following error:

```
>> system/version
== 2.7.8.3.1
>> pwd
== %/c/Red/Red-System/tests/
>> do %run-all.r
** Access Error: Cannot open /c/Red/Red-System/tests/quick-test/kernel32.dll
** Where: context
** Near: kernel32: load/library %kernel32.dll
SECURITY_ATTRIBUTES: make
```

The tests continue to run successfully under REBOL/View



Comments:
--------------------------------------------------------------------------------

On 2011-07-13T10:40:55Z, dockimbel, commented:
<https://github.com/red/red/issues/135#issuecomment-1561721>

    Actually, Quick-Test requires the /Library components for running on Windows (XP, Vista, Seven) with REBOL 2.7.8 to workaround the REBOL native `call` bug on `crlf`. So, Quick-Test will not work on REBOL/Core 2.7.8 on Windows and I don't see how we can workaround that simply, without REBOLTech fixing the native bug.
    
    Running on /Core 2.7.6 is OK on all Windows flavors AFAICT.

--------------------------------------------------------------------------------

On 2011-07-13T22:27:30Z, PeterWAWood, commented:
<https://github.com/red/red/issues/135#issuecomment-1566739>

    Thanks for the explanation.
    
    On 13 Jul 2011, at 18:40, dockimbel wrote:
    
    > Actually, Quick-Test requires the /Library components for running on Windows (XP, Vista, Seven) with REBOL 2.7.8 to workaround the REBOL native `call` bug on `crlf`. So, Quick-Test will not work on REBOL/Core 2.7.8 on Windows and I don't see how we can workaround that simply, without REBOLTech fixing the native bug.
    > 
    > Running on /Core 2.7.6 is OK on all Windows flavors AFAICT.
    > 
    > ## 
    > 
    > Reply to this email directly or view it on GitHub:
    > https://github.com/dockimbel/Red/issues/135#issuecomment-1561721

--------------------------------------------------------------------------------

On 2011-07-20T21:26:03Z, dockimbel, commented:
<https://github.com/red/red/issues/135#issuecomment-1619139>

    I am dismissing this ticket as there is nothing we can do to fix or workaround that REBOL issue. The solution for running Quick-Test tests under Windows with REBOL v2.7.8 is to use the /View version (or: /Pro, /Command).

