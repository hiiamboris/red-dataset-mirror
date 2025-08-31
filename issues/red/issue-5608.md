
#5608: Exit code of empty script is 255 instead of 0
================================================================================
Issue is closed, was reported by loziniak and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5608>

Shouldn't exit code of an empty script be `0`, that means successful execution?

```
Red [file: %exit-test.red]
;-- just an empty script
```

```
$ ./red-05apr25-75e46f30a exit-test.red 
$ echo $?
255
```
It's the same when compiling:

```
$ ./red-toolchain-05apr25-75e46f30a -c exit-test.red 
$ ./exit-test 
Gtk-Message: 16:03:50.426: Failed to load module "canberra-gtk-module"
Gtk-Message: 16:03:50.427: Failed to load module "canberra-gtk-module"
$ echo $?
255
```

@hiiamboris :
```
test@AURA:~$ ./red-07jan25-3e3c0952f 1.red; echo $?
255
test@AURA:~$ ./red-23dec24-66b2f5ba1 1.red; echo $?
0
```

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 9 date: 5-Apr-2025/6:43:25 commit: #75e46f30afadf50e81428280e9cf2e7efb03878d ]
PLATFORM: [ name: "Manjaro Linux" OS: 'Linux arch: 'x86_64 version: 6.6.54 build: {#1 SMP PREEMPT_DYNAMIC Tue Oct  8 03:11:08 UTC 2024} ]
--------------------------------------------
```



Comments:
--------------------------------------------------------------------------------

On 2025-04-08T14:11:54Z, loziniak, commented:
<https://github.com/red/red/issues/5608#issuecomment-2786592212>

    possibly related to #4095 

--------------------------------------------------------------------------------

On 2025-04-09T20:21:48Z, dockimbel, commented:
<https://github.com/red/red/issues/5608#issuecomment-2790915816>

    It should now return `0` in such case. 
    
    However, it seems `quit/return` is broken since `atexit()` handler were added... (`quit <code>` in R/S works fine).

--------------------------------------------------------------------------------

On 2025-04-09T20:49:32Z, dockimbel, commented:
<https://github.com/red/red/issues/5608#issuecomment-2790967182>

    Actually, `quit/return` with values up to 255 works fine. Above that, the process returns the code modulo 256, so it confused me.
    
    So, we're all good.

