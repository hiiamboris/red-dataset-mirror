
#3211: Crash on modification of object's body
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3211>

### Expected behavior
I kinda expected that it will work as `extend`, which currently doesn't support `object!`s.
### Actual behavior
```Red
>> append body-of object [] 'boom

*** Runtime Error 1: access violation
*** at: 0806500Bh
```
### Steps to reproduce the problem
Run snippet above.
### Red version and build date, operating system with version.
same on Linux
```Red
>> about
Red for Windows version 0.6.3 built 25-Jan-2018/23:52:32+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-03-13T12:07:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3211#issuecomment-372643399>

    @9214 Thanks for taking the time to dig deep into the standard library code to find a fix for that. Though, that fix works only by side-effect, here is the full analysis of the issue:
    
    Let's compile the following code in debug mode:
    ```
    Red []
    append body-of object [] 'boom
    ```
    Here is the command line I use to compile that from Rebol console:
    ```
    do %red.r
    rc "-r -d %bug.red"
    ```
    Running it gives the following output:
    ```
    C:\Dev\Red>bug
    
    *** Runtime Error 98: assertion failed
    *** in file: /C/dev/Red/runtime/allocator.reds
    *** at line: 518
    ***
    ***   stack: red/alloc-series-buffer 98 4272787 1638040
    ***   stack: red/alloc-series-buffer 0 16 0
    ***   stack: red/alloc-series 0 16 0
    ***   stack: red/alloc-cells 0
    ***   stack: red/object/reflect 025D46B4h 50
    ***   stack: red/actions/reflect 025D46B4h 025D46C4h
    ***   stack: red/actions/reflect*
    ***   stack: body-of
    ```
    So, as you can see by following the call stack, a length of `0` is passed to `alloc-cells` which wreaks havok into the memory allocation sub-system. If you look at the corresponding call in the source code:
    ```
    blk/node: alloc-cells block/rs-length? blk
    ```
    you can see that an empty `blk` block (so an empty object body) could cause this. The right fix is then to ensure that the argument to `alloc-cells` is >= 1, which we can achieve using the following way:
    ```
    len: block/rs-length? blk
    if len = 0 [len: 1]
    blk/node: alloc-cells len
    ```
    Your fix (cloning the block) works because `block/clone` [will ensure](https://github.com/red/red/blob/master/runtime/datatypes/block.reds#L151) that the new block allocates at least 1 cell.

--------------------------------------------------------------------------------

On 2018-03-13T12:47:46Z, 9214, commented:
<https://github.com/red/red/issues/3211#issuecomment-372653367>

    :open_mouth: :clap: thank you for detailed explanation, @dockimbel !

