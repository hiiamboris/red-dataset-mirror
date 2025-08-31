
#2906: [Linux][Compiler] Compilation fails with `-no-runtime` flag
================================================================================
Issue is closed, was reported by maximvl and has 16 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2906>

```
> cat hello.red 
Red/System []

a: 1
if a < 2 [ a: 2 ]

> red -c --no-runtime hello.red 

-=== Red Compiler 0.6.3 ===- 

Compiling /home/mvelesyuk/red/hello.red ...

Target: Linux 

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : Cannot use path on none! value 
*** Where: emit-epilog 
*** Near:  [if any [
fspec/5 = 'callback 
all [
attribs: compiler/get-attributes fspec/4 
any [find attribs 'cdecl find attribs 'stdcall]
]
] [
offset: locals-size + locals-offset 
emit #{8DA5} 
emit to-bin32 negate offset + 12 
emit #{5F} 
emit #{5E} 
emit #{5B}
] 
emit
] 

> red -c hello.red        

-=== Red Compiler 0.6.3 ===- 

Compiling /home/mvelesyuk/red/hello.red ...

Target: Linux 

Compiling to native code...
...compilation time : 318 ms
...linking time     : 14 ms
...output file size : 6640 bytes
...output file      : /home/mvelesyuk/red/hello 

```


Comments:
--------------------------------------------------------------------------------

On 2017-07-21T10:36:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2906#issuecomment-316968314>

    `--no-runtime` is for Red/System programs only, it is meant for cases where you can't use the built-in runtime library and want/need to provide a specific one (for example: writing your own OS or for barebone embedded systems).

--------------------------------------------------------------------------------

On 2017-07-21T10:53:38Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2906#issuecomment-316971412>

    The supplied program though named Hello.red was in fact a Red/System program.
    
    Should there be either a special target for such programs (e.g. -t em-i386, -t em-ARMel) or the --no-runtime option require a processor argument (e.g. --no-runtime i386, --no-runtime ARMhf)?
    
    
    

--------------------------------------------------------------------------------

On 2017-07-21T12:22:21Z, ghost, commented:
<https://github.com/red/red/issues/2906#issuecomment-316987081>

    For generating runnable binaries using `--no-runtime` see https://github.com/red/red/issues/1772#issuecomment-217625876

--------------------------------------------------------------------------------

On 2017-07-21T13:51:08Z, sam-baravy, commented:
<https://github.com/red/red/issues/2906#issuecomment-317006411>

    Guys, the code above is an attempt to produce an object (or just flat) file to link it later into a boot loader. I didn't understand from your comments if it is possible at the moment. It wasn't intended to be runnable by itself.

--------------------------------------------------------------------------------

On 2017-07-21T14:35:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2906#issuecomment-317017744>

    Okay, I got confused by the `.red` suffix. Pure Red/System source files use `.reds` suffix.
    
    On Windows, it compiles fine. Let me investigate why it fails on Linux.

--------------------------------------------------------------------------------

On 2017-07-21T16:18:27Z, dockimbel, commented:
<https://github.com/red/red/issues/2906#issuecomment-317045075>

    Ok, it should compile fine now.
    
    @sam-baravy Let me give you some extra info about that feature:
    
    * The `--no-runtime` on Linux still generates an ELF executable with at least code and data segments, so just to be clear, it's not an object file in the C sense (`.o`).
    * The `--no-runtime` has only been used so far for a prototype Arduino support, internally linked by Red's toolchain to a tiny pre-compiled binary runtime (less than a kilobyte IIRC).
    * On Windows, we built specific support for compiling Windows drivers for a commercial project. We had plans for supporting also Linux kernel modules, but didn't have a use-case for it, so it wasn't built.
    
    I haven't compiled a Linux kernel since 20 years, so I don't recall the image format, so I'm not sure you'll be able to use the currently emitted ELF file to make a bootable code from it. In any case, I suggest you add some extra compilation options (just guessing you'll need them):
    
    * Turn PIC mode on, to avoid generating absolute addresses in code segment
    * Set the base address for the code segment manually.
    
    Here is how you can do set that from the header (passing those options on command-line is currently broken):
    ```
    Red/System [
        config: [
            PIC?: yes
            base-address: 32768               ; 8000h
        ]
    ]
    
    a: 1
    if a < 2 [ a: 2 ]
    ```
    
    The generated code layout looks like [this](https://gist.github.com/dockimbel/a39884c5d7875fbdbd663453fa081dfb). As you can see, the PIC mode is used, but initialization code for `ebx` is missing. I will add a fix for that tomorrow.

--------------------------------------------------------------------------------

On 2017-07-21T17:02:46Z, sam-baravy, commented:
<https://github.com/red/red/issues/2906#issuecomment-317056683>

    @dockimbel Thank you for the fix and information. IMO, the issue is resolved.
    
    Right now I'm doing some low-level programming in Red/System. Just for fun and as a proof of concept. I'll try to not steal too much your time, but come back with new bugs if they arise.
    
    Waiting for the second fix you mentioned.

--------------------------------------------------------------------------------

On 2017-07-22T05:04:28Z, dockimbel, commented:
<https://github.com/red/red/issues/2906#issuecomment-317155747>

    The PIC mode is now correctly initialized.
    
    @sam-baravy Keep us informed of your progress on that (preferrably on our Gitter main [chat room](https://gitter.im/red/red)), I don't have much time to allocate for such features, but if it doesn't cost too much time, I'll be glad to enable generating bootable code/images using Red/System code. ;-)
    
    Cheers!
    

