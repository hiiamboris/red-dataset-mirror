
#3207: request-file bug in MacOS 10.13.2 and 10.13.3 High Sierra
================================================================================
Issue is closed, was reported by jackseay and has 10 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3207>

### Expected behavior
Return file name
### Actual behavior
This program:
Red [Title: "Simple hello world script" ]
 print "Hello World!"
 print read request-file

returns the following output to the console window (Terminal):

do %hello.r
Hello World!
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Common/ChunkCompression.cpp:50: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/PrivateFrameworks/FinderKit.framework/Resources/Base.lproj/AppCentricFinderView.nib'
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Common/ChunkCompression.cpp:50: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/PrivateFrameworks/FinderKit.framework/Resources/Base.lproj/SidebarView.nib'
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Common/ChunkCompression.cpp:50: Error: unsupported compressor 7
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/PrivateFrameworks/FinderKit.framework/Resources/Base.lproj/ColumnView.nib'
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Common/ChunkCompression.cpp:50: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/PrivateFrameworks/FinderKit.framework/Resources/Base.lproj/ArrangeByMenu.nib'
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Common/ChunkCompression.cpp:50: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/PrivateFrameworks/FinderKit.framework/Resources/Base.lproj/ColumnPreview.nib'
red []
print "hello world"

Using MacOS 10.13.2 the file requester window and terminal window froze and required a force quit with Activity Monitor. After upgrading to 10.13.3, the windows did not freeze, but still output the above to the terminal window.
### Steps to reproduce the problem
See above.
### Red version and build date, operating system with version.
Red for macOS version 0.6.3 built 23-Jan-2018/8:30:33-06:00
MacOS 10.13.2 and 10.13.3



Comments:
--------------------------------------------------------------------------------

On 2018-01-24T04:34:51Z, jackseay, commented:
<https://github.com/red/red/issues/3207#issuecomment-360018225>

    A note on the last 2 lines of output: I selected a different "hello.r" in the file requestor, thus the difference from the program actually ran. I tried editing my first comment, but the edit button didn't work.

--------------------------------------------------------------------------------

On 2018-01-26T06:10:02Z, ralfwenske, commented:
<https://github.com/red/red/issues/3207#issuecomment-360693280>

    Didn't know about above issue - on **Sierra 10.12.6** (16G1114) I explored following (copied from Gitter)
    
    In mac console following works fine:
    ```
    >> print read request-file
    Git commands even a monkey can understand
    >> print read to-file request-file
    Git commands even a monkey can understand
    >> print read to-red-file request-file
    Git commands even a monkey can understand
    >>
    ```
    On mac the following fails
    ```
    Red [needs 'View]
    view [ below
        button "1 to-red-file request-file" [print "btn 1" f: to-red-file request-file]
        button "2 to-file request-file" [print "btn 2" f: to-file request-file]
        button "3 request-file" [print "btn 3" f: request-file]
        button "read & show" [print "read & show" a/text: read f]
        return
        a: area 400x200
    ]
    ```
    result is
    ```
    macmini:red-tests ralfwenske$ ~/Dropbox/os/mac/red --cli /Users/ralfwenske/Dropbox/red-tests/test-requestfile.red
    btn 1
    *** Script Error: to-red-file does not allow function! for its path argument
    *** Where: to-red-file
    *** Stack: view do-events do-actor do-safe to-red-file
    btn 2
    read & show
    *** Access Error: cannot open: %?function?
    *** Where: read
    *** Stack: view do-events do-actor do-safe
    btn 3
    read & show
    *** Script Error: f is missing its face argument
    *** Where: f
    *** Stack: view do-events do-actor do-safe f
    ```
    whereas the same code works as expected on win10:
    ```
    PS C:\Users\Ralf\Dropbox\red-tests> C:/Users/Ralf/Dropbox/os/win/red.exe --cli c:\Use
    rs\Ralf\Dropbox\red-tests\test-requestfile.red
    btn 1
    read & show
    btn 2
    read & show
    btn 3
    read & show
    ```

--------------------------------------------------------------------------------

On 2018-04-14T02:17:54Z, x8x, commented:
<https://github.com/red/red/issues/3207#issuecomment-381296859>

    I'm getting similar stuff when running the wallet:
    ```
    /BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Common/ChunkCompression.cpp:50:Error: unsupported compressor 8
    /BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/Frameworks/AppKit.framework/Resources/Base.lproj/NSTextTouchBarItems.nib'
    ```
    Unfortunately Google is very unfriendly with this.

--------------------------------------------------------------------------------

On 2018-04-14T03:40:03Z, x8x, commented:
<https://github.com/red/red/issues/3207#issuecomment-381300587>

    Best I found "32-bit processes seem to support less filesystem compression methods than 64-bit ones for some reason." but how that error msg relate to Red is a mystery. Anyway, seams like a OS issue on APFS.

--------------------------------------------------------------------------------

On 2018-10-29T13:41:28Z, qtxie, commented:
<https://github.com/red/red/issues/3207#issuecomment-433913791>

    `request-file` may return wrong value in some cases. This issue is fixed in commit c00c57b1fd49848f7afa9edf6d8b5b6f70c14515

