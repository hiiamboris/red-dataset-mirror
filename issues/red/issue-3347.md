
#3347: Infection: Gen:Variant.Razy.304808
================================================================================
Issue is closed, was reported by Phryxe and has 8 comment(s).
[type.AV]
<https://github.com/red/red/issues/3347>

### Expected behavior
No problem running `red-24apr18-208571c5.exe` 
### Actual behavior
```
Product: F-Secure Anti-Virus (OID: 1.3.6.1.4.1.2213.12)
Severity: security alert (5)
Message: Malicious code found in file C:\ProgramData\Red\gui-console-2018-4-24-35021.exe. 
Infection: Gen:Variant.Razy.304808 
Action: The file was deleted.
```
### Steps to reproduce the problem
Run `red-24apr18-208571c5.exe` with F-secure as AV.
### Red and platform version
`red-24apr18-208571c5.exe`
Windows 7 x64


Comments:
--------------------------------------------------------------------------------

On 2018-04-24T13:17:46Z, Phryxe, commented:
<https://github.com/red/red/issues/3347#issuecomment-383926700>

    Submitted `red-24apr18-208571c5.exe` to [F-secure](https://www.f-secure.com/en/web/labs_global/submit-a-sample).

--------------------------------------------------------------------------------

On 2018-04-25T04:39:18Z, Phryxe, commented:
<https://github.com/red/red/issues/3347#issuecomment-384158552>

    Response from F-secure:
    *Thank you for bringing this to our attention. Our analysis indicates that the file you submitted is clean. We have identified the issue as a False Positive, which will be resolved in an upcoming database update.*

--------------------------------------------------------------------------------

On 2018-04-25T06:32:06Z, Phryxe, commented:
<https://github.com/red/red/issues/3347#issuecomment-384175223>

    Still a problem with `red-25apr18-e80f0759.exe`. Not sure how F-secure handles this as it is the compiled exe that is deleted, not the actual file I'm submitting.

--------------------------------------------------------------------------------

On 2018-04-26T11:18:44Z, Phryxe, commented:
<https://github.com/red/red/issues/3347#issuecomment-384603928>

    Finally it is possible to install Red (`red-26apr18-819d684a.exe`) again without F-secure deleting files. 

