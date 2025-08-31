
#1924: "READ directory" may return paths that cannot be read.
================================================================================
Issue is closed, was reported by rebolek and has 18 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/1924>

This has been tested under Windows 7.

If you read content of **C:\** drive on W7, you can see directories like `Document and Settings` or `System Volume Information`:

```
red>> path: %/c/ foreach file read path [print file]
$Recycle.Bin/
autoexec.bat
cmder/
config.sys
Console2/
Documents and Settings/
pagefile.sys
PerfLogs/
Program Files/
ProgramData/
Recovery/
ride/
System Volume Information/
Tmp/
```

When you try to read their content, you get an error:

```
red>> path: %/c/ foreach file read path [read append copy path file]
*** Access error: cannot open: %/c/Documents%20and%20Settings/
*** Where: read
```

Those directories are hardlinks and are not reported by other tools such as Explorer, Total Commander, or `dir C:\`.



Comments:
--------------------------------------------------------------------------------

On 2016-05-21T02:27:36Z, qtxie, commented:
<https://github.com/red/red/issues/1924#issuecomment-220753759>

    Those files are `junction point` which is newly added on Windows Vista or newer, for compatability with older versions of Windows.
    https://social.msdn.microsoft.com/Forums/vstudio/en-US/6816ac63-b0a9-4b86-a723-7b57b79d4e6e/findfirstfile-not-listing-folders-or-files-from-documents-and-settings-folder?forum=vcgeneral
    
    We should provide a way to let user get those information, so they can ignore those files or redirect them to the real folders depend on their needs.

--------------------------------------------------------------------------------

On 2018-06-13T20:30:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/1924#issuecomment-397075440>

    @rebolek You can't read `System Volume Information/` because only the OS has permissions to do so:
    ```
    C:\>cacls "System Volume Information"
    C:\System Volume Information NT AUTHORITY\system:(OI)(CI)F
    ```
    You can override that of course, and it's totally valid that `read` lists it. I wouldn't advise excluding these from read results, but it may indeed be desirable to have a refinement for that.
    
    The reason other tools won't show it is because they were configured (by default) to hide files with both *hidden* and *system* attributes set:
    ```
    C:\>dir /ash
    01.01.2015  10:55    <DIR>          $Recycle.Bin
    01.01.2015  11:45    <DIR>          Boot
    21.11.2010  06:23           383 786 bootmgr
    01.01.2015  11:45             8 192 BOOTSECT.BAK
    14.07.2009  08:08    <JUNCTION>     Documents and Settings [C:\Users]
    08.06.2018  00:58    <DIR>          System Volume Information
    ```
    @qtxie I can successfully `read` a mount point (which is also a kind of junction) and a symlink.
    I can also successfully `read` files contained in the junction target directory:
    ```
    >> read/binary %/c/Documents%20and%20Settings/desktop.ini
    == #{
    FFFE0D000A005B002E005300680065006C006C0043006C006100730073004900
    6E0066006F005D000D000A004...
    ```
    as well as access it's subdirectories.
    This is definitely a bug in Red though:
    ```
    >> read %/c/Documents%20and%20Settings/
    *** Access Error: cannot open: %/c/Documents%20and%20Settings/
    *** Where: read
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2018-06-14T01:07:42Z, qtxie, commented:
<https://github.com/red/red/issues/1924#issuecomment-397135160>

    @hiiamboris Thanks. I'll try to fix it.

--------------------------------------------------------------------------------

On 2018-06-14T15:51:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/1924#issuecomment-397344716>

    @qtxie You know, on a second thought it's not a bug. My file manager silently circumvents this limitation, so that misled me. But I think MS specifically wanted this folder to be untouched and only left it there for compatibility.
    ```
    C:\>cd "Documents and Settings"
    C:\Documents and Settings>dir /a
    ```
    doesn't give any results as well, while it does for `C:\Users` (a target of that junction).
    
    I digged it a bit. It's again a permission issue. Windows has different access control lists for the junction and for it's target. `C:\>icacls "Documents and Settings"` gives a clue: `All:(DENY)(S,RD)` which means no one can read the directory contents (`deny` overrides `allow` here). You can replicate that with any other junction: `icacls "myjunction" /deny All:(RD)`. When I allowed the Read-Data, both `dir` and Red's `ls` started working fine.
    
    So. Not a bug :)
    I'd just rename this issue to a reminder that we need a way to query file info.
    
    P.S. `All` is for english locales, your copy may use a different name for this ACL.
    

--------------------------------------------------------------------------------

On 2018-06-14T17:05:19Z, greggirwin, commented:
<https://github.com/red/red/issues/1924#issuecomment-397368324>

    This is great info to in in a file! wiki page.

--------------------------------------------------------------------------------

On 2018-06-14T21:04:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/1924#issuecomment-397437732>

    @greggirwin ok, added to https://github.com/red/red/wiki/File-Dir-Path-related-functions

--------------------------------------------------------------------------------

On 2018-06-15T01:15:40Z, greggirwin, commented:
<https://github.com/red/red/issues/1924#issuecomment-397484617>

    Excellent. Thanks!

--------------------------------------------------------------------------------

On 2018-06-17T13:01:53Z, endo64, commented:
<https://github.com/red/red/issues/1924#issuecomment-397877572>

    @hiiamboris Great work!
    For the [Call part](https://github.com/red/red/wiki/File-Dir-Path-related-functions#call) you can add a link to [Reference Call](https://github.com/red/red/wiki/Reference-Call) wiki page, it is a bit old but I'll update it soon.

--------------------------------------------------------------------------------

On 2018-12-23T21:45:02Z, endo64, commented:
<https://github.com/red/red/issues/1924#issuecomment-449665056>

    @greggirwin @hiiamboris As this is not a bug and the explanation was put on the [wiki](https://github.com/red/red/wiki/%5BDOC%5D-File-Dir-Path-related-functions) I think we are good to close this issue.

