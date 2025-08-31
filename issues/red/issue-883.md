
#883: Access error when writing APK
================================================================================
Issue is closed, was reported by WiseGenius and has 14 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/883>

The Android branch seems to be trying to make an .APK when I Rebol:

`do/args %red.r "-t Android %bridges/android/samples/eval/eval.red"`

But, it complains:

```
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.4.2 ===-

Compiling /H/red-android/bridges/android/samples/eval/eval.red ...
...compilation time : 250 ms

Compiling to native code...
Script: "Red/System ELF format emitter" (none)
...compilation time : 11437 ms
...linking time     : 125 ms
...output file size : 514224 bytes
...output file      : H:\red-android\eval.so
...creating new keystore
...generating apk
...signing apk
...aligning apk
*** Driver Internal Error: Access Error : Cannot open /H/Documents and Settings/All Users/Red/builds/eval.apk
*** Where: copy-file
*** Near:  [write/binary dst read/binary src]
```

However, by then it has already successfully written and downloaded other necessary folders and files to that same location.

I'm using Windows XP Professional SP3, and H is my main drive, not C.

Sorry in advance if I'm using this incorrectly.



Comments:
--------------------------------------------------------------------------------

On 2014-07-13T05:45:03Z, WiseGenius, commented:
<https://github.com/red/red/issues/883#issuecomment-48832564>

    Also, if I try to run `bridges/android/build.r` from either the Android or the master branch (choosing `ARM (default)`), it writes and downloads folders and files, and says `...all done!` without any errors, but there's no `eval.apk` file to be found anywhere.

--------------------------------------------------------------------------------

On 2014-07-14T10:51:02Z, dockimbel, commented:
<https://github.com/red/red/issues/883#issuecomment-48886848>

    The Android port is a work in progress, it is not ready for prime time yet. There are some dependencies to meet in order to make it work right now. One of then is to have a installed JDK 1.6+.
    
    In order to debug the building process, you need to edit the `system/formats/APK.r` file and set on line 11 the `verbose` word to `yes`. The most likely cause of your issue is a missing or invalid JDK version. Though, I have changed some of the toolchain binaries we still rely on to be more compatible with Java 1.6, so you might want to force the re-download of those tools by deleting your `ProgramData\Red\builds\` folder.

--------------------------------------------------------------------------------

On 2014-07-15T01:27:05Z, WiseGenius, commented:
<https://github.com/red/red/issues/883#issuecomment-48980624>

    Thanks. Still no luck though. I'm using JDK 7. Is that too recent? I was also wondering if perhaps the spaces in `Documents and Settings` and `All Users` were delimiting the path into more than one parameter?
    
    This is my output:
    
    ```
    Script: "Red command-line front-end" (none)
    Script: "Encap virtual filesystem" (21-Sep-2009)
    
    -=== Red Compiler 0.4.2 ===-
    
    Compiling /H/red-android/bridges/android/samples/eval/eval.red ...
    ...compilation time : 250 ms
    
    Compiling to native code...
    Script: "Red/System ELF format emitter" (none)
    ...compilation time : 11813 ms
    ...linking time     : 141 ms
    ...output file size : 514224 bytes
    ...output file      : H:\red-android\eval.so
    ...creating building folders
    ...downloading Android binary tools
        jli.dll...connecting to: static.red-lang.org
    done
        aapt.exe...connecting to: static.red-lang.org
    done
        keytool.exe...connecting to: static.red-lang.org
    done
        zipalign.exe...connecting to: static.red-lang.org
    done
        android.jar(18MB)...connecting to: static.red-lang.org
    done
    Invalid number of parameters
    Invalid number of parameters
    Invalid number of parameters
    Invalid number of parameters
    ...creating new keystore
    Registry key 'Software\JavaSoft\Java Runtime Environment\CurrentVersion'
    has value '1.7', but '1.6' is required.
    Error: could not find java.dll
    Error: could not find Java SE Runtime Environment.
    ...generating apk
    ERROR: input directory 'and' does not exist
    ...signing apk
    Only one alias can be specified
    
    Please type jarsigner -help for usage
    ...aligning apk
    Zip alignment utility
    Copyright (C) 2009 The Android Open Source Project
    
    Usage: zipalign [-f] [-v] <align> infile.zip outfile.zip
           zipalign -c [-v] <align> infile.zip
    
      <align>: alignment in bytes, e.g. '4' provides 32-bit alignment
      -c: check alignment only (does not modify file)
      -f: overwrite existing outfile.zip
      -v: verbose output
    *** Driver Internal Error: Access Error : Cannot open /H/Documents and Settings/All Users/Red/builds/eval.apk
    *** Where: copy-file
    *** Near:  [write/binary dst read/binary src]
    ```
    
    A second machine is giving me the same.

--------------------------------------------------------------------------------

On 2014-07-15T02:14:16Z, qtxie, commented:
<https://github.com/red/red/issues/883#issuecomment-48983019>

    @WiseGenius I find there are some nasty issues in `build.r`, at least on Windows. (I only test it on Windows). Maybe Doc developed it on Linux. ;-)
    Anyway, as Doc said above, the android branch is even not ready for prime yet. ;-)

--------------------------------------------------------------------------------

On 2014-07-15T02:17:22Z, WiseGenius, commented:
<https://github.com/red/red/issues/883#issuecomment-48983167>

    Sorry, that last output was from:
    
    `do/args %red.r "-t Android %bridges/android/samples/eval/eval.red"`
    
    ...in the Android branch.
    
    In both branches, `bridges/android/build.r` still gives the same output as before with no `eval.apk` file.
    
    ```
    Creating building folders...
    Downloading Android binary tools...
        jli.dll...done
        aapt.exe...done
        keytool.exe...done
        zipalign.exe...done
        android.jar(18MB)...done
    
    Choose CPU target (ENTER = default):
    1) ARM (default)
    2) x86
    3) both
    => 1
    
    -=== Red Compiler 0.4.2 ===-
    
    Compiling /H/red-android/bridges/android/samples/eval/eval.red ...
    ...compilation time : 250 ms
    
    Compiling to native code...
    ...compilation time : 11750 ms
    ...linking time     : 141 ms
    ...output file size : 514224 bytes
    ...output file      : H:\red-android\bridges\android\builds\eval\lib\armeabi\libRed.so
    Creating new keystore...
    Generating apk...
    Signing apk...
    Aligning apk...
    ...all done!
    ```

--------------------------------------------------------------------------------

On 2014-07-15T04:29:40Z, dockimbel, commented:
<https://github.com/red/red/issues/883#issuecomment-48989422>

    Do not use the `%build.r` script anymore, it is deprecated, use `-t Android` for invoking the APK packager.
    
    It seems that there are some issues with the whitespaces in paths, I will give it a look today.

--------------------------------------------------------------------------------

On 2014-07-15T08:30:22Z, dockimbel, commented:
<https://github.com/red/red/issues/883#issuecomment-49004075>

    I have fixed the whitespace issue in file paths. For the JDK version mismatch, you need to download manually the 1.7 versions of the files we rely on for the toolchain. Here are the direct links for Windows platform: [jli17.dll](http://static.red-lang.org/droid-tools/win/jli17.dll), [keytool17.exe](http://static.red-lang.org/droid-tools/win/keytool17.exe). Once downloaded, you need to remove the "17" part in their name and manually replace them in the `%ALLUSERSPROFILE%/Red/builds/tools/` folder. That should fix the JDK mismatched version.

