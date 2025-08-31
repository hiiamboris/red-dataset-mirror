
#2477: 'call/error' crashing console on macOS & Linux
================================================================================
Issue is closed, was reported by x8x and has 22 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2477>

I'm trying to port the `ecall` wrapper to the now included `call`. 
Not sure it should work with LibRedRT, but the wiredness is that it works fine on Linux and not on macOS, I don't use any platform specific code, so I'm suspecting there may be a lower level issue .

Download `ecall.red`:
```
  macOS% curl -O https://gist.githubusercontent.com/x8x/c3d538af1402507cddc982b239e870c2/raw/99a84d2b431606f277d1ff3d7caae30faf0cca8a/ecall.red
```
Note: the `redsys-call` `routine!` is a straight adaptation of the same routine that was in Bruno's `call.red` 

Compile in development mode returns an error:
```
  macOS% red -c -d ecall.red

-=== Red Compiler 0.6.1 ===- 

Compiling /red/build/bin/ecall.red ...
...using libRedRT built on 11-Mar-2017/20:16:54+7:00
...compilation time : 58 ms

Target: Darwin 

Compiling to native code...
*** Compilation Error: undefined symbol: red/unicode/to-utf8 
*** in file: %/red/build/bin/ecall.red 
*** in function: exec/ctx330~redsys-call
*** at line: 323 
*** near: [unicode/to-utf8 in-str :len 
    inp: as p-buffer! :pad1 
    inp/buffer:
]
```
Compile in release mode:
```
  macOS% red -c -d -r ecall.red

-=== Red Compiler 0.6.1 ===- 

Compiling /red/build/bin/ecall.red ...
...compilation time : 903 ms

Target: Darwin 

Compiling to native code...
...compilation time : 27327 ms
...linking time     : 2857 ms
...output file size : 1941504 bytes
...output file      : /red/build/bin/ecall 
```
Test the generated macOS bin (fail):
```
  macOS% ./ecall

*** Runtime Error 1: access violation
*** in file: /red/build/bin/call.reds
*** at line: 616
***
***   stack: ctx294~redsys-call 02024214h true false false false 02024264h 02024274h 02024284h
***   stack: ecall 00209264h
```
Compile in release mode for Linux platform:
```
  macOS% red -c -d -r -t Linux ecall.red

-=== Red Compiler 0.6.1 ===- 

Compiling /red/build/bin/ecall.red ...
...compilation time : 905 ms

Target: Linux 

Compiling to native code...
...compilation time : 27099 ms
...linking time     : 3092 ms
...output file size : 1979496 bytes
...output file      : /red/build/bin/ecall 
```
Test the generated Linux bin (works):
```
  Linux% ./ecall
true
```


Comments:
--------------------------------------------------------------------------------

On 2017-03-11T15:51:37Z, dockimbel, commented:
<https://github.com/red/red/issues/2477#issuecomment-285876562>

    The dev mode (using libRedRT) can only be used if you don't call R/S functions from the Red runtime API. If your code includes such calls, you need to compile at least once with:
    ```
    red clear
    red -u <script.red>
    ```
    This will generate a custom version of libRedRT and allow you to compile with just `-c` option next time.

--------------------------------------------------------------------------------

On 2017-03-11T15:54:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2477#issuecomment-285876730>

    Does you ecall.red script include a `redsys-call` routine? If so, what does it do?

--------------------------------------------------------------------------------

On 2017-03-11T16:02:14Z, x8x, commented:
<https://github.com/red/red/issues/2477#issuecomment-285877228>

    Yes it does, you can see the source code here https://gist.github.com/x8x/c3d538af1402507cddc982b239e870c2 .
    It is the same `redsys-call` that was in Bruno's version, just included `p-buffer!` because it is not globally accessible anymore and changed `system-call/call` to `ext-process/OS-call` and `system-call/insert-string` to `ext-process/insert-string`. I tryied first to use the `ext-process/call` that is your port of `redsys-call` but it didn't work as a `routine!`

--------------------------------------------------------------------------------

On 2017-03-11T16:13:58Z, dockimbel, commented:
<https://github.com/red/red/issues/2477#issuecomment-285877977>

    You have to use `ext-process/call`, it is `redsys-call`, there is no reason to duplicate it in your code, just call it  (see `natives/call*` to see how to properly call it).

--------------------------------------------------------------------------------

On 2017-03-11T16:30:13Z, x8x, commented:
<https://github.com/red/red/issues/2477#issuecomment-285878995>

    Ok thanks, I'll try harder.. still, any reasons, why it works on Linux and not on macOS ?

--------------------------------------------------------------------------------

On 2017-03-11T17:28:58Z, dockimbel, commented:
<https://github.com/red/red/issues/2477#issuecomment-285882635>

    No clue. I can give it a try tomorrow at the office.

--------------------------------------------------------------------------------

On 2017-03-11T17:56:41Z, x8x, commented:
<https://github.com/red/red/issues/2477#issuecomment-285886251>

    Thanks, much appreciated!

--------------------------------------------------------------------------------

On 2017-03-11T19:04:45Z, x8x, commented:
<https://github.com/red/red/issues/2477#issuecomment-285892206>

    This is the problem on macOS:
    ```
    red>> call/error {uname} e: {}
    
    *** Runtime Error 1: access violation
    *** at: 00056C0Eh
    ```
    same code works on Linux

--------------------------------------------------------------------------------

On 2017-03-12T11:50:37Z, x8x, commented:
<https://github.com/red/red/issues/2477#issuecomment-285939399>

    With `/output` added, it works fine, but with `/wait` added it doesn't:
    ```
      call/output/error {uname} o: "" e: ""
    ;   0
      o
    ;   "Darwin^/"
      e
    ;   ""
      call/wait/error {uname} e: ""
    
    *** Runtime Error 1: access violation
    *** in file: /red/build/call.reds
    *** at line: 631
    ***
    ***   stack: red/ext-process/call 00624284h true false false false 00000000h 00000000h 00624294h
    ***   stack: red/natives/call* false 1 -1 -1 -1 -1 -1 1
    ***   stack: red/interpreter/eval-arguments 006C026Ch 01C4E218h 01C4E218h 01C4E1D8h 01C4E82Ch
    ***   stack: red/interpreter/eval-code 006C026Ch 01C4E1E8h 01C4E218h true 01C4E1D8h 01C4E82Ch 006C026Ch
    ***   stack: red/interpreter/eval-path 01C4E1D8h 01C4E1E8h 01C4E218h false false false false
    ***   stack: red/interpreter/eval-expression 01C4E1E8h 01C4E218h false false false
    ***   stack: red/interpreter/eval 00624254h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx330~try-do 0026DAA0h
    ***   stack: ctx330~do-command 0026DAA0h
    ***   stack: ctx330~eval-command 0026DAA0h
    ***   stack: ctx330~run 0026DAA0h
    ***   stack: ctx330~launch 0026DAA0h
    ```
    It's not about out buffer wanting data, because `call` alone works:
    ```
      call {uname}
    ;   22792
    ```
    No differences with or without `/shell` and/or `/console`.

--------------------------------------------------------------------------------

On 2017-03-12T20:13:51Z, x8x, commented:
<https://github.com/red/red/issues/2477#issuecomment-285972578>

    On Linux, `call/error {uname} e: {}` that crashes on macOS, works fine,
    but this will crashes on Linux:
    ```
      call/error {printf} e: ""
    
    *** Runtime Error 1: access violation
    *** in file: /red/build/call.reds
    *** at line: 631
    ***
    ***   stack: red/ext-process/call F69DC284h false false false false 00000000h 00000000h F69DC294h
    ***   stack: red/natives/call* false -1 -1 -1 -1 -1 -1 1
    ***   stack: red/interpreter/eval-arguments F6A7835Ch F6562650h F6562650h F6562610h F6562D2Ch
    ***   stack: red/interpreter/eval-code F6A7835Ch F6562620h F6562650h true F6562610h F6562D2Ch F6A7835Ch
    ***   stack: red/interpreter/eval-path F6562610h F6562620h F6562650h false false false false
    ***   stack: red/interpreter/eval-expression F6562620h F6562650h false false false
    ***   stack: red/interpreter/eval F69DC254h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx330~try-do F6AC5AA8h
    ***   stack: ctx330~do-command F6AC5AA8h
    ***   stack: ctx330~eval-command F6AC5AA8h
    ***   stack: ctx330~run F6AC5AA8h
    ***   stack: ctx330~launch F6AC5AA8h
    ***   stack: ***_start
    ```
    Obviously `printf` command need an argument so `call` should set variable `e` to:
    ```
    printf: not enough arguments
    ```
    Running with `/output` works properly and `e` variable gets set:
    ```
      call/output/error {printf} o: "" e: ""
    ;   1
      e
    ;   {printf: not enough arguments^/}
    ```
    
    Looks like on macOS `call/error` without `/output` crashes always, while on Linux it crashes only when the command actually returns an error.

--------------------------------------------------------------------------------

On 2017-03-13T06:15:32Z, dockimbel, commented:
<https://github.com/red/red/issues/2477#issuecomment-286023619>

    Good finding. I will have a look at it later today.

