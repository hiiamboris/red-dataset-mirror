
#5515: Cortex XDR has blocked a malicious activity when trying to run https://static.red-lang.org/dl/auto/win/red-view-23jun24-583744106.exe
================================================================================
Issue is closed, was reported by misha-franz and has 4 comment(s).
[status.duplicate] [type.AV]
<https://github.com/red/red/issues/5515>


![image](https://github.com/red/red/assets/6687525/9fd4c4a6-a951-4fa1-920e-9fd4b5aa07fe)

Application information:
Application name:	Red GUI Console
Application version:	0.0.1.0
Process ID:	11628
Application location:	C:\Users\michaelf\Downloads\red-view-23jun24-583744106.exe
Command line:	"C:\Users\michaelf\Downloads\red-view-23jun24-583744106.exe" 
File origin:	Hard drive on this computer

Prevention information:
Prevention date:	Monday, June 24, 2024
Prevention time:	1:57:36
OS version:	10.0.19045.2.0.0.256.1
Component:	Local Analysis
Status code:	c0400055
Prevention description:	Suspicious executable detected
Additional information 1:	C:\Users\michaelf\Downloads\red-view-23jun24-583744106.exe
Additional information 2:	2788CB065AE120CF05479D4D579697AF4B0014640DC7FC1D9C21D897207BAADE
Additional information 3:	2788CB065AE120CF05479D4D579697AF4B0014640DC7FC1D9C21D897207BAADE
Additional information 4:	1
Additional information 5:	9EFFC16A7F964B9BC4650000040004000E000062000500230140012200061001
Additional information 6:	{"trigger":1,"component":311,"cystatus":32254






Comments:
--------------------------------------------------------------------------------

On 2024-06-24T09:17:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/5515#issuecomment-2186012678>

    See https://github.com/red/red/issues/3263#issuecomment-602061941

--------------------------------------------------------------------------------

On 2024-06-24T10:31:59Z, dockimbel, commented:
<https://github.com/red/red/issues/5515#issuecomment-2186224134>

    Another badly tuned AV software...
    
    You can upload your executable to [VirusTotal](https://www.virustotal.com/gui/home/upload) if you want to cross-check with other AVs.
    
    @misha-franz Could you please report it as false positive to Cortex XDR support?

