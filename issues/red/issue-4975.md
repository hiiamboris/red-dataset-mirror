
#4975: Error compiling Console on Win10 x64
================================================================================
Issue is closed, was reported by Alexey-T and has 10 comment(s).
[status.resolved]
<https://github.com/red/red/issues/4975>

Win10 x64.
I got red-30sep21-cdf3b1329.exe . copied it to c:\Red\red.exe. and I run it. it gives error:
```
Microsoft Windows [Version 10.0.19043.1165]
(c) Microsoft Corporation. All rights reserved.

C:\Red>red
Compiling compression library...
Compiling Red GUI console...
*** Driver Internal Error: Script Error : select expected series argument of type: series object port
*** Where: none
*** Near:  [select res [1 "Could not open the file."
2 "Could not map the file."
3 "Could not map a view of the file."
4 "Could not convert the file name to Unicode."
]]

```


Comments:
--------------------------------------------------------------------------------

On 2021-09-30T22:34:50Z, Alexey-T, commented:
<https://github.com/red/red/issues/4975#issuecomment-931750311>

    The red-064.exe installed OK.

--------------------------------------------------------------------------------

On 2021-09-30T22:50:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/4975#issuecomment-931756145>

    Did it create the `gui-console-2021-....exe` in `%SystemDrive%\ProgramData\Red`?

--------------------------------------------------------------------------------

On 2021-09-30T22:54:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/4975#issuecomment-931757864>

    Try disabling the AV if you have one. Those often cause weird troubles.

--------------------------------------------------------------------------------

On 2021-10-01T00:45:14Z, qtxie, commented:
<https://github.com/red/red/issues/4975#issuecomment-931805435>

    Most probably the AV blocks it.

--------------------------------------------------------------------------------

On 2021-10-01T09:19:40Z, Alexey-T, commented:
<https://github.com/red/red/issues/4975#issuecomment-932065192>

    Disabled the Avast... solved

