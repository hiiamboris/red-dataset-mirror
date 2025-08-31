
#3802: McAffee Security Endpoint deletes Red console as trojan
================================================================================
Issue is closed, was reported by mydoghasworms and has 8 comment(s).
[type.AV]
<https://github.com/red/red/issues/3802>

**Describe the bug**
Red GUI Console is identified by McAffee Endpoint Security provider as a Trojan and deletes it.

From the log:

```
[redacted] ran R:\USERS\[redacted]\DOWNLOADS\red-04mar19-53b5b37b.exe, which attempted to access C:\ProgramData\Red\gui-console-2019-3-4-76181.exe. The Trojan named GenericRXGX-HD!B469AA210B2C was detected and deleted.
```

**To reproduce**
Steps to reproduce the behavior:
1. Download and execute latest Red Windows release or daily build.
2. Execute downloaded file
3. Check errors in Windows Event Viewer / Application Log

**Expected behavior**
Console should launch

**Screenshots**
![screenshot](https://user-images.githubusercontent.com/514461/53784936-76bacb00-3f1f-11e9-86ee-6658ca555454.png)

**Platform version (please complete the following information)**
```
Windows 10 Enterprise running McAffee Endpoint Security 10.5.4
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-05T08:57:33Z, 9214, commented:
<https://github.com/red/red/issues/3802#issuecomment-469595947>

    @mydoghasworms thanks for the heads-up; don't forget to report it as a false-positive to McAfee.
    
    @greggirwin :point_up: could you label this as `type.AV`?

--------------------------------------------------------------------------------

On 2019-03-05T11:17:41Z, rebolek, commented:
<https://github.com/red/red/issues/3802#issuecomment-469642629>

    @mydoghasworms can you please check `gui-console.exe` (19-03-05 or newer) from https://www.rebolek.com/builds/ ? Latest version should be compressed with `upx` that should theoretically work as workaround for AV problems.

--------------------------------------------------------------------------------

On 2019-03-05T19:39:06Z, greggirwin, commented:
<https://github.com/red/red/issues/3802#issuecomment-469828777>

    @9214 done.

--------------------------------------------------------------------------------

On 2019-08-14T15:45:20Z, dockimbel, commented:
<https://github.com/red/red/issues/3802#issuecomment-521302496>

    Closing this ticket. Feel free to ask for reopening if the same AV makes trouble again.

