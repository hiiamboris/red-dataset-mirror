
#4196: crash on execution of malformed routine
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4196>

Related: https://github.com/red/red/issues/3171, https://github.com/red/red/issues/4192

**Describe the bug**

`clear`ing `routine!`s spec block and then calling it leads to a crash.

**To reproduce**

```red
>> clear spec-of :as-ipv4
== []
>> as-ipv4 1 3 3 7
```
```
*** Runtime Error 98: assertion failed
*** in file: .../red/runtime/interpreter.reds
*** at line: 560
***
***   stack: red/interpreter/exec-routine 00000062h
***   stack: red/interpreter/exec-routine 02D45D60h
***   stack: red/interpreter/eval-code 02D45D60h 03138268h 031382A8h false 00000000h 00000000h 02D45D60h
***   stack: red/interpreter/eval-expression 03138268h 031382A8h false false false
***   stack: red/interpreter/eval 02C42CB4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||504~try-do 00EC0508h
***   stack: ctx||504~do-command 00EC0508h
***   stack: ctx||504~eval-command 00EC0508h
***   stack: ctx||504~run 00EC0508h
***   stack: ctx||504~launch 00EC0508h
***   stack: ctx||536~launch 00EBF7C4h
```

**Expected behavior**

Ideally Red should ignore any changes to function's spec (see related tickets linked above).

**Platform version**

The latest build, all platforms.



Comments:
--------------------------------------------------------------------------------

On 2020-10-14T11:57:48Z, 9214, commented:
<https://github.com/red/red/issues/4196#issuecomment-708353387>

    A follow-up to https://github.com/red/red/pull/4677#issuecomment-708034786: this is a much deeper issue than I initially thought; in general, tampering with type signatures within routine's spec will lead to a crash within type-checking loop, or to a change in routine's behavior.
    
    * By changing the content of type spec to something other than `word!` (crash):
    
    ```red
    probe as-rgba 1 3 3 7
    
    block: first find spec-of :as-rgba block!
    block/1: float!
    
    probe as-rgba 1 3 3 7
    ```
    
    * By removing one or more type specifications (crash):
    
    ```red
    probe as-rgba 1 3 3 7
    
    take find spec-of :as-rgba block!
    
    probe as-rgba 1 3 3 7
    ```
    
    * By changing the datatype spec:
    
    ```red
    probe as-rgba 1 3 3 7
    
    block: first find spec-of :as-rgba block!
    block/1: 'float!
    
    probe as-rgba 1 3 3 7
    ```
    ```red
    1.3.3.7
    *** Script Error: as-rgba does not allow float! for its a argument
    *** Where: do
    *** Stack: do-file 
    ```
    
    * By appending one or more type specifications (since the loop works from tail to head):
    
    ```red
    probe as-rgba 1 3 3 7
    
    append spec-of :as-rgba [e [none!]]
    
    probe as-rgba 1 3 3 7
    ```
    ```red
    1.3.3.7
    *** Script Error: as-rgba does not allow none! for its d argument
    *** Where: do
    *** Stack: do-file  
    ```

--------------------------------------------------------------------------------

On 2022-08-30T17:51:16Z, dockimbel, commented:
<https://github.com/red/red/issues/4196#issuecomment-1231980602>

    All above cases now report a proper error when due and no crashing happens.

