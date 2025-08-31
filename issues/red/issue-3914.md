
#3914: [MacOS] Hello world fails to cross-compile for Android
================================================================================
Issue is closed, was reported by willsheppard and has 4 comment(s).
<https://github.com/red/red/issues/3914>

A hello world example throws an error on Mac OS when cross-compiling for Android:


I took a hello world example script:

```
 Red [
     Title: "redlang hello world script"
 ]

 print "Hello Red World!"
```

The script works:

```
./red-064 hello.red 
Hello Red World!
```

Tried to compile:

```
./red-064 -t Android hello.red

-=== Red Compiler 0.6.4 ===- 

Compiling /Users/will/temp/red/hello.red ...
...compilation time : 710 ms

Target: Android 

Compiling to native code...
*** Warning: OS_TYPE macro in R/S is redefined
*** Compilation Error: invalid path value: image/extract-data 
*** in file: %/Users/will/temp/red/datatypes/binary.reds 
*** in function: red/binary/to
*** at line: 1 
*** near: [1024x7 
    proto: image/extract-data as red-image! spec EXTRACT_ARGB
]
```

Versions:

```
>> about
Red 0.6.4 for macOS built 22-Nov-2018/1:40:38+01:00 commit #755eb94

Mac OS High Sierra version 10.13.6 (17G65)
```


Comments:
--------------------------------------------------------------------------------

On 2019-06-14T15:28:18Z, 9214, commented:
<https://github.com/red/red/issues/3914#issuecomment-502153526>

    Please consider to do a bit of research prior to opening issues. Android platform support is currently scheduled for 0.7.1 release, as described in [the opened ticket](https://github.com/red/red/issues/3911#issuecomment-499177170) right next to yours.

--------------------------------------------------------------------------------

On 2019-06-14T15:57:05Z, willsheppard, commented:
<https://github.com/red/red/issues/3914#issuecomment-502164248>

    Apologies, and thank you.

