
#1284: Cannot open crush.dll as library
================================================================================
Issue is closed, was reported by WiseGenius and has 82 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1284>

This error is encountered when trying to compile **any** code from the source.

On Windows XP:

Using Rebol 2 View (rebol-view-278-3-1.exe):
In red-master source:

```
REBOL/View 2.7.8.3.1 1-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM


Type desktop to start the Viewtop.
>> do/args %red.r "-c %test.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.5.4 ===-

Compiling /H/red-master/test.red ...
Pre-compiling compression library...
Script: "Red/System PE/COFF format emitter" (none)
*** Driver Internal Error: Access Error : Cannot open ./crush.dll as library
*** Where: build-compress-lib
*** Near:  [crush-lib: load/library filename
crush-compress: make
]
```

The file `crush.dll` was created.
The file `test.exe` was not created.

The content of `test.red` is simply:

```
Red []

print "This is the test output."
```

This issue was mentioned about 2 months ago [here](https://github.com/red/red/issues/1099) and discussed [here](https://groups.google.com/forum/#!msg/red-lang/mmlCKVCpt_c/EFeFaBz38wsJ).

Using Rebol 2 Core (rebol-core-278-3-1.exe):

```
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
>> do/args %red.r "-c %test.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.5.4 ===-

Compiling /H/red-master/test.red ...
...compilation time : 360 ms

Compiling to native code...
Script: "Red/System PE/COFF format emitter" (none)
...compilation time : 12953 ms
...linking time     : 78 ms
...output file size : 432640 bytes
...output file      : H:\red-master\test.exe

== none
```

The file `crush.dll` was **not** created.
The file `test.exe` **was** created.

And works:

```
H:\red-master>test
This is the test output.
```

However, using Rebol 2 Core won't work for all code (eg. compiling red-gui).

The automated builds interpret and compile ok:

```
H:\>red-24jul15-895ec65.exe test.red
Pre-compiling compression library...
Pre-compiling Red console...
This is the test output.

H:\>red-24jul15-895ec65.exe -c test.red

-=== Red Compiler 0.5.4 ===-

Compiling /H/test.red ...
...compilation time : 375 ms

Compiling to native code...
...compilation time : 12781 ms
...linking time     : 94 ms
...output file size : 320512 bytes
...output file      : H:\test.exe


H:\>test
This is the test output.
```

Again, this can't be used to test red-gui.



Comments:
--------------------------------------------------------------------------------

On 2015-07-24T07:21:31Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-124385661>

    Did you put the Rebol.exe in the sources root folder and ran it from there?

--------------------------------------------------------------------------------

On 2015-07-24T07:31:32Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-124390310>

    I always put `rebol-view-278-3-1.exe` and `test.red` into the same folder as `red.r`, and run the executable from there, yes. Same with `rebol-core-278-3-1.exe`.

--------------------------------------------------------------------------------

On 2015-07-24T16:31:39Z, Oldes, commented:
<https://github.com/red/red/issues/1284#issuecomment-124573805>

    In theory, you could just set false at this line and use Rebol/View without using the crush.dll https://github.com/red/red/blob/master/red.r#L25

--------------------------------------------------------------------------------

On 2015-07-24T16:32:23Z, Oldes, commented:
<https://github.com/red/red/issues/1284#issuecomment-124573946>

    Btw... Rebolek mentioned same issue. He is using XP too.

--------------------------------------------------------------------------------

On 2015-07-24T16:33:36Z, Oldes, commented:
<https://github.com/red/red/issues/1284#issuecomment-124574185>

    It looks that the created crush.dll is not loadable on Windows XP from some reason.

--------------------------------------------------------------------------------

On 2015-07-24T16:48:59Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-124577031>

    @Oldes [here](https://groups.google.com/forum/#!msg/red-lang/mmlCKVCpt_c/EFeFaBz38wsJ) though, it looks like @iArnold is having the same problem on Windows 7. Could it be because we're using 32-bit Windows as you suggested earlier?
    
    Is there anyone out there who **does** have it working on XP?

--------------------------------------------------------------------------------

On 2015-07-24T16:50:59Z, Oldes, commented:
<https://github.com/red/red/issues/1284#issuecomment-124577380>

    I'm quite surprised that someone is still using XP :) I'm having 64bit Win7, so cannot say if it may be related.

--------------------------------------------------------------------------------

On 2015-07-24T16:55:26Z, rebolek, commented:
<https://github.com/red/red/issues/1284#issuecomment-124578121>

    @Oldes WinXP VM runs superfast with only 384MB memory and takes just few gigs on HD. Can't say the same about newer versions. So why should I run them? Just because MS wants me to upgrade?
    Anyway, as you said, setting `load-lib?` to `false` makes it work.

--------------------------------------------------------------------------------

On 2015-07-24T17:05:46Z, Oldes, commented:
<https://github.com/red/red/issues/1284#issuecomment-124581358>

    Right... in VM it makes a sense. I was not using VM quite a long time:) Anyway.. looking again at ProcMonitor log provided by @iArnold and my own..
    
    Both do successfully:
    `Load Image C:\dev\GIT\Red\crush.dll    SUCCESS`
    `CloseFile  C:\dev\GIT\Red\crush.dll    SUCCESS`
    
    But iArnold is missing the:
    `QueryNameInformationFile   C:\dev\GIT\Red\crush.dll    SUCCESS`
    
    Which will be the place where the dll loading fails.

--------------------------------------------------------------------------------

On 2015-07-25T01:06:45Z, qtxie, commented:
<https://github.com/red/red/issues/1284#issuecomment-124780937>

    I encountered this issue before, I don't remeber how to fix it. I think I just ignored it. I deleted the red repo and clone a new one, or just clone a new one in another folder, then it works. (Maybe need to reboot and turn off antivirus software ;-) )

--------------------------------------------------------------------------------

On 2015-07-25T02:13:24Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-124788885>

    Up to now, I've been testing on my 1.5-year-old desktop. I just tested on my 5-year-old laptop, also running 32-bit Windows XP: @qtxie, first, I rebooted, then turned off all anti-virus software, then downloaded the source, etc. I get the exact same behaviour.
    @qtxie, ever since `crush.dll` was introduced, I've been downloading the source afresh and having this same issue. For months, I've been forced to use the automated builds instead. As there are no automated builds for the gui branch, I haven't been able to properly test it yet.
    From tomorrow onwards I'll try doing everything with [line 25](https://github.com/red/red/blob/master/red.r#L25) set to false, but I still see this as a temporary workaround.
    Although I'm not prepared to justify my continued use of Windows XP, I do think Red should be able to compile on XP. Furthermore, I think it's too early to say that it's only and always XP which has this problem. In the coming week I'll try to get access to some 32-bit Windows 7 computers and report the results.

--------------------------------------------------------------------------------

On 2015-07-26T09:54:47Z, iArnold, commented:
<https://github.com/red/red/issues/1284#issuecomment-124966344>

    Wisegenius,
    
    How about downloading the zipfile and then compile using the new rc way. I
    almost never compile using the old method anymore (because of the crush.dll
    error).
    
    Good to see some effort in getting this explained.
    
    regards,
    
    Arnold
    2015-07-25 4:13 GMT+02:00 WiseGenius notifications@github.com:
    
    > Up to now, I've been testing on my 1.5-year-old desktop. I just tested on
    > my 5-year-old laptop, also running 32-bit Windows XP: @qtxie
    > https://github.com/qtxie, first, I rebooted, then turned off all
    > anti-virus software, then downloaded the source, etc. I get the exact same
    > behaviour.
    > @qtxie https://github.com/qtxie, ever since crush.dll was introduced,
    > I've been downloading the source afresh and having this same issue. For
    > months, I've been forced to use the automated builds instead. As there are
    > no automated builds for the gui branch, I haven't been able to properly
    > test it yet.
    > From tomorrow onwards I'll try doing everything with line 25
    > https://github.com/red/red/blob/master/red.r#L25 set to false, but I
    > still see this as a temporary workaround.
    > Although I'm not prepared to justify my continued use of Windows XP, I do
    > think Red should be able to compile on XP. Furthermore, I think it's too
    > early to say that it's only and always XP which has this problem. In the
    > coming week I'll try to get access to some 32-bit Windows 7 computers and
    > report the results.
    > 
    > .

--------------------------------------------------------------------------------

On 2015-07-26T10:25:08Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-124967348>

    @iArnold, Yes, that was one of the tests I did for this report. I didn't include it because I didn't want it to be too cluttered too early with every permutation I tried. For me, it gave the same result (below).
    Does the new `rc` way work for you, then? Perhaps I'm using it incorrectly? (I was wondering if it was supposed to say `No source files specified.` initially?)
    Here is the relevant part of the report I removed (so it's using the same source as the other examples from 2 days ago):
    
    Using the new `rc` function as introduced [here](http://www.red-lang.org/2015/04/053-faster-compilation-and-extended.html):
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    
    
    Type desktop to start the Viewtop.
    >> do %red.r
    Script: "Red command-line front-end" (none)
    Script: "Encap virtual filesystem" (21-Sep-2009)
    No source files specified.
    >> rc "-c test.red"
    
    -=== Red Compiler 0.5.4 ===-
    
    Compiling /H/red-master/test.red ...
    Pre-compiling compression library...
    Script: "Red/System PE/COFF format emitter" (none)
    *** Driver Internal Error: Access Error : Cannot open ./crush.dll as library
    *** Where: build-compress-lib
    *** Near:  [crush-lib: load/library filename
    crush-compress: make
    ]
    
    ```
    
    The file `crush.dll` was created.
    The file `test.exe` was not created.

--------------------------------------------------------------------------------

On 2015-07-26T14:29:31Z, iArnold, commented:
<https://github.com/red/red/issues/1284#issuecomment-124997383>

    (Sorry, mixed up two different issues)
    
    2015-07-26 11:54 GMT+02:00 Arnold arnoldvanh@gmail.com:
    
    > Wisegenius,
    > 
    > How about downloading the zipfile and then compile using the new rc way. I
    > almost never compile using the old method anymore (because of the crush.dll
    > error).
    > 
    > Good to see some effort in getting this explained.
    > 
    > regards,
    > 
    > Arnold
    > 2015-07-25 4:13 GMT+02:00 WiseGenius notifications@github.com:
    > 
    > > Up to now, I've been testing on my 1.5-year-old desktop. I just tested on
    > > my 5-year-old laptop, also running 32-bit Windows XP: @qtxie
    > > https://github.com/qtxie, first, I rebooted, then turned off all
    > > anti-virus software, then downloaded the source, etc. I get the exact same
    > > behaviour.
    > > @qtxie https://github.com/qtxie, ever since crush.dll was introduced,
    > > I've been downloading the source afresh and having this same issue. For
    > > months, I've been forced to use the automated builds instead. As there are
    > > no automated builds for the gui branch, I haven't been able to properly
    > > test it yet.
    > > From tomorrow onwards I'll try doing everything with line 25
    > > https://github.com/red/red/blob/master/red.r#L25 set to false, but I
    > > still see this as a temporary workaround.
    > > Although I'm not prepared to justify my continued use of Windows XP, I do
    > > think Red should be able to compile on XP. Furthermore, I think it's too
    > > early to say that it's only and always XP which has this problem. In the
    > > coming week I'll try to get access to some 32-bit Windows 7 computers and
    > > report the results.
    > > 
    > > .

--------------------------------------------------------------------------------

On 2015-08-20T10:35:59Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-132968501>

    I gave it a new try on a Windows XP SP3, 32-bit image.
    
    1) I've downloaded a zip file of the latest master branch
    2) I've downloaded a Rebol/View 2.7.8 binary and put it in the red-master/ folder.
    3) I run the Rebol binary and by-passed the installation process.
    4) This is the result:
    
    ```
    >> do/args %red.r "-c %test.red"
    
    -=== Red Compiler 0.5.4 ===-
    
    Compiling /C/test/red-master/red-master/test.red ...
    Pre-compiling compression library...
    ...compilation time : 313 ms
    
    Compiling to native code...
    ...compilation time : 10516 ms
    ...linking time     : 4875 ms
    ...output file size : 321536 bytes
    ...output file      : C:\test\red-master\red-master\test.exe
    ```
    
    My Windows XP image has no anti-virus installed, so I suspect that your issue is related to the anti-virus you're using, and not to Red.
    
    From your reports, you have this line:
    
    ```
    Pre-compiling compression library...
    ```
    
    which indicates that the library is been built, but later, it fails to load. So, you should search your disk to see if you can find the `crush.dll` file somewhere (including hidden folders). It should be present in the red-master/ folder, but from the error message, that doesn't seem to be the case for you.

--------------------------------------------------------------------------------

On 2015-08-20T14:04:12Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133019916>

    As mentioned, the `crush.dll` file **is** created in the `red-master` folder. Just now, I uploaded the `crush.dll` file to Gitter.
    Also, I always put the Rebol binary and `test.red` in the `red-master` folder unzipped from the latest zip file.
    
    I don't have any anti-virus software running.
    
    2 weeks ago I tested this on a 64-bit Windows 7 computer, and had the same issue. I was going to do it again today and report all details with the latest download, but didn't get access to that computer. Next Thursday.
    
    @dockimbel You are using Rebol/View 1.2.8? Is that different from `rebol-view-278-3-1.exe` which I am downloading from [here](http://www.rebol.com/download-view.html)? Could that be the reason? Where do I get 1.2.8?
    
    I just tried the latest again on 32-bit XP:
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    
    
    Type desktop to start the Viewtop.
    >> do/args %red.r "-c %test.red"
    Script: "Red command-line front-end" (none)
    Script: "Encap virtual filesystem" (21-Sep-2009)
    
    -=== Red Compiler 0.5.4 ===-
    
    Compiling /H/Work/Red/Tests Red/red-master/red-master/test.red ...
    Pre-compiling compression library...
    Script: "Red/System PE/COFF format emitter" (none)
    *** Driver Internal Error: Access Error : Cannot open ./crush.dll as library
    *** Where: build-compress-lib
    *** Near:  [crush-lib: load/library filename
    crush-compress: make
    ]
    ```

--------------------------------------------------------------------------------

On 2015-08-20T14:16:49Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-133026597>

    Sorry, there is no version 1.2.8, it was a typo, I meant 2.7.8. (fixed the typo in my above comment now).

--------------------------------------------------------------------------------

On 2015-08-20T14:59:13Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133041069>

    Here is the output from the special branch:
    (`crush.dll` was created)
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    
    
    Type desktop to start the Viewtop.
    >> do/args %red.r "-c %test.red"
    Script: "Red command-line front-end" (none)
    Script: "Encap virtual filesystem" (21-Sep-2009)
    load-lib?: block!
    encap?: false
    
    -=== Red Compiler 0.5.4 ===-
    
    Compiling /H/red-issue-1284/red-issue-1284/test.red ...
    filename: %./crush.dll
    encap?: false
    crush-lib: none
    %/H/red-issue-1284/red-issue-1284/
    opts: make object! [
        config-name: 'MSDOS
        OS: 'Windows
        OS-version: none
        ABI: none
        link?: true
        debug?: false
        build-prefix: %./
        build-basename: %../crush
        build-suffix: none
        format: 'PE
        type: 'dll
        target: 'IA-32
        cpu-version: 6.0
        verbosity: 0
        sub-system: 'console
        runtime?: true
        use-natives?: false
        need-main?: false
        PIC?: false
        base-address: none
        dynamic-linker: none
        syscall: 'Linux
        stack-align-16?: false
        literal-pool?: false
        unicode?: false
        red-pass?: false
        red-only?: false
        red-store-bodies?: true
        red-strict-check?: true
        red-tracing?: true
        red-help?: false
        legacy: none
    ]
    Pre-compiling compression library...
    Script: "Red/System PE/COFF format emitter" (none)
    %/H/red-issue-1284/red-issue-1284/
    crush-lib: none
    filename: %./crush.dll
    true
    *** Driver Internal Error: Access Error : Cannot open ./crush.dll as library
    *** Where: build-compress-lib
    *** Near:  [crush-lib: load/library filename
    crush-compress: make
    ]
    ```

--------------------------------------------------------------------------------

On 2015-08-20T15:12:27Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-133044749>

    Everything seems right. Could you do the following test from a Rebol/View console inside that same Red folder:
    
    ```
    >> load/library %crush.dll
    ```
    
    Then this other test:
    
    ```
    >> load/library %./crush.dll
    ```

--------------------------------------------------------------------------------

On 2015-08-20T15:23:23Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133048153>

    ```
    >> load/library %crush.dll
    ** Access Error: Cannot open crush.dll as library
    ** Near: load/library %crush.dll
    >> load/library %./crush.dll
    ** Access Error: Cannot open ./crush.dll as library
    ** Near: load/library %./crush.dll
    ```

--------------------------------------------------------------------------------

On 2015-08-20T15:35:43Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-133053945>

    Is the crush.dll file effectively present in the current folder during those tests?

--------------------------------------------------------------------------------

On 2015-08-20T15:38:42Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133054674>

    Yes.

--------------------------------------------------------------------------------

On 2015-08-20T15:41:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-133055620>

    Then, it's definitely an OS-specific issue... Try the procmon way to gather more information about it (you can post Procmon logs here, use Edit->Copy to export the logs into your clipboard).

--------------------------------------------------------------------------------

On 2015-08-20T16:00:00Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133060163>

    ```
    1:49:49.4453013 AM  rebol-view-278-3-1.exe  19592   RegOpenKey  HKLM\Software\NVIDIA Corporation\Global\nView\Tweak NAME NOT FOUND  Desired Access: Read
    1:49:49.4453287 AM  rebol-view-278-3-1.exe  19592   RegOpenKey  HKCU    SUCCESS Desired Access: All Access
    1:49:49.4453533 AM  rebol-view-278-3-1.exe  19592   RegOpenKey  HKCU\Software\NVIDIA Corporation\Global\nView\Tweak SUCCESS Desired Access: Read
    1:49:49.4453756 AM  rebol-view-278-3-1.exe  19592   RegQueryValue   HKCU\Software\NVIDIA Corporation\Global\nView\Tweak\RemoteMode  NAME NOT FOUND  Length: 144
    1:49:49.4453980 AM  rebol-view-278-3-1.exe  19592   RegCloseKey HKCU\Software\NVIDIA Corporation\Global\nView\Tweak SUCCESS 
    1:49:49.4454064 AM  rebol-view-278-3-1.exe  19592   RegCloseKey HKCU    SUCCESS 
    1:50:34.8406924 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\red.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8407340 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\red.r  SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8407812 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\red.r  BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 16,384, EndOfFile: 12,499, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x10000000784a0, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8408469 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\red.r  SUCCESS Offset: 0, Length: 12,499
    1:50:34.8409309 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\red.r  SUCCESS 
    1:50:34.8433910 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\utils\encap-fs.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8434648 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\utils\encap-fs.r    SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8435123 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\utils\encap-fs.r    BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 4,096, EndOfFile: 2,323, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x1000000078587, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8435631 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\utils\encap-fs.r    SUCCESS Offset: 0, Length: 2,323
    1:50:34.8436422 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\utils\encap-fs.r    SUCCESS 
    1:50:34.8440274 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\compiler.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8440601 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\compiler.r SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8440836 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\compiler.r BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 94,208, EndOfFile: 93,469, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x1000000078470, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8441294 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\compiler.r SUCCESS Offset: 0, Length: 93,469
    1:50:34.8442414 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\compiler.r SUCCESS 
    1:50:34.8462146 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\compiler.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8462596 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\compiler.r  SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8462939 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\compiler.r  BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 98,304, EndOfFile: 96,968, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x10000000784f1, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8463515 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\compiler.r  SUCCESS Offset: 0, Length: 96,968
    1:50:34.8464607 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\compiler.r  SUCCESS 
    1:50:34.8497807 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\utils\profiler.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8498628 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\utils\profiler.r    SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8499458 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\utils\profiler.r    BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 12,288, EndOfFile: 8,705, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x1000000078589, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8500081 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\utils\profiler.r    SUCCESS Offset: 0, Length: 8,705
    1:50:34.8500983 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\utils\profiler.r    SUCCESS 
    1:50:34.8577574 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\utils\r2-forward.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8578580 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\utils\r2-forward.r  SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8579250 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\utils\r2-forward.r  BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 8,192, EndOfFile: 4,170, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x100000007858a, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8579946 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\utils\r2-forward.r  SUCCESS Offset: 0, Length: 4,170
    1:50:34.8580954 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\utils\r2-forward.r  SUCCESS 
    1:50:34.8582485 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8583049 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r  SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8583566 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r  BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 4,096, EndOfFile: 667, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x1000000078588, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8584158 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r  SUCCESS Offset: 0, Length: 667
    1:50:34.8584899 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r  SUCCESS 
    1:50:34.8586086 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8586905 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r    SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8587352 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r    BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 4,096, EndOfFile: 2,705, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x1000000078586, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8587810 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r    SUCCESS Offset: 0, Length: 2,705
    1:50:34.8588843 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r    SUCCESS 
    1:50:34.8590148 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8590508 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r  SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8590819 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r  BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 4,096, EndOfFile: 3,021, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x100000007858c, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8591212 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r  SUCCESS Offset: 0, Length: 3,021
    1:50:34.8591908 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r  SUCCESS 
    1:50:34.8593224 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8593621 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r   SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8593947 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r   BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 4,096, EndOfFile: 2,026, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x100000007858b, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8594344 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r   SUCCESS Offset: 0, Length: 2,026
    1:50:34.8594970 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r   SUCCESS 
    1:50:34.8596071 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\linker.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8596442 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\linker.r    SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8596763 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\linker.r    BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 8,192, EndOfFile: 5,105, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x1000000078515, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8597216 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\linker.r    SUCCESS Offset: 0, Length: 5,105
    1:50:34.8597942 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\linker.r    SUCCESS 
    1:50:34.8600082 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\emitter.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8600454 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\emitter.r   SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8600789 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\emitter.r   BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 20,480, EndOfFile: 18,075, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x10000000784f3, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8601203 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\emitter.r   SUCCESS Offset: 0, Length: 18,075
    1:50:34.8602105 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\emitter.r   SUCCESS 
    1:50:34.8606533 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\targets\target-class.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8607016 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\targets\target-class.r  SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8607620 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\targets\target-class.r  BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 12,288, EndOfFile: 8,319, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x100000007852e, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8608363 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\targets\target-class.r  SUCCESS Offset: 0, Length: 8,319
    1:50:34.8609399 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\targets\target-class.r  SUCCESS 
    1:50:34.8618420 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\loader.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8618995 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\loader.r    SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8619599 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\loader.r    BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 12,288, EndOfFile: 12,200, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x1000000078516, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8620046 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\loader.r    SUCCESS Offset: 0, Length: 12,200
    1:50:34.8620602 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\loader.r    SUCCESS 
    1:50:34.8624205 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\lexer.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8624499 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\lexer.r    SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8624708 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\lexer.r    BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 16,384, EndOfFile: 16,339, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x1000000078494, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8624971 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\lexer.r    SUCCESS Offset: 0, Length: 16,339
    1:50:34.8625680 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\lexer.r    SUCCESS 
    1:50:34.8661489 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\lexer.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8661747 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\lexer.r    SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8662325 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\lexer.r    BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:50:34 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 16,384, EndOfFile: 16,339, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x1000000078494, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8662721 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\lexer.r    SUCCESS Offset: 0, Length: 16,339
    1:50:34.8663101 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\lexer.r    SUCCESS 
    1:50:34.8674991 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\utils\extractor.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8675243 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\utils\extractor.r  SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8675441 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\utils\extractor.r  BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 4,096, EndOfFile: 1,209, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x10000000785db, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8675676 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\utils\extractor.r  SUCCESS Offset: 0, Length: 1,209
    1:50:34.8675975 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\utils\extractor.r  SUCCESS 
    1:50:34.8676782 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\runtime\macros.reds    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8677031 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\runtime\macros.reds    SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8677262 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\runtime\macros.reds    BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 12,288, EndOfFile: 8,387, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x10000000784d7, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8677533 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\runtime\macros.reds    SUCCESS Offset: 0, Length: 8,387
    1:50:34.8677874 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\runtime\macros.reds    SUCCESS 
    1:50:34.8688705 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\environment\scalars.red    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8688959 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\environment\scalars.red    SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8689314 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\environment\scalars.red    BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 4,096, EndOfFile: 1,499, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x1000000078492, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8689756 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\environment\scalars.red    SUCCESS Offset: 0, Length: 1,499
    1:50:34.8690080 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\environment\scalars.red    SUCCESS 
    1:50:34.8691594 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\utils\redbin.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8691971 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\utils\redbin.r SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8692390 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\utils\redbin.r BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 12,288, EndOfFile: 9,704, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x10000000785dc, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8692784 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\utils\redbin.r SUCCESS Offset: 0, Length: 9,704
    1:50:34.8693259 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\utils\redbin.r SUCCESS 
    1:50:34.8733331 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\system\config.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8733778 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\system\config.r    SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8734102 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\system\config.r    BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 8,192, EndOfFile: 4,288, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x10000000784f2, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8734513 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\system\config.r    SUCCESS Offset: 0, Length: 4,288
    1:50:34.8735055 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\system\config.r    SUCCESS 
    1:50:34.8736074 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284\system\custom-targets.r    NAME NOT FOUND  
    1:50:34.8736818 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284\test.red   SUCCESS CreationTime: 21/08/2015 12:54:07 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 11/06/2015 9:29:42 AM, ChangeTime: 27/07/2015 2:29:05 PM, AllocationSize: 48, EndOfFile: 42, FileAttributes: A
    1:50:34.8737278 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\test.red   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8737516 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\test.red   SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8737779 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\test.red   BUFFER OVERFLOW CreationTime: 21/08/2015 12:54:07 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 11/06/2015 9:29:42 AM, ChangeTime: 27/07/2015 2:29:05 PM, FileAttributes: A, AllocationSize: 48, EndOfFile: 42, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x10000000785df, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8738013 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\test.red   SUCCESS Offset: 0, Length: 42
    1:50:34.8738315 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\test.red   SUCCESS 
    1:50:34.8738714 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284    SUCCESS CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:50:34 AM, LastWriteTime: 21/08/2015 12:55:28 AM, ChangeTime: 21/08/2015 12:55:28 AM, AllocationSize: 0, EndOfFile: 0, FileAttributes: D
    1:50:34.8739002 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284    SUCCESS CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:50:34 AM, LastWriteTime: 21/08/2015 12:55:28 AM, ChangeTime: 21/08/2015 12:55:28 AM, AllocationSize: 0, EndOfFile: 0, FileAttributes: D
    1:50:34.8739483 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\version.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8739723 AM  rebol-view-278-3-1.exe  19592   QueryInformationVolume  H:\red-issue-1284\red-issue-1284\version.r  SUCCESS VolumeCreationTime: 7/12/2013 7:08:08 AM, VolumeSerialNumber: C844-074F, SupportsObjects: True, VolumeLabel: 
    1:50:34.8739932 AM  rebol-view-278-3-1.exe  19592   QueryAllInformationFile H:\red-issue-1284\red-issue-1284\version.r  BUFFER OVERFLOW CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, FileAttributes: N, AllocationSize: 8, EndOfFile: 5, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x10000000785dd, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    1:50:34.8740156 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\version.r  SUCCESS Offset: 0, Length: 5
    1:50:34.8740536 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\version.r  SUCCESS 
    1:50:34.8749107 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS CreationTime: 21/08/2015 12:55:28 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:55:28 AM, ChangeTime: 21/08/2015 12:55:28 AM, AllocationSize: 12,288, EndOfFile: 11,264, FileAttributes: A
    1:50:34.8749596 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS CreationTime: 21/08/2015 12:55:28 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:55:28 AM, ChangeTime: 21/08/2015 12:55:28 AM, AllocationSize: 12,288, EndOfFile: 11,264, FileAttributes: A
    1:50:34.8751780 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284\runtime\crush.reds SUCCESS CreationTime: 21/08/2015 12:53:46 AM, LastAccessTime: 21/08/2015 12:55:28 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 12:53:46 AM, AllocationSize: 12,288, EndOfFile: 11,059, FileAttributes: N
    1:50:34.8759762 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS CreationTime: 21/08/2015 12:55:28 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:55:28 AM, ChangeTime: 21/08/2015 12:55:28 AM, AllocationSize: 12,288, EndOfFile: 11,264, FileAttributes: A
    1:50:34.8761147 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284    SUCCESS Desired Access: Read Data/List Directory, Synchronize, Disposition: Open, Options: Directory, Synchronous IO Non-Alert, Attributes: n/a, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8761259 AM  rebol-view-278-3-1.exe  19592   QueryDirectory  H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Filter: crush.dll, 1: crush.dll
    1:50:34.8761432 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284    SUCCESS 
    1:50:34.8762050 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS CreationTime: 21/08/2015 12:55:28 AM, LastAccessTime: 21/08/2015 1:47:46 AM, LastWriteTime: 21/08/2015 12:55:28 AM, ChangeTime: 21/08/2015 12:55:28 AM, AllocationSize: 12,288, EndOfFile: 11,264, FileAttributes: A
    1:50:34.8762687 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8763011 AM  rebol-view-278-3-1.exe  19592   CreateFileMapping   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    1:50:34.8763069 AM  rebol-view-278-3-1.exe  19592   QueryStandardInformationFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS AllocationSize: 12,288, EndOfFile: 11,264, NumberOfLinks: 1, DeletePending: False, Directory: False
    1:50:34.8763391 AM  rebol-view-278-3-1.exe  19592   CreateFileMapping   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS SyncType: SyncTypeOther
    1:50:34.8763849 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS 
    1:50:34.8764550 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS CreationTime: 21/08/2015 12:55:28 AM, LastAccessTime: 21/08/2015 1:50:34 AM, LastWriteTime: 21/08/2015 12:55:28 AM, ChangeTime: 21/08/2015 12:55:28 AM, AllocationSize: 12,288, EndOfFile: 11,264, FileAttributes: A
    1:50:34.8764910 AM  rebol-view-278-3-1.exe  19592   QueryOpen   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS CreationTime: 21/08/2015 12:55:28 AM, LastAccessTime: 21/08/2015 1:50:34 AM, LastWriteTime: 21/08/2015 12:55:28 AM, ChangeTime: 21/08/2015 12:55:28 AM, AllocationSize: 12,288, EndOfFile: 11,264, FileAttributes: A
    1:50:34.8765251 AM  rebol-view-278-3-1.exe  19592   CreateFile  H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    1:50:34.8765503 AM  rebol-view-278-3-1.exe  19592   CreateFileMapping   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    1:50:34.8765550 AM  rebol-view-278-3-1.exe  19592   QueryStandardInformationFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS AllocationSize: 12,288, EndOfFile: 11,264, NumberOfLinks: 1, DeletePending: False, Directory: False
    1:50:34.8765598 AM  rebol-view-278-3-1.exe  19592   CreateFileMapping   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS SyncType: SyncTypeOther
    1:50:34.8766277 AM  rebol-view-278-3-1.exe  19592   CreateFileMapping   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS SyncType: SyncTypeOther
    1:50:34.8766656 AM  rebol-view-278-3-1.exe  19592   CloseFile   H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS 
    1:50:34.8768523 AM  rebol-view-278-3-1.exe  19592   Load Image  H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Image Base: 0x2170000, Image Size: 0x7000
    1:50:34.8768743 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Offset: 10,752, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    1:50:34.8770646 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Offset: 1,024, Length: 7,168, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    1:50:34.8772646 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Offset: 8,192, Length: 1,536, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    1:50:34.8774331 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Offset: 9,728, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    1:50:34.8776323 AM  rebol-view-278-3-1.exe  19592   ReadFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Offset: 10,240, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    1:50:34.8778194 AM  rebol-view-278-3-1.exe  19592   RegOpenKey  HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\crush.dll    NAME NOT FOUND  Desired Access: Read
    ```

--------------------------------------------------------------------------------

On 2015-08-20T16:07:22Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133062109>

    Here is a test using Rebol/View 2.7.6:
    
    ```
    REBOL/View 2.7.6.3.1 14-Mar-2008
    Copyright 2000-2008 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    >> load/library %crush.dll
    ** Access Error: Cannot open crush.dll as library
    ** Where: halt-view
    ** Near: load/library %crush.dll
    >> load/library %./crush.dll
    ** Access Error: Cannot open ./crush.dll as library
    ** Where: halt-view
    ** Near: load/library %./crush.dll
    >>
    ```

--------------------------------------------------------------------------------

On 2015-08-20T16:37:20Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-133069919>

    Thanks.
    
    ```
     Load Image  H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Image Base: 0x2170000, Image Size: 0x7000
     ReadFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Offset: 10,752, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
     ReadFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Offset: 1,024, Length: 7,168, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
     ReadFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Offset: 8,192, Length: 1,536, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
     ReadFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Offset: 9,728, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
     ReadFile    H:\red-issue-1284\red-issue-1284\crush.dll  SUCCESS Offset: 10,240, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    ```
    
    The relevant parts of the procmon logs show that the DLL is well loaded in memory, so the cause of the error is related to the combination of Rebol with your XP system. Some difference(s) on your XP system compared to our XP instances is triggering the issue. Now we need to identify what...:-)
    
    EDIT: it is worth doing the procmon logging with no filter set, to see if we didn't miss anything important.

--------------------------------------------------------------------------------

On 2015-08-20T17:40:38Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133090456>

    The following tests were all done on my **2nd** XP computer:
    
    I'm almost certain it used to give the same results as the first one, but in fact it's worse.
    
    Whenever it tries to load `%crush.dll`, `rebol-view-278-3-1.exe` process disappears. And it does so too quickly for me to see if there were any clues written in the console.
    
    For some reason, however, `rebview276.exe` doesn't crash, and simply gives similar complaints as the first computer:
    
    ```
    REBOL/View 2.7.6.3.1 14-Mar-2008
    Copyright 2000-2008 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    >> do/args %red.r "-c %test.red"
    load-lib?: block!
    encap?: false
    
    -=== Red Compiler 0.5.4 ===-
    
    Compiling /C/Temporary/2015-08-21/red-issue-1284/red-issue-1284/test.red ...
    filename: %./crush.dll
    encap?: false
    crush-lib: none
    %/C/Temporary/2015-08-21/red-issue-1284/red-issue-1284/
    opts: make object! [
        config-name: 'MSDOS
        OS: 'Windows
        OS-version: none
        ABI: none
        link?: true
        debug?: false
        build-prefix: %./
        build-basename: %../crush
        build-suffix: none
        format: 'PE
        type: 'dll
        target: 'IA-32
        cpu-version: 6.0
        verbosity: 0
        sub-system: 'console
        runtime?: true
        use-natives?: false
        need-main?: false
        PIC?: false
        base-address: none
        dynamic-linker: none
        syscall: 'Linux
        stack-align-16?: false
        literal-pool?: false
        unicode?: false
        red-pass?: false
        red-only?: false
        red-store-bodies?: true
        red-strict-check?: true
        red-tracing?: true
        red-help?: false
        legacy: none
    ]
    Pre-compiling compression library...
    %/C/Temporary/2015-08-21/red-issue-1284/red-issue-1284/
    crush-lib: none
    filename: %./crush.dll
    true
    *** Driver Internal Error: Access Error : Cannot open ./crush.dll as library
    *** Where: build-compress-lib
    *** Near:  [crush-lib: load/library filename
    crush-compress: make
    ]
    
    >>
    ```
    
    ```
    REBOL/View 2.7.6.3.1 14-Mar-2008
    Copyright 2000-2008 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    >> load/library %crush.dll
    ** Access Error: Cannot open crush.dll as library
    ** Where: halt-view
    ** Near: load/library %crush.dll
    >> load/library %./crush.dll
    ** Access Error: Cannot open ./crush.dll as library
    ** Where: halt-view
    ** Near: load/library %./crush.dll
    >>
    ```
    
    Then, using procmon on the 2nd computer with `rebview276.exe`:
    
    ```
    REBOL/View 2.7.6.3.1 14-Mar-2008
    Copyright 2000-2008 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    >> do/args %red.r "-c %test.red"
    load-lib?: block!
    encap?: false
    
    -=== Red Compiler 0.5.4 ===-
    
    Compiling /C/Temporary/2015-08-21/red-issue-1284/red-issue-1284/test.red ...
    filename: %./crush.dll
    encap?: false
    21-Aug-2015/2:29:09+10:00
    21-Aug-2015/0:50:54+10:00
    false
    %/C/Temporary/2015-08-21/red-issue-1284/red-issue-1284/
    crush-lib: none
    filename: %./crush.dll
    true
    *** Driver Internal Error: Access Error : Cannot open ./crush.dll as library
    *** Where: build-compress-lib
    *** Near:  [crush-lib: load/library filename
    crush-compress: make
    ]
    
    ```
    
    ```
    2:42:59.3650872 AM  rebview276.exe  1172    QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:42:56 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:42:59.3656180 AM  rebview276.exe  1172    CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:42:59.3660236 AM  rebview276.exe  1172    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:42:59.3660549 AM  rebview276.exe  1172    QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:42:59.3661099 AM  rebview276.exe  1172    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:42:59.3665239 AM  rebview276.exe  1172    CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:42:59.9363774 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\red.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9365791 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\red.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9370090 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\red.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 12,499, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x900000003c4bb, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9375180 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\red.r SUCCESS Offset: 0, Length: 12,499
    2:42:59.9380226 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\red.r SUCCESS 
    2:42:59.9402097 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\encap-fs.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9406173 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\encap-fs.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9409855 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\encap-fs.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:59 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:59 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 2,323, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a2, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9414484 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\encap-fs.r   SUCCESS Offset: 0, Length: 2,323
    2:42:59.9421873 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\encap-fs.r   SUCCESS 
    2:42:59.9431073 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\compiler.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9432855 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\compiler.r    SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9434422 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\compiler.r    BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 53,248, EndOfFile: 93,469, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c48b, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9437093 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\compiler.r    SUCCESS Offset: 0, Length: 93,469
    2:42:59.9443446 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\compiler.r    SUCCESS 
    2:42:59.9581461 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\compiler.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9584495 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\compiler.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9587213 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\compiler.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 49,152, EndOfFile: 96,968, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c50c, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9591490 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\compiler.r SUCCESS Offset: 0, Length: 96,968
    2:42:59.9599212 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\compiler.r SUCCESS 
    2:42:59.9730843 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\profiler.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9734396 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\profiler.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9737986 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\profiler.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:00 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:00 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 8,705, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a4, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9742129 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\profiler.r   SUCCESS Offset: 0, Length: 8,705
    2:42:59.9748568 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\profiler.r   SUCCESS 
    2:42:59.9768554 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\r2-forward.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9771974 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\r2-forward.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9774466 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\r2-forward.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:00 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:01 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 4,170, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a5, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9777840 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\r2-forward.r SUCCESS Offset: 0, Length: 4,170
    2:42:59.9781631 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\r2-forward.r SUCCESS 
    2:42:59.9791853 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9794843 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9797642 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:59 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:59 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 667, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a3, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9800508 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r SUCCESS Offset: 0, Length: 667
    2:42:59.9804081 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r SUCCESS 
    2:42:59.9813591 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9817622 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9821469 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:59 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:59 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 2,705, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0xa00000003c5a1, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9857873 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r   SUCCESS Offset: 0, Length: 2,705
    2:42:59.9862985 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r   SUCCESS 
    2:42:59.9874006 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9876805 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9879485 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:01 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:01 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 3,021, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a7, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9882625 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r SUCCESS Offset: 0, Length: 3,021
    2:42:59.9886469 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r SUCCESS 
    2:42:59.9897529 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9900470 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r  SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9926921 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r  BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:01 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:01 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 2,026, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a6, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9931740 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r  SUCCESS Offset: 0, Length: 2,026
    2:42:59.9935595 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r  SUCCESS 
    2:42:59.9944264 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\linker.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9947412 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\linker.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9950184 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\linker.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 5,105, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0xa00000003c530, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9953793 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\linker.r   SUCCESS Offset: 0, Length: 5,105
    2:42:59.9958215 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\linker.r   SUCCESS 
    2:42:59.9974159 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\emitter.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:42:59.9977220 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\emitter.r  SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:42:59.9979824 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\emitter.r  BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 12,288, EndOfFile: 18,075, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c50e, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:42:59.9983087 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\emitter.r  SUCCESS Offset: 0, Length: 18,075
    2:42:59.9987537 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\emitter.r  SUCCESS 
    2:43:00.0020377 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\targets\target-class.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.0023562 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\targets\target-class.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.0026026 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\targets\target-class.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 8,319, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c549, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.0039307 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\targets\target-class.r SUCCESS Offset: 0, Length: 8,319
    2:43:00.0043413 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\targets\target-class.r SUCCESS 
    2:43:00.0103689 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\loader.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.0106726 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\loader.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.0109332 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\loader.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 12,200, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x500000003c531, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.0113629 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\loader.r   SUCCESS Offset: 0, Length: 12,200
    2:43:00.0117956 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\loader.r   SUCCESS 
    2:43:00.0143091 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.0144837 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.0146454 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 16,339, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c4af, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.0148664 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS Offset: 0, Length: 16,339
    2:43:00.0152067 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS 
    2:43:00.0436455 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.0438293 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.0439885 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 16,339, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c4af, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.0452686 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS Offset: 0, Length: 16,339
    2:43:00.0455569 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS 
    2:43:00.0518962 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\extractor.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.0536509 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\extractor.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.0538278 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\extractor.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:15 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:15 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 1,209, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5f6, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.0540393 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\extractor.r SUCCESS Offset: 0, Length: 1,209
    2:43:00.0553257 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\extractor.r SUCCESS 
    2:43:00.0561015 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\macros.reds   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.0563328 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\macros.reds   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.0590614 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\macros.reds   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 8,387, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c4f2, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.0593517 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\macros.reds   SUCCESS Offset: 0, Length: 8,387
    2:43:00.0597294 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\macros.reds   SUCCESS 
    2:43:00.0701271 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\environment\scalars.red   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.0703310 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\environment\scalars.red   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.0705011 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\environment\scalars.red   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 1,499, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c4ad, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.0716027 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\environment\scalars.red   SUCCESS Offset: 0, Length: 1,499
    2:43:00.0718893 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\environment\scalars.red   SUCCESS 
    2:43:00.0729635 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\redbin.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.0732744 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\redbin.r    SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.0735241 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\redbin.r    BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:15 AM, LastAccessTime: 21/08/2015 2:40:53 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:15 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 9,704, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5f7, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.0738521 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\redbin.r    SUCCESS Offset: 0, Length: 9,704
    2:43:00.0742608 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\redbin.r    SUCCESS 
    2:43:00.1014352 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\config.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.1017666 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\config.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.1020071 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\config.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:40:54 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 4,288, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c50d, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.1023795 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\config.r   SUCCESS Offset: 0, Length: 4,288
    2:43:00.1027454 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\config.r   SUCCESS 
    2:43:00.1034025 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\custom-targets.r   NAME NOT FOUND  
    2:43:00.1041026 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  SUCCESS CreationTime: 21/08/2015 2:18:44 AM, LastAccessTime: 21/08/2015 2:40:54 AM, LastWriteTime: 21/08/2015 12:30:17 AM, ChangeTime: 21/08/2015 2:27:35 AM, AllocationSize: 48, EndOfFile: 42, FileAttributes: AC
    2:43:00.1045284 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.1047035 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.1048653 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  BUFFER OVERFLOW CreationTime: 21/08/2015 2:18:44 AM, LastAccessTime: 21/08/2015 2:40:54 AM, LastWriteTime: 21/08/2015 12:30:17 AM, ChangeTime: 21/08/2015 2:27:35 AM, FileAttributes: AC, AllocationSize: 48, EndOfFile: 42, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c439, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.1050326 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  SUCCESS Offset: 0, Length: 42
    2:43:00.1052980 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  SUCCESS 
    2:43:00.1056187 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 0, EndOfFile: 0, FileAttributes: DC
    2:43:00.1058593 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 0, EndOfFile: 0, FileAttributes: DC
    2:43:00.1062263 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\version.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:00.1064236 AM  rebview276.exe  1172    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\version.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:43:00.1094768 AM  rebview276.exe  1172    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\version.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:15 AM, LastAccessTime: 21/08/2015 2:40:54 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:15 AM, FileAttributes: C, AllocationSize: 8, EndOfFile: 5, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5f8, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:43:00.1096762 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\version.r SUCCESS Offset: 0, Length: 5
    2:43:00.1099377 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\version.r SUCCESS 
    2:43:00.1186288 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:42:40 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:43:00.1190749 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:42:40 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:43:00.1208131 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\crush.reds    SUCCESS CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:28:08 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, AllocationSize: 8,192, EndOfFile: 11,059, FileAttributes: C
    2:43:00.1278562 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:42:40 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:43:00.1299576 AM  rebview276.exe  1172    CreateFile  C:\WINDOWS\Fonts\sserife.fon    SUCCESS Desired Access: Generic Read/Execute, Disposition: Open, Options: Synchronous IO Alert, Attributes: N, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:43:00.1303573 AM  rebview276.exe  1172    QueryStandardInformationFile    C:\WINDOWS\Fonts\sserife.fon    SUCCESS AllocationSize: 28,672, EndOfFile: 64,656, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:43:00.1307205 AM  rebview276.exe  1172    QueryBasicInformationFile   C:\WINDOWS\Fonts\sserife.fon    SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:40:54 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 10/08/2012 4:07:05 PM, FileAttributes: HC
    2:43:00.1310988 AM  rebview276.exe  1172    QueryAttributeInformationVolume C:\WINDOWS\Fonts\sserife.fon    SUCCESS FileSystemAttributes: Case Preserved, Case Sensitive, Unicode, ACLs, Compression, Named Streams, Object IDs, Reparse Points, Sparse Files, Quotas, MaximumComponentNameLength: 255, FileSystemName: NTFS
    2:43:00.1314407 AM  rebview276.exe  1172    CreateFileMapping   C:\WINDOWS\Fonts\sserife.fon    SUCCESS SyncType: SyncTypeCreateSection, PageProtection: 
    2:43:00.1314687 AM  rebview276.exe  1172    QueryStandardInformationFile    C:\WINDOWS\Fonts\sserife.fon    SUCCESS AllocationSize: 28,672, EndOfFile: 64,656, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:43:00.1315142 AM  rebview276.exe  1172    CreateFileMapping   C:\WINDOWS\Fonts\sserife.fon    SUCCESS SyncType: SyncTypeOther
    2:43:00.1319017 AM  rebview276.exe  1172    QueryNameInformationFile    C:\WINDOWS\Fonts\sserife.fon    SUCCESS Name: \WINDOWS\Fonts\sserife.fon
    2:43:00.1349602 AM  rebview276.exe  1172    CloseFile   C:\WINDOWS\Fonts\sserife.fon    SUCCESS 
    2:43:03.4207518 AM  rebview276.exe  1172    QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:43:03.4246855 AM  rebview276.exe  1172    CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:43:03.4251090 AM  rebview276.exe  1172    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:43:03.4251387 AM  rebview276.exe  1172    QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:43:03.4251945 AM  rebview276.exe  1172    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:43:03.4255946 AM  rebview276.exe  1172    CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:43:03.4385968 AM  rebview276.exe  1172    QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:43:03 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:43:03.4390639 AM  rebview276.exe  1172    CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:43:03.4436405 AM  rebview276.exe  1172    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:43:03.4436796 AM  rebview276.exe  1172    QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:43:03.4437416 AM  rebview276.exe  1172    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:43:03.4441629 AM  rebview276.exe  1172    CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:43:03.4462668 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS Desired Access: Read Data/List Directory, Synchronize, Disposition: Open, Options: Directory, Synchronous IO Non-Alert, Attributes: n/a, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:43:03.4463461 AM  rebview276.exe  1172    QueryDirectory  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Filter: crush.dll, 1: crush.dll
    2:43:03.4464612 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS 
    2:43:03.4473040 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:42:40 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:43:03.4475870 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:43:03.4477639 AM  rebview276.exe  1172    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:43:03.4477904 AM  rebview276.exe  1172    QueryStandardInformationFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS AllocationSize: 8,192, EndOfFile: 11,264, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:43:03.4478374 AM  rebview276.exe  1172    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:43:03.4480301 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS 
    2:43:03.4483760 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:43:03 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:43:03.4486294 AM  rebview276.exe  1172    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:43:03 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:43:03.4488925 AM  rebview276.exe  1172    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:43:03.4490825 AM  rebview276.exe  1172    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:43:03.4491104 AM  rebview276.exe  1172    QueryStandardInformationFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS AllocationSize: 8,192, EndOfFile: 11,264, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:43:03.4491409 AM  rebview276.exe  1172    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:43:03.4494334 AM  rebview276.exe  1172    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:43:03.4496323 AM  rebview276.exe  1172    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS 
    2:43:03.4500415 AM  rebview276.exe  1172    Load Image  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Image Base: 0x1590000, Image Size: 0x7000
    2:43:03.4501178 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 10,752, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:43:09.3254257 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 1,024, Length: 7,168, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:43:09.3287792 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 8,192, Length: 1,536, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:43:09.3340952 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 9,728, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:43:09.3355253 AM  rebview276.exe  1172    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 10,240, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:43:09.3386942 AM  rebview276.exe  1172    RegOpenKey  HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\crush.dll    NAME NOT FOUND  Desired Access: Read
    2:43:09.3965409 AM  rebview276.exe  1172    QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:43:03 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:43:09.3976690 AM  rebview276.exe  1172    CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:43:09.3984026 AM  rebview276.exe  1172    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:43:09.3984548 AM  rebview276.exe  1172    QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:43:09.3985518 AM  rebview276.exe  1172    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:43:09.3994985 AM  rebview276.exe  1172    CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    ```

--------------------------------------------------------------------------------

On 2015-08-20T17:41:37Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133090902>

    Still on the **2nd computer**, I went back to using `rebol-view-278-3-1.exe` on each of the 3 tests (which cause it to crash), running procmon on each in case it would give any clues. Each time, Rebol silently crashed before I could read anything in the console:
    
    **do/args %red.r "-c %test.red"**
    
    ```
    2:47:24.9455318 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:47:20 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:47:24.9461098 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:47:24.9464847 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:47:24.9465115 AM  rebol-view-278-3-1.exe  3372    QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:47:24.9465632 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:47:24.9469660 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:47:30.8531033 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:47:24 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:47:30.8536598 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:47:30.8541249 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:47:30.8541609 AM  rebol-view-278-3-1.exe  3372    QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:47:30.8542171 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:47:30.8546448 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:47:30.8651204 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:47:30 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:47:30.8656197 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:47:30.8660298 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:47:30.8660622 AM  rebol-view-278-3-1.exe  3372    QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:47:30.8661153 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:47:30.8664944 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:47:30.8705616 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\red.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.8707432 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\red.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.8709044 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\red.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:45:15 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 12,499, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x900000003c4bb, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.8711128 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\red.r SUCCESS Offset: 0, Length: 12,499
    2:47:30.8715682 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\red.r SUCCESS 
    2:47:30.8767926 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\encap-fs.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.8771683 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\encap-fs.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.8775622 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\encap-fs.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:59 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:59 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 2,323, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a2, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.8779791 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\encap-fs.r   SUCCESS Offset: 0, Length: 2,323
    2:47:30.8785467 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\encap-fs.r   SUCCESS 
    2:47:30.8811574 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\compiler.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.8813437 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\compiler.r    SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.8815035 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\compiler.r    BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 53,248, EndOfFile: 93,469, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c48b, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.8817659 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\compiler.r    SUCCESS Offset: 0, Length: 93,469
    2:47:30.8824176 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\compiler.r    SUCCESS 
    2:47:30.8970019 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\compiler.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.8973262 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\compiler.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.8975720 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\compiler.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 49,152, EndOfFile: 96,968, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c50c, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.8979766 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\compiler.r SUCCESS Offset: 0, Length: 96,968
    2:47:30.8987124 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\compiler.r SUCCESS 
    2:47:30.9227923 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\profiler.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9232197 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\profiler.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9235698 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\profiler.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:00 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:00 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 8,705, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a4, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9239631 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\profiler.r   SUCCESS Offset: 0, Length: 8,705
    2:47:30.9244590 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\profiler.r   SUCCESS 
    2:47:30.9265422 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\r2-forward.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9268174 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\r2-forward.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9270571 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\r2-forward.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:00 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:01 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 4,170, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a5, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9274300 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\r2-forward.r SUCCESS Offset: 0, Length: 4,170
    2:47:30.9277988 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\r2-forward.r SUCCESS 
    2:47:30.9287333 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9290017 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9292481 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:59 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:59 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 667, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a3, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9295742 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r SUCCESS Offset: 0, Length: 667
    2:47:30.9299379 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\int-to-bin.r SUCCESS 
    2:47:30.9306391 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9313780 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9317638 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:59 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:59 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 2,705, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0xa00000003c5a1, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9321541 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r   SUCCESS Offset: 0, Length: 2,705
    2:47:30.9325969 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\IEEE-754.r   SUCCESS 
    2:47:30.9337476 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9340225 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9342893 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:01 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:01 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 3,021, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a7, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9345692 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r SUCCESS Offset: 0, Length: 3,021
    2:47:30.9349131 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\virtual-struct.r SUCCESS 
    2:47:30.9365206 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9367902 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r  SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9370785 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r  BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:01 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:01 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 2,026, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5a6, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9373489 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r  SUCCESS Offset: 0, Length: 2,026
    2:47:30.9376906 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\utils\secure-clean-path.r  SUCCESS 
    2:47:30.9384566 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\linker.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9387278 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\linker.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9390036 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\linker.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 5,105, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0xa00000003c530, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9393335 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\linker.r   SUCCESS Offset: 0, Length: 5,105
    2:47:30.9397260 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\linker.r   SUCCESS 
    2:47:30.9413030 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\emitter.r  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9415899 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\emitter.r  SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9418679 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\emitter.r  BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:42:59 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 12,288, EndOfFile: 18,075, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c50e, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9422188 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\emitter.r  SUCCESS Offset: 0, Length: 18,075
    2:47:30.9426624 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\emitter.r  SUCCESS 
    2:47:30.9457005 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\targets\target-class.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9459754 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\targets\target-class.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9462294 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\targets\target-class.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 8,319, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c549, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9468018 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\targets\target-class.r SUCCESS Offset: 0, Length: 8,319
    2:47:30.9474370 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\targets\target-class.r SUCCESS 
    2:47:30.9588256 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\loader.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9591232 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\loader.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9593643 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\loader.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 12,200, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x500000003c531, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9597182 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\loader.r   SUCCESS Offset: 0, Length: 12,200
    2:47:30.9601498 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\loader.r   SUCCESS 
    2:47:30.9627837 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9629745 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9631552 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 16,339, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c4af, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9633712 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS Offset: 0, Length: 16,339
    2:47:30.9637042 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS 
    2:47:30.9972786 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:30.9975029 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:30.9976702 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:47:30 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 16,339, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c4af, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:30.9979368 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS Offset: 0, Length: 16,339
    2:47:30.9982435 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\lexer.r   SUCCESS 
    2:47:31.0043555 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\extractor.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:31.0045577 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\extractor.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:31.0047086 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\extractor.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:15 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:15 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 1,209, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5f6, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:31.0049678 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\extractor.r SUCCESS Offset: 0, Length: 1,209
    2:47:31.0052327 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\extractor.r SUCCESS 
    2:47:31.0059724 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\macros.reds   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:31.0061764 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\macros.reds   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:31.0063364 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\macros.reds   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 8,387, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c4f2, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:31.0065585 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\macros.reds   SUCCESS Offset: 0, Length: 8,387
    2:47:31.0068303 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\macros.reds   SUCCESS 
    2:47:31.0163799 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\environment\scalars.red   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:31.0167805 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\environment\scalars.red   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:31.0169548 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\environment\scalars.red   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 1,499, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c4ad, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:31.0172085 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\environment\scalars.red   SUCCESS Offset: 0, Length: 1,499
    2:47:31.0174918 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\environment\scalars.red   SUCCESS 
    2:47:31.0185754 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\redbin.r    SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:31.0188358 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\redbin.r    SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:31.0190744 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\redbin.r    BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:15 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:15 AM, FileAttributes: C, AllocationSize: 8,192, EndOfFile: 9,704, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5f7, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:31.0193993 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\redbin.r    SUCCESS Offset: 0, Length: 9,704
    2:47:31.0198563 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\utils\redbin.r    SUCCESS 
    2:47:31.0463823 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\config.r   SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:31.0466723 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\config.r   SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:31.0469159 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\config.r   BUFFER OVERFLOW CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, FileAttributes: C, AllocationSize: 4,096, EndOfFile: 4,288, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c50d, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:31.0472316 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\config.r   SUCCESS Offset: 0, Length: 4,288
    2:47:31.0476202 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\config.r   SUCCESS 
    2:47:31.0485052 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\system\custom-targets.r   NAME NOT FOUND  
    2:47:31.0489787 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  SUCCESS CreationTime: 21/08/2015 2:18:44 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:30:17 AM, ChangeTime: 21/08/2015 2:27:35 AM, AllocationSize: 48, EndOfFile: 42, FileAttributes: AC
    2:47:31.0493212 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:31.0494844 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:31.0496833 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  BUFFER OVERFLOW CreationTime: 21/08/2015 2:18:44 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:30:17 AM, ChangeTime: 21/08/2015 2:27:35 AM, FileAttributes: AC, AllocationSize: 48, EndOfFile: 42, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c439, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:31.0498688 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  SUCCESS Offset: 0, Length: 42
    2:47:31.0501233 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\test.red  SUCCESS 
    2:47:31.0504694 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:47:31 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 0, EndOfFile: 0, FileAttributes: DC
    2:47:31.0507370 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:47:31 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 0, EndOfFile: 0, FileAttributes: DC
    2:47:31.0511877 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\version.r SUCCESS Desired Access: Generic Read, Disposition: Open, Options: Sequential Access, Synchronous IO Non-Alert, Non-Directory File, Attributes: N, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:31.0514137 AM  rebol-view-278-3-1.exe  3372    QueryInformationVolume  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\version.r SUCCESS VolumeCreationTime: 15/05/2012 4:50:47 PM, VolumeSerialNumber: 0005-DEE2, SupportsObjects: True, VolumeLabel: SSD
    2:47:31.0515701 AM  rebol-view-278-3-1.exe  3372    QueryAllInformationFile C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\version.r BUFFER OVERFLOW CreationTime: 21/08/2015 2:27:15 AM, LastAccessTime: 21/08/2015 2:43:00 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:27:15 AM, FileAttributes: C, AllocationSize: 8, EndOfFile: 5, NumberOfLinks: 1, DeletePending: False, Directory: False, IndexNumber: 0x800000003c5f8, EaSize: 0, Access: Generic Read, Position: 0, Mode: Sequential Access, Synchronous IO Non-Alert, AlignmentRequirement: Word
    2:47:31.0517542 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\version.r SUCCESS Offset: 0, Length: 5
    2:47:31.0520093 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\version.r SUCCESS 
    2:47:31.0588476 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:47:08 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:47:31.0592588 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:47:08 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:47:31.0609769 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\runtime\crush.reds    SUCCESS CreationTime: 21/08/2015 2:26:51 AM, LastAccessTime: 21/08/2015 2:28:08 AM, LastWriteTime: 21/08/2015 12:50:54 AM, ChangeTime: 21/08/2015 2:26:51 AM, AllocationSize: 8,192, EndOfFile: 11,059, FileAttributes: C
    2:47:31.0685832 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:47:08 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:47:31.0712204 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS Desired Access: Read Data/List Directory, Synchronize, Disposition: Open, Options: Directory, Synchronous IO Non-Alert, Attributes: n/a, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:47:31.0714872 AM  rebol-view-278-3-1.exe  3372    QueryDirectory  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Filter: crush.dll, 1: crush.dll
    2:47:31.0716045 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS 
    2:47:31.0719811 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:47:08 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:47:31.0722565 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:47:31.0724211 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:47:31.0724443 AM  rebol-view-278-3-1.exe  3372    QueryStandardInformationFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS AllocationSize: 8,192, EndOfFile: 11,264, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:47:31.0724898 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:47:31.0726734 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS 
    2:47:31.0730413 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:47:31 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:47:31.0732941 AM  rebol-view-278-3-1.exe  3372    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:47:31 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:47:31.0735601 AM  rebol-view-278-3-1.exe  3372    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:47:31.0737308 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:47:31.0737565 AM  rebol-view-278-3-1.exe  3372    QueryStandardInformationFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS AllocationSize: 8,192, EndOfFile: 11,264, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:47:31.0737858 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:47:31.0740408 AM  rebol-view-278-3-1.exe  3372    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:47:31.0744834 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS 
    2:47:31.0748812 AM  rebol-view-278-3-1.exe  3372    Load Image  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Image Base: 0x22b0000, Image Size: 0x7000
    2:47:31.0749541 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 10,752, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:47:40.1961357 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 1,024, Length: 7,168, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:47:40.1983228 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 8,192, Length: 1,536, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:47:40.2021141 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 9,728, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:47:40.2027363 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 10,240, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:47:40.2033447 AM  rebol-view-278-3-1.exe  3372    RegOpenKey  HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\crush.dll    NAME NOT FOUND  Desired Access: Read
    2:47:40.2034749 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\rebol-view-278-3-1.exe    SUCCESS Offset: 106,496, Length: 20,480, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:47:40.2051944 AM  rebol-view-278-3-1.exe  3372    ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\rebol-view-278-3-1.exe    SUCCESS Offset: 458,752, Length: 32,768, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:47:40.2494793 AM  rebol-view-278-3-1.exe  3372    Thread Exit     SUCCESS Thread ID: 3436, User Time: 0.4375000, Kernel Time: 0.4062500
    2:47:40.2514997 AM  rebol-view-278-3-1.exe  3372    Process Exit        SUCCESS Exit Status: -1073741819, User Time: 0.4531250 seconds, Kernel Time: 0.2812500 seconds, Private Bytes: 9,908,224, Peak Private Bytes: 10,203,136, Working Set: 12,869,632, Peak Working Set: 13,213,696
    2:47:40.2515765 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS 
    2:47:40.2519741 AM  rebol-view-278-3-1.exe  3372    CloseFile   C:\WINDOWS\WinSxS\x86_Microsoft.Windows.Common-Controls_6595b64144ccf1df_6.0.2600.6028_x-ww_61e65202    SUCCESS 
    ```
    
    **load/library %crush.dll**
    
    ```
    2:49:57.4051172 AM  rebol-view-278-3-1.exe  2668    QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:49:54 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:49:57.4057824 AM  rebol-view-278-3-1.exe  2668    CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:49:57.4062931 AM  rebol-view-278-3-1.exe  2668    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:49:57.4063255 AM  rebol-view-278-3-1.exe  2668    QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:49:57.4063853 AM  rebol-view-278-3-1.exe  2668    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:49:57.4067697 AM  rebol-view-278-3-1.exe  2668    CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:50:02.8870196 AM  rebol-view-278-3-1.exe  2668    QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:49:57 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:50:02.8875048 AM  rebol-view-278-3-1.exe  2668    CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:50:02.8879035 AM  rebol-view-278-3-1.exe  2668    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:50:02.8879314 AM  rebol-view-278-3-1.exe  2668    QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:50:02.8879797 AM  rebol-view-278-3-1.exe  2668    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:50:02.8883669 AM  rebol-view-278-3-1.exe  2668    CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:50:02.8990272 AM  rebol-view-278-3-1.exe  2668    QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:50:02 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:50:02.8995200 AM  rebol-view-278-3-1.exe  2668    CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:50:02.8999237 AM  rebol-view-278-3-1.exe  2668    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:50:02.8999623 AM  rebol-view-278-3-1.exe  2668    QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:50:02.9000095 AM  rebol-view-278-3-1.exe  2668    CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:50:02.9004056 AM  rebol-view-278-3-1.exe  2668    CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:50:02.9020072 AM  rebol-view-278-3-1.exe  2668    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS Desired Access: Read Data/List Directory, Synchronize, Disposition: Open, Options: Directory, Synchronous IO Non-Alert, Attributes: n/a, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:50:02.9020815 AM  rebol-view-278-3-1.exe  2668    QueryDirectory  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Filter: crush.dll, 1: crush.dll
    2:50:02.9021902 AM  rebol-view-278-3-1.exe  2668    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS 
    2:50:02.9025162 AM  rebol-view-278-3-1.exe  2668    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:47:40 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:50:02.9027813 AM  rebol-view-278-3-1.exe  2668    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:50:02.9029484 AM  rebol-view-278-3-1.exe  2668    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:50:02.9029819 AM  rebol-view-278-3-1.exe  2668    QueryStandardInformationFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS AllocationSize: 8,192, EndOfFile: 11,264, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:50:02.9030314 AM  rebol-view-278-3-1.exe  2668    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:50:02.9031859 AM  rebol-view-278-3-1.exe  2668    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS 
    2:50:02.9035281 AM  rebol-view-278-3-1.exe  2668    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:50:02 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:50:02.9038183 AM  rebol-view-278-3-1.exe  2668    QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:50:02 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:50:02.9040876 AM  rebol-view-278-3-1.exe  2668    CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:50:02.9042625 AM  rebol-view-278-3-1.exe  2668    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:50:02.9043581 AM  rebol-view-278-3-1.exe  2668    CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:50:02.9045469 AM  rebol-view-278-3-1.exe  2668    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS 
    2:50:02.9049769 AM  rebol-view-278-3-1.exe  2668    Load Image  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Image Base: 0x1aa0000, Image Size: 0x7000
    2:50:02.9052233 AM  rebol-view-278-3-1.exe  2668    RegOpenKey  HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\crush.dll    NAME NOT FOUND  Desired Access: Read
    2:50:02.9054155 AM  rebol-view-278-3-1.exe  2668    Thread Exit     SUCCESS Thread ID: 2780, User Time: 0.1093750, Kernel Time: 0.2500000
    2:50:02.9084932 AM  rebol-view-278-3-1.exe  2668    Process Exit        SUCCESS Exit Status: -1073741819, User Time: 0.1250000 seconds, Kernel Time: 0.2500000 seconds, Private Bytes: 7,237,632, Peak Private Bytes: 7,249,920, Working Set: 10,272,768, Peak Working Set: 10,375,168
    2:50:02.9085695 AM  rebol-view-278-3-1.exe  2668    CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS 
    2:50:02.9089855 AM  rebol-view-278-3-1.exe  2668    CloseFile   C:\WINDOWS\WinSxS\x86_Microsoft.Windows.Common-Controls_6595b64144ccf1df_6.0.2600.6028_x-ww_61e65202    SUCCESS 
    ```
    
    **load/library %./crush.dll**
    
    ```
    2:57:11.2504594 AM  rebol-view-278-3-1.exe  820 QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:57:09 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:57:11.2509427 AM  rebol-view-278-3-1.exe  820 CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:57:11.2515056 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:57:11.2515417 AM  rebol-view-278-3-1.exe  820 QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:57:11.2515967 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:57:11.2519565 AM  rebol-view-278-3-1.exe  820 CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:57:27.1606086 AM  rebol-view-278-3-1.exe  820 QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:57:19 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:57:27.1610751 AM  rebol-view-278-3-1.exe  820 CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:57:27.1614886 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:57:27.1615294 AM  rebol-view-278-3-1.exe  820 QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:57:27.1615830 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:57:27.1620018 AM  rebol-view-278-3-1.exe  820 CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:57:27.1694575 AM  rebol-view-278-3-1.exe  820 QueryOpen   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS CreationTime: 14/04/2008 10:00:00 PM, LastAccessTime: 21/08/2015 2:57:27 AM, LastWriteTime: 14/04/2008 10:00:00 PM, ChangeTime: 11/08/2012 1:53:24 AM, AllocationSize: 114,688, EndOfFile: 159,232, FileAttributes: AC
    2:57:27.1698047 AM  rebol-view-278-3-1.exe  820 CreateFile  C:\WINDOWS\system32\MSIMTF.dll  SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:57:27.1701352 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:57:27.1701592 AM  rebol-view-278-3-1.exe  820 QueryStandardInformationFile    C:\WINDOWS\system32\MSIMTF.dll  SUCCESS AllocationSize: 114,688, EndOfFile: 159,232, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:57:27.1701970 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS SyncType: SyncTypeOther
    2:57:27.1704626 AM  rebol-view-278-3-1.exe  820 CloseFile   C:\WINDOWS\system32\MSIMTF.dll  SUCCESS 
    2:57:27.1717667 AM  rebol-view-278-3-1.exe  820 CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS Desired Access: Read Data/List Directory, Synchronize, Disposition: Open, Options: Directory, Synchronous IO Non-Alert, Attributes: n/a, ShareMode: Read, Write, AllocationSize: n/a, OpenResult: Opened
    2:57:27.1718609 AM  rebol-view-278-3-1.exe  820 QueryDirectory  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Filter: crush.dll, 1: crush.dll
    2:57:27.1719600 AM  rebol-view-278-3-1.exe  820 CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS 
    2:57:27.1722986 AM  rebol-view-278-3-1.exe  820 QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:56:30 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:57:27.1725084 AM  rebol-view-278-3-1.exe  820 CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:57:27.1726344 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:57:27.1726548 AM  rebol-view-278-3-1.exe  820 QueryStandardInformationFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS AllocationSize: 8,192, EndOfFile: 11,264, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:57:27.1726883 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:57:27.1728104 AM  rebol-view-278-3-1.exe  820 CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS 
    2:57:27.1730719 AM  rebol-view-278-3-1.exe  820 QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:57:27 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:57:27.1732541 AM  rebol-view-278-3-1.exe  820 QueryOpen   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS CreationTime: 21/08/2015 2:29:09 AM, LastAccessTime: 21/08/2015 2:57:27 AM, LastWriteTime: 21/08/2015 2:29:09 AM, ChangeTime: 21/08/2015 2:29:09 AM, AllocationSize: 8,192, EndOfFile: 11,264, FileAttributes: AC
    2:57:27.1734345 AM  rebol-view-278-3-1.exe  820 CreateFile  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Desired Access: Execute/Traverse, Synchronize, Disposition: Open, Options: Synchronous IO Non-Alert, Non-Directory File, Attributes: n/a, ShareMode: Read, Delete, AllocationSize: n/a, OpenResult: Opened
    2:57:27.1735555 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeCreateSection, PageProtection: PAGE_EXECUTE
    2:57:27.1735731 AM  rebol-view-278-3-1.exe  820 QueryStandardInformationFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS AllocationSize: 8,192, EndOfFile: 11,264, NumberOfLinks: 1, DeletePending: False, Directory: False
    2:57:27.1735924 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:57:27.1737776 AM  rebol-view-278-3-1.exe  820 CreateFileMapping   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS SyncType: SyncTypeOther
    2:57:27.1739025 AM  rebol-view-278-3-1.exe  820 CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS 
    2:57:27.1742849 AM  rebol-view-278-3-1.exe  820 Load Image  C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Image Base: 0x1aa0000, Image Size: 0x7000
    2:57:27.1743838 AM  rebol-view-278-3-1.exe  820 ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 10,752, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:57:27.5009728 AM  rebol-view-278-3-1.exe  820 ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 1,024, Length: 7,168, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:57:27.5031809 AM  rebol-view-278-3-1.exe  820 ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 8,192, Length: 1,536, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:57:27.5115736 AM  rebol-view-278-3-1.exe  820 ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 9,728, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:57:27.5181686 AM  rebol-view-278-3-1.exe  820 ReadFile    C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284\crush.dll SUCCESS Offset: 10,240, Length: 512, I/O Flags: Non-cached, Paging I/O, Synchronous Paging I/O
    2:57:27.5268166 AM  rebol-view-278-3-1.exe  820 RegOpenKey  HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\crush.dll    NAME NOT FOUND  Desired Access: Read
    2:57:27.5271443 AM  rebol-view-278-3-1.exe  820 Thread Exit     SUCCESS Thread ID: 668, User Time: 0.2500000, Kernel Time: 0.1093750
    2:57:27.5329464 AM  rebol-view-278-3-1.exe  820 Process Exit        SUCCESS Exit Status: -1073741819, User Time: 0.2656250 seconds, Kernel Time: 0.1250000 seconds, Private Bytes: 7,237,632, Peak Private Bytes: 7,249,920, Working Set: 10,268,672, Peak Working Set: 10,391,552
    2:57:27.5330537 AM  rebol-view-278-3-1.exe  820 CloseFile   C:\Temporary\2015-08-21\red-issue-1284\red-issue-1284   SUCCESS 
    2:57:27.5337437 AM  rebol-view-278-3-1.exe  820 CloseFile   C:\WINDOWS\WinSxS\x86_Microsoft.Windows.Common-Controls_6595b64144ccf1df_6.0.2600.6028_x-ww_61e65202    SUCCESS 
    ```

--------------------------------------------------------------------------------

On 2015-08-20T18:47:45Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133115717>

    Both computers seem to have no trouble loading other dlls:
    
    ```
    >> load/library %freetype6.dll
    >> load/library %sqlite3.dll
    >> load/library %HelloWorld.dll
    >>
    ```

--------------------------------------------------------------------------------

On 2015-08-21T02:58:43Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-133259746>

    I see nothing wrong in the logs.
    
    The crush.dll version you uploaded is bit-identical to the one I'm compiling from the same branch. Your crush.dll works fine here.

--------------------------------------------------------------------------------

On 2015-08-23T16:24:37Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133872627>

    **A**: 32-bit Windows XP, SP3.
    **B**: 32-bit Windows XP, SP3.
    **C**: 32-bit Windows 7, SP1, on a virtual machine (on **A**).
    **D**: 64-bit Windows 7, SP1 (don't have constant access, so not referred to in all examples).
    
    All of the following libraries are loaded in `rebol-view-278-3-1.exe`:
    
    `load/library %crush.dll`
    **A**: `** Access Error: Cannot open crush.dll as library`
    **B**: crash
    **C**: OK
    **D**: `** Access Error: Cannot open crush.dll as library`
    
    Using `load/library` on 32 other random dlls:
    **A**: OK
    **B**: OK
    **C**: OK
    
    Using `testlib.dll` compiled from the `testlib.reds` example from [here](http://www.red-lang.org/2013/08/033-released-shared-libraries-and.html):
    **A**: OK
    **B**: OK
    **C**: OK
    
    Now the interesting part!
    Using four dlls compiled from four minimal Red/System files based on `testlib.dll` (the sources are further below):
    
    **A** and **B** (**B** doesn't crash this time):
    
    ```
    >> load/library %testlib1.dll
    >> load/library %testlib2.dll
    ** Access Error: Cannot open testlib2.dll as library
    ** Near: load/library %testlib2.dll
    >> load/library %testlib3.dll
    >> load/library %testlib4.dll
    ** Access Error: Cannot open testlib4.dll as library
    ** Near: load/library %testlib4.dll
    >>
    ```
    
    **C**:
    
    ```
    Type desktop to start the Viewtop.
    >> load/library %testlib1.dll
    >> load/library %testlib2.dll
    >> load/library %testlib3.dll
    >> load/library %testlib4.dll
    ** Access Error: Cannot open testlib4.dll as library
    ** Near: load/library %testlib4.dll
    >>
    ```
    
    **A**, **B** and **C** can use `testlib1.dll` and `testlib3.dll`.
    However, when trying to actually use `testlib2.dll`, **C** crashes:
    
    ![win7crash](https://cloud.githubusercontent.com/assets/7657453/9429050/baccbbbc-4a06-11e5-91e4-85c7cf6800b7.PNG)
    
    “View problem details” gives:
    
    ```
    Problem signature:
      Problem Event Name:   APPCRASH
      Application Name: rebol-view-278-3-1.exe
      Application Version:  2.7.8.3
      Application Timestamp:    4d1fc945
      Fault Module Name:    testlib2.dll
      Fault Module Version: 0.0.0.0
      Fault Module Timestamp:   55da5752
      Exception Code:   c0000005
      Exception Offset: 00002038
      OS Version:   6.1.7601.2.1.0.256.48
      Locale ID:    3081
      Additional Information 1: 4ad3
      Additional Information 2: 4ad3300d3680fa98c9804cea14c08123
      Additional Information 3: 8abc
      Additional Information 4: 8abcced32cf0093a2df5580c6210d08a
    
    Read our privacy statement online:
      http://go.microsoft.com/fwlink/?linkid=104288&clcid=0x0409
    
    If the online privacy statement is not available, please read our privacy statement offline:
      C:\Windows\system32\en-US\erofflps.txt
    ```
    
    Here are the sources. As you can see, all the difference is made by one more `print "hi"` and one more `a: 4`:
    
    `testlib1.reds`:
    
    ```
    Red/System [
        File: %testlib1.reds
    ]
    
    inc: func [n [integer!] return: [integer!]][
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
    ;   print "hi"
    
        n + 1
    ] 
    
    #export [inc]
    ```
    
    `testlib2.reds`:
    
    ```
    Red/System [
        File: %testlib2.reds
    ]
    
    inc: func [n [integer!] return: [integer!]][
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
    
        n + 1
    ] 
    
    #export [inc]
    ```
    
    `testlib3.reds`:
    
    ```
    Red/System [
        File: %testlib3.reds
    ]
    
    inc: func [n [integer!] return: [integer!]][
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
    ;   a: 4
    
        n + 1
    ] 
    
    #export [inc]
    ```
    
    `testlib4.reds`:
    
    ```
    Red/System [
        File: %testlib4.reds
    ]
    
    inc: func [n [integer!] return: [integer!]][
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
        a: 4
    
        n + 1
    ] 
    
    #export [inc]
    ```

--------------------------------------------------------------------------------

On 2015-08-23T19:52:01Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-133910052>

    Using executables compiled from Red/System files based on the `loadlib.reds` example from [here](http://www.red-lang.org/2013/08/033-released-shared-libraries-and.html) to load the four `loadlibx.dll`s:
    **A**: OK
    **B**: OK
    **C**: OK
    
    ```
    C:\>loadlib1
    hihihihihihihihihihihihihihihihi124
    C:\>loadlib2
    hihihihihihihihihihihihihihihihihi124
    C:\>loadlib3
    124
    C:\>loadlib4
    124
    ```
    
    So one may be tempted to think the problem is with Rebol 2. However, other tested languages also only load **1** and **3** and consistently choke on **2** (even on **C**), **4** and **crush**:
    
    **Python** on **A**, **B** and **C**:
    
    ```
    Python 2.7.6 (default, Nov 10 2013, 19:24:18) [MSC v.1500 32 bit (Intel)] on win32
    Type "copyright", "credits" or "license()" for more information.
    >>> import ctypes
    >>> testlib1 = ctypes.WinDLL ("c:\\testlib1.dll")
    >>> testlib2 = ctypes.WinDLL ("c:\\testlib2.dll")
    
    Traceback (most recent call last):
      File "<pyshell#2>", line 1, in <module>
        testlib2 = ctypes.WinDLL ("c:\\testlib2.dll")
      File "C:\Python27\lib\ctypes\__init__.py", line 365, in __init__
        self._handle = _dlopen(self._name, mode)
    WindowsError: [Error 998] Invalid access to memory location
    >>> testlib3 = ctypes.WinDLL ("c:\\testlib3.dll")
    >>> testlib4 = ctypes.WinDLL ("c:\\testlib4.dll")
    
    Traceback (most recent call last):
      File "<pyshell#4>", line 1, in <module>
        testlib4 = ctypes.WinDLL ("c:\\testlib4.dll")
      File "C:\Python27\lib\ctypes\__init__.py", line 365, in __init__
        self._handle = _dlopen(self._name, mode)
    WindowsError: [Error 998] Invalid access to memory location
    >>> crush = ctypes.WinDLL ("c:\\crush.dll")
    
    Traceback (most recent call last):
      File "<pyshell#5>", line 1, in <module>
        crush = ctypes.WinDLL ("c:\\crush.dll")
      File "C:\Python27\lib\ctypes\__init__.py", line 365, in __init__
        self._handle = _dlopen(self._name, mode)
    WindowsError: [Error 998] Invalid access to memory location
    >>>
    ```
    
    **Racket** on **A**, **B** and **C**:
    
    ```
    Welcome to DrRacket, version 6.2.1 [3m].
    Language: racket; memory limit: 128 MB.
    > (require ffi/unsafe)
    > (ffi-lib "c:/testlib1.dll")
    #<ffi-lib>
    > (ffi-lib "c:/testlib2.dll")
    . . ..\..\Program Files\Racket\share\pkgs\drracket\drracket\private\rep.rkt:1131:24: ffi-lib: couldn't open "c:/testlib2.dll" (Invalid access to memory location.; errno=998)
    > (ffi-lib "c:/testlib3.dll")
    #<ffi-lib>
    > (ffi-lib "c:/testlib4.dll")
    . . ..\..\Program Files\Racket\share\pkgs\drracket\drracket\private\rep.rkt:1131:24: ffi-lib: couldn't open "c:/testlib4.dll" (Invalid access to memory location.; errno=998)
    > (ffi-lib "c:/crush.dll")
    . . ..\..\Program Files\Racket\share\pkgs\drracket\drracket\private\rep.rkt:1131:24: ffi-lib: couldn't open "c:/crush.dll" (Invalid access to memory location.; errno=998)
    > 
    ```
    
    Therefore, it seems more likely that programs written in Red/System are the only ones which can load the faulty dlls written in Red/System.

--------------------------------------------------------------------------------

On 2015-09-03T17:38:29Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-137523018>

    I finally had a chance to test more on **D**, which is running 64-bit Windows 7 Enterprise, SP 1 on a i7-2600 CPU.
    
    Using the `red-issue-1284` branch to compile `test.red`:
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    >> do/args %red.r {-c test.red}
    load-lib?: block!
    encap?: false
    
    -=== Red Compiler 0.5.4 ===-
    
    Compiling /E/2015-09-03/red-issue-1284/red-issue-1284/test.red ...
    filename: %./crush.dll
    encap?: false
    crush-lib: none
    %/E/2015-09-03/red-issue-1284/red-issue-1284/
    opts: make object! [
        config-name: 'MSDOS
        OS: 'Windows
        OS-version: none
        ABI: none
        link?: true
        debug?: false
        build-prefix: %./
        build-basename: %../crush
        build-suffix: none
        format: 'PE
        type: 'dll
        target: 'IA-32
        cpu-version: 6.0
        verbosity: 0
        sub-system: 'console
        runtime?: true
        use-natives?: false
        need-main?: false
        PIC?: false
        base-address: none
        dynamic-linker: none
        syscall: 'Linux
        stack-align-16?: false
        literal-pool?: false
        unicode?: false
        red-pass?: false
        red-only?: false
        red-store-bodies?: true
        red-strict-check?: true
        red-tracing?: true
        red-help?: false
        legacy: none
    ]
    Pre-compiling compression library...
    %/E/2015-09-03/red-issue-1284/red-issue-1284/
    crush-lib: none
    filename: %./crush.dll
    true
    *** Driver Internal Error: Access Error : Cannot open ./crush.dll as library
    *** Where: build-compress-lib
    *** Near:  [crush-lib: load/library filename
    crush-compress: make
    ]
    ```
    
    The same 3 out of 5 Red-made dlls don't load in Rebol 2:
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    >> load/library %testlib1.dll
    >> load/library %testlib2.dll
    ** Access Error: Cannot open testlib2.dll as library
    ** Where: halt-view
    ** Near: load/library %testlib2.dll
    >> load/library %testlib3.dll
    >> load/library %testlib4.dll
    ** Access Error: Cannot open testlib4.dll as library
    ** Where: halt-view
    ** Near: load/library %testlib4.dll
    >> load/library %crush.dll
    ** Access Error: Cannot open crush.dll as library
    ** Where: halt-view
    ** Near: load/library %crush.dll
    >>
    ```
    
    Or Python:
    
    ```
    Python 2.7.1 (r271:86832, Nov 27 2010, 18:30:46) [MSC v.1500 32 bit (Intel)] on win32
    Type "copyright", "credits" or "license()" for more information.
    >>> import ctypes
    >>> test1 = ctypes.WinDLL("c:\\testlib1.dll")
    >>> test2 = ctypes.WinDLL("c:\\testlib2.dll")
    
    Traceback (most recent call last):
      File "<pyshell#2>", line 1, in <module>
        test2 = ctypes.WinDLL("c:\\testlib2.dll")
      File "C:\Python27\lib\ctypes\__init__.py", line 353, in __init__
        self._handle = _dlopen(self._name, mode)
    WindowsError: [Error 998] Invalid access to memory location
    >>> test3 = ctypes.WinDLL("c:\\testlib3.dll")
    >>> test4 = ctypes.WinDLL("c:\\testlib4.dll")
    
    Traceback (most recent call last):
      File "<pyshell#4>", line 1, in <module>
        test4 = ctypes.WinDLL("c:\\testlib4.dll")
      File "C:\Python27\lib\ctypes\__init__.py", line 353, in __init__
        self._handle = _dlopen(self._name, mode)
    WindowsError: [Error 998] Invalid access to memory location
    >>> test1 = ctypes.WinDLL("c:\\crush.dll")
    
    Traceback (most recent call last):
      File "<pyshell#5>", line 1, in <module>
        test1 = ctypes.WinDLL("c:\\crush.dll")
      File "C:\Python27\lib\ctypes\__init__.py", line 353, in __init__
        self._handle = _dlopen(self._name, mode)
    WindowsError: [Error 998] Invalid access to memory location
    >>> 
    ```

--------------------------------------------------------------------------------

On 2015-11-07T10:28:37Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-154689469>

    Good news, we found the origin of the problem: the relocation of our DLL in memory by the Windows kernel does not happen for an unknown reason. We are now investigating our relocation supporting code to see why and fix it.

--------------------------------------------------------------------------------

On 2015-11-08T18:23:45Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-154855469>

    Update concerning latest fix:
    
    As before, the dlls are compiled from:
    
    **testlib1.reds**
    
    ```
    Red/System [
        File: %testlib1.reds
    ]
    
    inc: func [n [integer!] return: [integer!]][
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
        print "hi"
    ;   print "hi"
    
        n + 1
    ] 
    
    #export [inc]
    ```
    
    **testlib2.reds** is the same but with the last `print "hi"` uncommented.
    
    (testlib3.reds and testlib4.reds from earlier rightly no longer compile because they violate [this fix](https://github.com/red/red/commit/0c4bbcd220eb8049fbd4f77a8c279e67533494de).)
    
    The dlls are called from executables compiled from:
    **loadlib1.reds**
    
    ```
        Red/System [
            File: %loadlib1.reds
        ]
    
        #import [
            "testlib1.dll" stdcall [
                inc: "inc" [n [integer!] return: [integer!]]
            ]
        ]
    
        print inc 123
    ```
    
    On **A** (32-bit Windows XP, SP3):
    
    ```
    H:\>loadlib1
    hihihihihihihihihihihihihihihihi124
    H:\>loadlib2
    hihihihihihihihihihihihihihihihihi124
    ```
    
    Rebol 2:
    
    ```
    >> load/library %testlib1.dll
    ** Access Error: Cannot open testlib1.dll as library
    ** Near: load/library %testlib1.dll
    >> load/library %testlib2.dll
    ** Access Error: Cannot open testlib2.dll as library
    ** Near: load/library %testlib2.dll
    ```
    
    Python:
    
    ```
    Python 2.7.6 (default, Nov 10 2013, 19:24:18) [MSC v.1500 32 bit (Intel)] on win32
    Type "copyright", "credits" or "license()" for more information.
    >>> import ctypes
    >>> testlib1 = ctypes.WinDLL ("h:\\testlib1.dll")
    
    Traceback (most recent call last):
      File "<pyshell#1>", line 1, in <module>
        testlib1 = ctypes.WinDLL ("h:\\testlib1.dll")
      File "H:\Python27\lib\ctypes\__init__.py", line 365, in __init__
        self._handle = _dlopen(self._name, mode)
    WindowsError: [Error 998] Invalid access to memory location
    >>> testlib2 = ctypes.WinDLL ("h:\\testlib2.dll")
    
    Traceback (most recent call last):
      File "<pyshell#2>", line 1, in <module>
        testlib2 = ctypes.WinDLL ("h:\\testlib2.dll")
      File "H:\Python27\lib\ctypes\__init__.py", line 365, in __init__
        self._handle = _dlopen(self._name, mode)
    WindowsError: [Error 998] Invalid access to memory location
    >>> 
    ```
    
    Racket:
    
    ```
    Welcome to DrRacket, version 6.2.1 [3m].
    Language: racket; memory limit: 128 MB.
    > (require ffi/unsafe)
    > (ffi-lib "h:/testlib1.dll")
    . . ..\..\Program Files\Racket\share\pkgs\drracket\drracket\private\rep.rkt:1131:24: ffi-lib: couldn't open "h:/testlib1.dll" (Invalid access to memory location.; errno=998)
    > (ffi-lib "h:/testlib2.dll")
    . . ..\..\Program Files\Racket\share\pkgs\drracket\drracket\private\rep.rkt:1131:24: ffi-lib: couldn't open "h:/testlib2.dll" (Invalid access to memory location.; errno=998)
    > 
    ```
    
    On **C** (32-bit Windows 7, SP1, on a virtual machine (on **A**)):
    
    ```
    C:\>loadlib1
    hihihihihihihihihihihihihihihihi124
    C:\>loadlib2
    hihihihihihihihihihihihihihihihihi124
    ```
    
    Rebol 2:
    
    ```
    >> load/library %testlib1.dll
    >> load/library %testlib2.dll
    ```
    
    Python:
    
    ```
    Python 2.7.6 (default, Nov 10 2013, 19:24:18) [MSC v.1500 32 bit (Intel)] on win32
    Type "copyright", "credits" or "license()" for more information.
    >>> import ctypes
    >>> testlib1 = ctypes.WinDLL ("c:\\testlib1.dll")
    
    Traceback (most recent call last):
      File "<pyshell#1>", line 1, in <module>
        testlib1 = ctypes.WinDLL ("c:\\testlib1.dll")
      File "C:\Python27\lib\ctypes\__init__.py", line 365, in __init__
        self._handle = _dlopen(self._name, mode)
    WindowsError: [Error 998] Invalid access to memory location
    >>> testlib2 = ctypes.WinDLL ("c:\\testlib2.dll")
    
    Traceback (most recent call last):
      File "<pyshell#2>", line 1, in <module>
        testlib2 = ctypes.WinDLL ("c:\\testlib2.dll")
      File "C:\Python27\lib\ctypes\__init__.py", line 365, in __init__
        self._handle = _dlopen(self._name, mode)
    WindowsError: [Error 998] Invalid access to memory location
    >>> 
    ```
    
    Racket:
    
    ```
    Welcome to DrRacket, version 6.2.1 [3m].
    Language: racket; memory limit: 128 MB.
    > (require ffi/unsafe)
    > (ffi-lib "c:/testlib1.dll")
    #<ffi-lib>
    > (ffi-lib "c:/testlib2.dll")
    ffi-lib: couldn't open "c:/testlib2.dll" (Invalid access to memory location.; errno=998)
    > 
    ```
    
    Notice the differences between the 2 OSes concerning Rebol 2 and Racket.
    
    Also, crush.dll still isn't loaded by Rebol 2 in **A**, but it is in **C**.

--------------------------------------------------------------------------------

On 2015-11-09T07:39:16Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-154984543>

    I generated 20 versions of the code which have 1 to 20 times the `print "hi"` line.
    
    In **A** (Windows XP), they all fail when loading them in ascending order in Rebol 2, Python and Racket.
    In **C** (Windows 7), it's the same for Python and Racket, but in Rebol 2:
    
    ```
    >> load/library %hilib0001.dll
    >> load/library %hilib0002.dll
    >> load/library %hilib0003.dll
    >> load/library %hilib0004.dll
    >> load/library %hilib0005.dll
    >> load/library %hilib0006.dll
    >> load/library %hilib0007.dll
    >> load/library %hilib0008.dll
    >> load/library %hilib0009.dll
    ** Access Error: Cannot open hilib0009.dll as library
    ** Near: load/library %hilib0009.dll
    >> load/library %hilib0010.dll
    ** Access Error: Cannot open hilib0010.dll as library
    ** Near: load/library %hilib0010.dll
    >> load/library %hilib0011.dll
    ** Access Error: Cannot open hilib0011.dll as library
    ** Near: load/library %hilib0011.dll
    >> load/library %hilib0012.dll
    ** Access Error: Cannot open hilib0012.dll as library
    ** Near: load/library %hilib0012.dll
    >> load/library %hilib0013.dll
    ** Access Error: Cannot open hilib0013.dll as library
    ** Near: load/library %hilib0013.dll
    >> load/library %hilib0014.dll
    ** Access Error: Cannot open hilib0014.dll as library
    ** Near: load/library %hilib0014.dll
    >> load/library %hilib0015.dll
    ** Access Error: Cannot open hilib0015.dll as library
    ** Near: load/library %hilib0015.dll
    >> load/library %hilib0016.dll
    ** Access Error: Cannot open hilib0016.dll as library
    ** Near: load/library %hilib0016.dll
    >> load/library %hilib0017.dll
    ** Access Error: Cannot open hilib0017.dll as library
    ** Near: load/library %hilib0017.dll
    >> load/library %hilib0018.dll
    ** Access Error: Cannot open hilib0018.dll as library
    ** Near: load/library %hilib0018.dll
    >> load/library %hilib0019.dll
    ** Access Error: Cannot open hilib0019.dll as library
    ** Near: load/library %hilib0019.dll
    >> load/library %hilib0020.dll
    ** Access Error: Cannot open hilib0020.dll as library
    ** Near: load/library %hilib0020.dll
    ```
    
    However, it seems to depend on the order in which they are loaded in each session:
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    
    
    Type desktop to start the Viewtop.
    >> load/library %hilib0020.dll
    >> load/library %hilib0019.dll
    >> load/library %hilib0018.dll
    >> load/library %hilib0017.dll
    >> load/library %hilib0016.dll
    >> load/library %hilib0015.dll
    >> load/library %hilib0014.dll
    >> load/library %hilib0013.dll
    >> load/library %hilib0012.dll
    >> load/library %hilib0011.dll
    >> load/library %hilib0010.dll
    >> load/library %hilib0009.dll
    >> load/library %hilib0008.dll
    ** Access Error: Cannot open hilib0008.dll as library
    ** Near: load/library %hilib0008.dll
    >> load/library %hilib0007.dll
    ** Access Error: Cannot open hilib0007.dll as library
    ** Near: load/library %hilib0007.dll
    >> load/library %hilib0006.dll
    ** Access Error: Cannot open hilib0006.dll as library
    ** Near: load/library %hilib0006.dll
    >> load/library %hilib0005.dll
    ** Access Error: Cannot open hilib0005.dll as library
    ** Near: load/library %hilib0005.dll
    >> load/library %hilib0004.dll
    ** Access Error: Cannot open hilib0004.dll as library
    ** Near: load/library %hilib0004.dll
    >> load/library %hilib0003.dll
    ** Access Error: Cannot open hilib0003.dll as library
    ** Near: load/library %hilib0003.dll
    >> load/library %hilib0002.dll
    ** Access Error: Cannot open hilib0002.dll as library
    ** Near: load/library %hilib0002.dll
    >> load/library %hilib0001.dll
    ** Access Error: Cannot open hilib0001.dll as library
    ** Near: load/library %hilib0001.dll
    ```
    
    After having systematically tested every possible order, my conclusion about the pattern here, is that:
    - Successfully loading any hilib greater than 8 means that from then on in that session:
      - Any hilib less than 9 will fail.
      - Any hilib greater than 8 will succeed.
    - Successfully loading any hilib less than 9 means that from then on in that session:
      - Any hilib less than 9 will succeed.
      - Any hilib greater than 8 will fail.
    
    Example:
    
    ```
    REBOL/View 2.7.8.3.1 1-Jan-2011
    Copyright 2000-2011 REBOL Technologies.  All rights reserved.
    REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
    
    
    Type desktop to start the Viewtop.
    >> load/library %hilib0004.dll
    >> load/library %hilib0009.dll
    ** Access Error: Cannot open hilib0009.dll as library
    ** Near: load/library %hilib0009.dll
    >> load/library %hilib0010.dll
    ** Access Error: Cannot open hilib0010.dll as library
    ** Near: load/library %hilib0010.dll
    >> load/library %hilib0011.dll
    ** Access Error: Cannot open hilib0011.dll as library
    ** Near: load/library %hilib0011.dll
    >> load/library %hilib0012.dll
    ** Access Error: Cannot open hilib0012.dll as library
    ** Near: load/library %hilib0012.dll
    >> load/library %hilib0013.dll
    ** Access Error: Cannot open hilib0013.dll as library
    ** Near: load/library %hilib0013.dll
    >> load/library %hilib0014.dll
    ** Access Error: Cannot open hilib0014.dll as library
    ** Near: load/library %hilib0014.dll
    >> load/library %hilib0015.dll
    ** Access Error: Cannot open hilib0015.dll as library
    ** Near: load/library %hilib0015.dll
    >> load/library %hilib0016.dll
    ** Access Error: Cannot open hilib0016.dll as library
    ** Near: load/library %hilib0016.dll
    >> load/library %hilib0017.dll
    ** Access Error: Cannot open hilib0017.dll as library
    ** Near: load/library %hilib0017.dll
    >> load/library %hilib0018.dll
    ** Access Error: Cannot open hilib0018.dll as library
    ** Near: load/library %hilib0018.dll
    >> load/library %hilib0019.dll
    ** Access Error: Cannot open hilib0019.dll as library
    ** Near: load/library %hilib0019.dll
    >> load/library %hilib0020.dll
    ** Access Error: Cannot open hilib0020.dll as library
    ** Near: load/library %hilib0020.dll
    >> load/library %hilib0001.dll
    >> load/library %hilib0002.dll
    >> load/library %hilib0003.dll
    >> load/library %hilib0004.dll
    >> load/library %hilib0005.dll
    >> load/library %hilib0006.dll
    >> load/library %hilib0007.dll
    >> load/library %hilib0008.dll
    >>
    ```

--------------------------------------------------------------------------------

On 2015-11-09T08:07:08Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-154992568>

    Strangely, Racket no longer loads `testlib1.dll` on **C** (though it did before), even if I reboot Windows 7. I don't think I've changed anything relevant.
    
    ```
    Welcome to DrRacket, version 6.2.1 [3m].
    Language: racket; memory limit: 128 MB.
    > (require ffi/unsafe)
    > (ffi-lib "c:/testlib1.dll")
    . . ..\..\Program Files\Racket\share\pkgs\drracket\drracket\private\rep.rkt:1131:24: ffi-lib: couldn't open "c:/testlib1.dll" (Invalid access to memory location.; errno=998)
    > 
    ```

--------------------------------------------------------------------------------

On 2015-11-09T08:31:52Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-154996407>

    Please give it another try with the new fix. With that fix, we can load at least 10 instances of the library from Rebol2 on Windows 7 without any issue.

--------------------------------------------------------------------------------

On 2015-11-09T09:19:20Z, iArnold, commented:
<https://github.com/red/red/issues/1284#issuecomment-155004353>

    Hi,
    
    I was able to compile a trivial testprogram on this Windows 7 with newest
    GUI branch using Rebol/View and the 'old' way of compiling
    do/args %red.r "-c %../testprogram.red"
    
    Looks to me this is solved.
    
    Regards,
    
    Arnold
    
    2015-11-09 9:31 GMT+01:00 Nenad Rakocevic notifications@github.com:
    
    > Please give it another try with the new fix.
    > 
    > —
    > Reply to this email directly or view it on GitHub
    > https://github.com/red/red/issues/1284#issuecomment-154996407.

--------------------------------------------------------------------------------

On 2015-11-09T09:20:23Z, WiseGenius, commented:
<https://github.com/red/red/issues/1284#issuecomment-155004530>

    Since [this commit](https://github.com/red/red/commit/cc3f29e6fa43ce20cbd9384419d33107b3b587fc):
    On both **A** (Windows XP) and **C** (Windows 7):
    - console and view-test successfully compile without any issues with `crush.dll`!
    - Rebol 2, Python and Racket successfully load all 20 hilibs!

--------------------------------------------------------------------------------

On 2015-11-09T09:35:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1284#issuecomment-155009560>

    Great!! :+1: :-)
    
    @WiseGenius Thank you _very much_ for your involvement and extensive testing/reporting on this issue. You saved us a lot of valuable time and helped fix a deep issue which will make Red experience much nicer for newcomers on Windows plateform.

