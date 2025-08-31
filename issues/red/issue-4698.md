
#4698: [Regression] CLI-only Linux executables can't be produced in devmode anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4698>

**Describe the bug**

I have $DISPLAY var set to an IP address of the VM host and trying to produce an exe that doesn't require a running GUI environment (XServer is down on the host):
1. Script: `1.red`: `Red [] print "hello"`
2. Compile it: `red -c -t Linux-Old 1.red`
3. Run it: `./1` -- it just **hangs** (it will not hang if XServer is running on the host!)

Whereas `red -r -t Linux-Old 1.red` produces a working exe.

Notes:
1. Alternative compilation way (assuming Linux): `red -c --config "[sub-system: 'console]" 1.red` doesn't help the matter.
2. GTK-enabled compilation works just the same: `red -c -t Linux 1.red` will produce an exe that hangs, `red -r -t Linux 1.red` will produce an exe that works regardless of the XServer state.
3. If I `unset DISPLAY`, then `./1` compiled in devmode tells me this and terminates (does not hang):
```
Unable to init server: Could not connect: Connection refused
(1:1145): Gtk-WARNING **: 20:13:05.183: cannot open display:
```

**Expected behavior**

1. Should print `hello` in both `-r` and `-c` compilation modes.
2. An error instead of hanging when it can't init the GUI.

**Platform version**
```
Red 0.6.4 for Linux built 16-Oct-2020/21:35:47+03:00 commit #df54dcd
```
W10 host running WSL2 VM with Ubuntu OS.



Comments:
--------------------------------------------------------------------------------

On 2020-10-30T17:34:29Z, dockimbel, commented:
<https://github.com/red/red/issues/4698#issuecomment-719694237>

    ```
    Unable to init server: Could not connect: Connection refused
    (1:1145): Gtk-WARNING **: 20:13:05.183: cannot open display:
    ```
    GTK dependency without `Needs: View` header? That's an implementation issue.

--------------------------------------------------------------------------------

On 2020-10-30T17:35:14Z, 9214, commented:
<https://github.com/red/red/issues/4698#issuecomment-719694675>

    What about `--no-view`?

--------------------------------------------------------------------------------

On 2020-10-30T17:55:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/4698#issuecomment-719706360>

    @9214 
    ```
    test@AURA:~/1$ red -c --no-view -t Linux-Old 1.red
    
    -=== Red Compiler 0.6.4 ===-
    
    Compiling /home/test/1/1.red ...
    Compiling libRedRT...
    ...compilation time : 869 ms
    
    Compiling to native code...
    *** libRedRT Error: definition not found for red/image/init-image
    ```

--------------------------------------------------------------------------------

On 2020-10-30T17:58:06Z, 9214, commented:
<https://github.com/red/red/issues/4698#issuecomment-719707678>

    @hiiamboris I don't think we have `Linux-Old` target. Try `Linux` just in case.

--------------------------------------------------------------------------------

On 2020-10-30T18:04:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/4698#issuecomment-719711558>

    @9214 it's unlisted but it's in config.r ☺:
    ```
    Linux-Old [                                                                                                                                                                                    OS:         'Linux                                                                                                                                                                         format:     'ELF                                                                                                                                                                           type:       'exe                                                                                                                                                                           dynamic-linker: "/lib/ld-linux.so.2"                                                                                                                                                       legacy:     [stat32]                                                                                                                                                                   ] 
    ```
    `-t Linux` works the same, just tried.

