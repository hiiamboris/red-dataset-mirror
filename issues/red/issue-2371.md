
#2371: WISH: compiler should check date of libRedRT.dll file before deciding to use it
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2371>

(Working under W10) I understand that the compiler stores `libRedRT.dll` in the folder specified for the executable and only does a re-compilation of `libRedRT` if the `.dll` is absent from that folder. However, when in the meantime a new version of `red.exe` has been downloaded and installed, incompatibilities may result.
As of now, the onus is on the user to delete `libRedRT.dll` or to force re-compilation after an update of `red.exe`.


Comments:
--------------------------------------------------------------------------------

On 2017-02-17T16:23:51Z, ghost, commented:
<https://github.com/red/red/issues/2371#issuecomment-280695940>

    @dockimbel 
    Currently libRedRT.dll is stored in the same directory as the script that has to be compiled. So that means that if I have some other code in the some other directory, then the first compile will take long time since it is recompiling libredrt.dll, also there will be a libredrt.dll in every folder in which there are Red scripts.
      
    Wouldn't it be better to compile libRedRT.dll in the first run and store it in `C:\ProgramData\Red` and then link to it regardless of whichever directory the code is placed in (just like crush.dll is stored there). 
      
    If some code contains R/S code and libRedRT.dll needs recompilation, then it should be placed in the local directory of the code, else for pure Red code, IMHO it should be placed in `C:\ProgramData\Red`. Because libredrt is only meant for allowing quick development and is not intended to be used for release mode, hence I think this approach could work better.
    
    The compiler can check the date of libredrt.dll to link against the appropriate version as described by @meijeru , i.e. just like the GUI-console, CLI-console and crush.dll are named (for eg. gui-console-2017-2-17-60556.exe)
    
    If you agree, then I hope you process this wish ASAP, because I generally have small scripts scattered all around my HDD and having a libRedRT.dll everywhere doesn't feel good.

--------------------------------------------------------------------------------

On 2019-09-11T16:09:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2371#issuecomment-530451303>

    @ghost You should not hijack a ticket to ask for features that are not directly related to the purpose of the ticket. About your wish, that's not compatible with the way libRedRT is used currently. Custom versions of libRedRT can be built using `-u` option (as explained in the 0.6.2 release article), so libRedRT becomes then project-specific. Moreover, you only need to have libRedRT files in the same folder where your executable(s) is(are), so not necessarily where the source code is. Last, you can copy libRedRT files around, you don't need to compile a new one each time.
    
    We can see in the future if we can have a centralized libRedRT along with custom per-project versions. Though this is low-priority compared to the heavy tasks left for the 1.0, so probably post-1.0.

