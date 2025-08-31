
#2020: Symantec Anti Virus flagging Red as a threat
================================================================================
Issue is closed, was reported by RnBrgn and has 20 comment(s).
[type.AV]
<https://github.com/red/red/issues/2020>

SONAR.Cryptlocker!g31","gui-console-2016-5-13-70418.exe","Restored","c:\programdata\red



Comments:
--------------------------------------------------------------------------------

On 2016-06-14T17:09:18Z, meijeru, commented:
<https://github.com/red/red/issues/2020#issuecomment-225949394>

    I have the same. There seems no other way out but to confirm the safety of the programn manually. It also goes for any program compiled by red.exe.

--------------------------------------------------------------------------------

On 2016-06-14T17:30:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2020#issuecomment-225955444>

    Symantec is really bad at getting accurate heuristics...

--------------------------------------------------------------------------------

On 2016-06-14T17:47:55Z, RnBrgn, commented:
<https://github.com/red/red/issues/2020#issuecomment-225960532>

    It's not causing any issues. I just exclude the threat the first time and it works fine after.
    You just have to do it for every build because  the date is included  in the executable name so it's always changing. red-15jun16-8eb23a2.exe

--------------------------------------------------------------------------------

On 2016-06-14T18:03:54Z, dockimbel, commented:
<https://github.com/red/red/issues/2020#issuecomment-225965303>

    @RnBrgn If you could submit it as a false positive to Symantec, that would be helpful.

--------------------------------------------------------------------------------

On 2016-06-14T19:06:28Z, RnBrgn, commented:
<https://github.com/red/red/issues/2020#issuecomment-225984373>

    Submitted..
    The tracking number for your submission is: 3962598, please reference this tracking number in any further correspondence on this issue.
    
    ## Your submission:
    
    When did the detection you are reporting occur? = INSTALL
    Which product were you using when you saw this? = SEP12
    Which of the following types of detection are you reporting? = SONAR
    
    Are you the creator or distributor of the software in question? = no
    
    File being uploaded = red_15jun16_8eb23a2.exe
    Download (or blocking) URL = 
    
    Name of the software being detected = Red programming language
    Name of detection given by Symantec product = SONAR.Cryptlockerg31
    File hash or clipboard paste from product = SONAR.Cryptlockerg31gui-console-2016-5-13-70418.exeRestoredc:\programdataed

--------------------------------------------------------------------------------

On 2016-06-15T03:40:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2020#issuecomment-226080369>

    @RnBrgn Thank you! Let us know here the reply of Symantec and if it still scans positive in next Symantec update.

--------------------------------------------------------------------------------

On 2016-06-15T22:28:00Z, RnBrgn, commented:
<https://github.com/red/red/issues/2020#issuecomment-226338841>

    See what happens after the next update(s). 
    
    In relation to submission [3962598].
    Upon further analysis and investigation we have verified your submission and, as such, the detection(s) for the following file(s) will be removed from our products:
    
    Filename: red_15jun16_8eb23a2.exe
    MD5: 8BC4984C749AC97FAFC0C2A7D0EF3B5C
    SHA256: 9FDC543A1A11350E13F9A17C709E26998BF4ADDCDC33A58303AC0D1B735941BF
    
    If detection persists, please contact support:
    Norton: https://support.norton.com/sp/en/us/home/current/info 
    SEP: https://support.symantec.com/en_US/endpoint-protection.54619.html

--------------------------------------------------------------------------------

On 2016-06-16T05:57:37Z, dockimbel, commented:
<https://github.com/red/red/issues/2020#issuecomment-226394933>

    This looks like just finger-printing of that specific file...let's see witht the next updates.

--------------------------------------------------------------------------------

On 2016-06-22T12:15:11Z, RnBrgn, commented:
<https://github.com/red/red/issues/2020#issuecomment-227725080>

    We're still seeing a false positive with Symantec. I reported the false positive a second time, but it looks like we're going to keep getting the same result. Here's the response from the 2nd submission.
    
    In relation to submission [3965043].
    Upon further analysis and investigation we have verified your submission and, as such, the detection(s) for the following file(s) will be removed from our products:
    
    Filename: red_21jun16_fa8a2f9.exe
    MD5: F911E034D59BB6646A64D446557610AB
    SHA256: 2C0E06BE4099C84F3E73704D8386C41B848140F707C1DD516C274FA20D17E95B
    Result: Whitelisting for above file is under process. It may take up to 72 hours to take effect.

--------------------------------------------------------------------------------

On 2016-07-06T17:52:31Z, RnBrgn, commented:
<https://github.com/red/red/issues/2020#issuecomment-230851912>

    Update:
    I'm not seeing the same false positives with Symantec while installing the latest windows binaries.
    It's not flagging  files installed in  c:\programdata\red anymore which is good. Previously it would quarantine those files.
    The only warning from Symantec that I see,  happens when I first click on the installation file to install. red-07jul16-00b9201.exe
    Symantec prompts you ,that it's not a recognized file/app,  then allows you to continue without further issues.

