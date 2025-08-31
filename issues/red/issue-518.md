
#518: Double file extensions on dynamic libs
================================================================================
Issue is closed, was reported by PeterWAWood and has 12 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/518>

Encap branch red.r adds the file extension to dynamic libs even when the -o options specifies a full path including the extension.

Example:

```
Schulz:Red peter$ pwd
/Users/peter/VMShare/Languages/Red

Schulz:Red peter$ ls
BSD-3-License.txt   driveRedconsole.rb  run-all.r
BSL-License.txt     precap.r        test
README.md       quick-test      usage.txt
build           red         version.r
console         red-system
docs            red.r

Schulz:Red peter$ rebol -qs red.r -o /Users/peter/VMShare/Languages/Red/mydll.dylib -dlib -t darwin ../../Code/Red-System/test-dll.reds


-=== Red Compiler 0.3.3 ===- 

Compiling /Users/peter/VMShare/Code/Red-System/test-dll.reds ...

Compiling to native code...
...compilation time : 107 ms
...linking time     : 5 ms
...output file size : 16384 bytes
...output file      : /Users/peter/VMShare/Languages/Red/mydll.dylib.dylib

Schulz:Red peter$ ls
BSD-3-License.txt   driveRedconsole.rb  red.r
BSL-License.txt     mydll.dylib.dylib   run-all.r
README.md       precap.r        test
build           quick-test      usage.txt
console         red         version.r
docs            red-system

```



Comments:
--------------------------------------------------------------------------------

On 2013-08-22T17:09:41Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/518#issuecomment-23108193>

    Isn't it for the best that Red adds the extension? Otherwise, in build scripts using -o you're forced to manage extensions yourself.

--------------------------------------------------------------------------------

On 2013-08-22T23:29:42Z, PeterWAWood, commented:
<https://github.com/red/red/issues/518#issuecomment-23133991>

    I believe the correct behaviour is for the compiler to add the file extension if it is not supplied but not to add a second one if it has been supplied. This was the case with rsc.r.
    
    In my case, I am generating the code which calls the dynamic linked library as well as programatically compiling the library so I must manage the extensions myself anyway.

--------------------------------------------------------------------------------

On 2013-08-23T01:23:12Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/518#issuecomment-23137975>

    That would be ideal, yes.

--------------------------------------------------------------------------------

On 2013-08-23T18:13:28Z, earl, commented:
<https://github.com/red/red/issues/518#issuecomment-23181230>

    I'd definitely prefer an option that doesn't at all mess with what I tell it to output.

--------------------------------------------------------------------------------

On 2013-08-23T18:42:03Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/518#issuecomment-23183007>

    Yes, but I also need an option where I don't have to manage the file extensions for multiple platforms that Red is already managing.

--------------------------------------------------------------------------------

On 2013-09-26T16:10:47Z, dockimbel, commented:
<https://github.com/red/red/issues/518#issuecomment-25180803>

    If a filename is provided with the expected extension, it will now pass through. If no extension is provided, one could be added by the linker when it makes sense (for libraries e.g.).

