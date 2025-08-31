
#2915: why does red on windows extract same files to 2 directories?
================================================================================
Issue is closed, was reported by retsyo and has 34 comment(s).
<https://github.com/red/red/issues/2915>

I am using red 0.63 under win7 64 bits

3 same files are placed in both `C:\ProgramData\Red\` and `C:\Users\All Users\Red\`. Is it necessary?

```bash

2017/07/22  22:23    <DIR>          .
2017/07/22  22:23    <DIR>          ..
2017/07/22  22:30               189 console-cfg.red
2017/07/22  22:20            30,720 crush-2017-7-17-55847.dll
2017/07/22  22:22         1,012,736 gui-console-2017-7-17-55847.exe
               3 File(s)      1,043,645 bytes
               2 Dir(s)     798,715,904 bytes free
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-22T17:38:09Z, dockimbel, commented:
<https://github.com/red/red/issues/2915#issuecomment-317198744>

    Did you run Red from the downloaded binary only, or also from sources, using a Rebol interpreter?
    
    BTW, those files are compiled (for the `.dll` and `.exe`) or generated, not extracted.

--------------------------------------------------------------------------------

On 2017-07-23T05:30:51Z, alhabshi3k, commented:
<https://github.com/red/red/issues/2915#issuecomment-317230343>

    @retsyo : if You delete these complied files from one of the folders , it will be deleted from the other automatically.  in other word, what you missed is, the "C:\Users\All Users" is a Short Cut to C:\ProgramData.
    
    and as @dockimbel mentioned , they are generated and compiled to match your operating system specification. They present the console.
    
    Although, I prefer that they are generated within the same folder of Red.exe and for two reasons:
    
    - To maintain high level of portability , consider running RED.exe from a USB storage. every time you run it on a different computer , it will generate these files, though  the other computer are running Windows.
    
    - To keep the computer system clean of temporary files and user specific configurations. from My experiences with many software, majority of them place Temporary, cache, Log and specific user configuration/setting  files. This is normal with me; but when it comes to the amount of storage they consume, and that after investigating , these software just put some garbage that consume storage and processing, just try to delete 2000 files/folders see how long the OS figure out to delete them.
    In addition, such software they do not provide an option to clean such. You have to use a third party software such cCleaner.
    

--------------------------------------------------------------------------------

On 2017-07-26T06:01:34Z, retsyo, commented:
<https://github.com/red/red/issues/2915#issuecomment-317956340>

    I run Red from the downloaded binary only. 
    
    I found that the `C:\Users\All Users` is a Short Cut to `C:\ProgramData` as alhabshi3k said

--------------------------------------------------------------------------------

On 2017-07-28T13:25:35Z, retsyo, commented:
<https://github.com/red/red/issues/2915#issuecomment-318651091>

    avira says `TR/Crypt.XPACK.Gen2` is found in `d:\ProgramData\Red\crush-2017-7-28-53993.dll`. The description is 
    ```
    The term 'TR' denotes a trojan horse that is able to spy out data, violate your privacy, or perform unwanted modifications to the system.
    
    A generic detection routine designed to detect common family characteristics shared in several variants. This special detection routine was developed in order to detect unknown variants and will be enhanced continuously.
    ```
    
    please note `violate your privacy, or perform unwanted modifications to the system` statement
    
    so what if the compiled files are not placed under `d:\ProgramData\Red` but under the directoy where red*.exe lives?
    

--------------------------------------------------------------------------------

On 2017-07-28T14:43:35Z, alhabshi3k, commented:
<https://github.com/red/red/issues/2915#issuecomment-318670732>

    I have done quick experiment  and these are the outcomes:
    
    - The DLL "crush-2017-7-28-53993.dll" is a compressor and decompressor for the RED runtime. i think it is the simple type that it is similar to one used by malware. 
    
    - You can delete the file, However the "red.exe" executable file will generate it again.
    
    - On the side of the story, you can :
       1. copy the GUI-Console-2017-7-28-53993.exe to red.exe location,
       2. CLI-Console-2017-7-28-53993.exe  ( if you tried the CLI ) to red.exe location,
       3. delete the crush-2017-7-28-53993.dll.
       4. delete or rename Red.exe to something else .
    --- 
      
       * Running any of GUI-Console-2017-7-28-53993.exe or CLI-Console-2017-7-28-53993.exe **will run the RED language console**. 
       * Even you can drag or drop a red script on each of the above it will **run** normally .
       * This mean each of GUI and CLI console already contain the Red language.
       - The Only remaining file in the d:\ProgramData\Red is console-cfg.red.
       - i havn't tried to compile a red script in command line (shell)  using GUI and CLI console.
    
    @dockimbel , any comments and clarification ?

--------------------------------------------------------------------------------

On 2017-07-28T15:16:16Z, retsyo, commented:
<https://github.com/red/red/issues/2915#issuecomment-318680421>

    :(
    `GUI-Console-2017-7-28-53993.exe` containing the pattern of ` TR/Crypt.XPACK.Gen2` was blocked 

--------------------------------------------------------------------------------

On 2017-07-28T16:07:10Z, alhabshi3k, commented:
<https://github.com/red/red/issues/2915#issuecomment-318694933>

    Although , i trust Red language with its contains, However it not only avira report it contain pattern of malware.
    
    This topic should be followed with the anti-virus and security expert teams. 
    
    Meanwhile , contacting the support of the Avira is more like talking to dead people. i don't know if they wake up if some one talks about money matter and lost of investment in commercial court.
    
    For the moment , let us consider https://www.virustotal.com/ as measurement of respectful anti-virus and as malicious signature that are tagged with Red. 

--------------------------------------------------------------------------------

On 2019-10-07T15:24:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/2915#issuecomment-539066710>

    Should we close this issue maybe? It has served it's purpose IMO.

--------------------------------------------------------------------------------

On 2019-10-07T17:04:20Z, alhabshi3k, commented:
<https://github.com/red/red/issues/2915#issuecomment-539109935>

    Considering the issue old from 2017, better to close it. 
    
    If a similar question come-up, it can be addressed as a new issue.  
    
    In regards, the case of being a malware, Red (version 0.6.4) is cleared from all of the 69 antivirus software used in  [ https://www.virustotal.com/ ](https://www.virustotal.com/gui/file/45eb8d089b6e25701e4208ac5d1db0c483752e0abff28f58baff5a39f765db9c/detection). 
    
    I can say congratulations, let us promote Red and start distributing some software coded by it, for serious development and for fun.

--------------------------------------------------------------------------------

On 2019-10-07T17:57:44Z, greggirwin, commented:
<https://github.com/red/red/issues/2915#issuecomment-539131406>

    Agreed. Fingers crossed that the AV issues don't come back. 

--------------------------------------------------------------------------------

On 2019-10-18T02:55:46Z, retsyo, commented:
<https://github.com/red/red/issues/2915#issuecomment-543465696>

    so can anyone supply a latest red.exe for testing against AV?

--------------------------------------------------------------------------------

On 2019-10-18T09:10:25Z, endo64, commented:
<https://github.com/red/red/issues/2915#issuecomment-543619051>

    `red.exe` toolchain latest build `2019-10-18 09:01:45 UTC`: https://www.virustotal.com/gui/file/243b7eb3105d6284480b5da99b5b2b3a186a49e759c799c8151a73c05cf9cc5c/detection
    0 / 67
    
    A test file compiled with Red: https://www.virustotal.com/gui/file/7e99ab54db16bcc97e9e62d584c235edb8c11aeacc66ed83f2d3286a9c054795/detection 
    8 / 68

--------------------------------------------------------------------------------

On 2019-10-19T11:05:09Z, retsyo, commented:
<https://github.com/red/red/issues/2915#issuecomment-544129384>

    sorry, I mean is there a site where we can download a nightly build red.exe ?

--------------------------------------------------------------------------------

On 2019-10-19T11:06:19Z, retsyo, commented:
<https://github.com/red/red/issues/2915#issuecomment-544129530>

    btw I am using free Avira which seems to be not in the above AV engine

--------------------------------------------------------------------------------

On 2019-10-20T11:14:31Z, endo64, commented:
<https://github.com/red/red/issues/2915#issuecomment-544242798>

    Here you can find autobuilds: https://rebolek.com/builds/

--------------------------------------------------------------------------------

On 2019-10-20T18:37:11Z, greggirwin, commented:
<https://github.com/red/red/issues/2915#issuecomment-544279409>

    https://www.red-lang.org/p/download.html also has the nightly bulds, but not historical ones.

--------------------------------------------------------------------------------

On 2019-10-21T03:29:46Z, retsyo, commented:
<https://github.com/red/red/issues/2915#issuecomment-544334946>

    1. `_red-latest.exe demo.red` can run without problem. In other word, AVIRA does not complain for virus
    
    2. `R:\>_red-latest.exe -c -o demo.exe demo.red `
    
    -=== Red Compiler 0.6.4 ===-
    
    Compiling R:\demo.red ...
    Compiling libRedRT...
    ...compilation time : 42608 ms
    
    Compiling to native code...
    ...compilation time : 96135 ms
    ...linking time     : 1102 ms
    ...output file size : 1129472 bytes
    ...output file      : R:\libRedRT.dll
    
    ...compilation time : 82 ms
    
    Target: MSDOS
    
    Compiling to native code...
    ...compilation time : 2657 ms
    ...linking time     : 153 ms
    ...output file size : 77824 bytes
    ...output file      : R:\demo.exe
    
    however, avira says `TR/Crypt.XPACK.Gen` in `R:\demo.exe`, so there is no `R:\demo.exe` left
    ```
    2019/10/21  11:18             1,273 demo.red
    2019/10/21  11:21           301,007 libRedRT-defs.r
    2019/10/21  11:22               901 libRedRT-extras.r
    2019/10/21  11:21            61,543 libRedRT-include.red
    2019/10/19  12:27         1,281,550 _red-latest.exe
    ```

