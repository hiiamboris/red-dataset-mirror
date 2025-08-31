
#2481: Interpreter: `call/console "red .."` need `/shell` refinement! rebol encapper limitation.
================================================================================
Issue is closed, was reported by x8x and has 8 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/2481>

on macOS:
```
  % echo 'Red []' > test.red
  % red
  call/console {red -c -r test.red}
red(76039,0xa70ad1c0) malloc: *** mach_vm_map(size=3909091328) failed (error code=3)
*** error: can't allocate region
*** set a breakpoint in malloc_error_break to debug
** Script Error: Not enough memory
** Near: script: decapsulate 
if none? script
;   0
```
on Linux:
```
  % echo 'Red []' > test.red
  % red
  call/console {red -c -r test.red}
*** Error: cannot access argument file
```


Comments:
--------------------------------------------------------------------------------

On 2017-03-16T05:15:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2481#issuecomment-286960198>

    `red` binary is a Rebol-encapsulated executable, so it needs a wrapper shell script in order to use it with redirections (`/console` is forcing redirections).

--------------------------------------------------------------------------------

On 2017-03-16T05:50:44Z, x8x, commented:
<https://github.com/red/red/issues/2481#issuecomment-286964386>

    Adding `/shell` to `call` works:
    ```
      % echo 'Red []' > test.red
      % red
      call/shell/console {red -c -r test.red}
    
    -=== Red Compiler 0.6.1 ===- 
    ..
    ```
    Still the error returned above is not very meaningful.

--------------------------------------------------------------------------------

On 2017-03-16T06:03:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2481#issuecomment-286965830>

    The error on macOS is coming from the Rebol encapper code, we cannot do anything about that.

--------------------------------------------------------------------------------

On 2017-03-16T06:07:22Z, x8x, commented:
<https://github.com/red/red/issues/2481#issuecomment-286966399>

    Fair enough thank you.

