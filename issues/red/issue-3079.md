
#3079: macOS High Sierra APFS
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
<https://github.com/red/red/issues/3079>

I've just upgraded my macOS to the latest version "macOS High Sierra 10.13". After running my old Red code, I got an issue which has never happened before. I guess it's caused by the new File System "APFS".

```Red
>> do %bcode.red
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.1.1/Common/ChunkCompression.cpp:50: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.1.1/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/Frameworks/AppKit.framework/Resources/Base.lproj/NSTextTouchBarItems.nib'
```



Comments:
--------------------------------------------------------------------------------

On 2017-10-12T07:27:42Z, x8x, commented:
<https://github.com/red/red/issues/3079#issuecomment-336044440>

    @JenniferLee520 Could you please provide some code to reproduce the issue?

--------------------------------------------------------------------------------

On 2017-10-13T07:38:10Z, JenniferLee520, commented:
<https://github.com/red/red/issues/3079#issuecomment-336375220>

    It's not easy to reproduce and locate the bug. close it for now until I have more info.

