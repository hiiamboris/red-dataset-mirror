
#500: Symantec intercepts hello.red when explicitly targeted to Windows
================================================================================
Issue is closed, was reported by memophen and has 12 comment(s).
[status.resolved] [type.AV]
<https://github.com/red/red/issues/500>

When the example script hello.red or a home-brewed script is compiled with option `-t Windows`, the executable is intercepted by Symantec Endpoint Protection (12.1.1101.401), due to the risk "Suspicious.Cloud". This concerns Red v0.3.2, compiled on a Windows Vista platform.

It does not happen when I compile with `-t MSDOS` or with no target option at all. (May I conclude that MSDOS is the default target on a Windows platform?)

For hello.reds and other Red/System programs, I see no difference whether it's compiled with Windows or MSDOS as target: the executables look pretty much the same and Symantec keeps quiet.



Comments:
--------------------------------------------------------------------------------

On 2013-07-31T16:42:14Z, dockimbel, commented:
<https://github.com/red/red/issues/500#issuecomment-21876876>

    Indeed, this is the virustotal [report](https://www.virustotal.com/en/file/fffe502d6ba8a11c2cfe19e89f5fe1925dc4631d8d62e09e0ed05793b84bff91/analysis/1375288855/) for future reference.

--------------------------------------------------------------------------------

On 2013-07-31T16:43:43Z, dockimbel, commented:
<https://github.com/red/red/issues/500#issuecomment-21876996>

    There are a few header entry values that needs to be fixed, we'll see if that makes the binaries pass the AV heuristics, if not, we'll contact each AV vendor for whitelisting them.

--------------------------------------------------------------------------------

On 2013-08-06T17:03:50Z, dockimbel, commented:
<https://github.com/red/red/issues/500#issuecomment-22194404>

    I have submitted false positive reports to a few vendors, waiting for their acknowledgement.

--------------------------------------------------------------------------------

On 2013-09-20T12:03:56Z, dockimbel, commented:
<https://github.com/red/red/issues/500#issuecomment-24805674>

    I have received an answer from Symantec:
    
    ```
    In relation to submission [3278929].
    
    Having reviewed the information provided we are unable to reproduce or confirm the issue
    described.
    
    Please  ensure that you are using Symantec's latest virus definitions for detection. These
    can be found using live update or alternatively via the URL below.
    http://securityresponse.symantec.com/avcenter/defs.download.html
    
    If the issue persists with the latest definitions, please respond to this email providing the
    additional information below in order for us to analyze the problem further:
    
    - Details of the message or a screen shot of the message received
    - Exact step by step instructions on how to recreate issue
    - Details of the Symantec product and version being used 
    - Detection log(s) from the product
    
    If other versions of the file(s) in question have previously triggered false positive
    detections please mention this in your response and include all available file
    versions. 
    
    
    Sincerely,
    Symantec Security Response
    http://securityresponse.symantec.com
    ```
    
    I cannot give them any details about the Symantec product used as Virustotal does not give such information...
    
    A [new test](https://www.virustotal.com/en/file/b804a35a00a9617fded011d67d9b4f2dcf6ec20accfe5fb356e80d0e691696fe/analysis/1379678167/) on VirusTotal shows that other AV vendors have fixed their heuristics, but AntiVir and Symantec have not.

--------------------------------------------------------------------------------

On 2014-04-26T22:42:27Z, dockimbel, commented:
<https://github.com/red/red/issues/500#issuecomment-41483180>

    A new scan on virustotal still [shows](https://www.virustotal.com/en/file/68d7dffbb7e4db89c4140f426d4ebb3d35085c8fe99d8235f268e30a3766c39d/analysis/) the false positive. I have resubmitted a new report to Symantec, hoping that this time they will do something about it.

--------------------------------------------------------------------------------

On 2016-02-06T19:07:02Z, dockimbel, commented:
<https://github.com/red/red/issues/500#issuecomment-180839663>

    Symantec is not reporting any false positive in a [new](https://www.virustotal.com/en/file/3b14d0120116bcb9a5941ed5a9406c1053b39f7c6bbab247038cc0c9e43ff748/analysis/1454785416/) scan, so I'm closing this ticket.

