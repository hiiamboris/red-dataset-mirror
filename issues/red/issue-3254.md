
#3254: Reading a simple text file no longer works
================================================================================
Issue is closed, was reported by StephaneVeneri and has 26 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3254>

### Expected behavior
```
>> read %liste.txt
== {console^/dictionary-tools.red^/dictionary.red^/dictionnaire-fr.txt^/le
```
### Actual behavior
```
>> read %liste.txt
*** Access Error: invalid UTF-8 encoding: #{801D6001}
*** Where: read
*** Stack:  
```

### Steps to reproduce the problem
First create a text file
`ls > liste.txt`
Then read the file content.

### Red version and build date, operating system with version.
Red version: 0.6.3
Build: red-11mar18-ab8f5d55
OS: macOS 10.12.6



Comments:
--------------------------------------------------------------------------------

On 2018-03-12T00:27:02Z, greggirwin, commented:
<https://github.com/red/red/issues/3254#issuecomment-372163460>

    New codecs may come, but right now Red requires that data be valid UTF-8.
    
    Closing this as a known limitation.

--------------------------------------------------------------------------------

On 2018-03-12T01:18:27Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/3254#issuecomment-372168031>

    @greggirwin I don't agree with you, because it's works perfectly with the stable version or with a february version (february 13, 2018) on the same file (a simple list of files contained in a folder). I think there's a link with the last commits.
    So this issue shouldn't be closed.

--------------------------------------------------------------------------------

On 2018-03-12T03:42:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3254#issuecomment-372185939>

    @StephaneVeneri Could you please upload the file (in binary form) here if not too big, or in a gist otherwise?

--------------------------------------------------------------------------------

On 2018-03-12T06:35:09Z, greggirwin, commented:
<https://github.com/red/red/issues/3254#issuecomment-372206531>

    Thanks for clarifying Stephane. It wasn't clear from the ticket that this was a possible regression.

--------------------------------------------------------------------------------

On 2018-03-12T08:13:00Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/3254#issuecomment-372224544>

    Thank you for reconsidering my request and you're right, I wasn't precise enough in my request, I should have said that I was thinking about regression.
    So here's the file:
    [liste.txt.zip](https://github.com/red/red/files/1801854/liste.txt.zip)

--------------------------------------------------------------------------------

On 2018-03-12T08:30:40Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/3254#issuecomment-372228614>

    Other symptom, I create the script :
    ```
    Red []
    print "Hello"
    ```
    
    I save it in a file test.red, I execute :
    ` ./red-latest test.red`
    
    Result :
    ```
    Totoro:Projet stephane$ ./red-latest test.red
    *** Error: cannot access argument file:
    test.red
    --== Red 0.6.3 ==-- 
    Type HELP for starting information. 
    
    >> 
    ```
    
    With old version (February) :
    ```
    Totoro:Projet stephane$ ./console test.red
    Hello
    ```

--------------------------------------------------------------------------------

On 2018-03-12T10:07:25Z, dockimbel, commented:
<https://github.com/red/red/issues/3254#issuecomment-372255916>

    @qtxie I can read the file fine on Windows, looks like a macOS specific issue.
    
    @StephaneVeneri Please don't report a different issue into an opened ticket. Post it first on Gitter, in red/bugs for confirmation, then open a new ticket. Moreover in your command-line, you seem to be testing different executables: red toolchain vs compiled console executable.

--------------------------------------------------------------------------------

On 2018-03-12T13:05:38Z, qtxie, commented:
<https://github.com/red/red/issues/3254#issuecomment-372302542>

    Confirmed. This commit 943ac2ae72f94e6b30b9106a0ab36749394a6c99 causes the regression.

--------------------------------------------------------------------------------

On 2018-03-12T13:12:41Z, dockimbel, commented:
<https://github.com/red/red/issues/3254#issuecomment-372304583>

    @qtxie This change causing it? https://github.com/red/red/commit/943ac2ae72f94e6b30b9106a0ab36749394a6c99#diff-1a565e1052059de6a2b1dbcf552dca73L233

--------------------------------------------------------------------------------

On 2018-03-12T13:23:40Z, qtxie, commented:
<https://github.com/red/red/issues/3254#issuecomment-372307628>

    ```
    timespec!: alias struct! [
    	sec    [integer!] ;Seconds
    	nsec   [integer!] ;Nanoseconds
    ]
    
    stat!: alias struct! [
    	st_dev		[integer!]
    	st_ino		[integer!]
    	st_modelink	[integer!]		;-- st_mode & st_link are both 16bit fields
    	st_uid		[integer!]
    	st_gid		[integer!]
    	st_rdev		[integer!]
    	st_atime	[timespec! value]	;-- struct timespec inlined
    	st_mtime	[timespec! value]	;-- struct timespec inlined
    	st_ctime	[timespec! value]	;-- struct timespec inlined
    	ctv_msec	[integer!]
    	st_size		[integer!]
    	st_blocks	[integer!]
    	st_blksize	[integer!]
    	st_flags	[integer!]
    	st_gen		[integer!]
    	st_lspare	[integer!]
    	st_qspare_1 [integer!]			;-- int64
    	st_qspare_2 [integer!]
    	st_qspare_3 [integer!]			;-- int64
    	st_qspare_4 [integer!]
    ]
    
    stat2!: alias struct! [
    	st_dev		[integer!]
    	st_ino		[integer!]
    	st_modelink	[integer!]		;-- st_mode & st_link are both 16bit fields
    	st_uid		[integer!]
    	st_gid		[integer!]
    	st_rdev		[integer!]
    	atv_sec		[integer!]		;-- struct timespec inlined
    	atv_msec	[integer!]
    	mtv_sec		[integer!]		;-- struct timespec inlined
    	mtv_msec	[integer!]
    	ctv_sec		[integer!]		;-- struct timespec inlined
    	ctv_msec	[integer!]
    	st_size		[integer!]
    	st_blocks	[integer!]
    	st_blksize	[integer!]
    	st_flags	[integer!]
    	st_gen		[integer!]
    	st_lspare	[integer!]
    	st_qspare_1 [integer!]			;-- int64
    	st_qspare_2 [integer!]
    	st_qspare_3 [integer!]			;-- int64
    	st_qspare_4 [integer!]
    ]
    
    probe size? stat!			;-- 92
    probe size? stat2!			;-- 88
    ```
    Inline struct value in struct has some issue.

--------------------------------------------------------------------------------

On 2018-03-12T15:35:25Z, dockimbel, commented:
<https://github.com/red/red/issues/3254#issuecomment-372353126>

    Not the compiler's fault, the structs are not equivalent, I have removed the extra field. Please re-test it on macOS with the fix.

--------------------------------------------------------------------------------

On 2018-03-12T19:18:34Z, greggirwin, commented:
<https://github.com/red/red/issues/3254#issuecomment-372431402>

    Thanks for the follow-up on this Stephane. Good catch!

--------------------------------------------------------------------------------

On 2018-03-12T19:28:55Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/3254#issuecomment-372434428>

    I just finished the tests : the problem is fixed, everything works correctly (even the 2nd symptom) 👍
    Thank you all, I close the issue.

