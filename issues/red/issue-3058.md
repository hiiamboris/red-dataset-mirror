
#3058: Access violation on recursive function call
================================================================================
Issue is closed, was reported by 9214 and has 24 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3058>

```Red
violate!: does [violate!]
violate!
```
```Red
*** Runtime Error 1: access violation
*** at: 00460102h
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-28T06:16:17Z, 9214, commented:
<https://github.com/red/red/issues/3058#issuecomment-332738462>

    https://github.com/red/red/issues/3052 related?

--------------------------------------------------------------------------------

On 2017-09-30T07:45:34Z, 9214, commented:
<https://github.com/red/red/issues/3058#issuecomment-333291210>

    Also
    ```Red
    Red []
    
    probe reduce load system/options/script
    ```
    ```Red
    *** Runtime Error 1: access violation
    *** at: 0809F19Eh
    ```
    though without `probe` it's an expected stack overflow

--------------------------------------------------------------------------------

On 2017-10-02T08:09:51Z, dockimbel, commented:
<https://github.com/red/red/issues/3058#issuecomment-333467376>

    It's related to the fix for #3052, which was missing something.
    
    I cannot reproduce the second crash you've mentioned.

--------------------------------------------------------------------------------

On 2017-10-02T08:25:17Z, 9214, commented:
<https://github.com/red/red/issues/3058#issuecomment-333470565>

    @dockimbel after your message I've grabbed latest release and re-checked on Win10 box with VSCode plugin:
    ```Red
    Red for Windows version 0.6.3 built 2-Oct-2017/12:24:13+05:00
    ```
    * first
    ```Red
    Red []
    
    violate!: does [violate!]
    violate!
    ```
    ```Red
    *** Runtime Error 1: access violation
    *** at: 00460419h
    ```
    * second
    ```Red
    Red []
    
    probe reduce load system/options/script
    ```
    ```Red
    *** Runtime Error 1: access violation
    *** at: 00460433h
    ```
    * second without `probe`:
    ```Red
    *** Internal Error: stack overflow
    *** Where: do
    *** Stack: load
    ```

--------------------------------------------------------------------------------

On 2017-10-02T12:05:40Z, dockimbel, commented:
<https://github.com/red/red/issues/3058#issuecomment-333514914>

    Are you compiling it or running in the console?

--------------------------------------------------------------------------------

On 2017-10-02T12:10:35Z, 9214, commented:
<https://github.com/red/red/issues/3058#issuecomment-333515889>

    @dockimbel just running interpreter with F6 hotkey, also tried first example directly from REPL - it silently crashed.

--------------------------------------------------------------------------------

On 2017-10-02T12:14:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3058#issuecomment-333516729>

    From console here on Win7:
    ```
    >> violate!: does [violate!]
    == func [][violate!]
    >> violate!
    *** Internal Error: stack overflow
    *** Where: violate!
    *** Stack: violate! violate! violate! violate! violate! violate! violate! violate! violate! ...
    ```

--------------------------------------------------------------------------------

On 2017-10-02T12:19:31Z, 9214, commented:
<https://github.com/red/red/issues/3058#issuecomment-333517685>

    For sanity check I wiped out `/ProgramData/Red/` folder and recompiled toolchain (or should I say console?), the issue is still here.
    
    ![crash](https://user-images.githubusercontent.com/15716466/31077070-89f26902-a796-11e7-90ef-a67fb10ad7ea.gif)

--------------------------------------------------------------------------------

On 2017-10-02T12:49:18Z, dockimbel, commented:
<https://github.com/red/red/issues/3058#issuecomment-333524299>

    Can you check if your local git repo contains the fix for this issue?

--------------------------------------------------------------------------------

On 2017-10-02T14:21:52Z, 9214, commented:
<https://github.com/red/red/issues/3058#issuecomment-333549216>

    Yes, it's even with main repo now.

--------------------------------------------------------------------------------

On 2017-10-02T14:28:04Z, 9214, commented:
<https://github.com/red/red/issues/3058#issuecomment-333551168>

    I'm back home now, updated both my Linux and Win toolchains. GUI Win version still crashes, while Linux (and Win) CLI, well, see for yourself, it's batshit insane :japanese_ogre::
    ```Red
    >> about
    Red for Linux version 0.6.3 built 2-Oct-2017/19:23:06+05:00
    >> v: does [v]
    == func [][v]
    >> v
    *** Internal Error: stack overflow
    *** Where: 
    *** Stack:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    
    >> do [1 + 1]
    *** Script Error: do has no value
    *** Where: catch
    *** Stack:  
    
    >> 1 + 1
    *** Script Error: + has no value
    *** Where: catch
    *** Stack:  
    ```
    Looks like recursive call corrupts memory/stack?

--------------------------------------------------------------------------------

On 2017-10-02T15:36:31Z, dockimbel, commented:
<https://github.com/red/red/issues/3058#issuecomment-333572491>

    Thanks, I'll test it more tomorrow.

