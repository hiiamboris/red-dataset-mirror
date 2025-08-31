
#826: missing random.reds file when precompiling
================================================================================
Issue is closed, was reported by WiseGenius and has 10 comment(s).
<https://github.com/red/red/issues/826>

```
Microsoft Windows XP [Version 5.1.2600]
(C) Copyright 1985-2001 Microsoft Corp.

H:\>red-21may14-a925d9f.exe
Pre-compiling Red console...
*** Loading Error: file access error: make object! [
    code: 500
    type: 'access
    id: 'cannot-open
    arg1: "/H/random.reds"
    arg2: none
    arg3: none
    near: [any [get-cache file read/binary file]]
    where: 'read-binary-cache
]
*** in file: %parse.reds
*** at line: 77
```



Comments:
--------------------------------------------------------------------------------

On 2014-05-22T11:46:46Z, WayneCui, commented:
<https://github.com/red/red/issues/826#issuecomment-43877375>

    Same with Windows 7 and CentOS 6.5. Just download the binary and run it.

--------------------------------------------------------------------------------

On 2014-05-22T23:01:39Z, qtxie, commented:
<https://github.com/red/red/issues/826#issuecomment-43954331>

    @WayneTsui @WiseGenius  A Fix (6b61b5815d8586ed544658abeb1486034296d6c6) about this issue have been merged at May 22. But I find the nightly build is `red-21may14-a925d9f.exe`, the `21may` indicate it's built on May 21.

--------------------------------------------------------------------------------

On 2014-05-23T04:51:27Z, WayneCui, commented:
<https://github.com/red/red/issues/826#issuecomment-43971106>

    @qtxie I see. @WiseGenius , if you want to use the latest Red, you could use a self-compiling one: just compile  runtime/console/console.red. Or you may have already done this? :-)

--------------------------------------------------------------------------------

On 2014-05-23T08:45:02Z, WiseGenius, commented:
<https://github.com/red/red/issues/826#issuecomment-43984699>

    @WayneTsui, Thanks. Or I may have downloaded random.reds into the same folder as the binary. ;)

--------------------------------------------------------------------------------

On 2014-05-24T17:07:35Z, WiseGenius, commented:
<https://github.com/red/red/issues/826#issuecomment-44093277>

    Just confirming that red-24may14-6b61b58.exe works. Thanks, @qtxie.

