
#4264: Red after compile incorrectly flagged as virus by Webroot
================================================================================
Issue is closed, was reported by birdybro and has 8 comment(s).
<https://github.com/red/red/issues/4264>

Just a headsup:

Threat List:
GUI-CONSOLE-2018-11-22-8164.EXE, W32.Adware.Gen, %appdata%\red\,   https://snup.webrootcloudav.com/SkyStoreFileUploader/upload.aspx?MD5=0C75F871F6D72A34CAE0FBC6D60C49A8 0C75F871F6D72A34CAE0FBC6D60C49A8,

CRUSH-2018-11-22-8164.DLL, W32.Adware.Gen, %appdata%\red\,   https://snup.webrootcloudav.com/SkyStoreFileUploader/upload.aspx?MD5=56A73C7D82069CD237B334CEEDE6B6A9 56A73C7D82069CD237B334CEEDE6B6A9,

This is a procedural anti-virus, so it will pick up things it hasn't seen before (definitions-based), see what they do, and put them in quarantine and alert the sysadmin that it's a threat if it does stuff it considers threatening.

Not sure if there is any way Red can be redesigned or fixed to address the newer "procedural" anti-viruses that are popping up like Cylance and Webroot.


Comments:
--------------------------------------------------------------------------------

On 2020-01-28T22:53:53Z, greggirwin, commented:
<https://github.com/red/red/issues/4264#issuecomment-579506999>

    Thanks. Assuming we have to remove anything considered threatening, like writing files through OS APIs, that could be tough. i.e., we can't really design around that. If you use them, please let them know about the false positive. That's about all we can do at this point.

--------------------------------------------------------------------------------

On 2020-01-28T22:55:52Z, greggirwin, commented:
<https://github.com/red/red/issues/4264#issuecomment-579508192>

    If either Webroot or Cylance want info, certainly we'll provide all we can to get on their good side.

--------------------------------------------------------------------------------

On 2020-01-29T14:50:40Z, birdybro, commented:
<https://github.com/red/red/issues/4264#issuecomment-579790242>

    Yes, I have informed them, and with Webroot you mostly mark it as a false positive internally in the web management console, they don't usually have a manual false positive report method like others. Their staff reviews ones that are new after many customers mark them as safe, from what I've seen.
    
    This is more of an inquiry, since I'm curious... If Red is considered portable, why does it need to drop an EXE and DLL in %appdata%\red? I don't see similar behavior from other portable versions of software. Or have I misunderstood "portable" in this sense? Or is the philosophy of software portability only being applied to the software developed using Red, and not the compiler itself?
    
    EDIT: I may have answered my own question, looks like the self-compiler is not coded in Red, and that is a goal in the roadmap in the future. Either way love the philosophy behind this language, as a laymen even.

--------------------------------------------------------------------------------

On 2020-01-29T15:41:33Z, 9214, commented:
<https://github.com/red/red/issues/4264#issuecomment-579817957>

    @aberusugi currently, when you launch the toolchain for the first time, two things happen:
    
    1. Compilation of GUI/CLI console (REPL);
    1. Compilation of compression library. 
    
    So, what Red "drops" into `AppData` is driven by necessity: **(1)** by definition is a gateway to Red interpreter, **(2)** is used for packing [RedBin](https://doc.red-lang.org/en/redbin.html) using custom CRUSH algorithm — each compiled binary needs to contain the whole language runtime in order to cope with Red's highly dynamic nature; this compression is what triggers false-positives in AVs with bad heuristics. If you use `--no-compress` with UPX then everything is fine.
    
    > self-compiler is not coded in Red
    
    Both Red → Red/System and Red/System → native compilers are written in Rebol2, which is 90% compatible with Red. This is a consequence of the bootstrapping phase, not related to this issue and your questions at all. Both Red toolchain and binaries compiled with it are stand-alone and portable, I'm not sure what makes you think otherwise.
    
    ---
    
    In the future, please use community chat for such inquiries.

