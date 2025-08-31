
#3263: Windows Defender reports gui-console.exe as Trojan
================================================================================
Issue is closed, was reported by BeardPower and has 28 comment(s).
[type.AV]
<https://github.com/red/red/issues/3263>

### Expected behavior
Threat-free executable.
### Actual behavior
Windows Defender reports `gui-console.exe` as `Trojan:Win32/Dorv.D!rfn`.
### Steps to reproduce the problem
Checkout any branch of RED.
Fire up REBOL/View.
Compile the gui-console with: `do/args %red.r "-r -t Windows %environment/console/gui-console.red"`

Windows defender will report the threat.
### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 15-Mar-2018/13:22:46+01:00

Microsoft Windows [Version 10.0.16299.309]



Comments:
--------------------------------------------------------------------------------

On 2018-03-15T13:47:52Z, dockimbel, commented:
<https://github.com/red/red/issues/3263#issuecomment-373381182>

    Could you please fill a false positive report there? https://www.microsoft.com/en-us/wdsi/filesubmission
    
    They require some extra infor, like the Defender definitions version number.

--------------------------------------------------------------------------------

On 2018-03-15T14:50:18Z, DideC, commented:
<https://github.com/red/red/issues/3263#issuecomment-373402563>

    It will probably be hard to keep it not tagged as "threat" as Red is a moving target : it evolves regularly for those who download frequently.
    
    Just tried the last one and I also get the Windows Defender alert.
    Restoring the quarantine program works.
    
    My submission https://www.microsoft.com/en-us/wdsi/submission/5c7a1950-26a0-4223-a263-9eef9dcf7d9b

--------------------------------------------------------------------------------

On 2018-03-15T18:00:00Z, greggirwin, commented:
<https://github.com/red/red/issues/3263#issuecomment-373469122>

    @dockimbel, should we add an AV label for issues?

--------------------------------------------------------------------------------

On 2018-03-16T01:15:11Z, BeardPower, commented:
<https://github.com/red/red/issues/3263#issuecomment-373572569>

    @dockimbel Sure, sending is done.

--------------------------------------------------------------------------------

On 2018-03-16T09:40:28Z, 9214, commented:
<https://github.com/red/red/issues/3263#issuecomment-373656784>

    @greggirwin speaking of AV label, I already have most of the false-positive-related tickets collected.

--------------------------------------------------------------------------------

On 2018-03-16T12:37:31Z, greggirwin, commented:
<https://github.com/red/red/issues/3263#issuecomment-373700622>

    Excellent @9214!

--------------------------------------------------------------------------------

On 2018-03-17T09:19:54Z, dockimbel, commented:
<https://github.com/red/red/issues/3263#issuecomment-373906355>

    @greggirwin If you think it would help, we could have a `type.AV` one.

--------------------------------------------------------------------------------

On 2018-03-20T21:22:39Z, greggirwin, commented:
<https://github.com/red/red/issues/3263#issuecomment-374761415>

    I do think `type.AV` would be useful. As long as it's not confused with Audio-Visual. I see this ticket at `status.AV` now, which works for me.

--------------------------------------------------------------------------------

On 2018-03-22T17:04:49Z, greggirwin, commented:
<https://github.com/red/red/issues/3263#issuecomment-375382645>

    Interestingly, Security Essentials (Win7) just asked me today to send the console binary I had just built for analysis. 

--------------------------------------------------------------------------------

On 2018-03-22T17:10:40Z, 9214, commented:
<https://github.com/red/red/issues/3263#issuecomment-375384733>

    @greggirwin I think vendors share their signature DBs somehow.

--------------------------------------------------------------------------------

On 2018-03-23T13:38:55Z, DideC, commented:
<https://github.com/red/red/issues/3263#issuecomment-375667527>

    Security Essentials (Win7 and earlier) = Windows defender (Win10)
    So same vendor: M$
    ;-)

--------------------------------------------------------------------------------

On 2018-03-28T01:16:12Z, RnBrgn, commented:
<https://github.com/red/red/issues/3263#issuecomment-376727315>

    Same result with today's Red build on Windows 10 defender.
    
    ![image](https://user-images.githubusercontent.com/16709809/38003116-0d542a54-3204-11e8-86ca-9e2aecb77c3e.png)
    
    
    Submitted to Microsoft.
    
    gui-console-2018-3-26-44229.exe
    
    Submission ID: 3c92f332-7f50-46b1-ace1-4f4fa2877222
    
    Status: Submitted
    
    Submitted by: 
    
    Submitted: Mar 27, 2018 10:09:57 PM
    
    Analyst comments:
    
    No analyst comment provided. 

--------------------------------------------------------------------------------

On 2020-03-21T15:40:25Z, 9214, commented:
<https://github.com/red/red/issues/3263#issuecomment-602061941>

    There are a couple of tickets **†‡** tagged with [`type.AV`](https://github.com/red/red/issues?q=is%3Aissue+label%3Atype.AV) on the issue tracker, and some of them (including this one) are still opened.
    
    As of today, nightly build of the Red toolchain and GUI/CLI consoles compiled from sources (master branch) have the following VirusTotal scores:
    
    | Binary | Score |
    |:-|:-|
    | [Toolchain](https://www.virustotal.com/gui/file/e68cb9bd131bda6a53bda1e25227bd899a14983302611434c7d4e8e2de0875b5/detection) | 0/72 |
    | [GUI console](https://www.virustotal.com/gui/file/6c917eac7bcacd1e47214d1a724c386055053b33a577ec47d4fb1dbe3314c022/detection) | 13/72 |
    | [GUI console uncompressed](https://www.virustotal.com/gui/file/58096f9c7874c9d369f57696e2cfdc7bd3f1817961aed258fc6eca5a42f22996/detection) | 17/72 |
    | [CLI console](https://www.virustotal.com/gui/file/621ecf4ff0cab28f011397e9fd7724c24515e5d46c412ca07fefb19077eca5af/detection) | 13/72 |
    | [CLI console uncompressed](https://www.virustotal.com/gui/file/d80a02d09c5f487b735db7454ad25499397df206c98cb6416653a139843880fd/detection) | 8/72 |
    
    I hazard a guess that triggered scanners check only:
    
    * Signatures (Rebol Technologies vs. Red Foundation);
    * PE layout and perhaps DATA section entropy.
    
    I leave it to others to decide if such metrics are reliable and if these scanners can be trusted (note that with consoles compilation sources are the same, but compression makes score go either up or down).
    
    False-positives are rather generic and keep resurfacing from time to time, always without even a slightest indication of what we did (or did not) to cause them. Our hands are tied without any form of feedback from AV vendors/scanners, and there's little we can do except for shooting in the dark and hoping for the best.
    
    We have a dedicated [wiki page](https://github.com/red/red/wiki/%5BNOTE%5D-Anti-virus-false-positives) that describes the problem in a more detail and points out solutions that proved to be effective, ready to be used by anyone concerned.
    
    So, I propose we close the pending tickets **†** and refer people to that page (and this message) in the future.
    
    I also propose we keep collecting false-positive reports as data points, to harness stats and draw some sort of a timeline (e.g. to proove that there's zero correlation between false-positives alarms and changes in the codebase, and that the majority of them are caused by poor AV heuristics) — but since there's no one-size-fit-them-all solution to such issues, they should be closed with a reference to the above-mentioned wiki page.
    
    ---
    
    **†** #3584 #3263 #3260 #2968 #2903 #2399
    **‡** #3802 #3347 #3294 #3255 #3137 #3026 #2317 #2020 #1841 #500

--------------------------------------------------------------------------------

On 2020-03-22T22:19:45Z, greggirwin, commented:
<https://github.com/red/red/issues/3263#issuecomment-602285478>

    † Done.

