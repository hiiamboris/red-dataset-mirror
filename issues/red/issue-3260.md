
#3260: installation fails due to Windows Defender with AD and System Center Endpoint Protection
================================================================================
Issue is closed, was reported by blackeyes00 and has 0 comment(s).
[type.AV]
<https://github.com/red/red/issues/3260>

### Expected behavior
### Actual behavior
### Steps to reproduce the problem
### Red version and build date, operating system with version.

Here is the report from out enterprise alert....
System Center Endpoint Protection has detected malware on one or more computers in your organization  
Collection name: All Systems

Malware Name: Trojan:Win32/Critet.BS
Number of infections: 14
Last detection time(UTC time): 3/14/2018 3:08:07 PM

These are the infections of this malware:
1. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 3:08:07 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

2. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 3:07:55 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

3. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 3:01:58 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

4. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:58:10 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

5. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:57:05 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: NoAction
Action status: Succeeded 

6. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:56:40 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

7. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:55:06 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

8. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:54:58 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: NoAction
Action status: Succeeded 

9. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:53:04 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

10. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:52:52 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

11. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:51:03 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

12. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:50:55 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

13. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:49:28 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded 

14. Computer name: T52H-E-W-D.ad.nmc.edu
Domain: AD
Detection time(UTC time): 3/14/2018 2:49:22 PM
Malware file path: file:_C:\ProgramData\Red\gui-console-2017-8-3-49893.exe  Remediation action: Remove
Action status: Succeeded
To view further information about malware activity in your organization, run Malware Details Report.  
Note: No additional Malware Detection alerts will be generated for these computers if no new infections are found in the next 2


