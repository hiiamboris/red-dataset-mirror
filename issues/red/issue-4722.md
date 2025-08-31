
#4722: Flawed logic in `make bitset!` exploits emitters discrepancy
================================================================================
Issue is open, was reported by hiiamboris and has 26 comment(s).
[Red/System]
<https://github.com/red/red/issues/4722>

**Describe the bug**

https://github.com/red/red/blob/738c45d5ca412950325d2e00e0c08392777ad603/runtime/datatypes/bitset.reds#L567-L578
and then the macro:
https://github.com/red/red/blob/738c45d5ca412950325d2e00e0c08392777ad603/runtime/macros.reds#L548-L559

As can be seen, code does not consider a NaN float value. Both `< MIN_INT` and `> MAX_INT` checks will fail with NaNs, leading to NaN being converted into an integer.

Why I open this issue is an emitter discrepancy which probably should be addressed:
- on IA-32: `as-integer 0.0 / 0.0` gives out `-2147483648`. No idea where it comes from since:<br>
```
>> to #{} 1.#nan
== #{7FF8000000000000}
```
- on ARM: `as-integer 0.0 / 0.0` gives out `0`, and thus it gets past the `< 0` check in the `constuct` func, propagating the bug into user code.

**To reproduce**
```
Red/System []

f: 0.0 / 0.0
probe f < -2147483648.0
probe f > -2147483648.0
probe f < 2147483647.0
probe f > 2147483647.0
probe as-integer f
probe as-integer 1.0
probe as-integer 10.0
```

**Expected behavior**

I expect `as-integer` to return platform-agnostic result.

Should print (on the https://github.com/red/red/pull/4717 branch):
```
false
false
false
false
-2147483648
1
10
```
Though `-2147483648` (IA-32) value is debatable, it's probably better than `0` (ARM) in terms of early error detection.

**Platform version**
```
Red 0.6.4 for Windows built 11-Nov-2020/5:05:03+03:00 commit #738c45d
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-11T17:25:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4722#issuecomment-725554113>

    Macro itself will be patched in https://github.com/red/red/pull/4717

--------------------------------------------------------------------------------

On 2022-09-04T10:36:28Z, dockimbel, commented:
<https://github.com/red/red/issues/4722#issuecomment-1236308122>

    @hiiamboris  On ARM (RPi), it gives:
    ```
    true
    true
    true
    true
    0
    1
    10
    ```
    
    It seems the NaN comparisons handling is wrong at: https://github.com/red/red/blob/master/system/targets/ARM.r#L1931
    
    Moreover, it seems the method used there is not sound, as distinction between a purely unordered result and a mix of lesser/greater + unordered is never made. The latter case is what is implemented, but fails to flip properly the comparison mode because it's not possible to detect a NaN at compile time. The `parity` flag only indicates that it's a float operation, nothing more.  It seems that a separate check for unordered state needs to be done for NaNs, so that a `false` can be returned for any comparison.
    
    It seems that a specific check for `overflow` (V = 1) needs to be done to detect the unordered result.
    
    For the record, here's the relevant ARM documentation page:
    
    ![image](https://user-images.githubusercontent.com/411393/188309166-ad9f215e-4b89-4fd7-8e8e-894aa5a7b6e0.png)

--------------------------------------------------------------------------------

On 2022-09-04T11:06:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4722#issuecomment-1236312841>

    Does `system/tests/source/units/float-test.reds` succeed for you? I don't have access to @rebolek's Pi anymore.

--------------------------------------------------------------------------------

On 2022-09-04T11:32:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4722#issuecomment-1236317258>

    Pretty sure I have tested it previously :)
    Anyway, the logic was to for floats use conditions that will return false for unordered result.
    Given:
    ```
    conditions: make hash! [
    ;-- name ----------- signed --- unsigned --
        overflow?        #{60}      -
        not-overflow?    #{70}      -
        =                #{00}      -
        <>               #{10}      -
        signed?          -          -
        unsigned?        -          -
        even?            -          -
        odd?             -          -
        <                #{b0}      #{30}
        >=               #{a0}      #{20}
        <=               #{d0}      #{90}
        >                #{c0}      #{80}
    ]
    ```
    And:
    ```
    ;; for floats only: use conds that are false given NaN
    ;; in unflipped state: unsigned for < <= , signed for > >=
    ```
    We get opcodes (note that 2 were chosen from signed, 2 from unsigned column):
    ```
    operator hex binary
    <  #{30} "00110000"
    <= #{90} "10010000"
    >= #{A0} "10100000"
    >  #{C0} "11000000"
    ```
    And their "opposite" opcodes:
    ```
    operator hex binary
    <  #{B0} "10110000"
    <= #{D0} "11010000"
    >= #{20} "00100000"
    >  #{80} "10000000"
    ```
    Looking these up in the manual:
    ![](https://i.gyazo.com/a01446cc7e94ff56f2cdd80f36fb0111.png)
    ![](https://i.gyazo.com/2c31b715736ebdc25932428e07f99e3f.png)
    ![](https://i.gyazo.com/364c4b72679e145c9e28f9532c027b77.png)
    ![](https://i.gyazo.com/06c7573a0e0f73bf13045d8c7e5e1623.png)
    Shows that indeed these opcodes should return false given any NaN argument, and should be used if compiler does not reverse the operator.
    
    And opposites:
    ![](https://i.gyazo.com/6b2089aa96dcd9f93d30bb7c0c1b9535.png)
    ![](https://i.gyazo.com/b6cbf830029680fbcf85b5c708104aa8.png)
    ![](https://i.gyazo.com/2777b275a21e1a759b57344f68751877.png)
    ![](https://i.gyazo.com/a63e88ecae05fde0db401ffc40923c52.png)
    Should be true when given a NaN, so they should be used when compiler *does* reverse the operator.
    
    `flip?` flag accounts for:
    - compiler-induced reversal
    - `< <=` vs `>= >` change in NaN-handling behavior
    And if `parity` is false (no float operands expected), `flip?` is disabled.
    
    Where's the bug? 

--------------------------------------------------------------------------------

On 2022-09-04T11:36:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/4722#issuecomment-1236317945>

    I think `0110` opcode (integer overflow, float unordered) is not related to comparisons, but rather to arithmetic (gets set when result is a NaN).

--------------------------------------------------------------------------------

On 2022-09-04T13:27:45Z, dockimbel, commented:
<https://github.com/red/red/issues/4722#issuecomment-1236342128>

    > Does `system/tests/source/units/float-test.reds` succeed for you? I don't have access to @rebolek's Pi anymore.
    
    It does pass.
    
    I re-tested your code above and I've found the source of the wrong results. It's a side-effect of compiler internal states not being cleared up fully on multiple jobs from the same Rebol session. If I compile for RPi only from a fresh session, I get:
    ```
    pi@raspberrypi:~ $ ./test-logic2
    false
    false
    false
    false
    0
    1
    10
    ```
    If I first compile for MSDOS target, then for RPi, I get:
    ```
    pi@raspberrypi:~ $ ./test-logic2
    true
    true
    true
    true
    0
    1
    10
    ```
    :see_no_evil::see_no_evil:

--------------------------------------------------------------------------------

On 2022-09-04T13:33:53Z, dockimbel, commented:
<https://github.com/red/red/issues/4722#issuecomment-1236343392>

    > Shows that indeed these opcodes should return false given any NaN argument,
    
    That's the part I've missed as I wrongly assumed that they would return TRUE even on a NaN argument. In such case, it's all good and your method is sound. 👍 

--------------------------------------------------------------------------------

On 2022-09-04T22:21:26Z, dockimbel, commented:
<https://github.com/red/red/issues/4722#issuecomment-1236425584>

    Converting a NaN to a 32-bit integer is an undefined behavior in C (and probably in most other system languages): https://stackoverflow.com/a/10366541/2081311
    
    So you get what the FPU returns during the conversion, `INT_MIN` on IA-32 and `0` on ARM.
    
    The `as` instruction in R/S has a `keep` [option](https://static.red-lang.org/red-system-specs.html#section-4.9) which should just change the type without touching the payload (it seems to require some extra debugging at least on ARM). Using `as integer! keep` should return the same value on all platforms (provided that the same NaN is produced on each platform). For 32-bit floats only, so a 64-bit float would first need to be converted to 32-bit.
    
    Without `keep`, a FPU-driven conversion occurs  from a 32-bit or 64-bit float to a 32-bit integer (on 32-bit platforms). For NaN values, it's an undefined behavior (which can be [really bad](https://stackoverflow.com/questions/10366485/problems-casting-nan-floats-to-int#comment39313111_10366541)). If we want to avoid that, we need to pay the cost of adding extra instructions to check if the value to convert from is a NaN and use a fallback code path then to return a static value of our choice. 
    
    For that, we would need in the [emit-casting](https://github.com/red/red/blob/master/system/targets/ARM.r#L944) backend, to check for the upper bits that define a NaN, use two jumps for a IF/THEN/ELSE flow and set a literal return value. That overhead will be paid on all floating point to integer castings in order to claim a well-defined behavior for this edge case. No other system language is doing that it seems (would be good to verify that for Go, Zig and Rust at least). I tend to prefer correctness in such case. Though, we could also add an `unsafe` option to `as` to skip such checks when user needs to squeeze every bit of performance and knows what he's doing.
    
    What do you think?

--------------------------------------------------------------------------------

On 2022-09-05T12:07:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/4722#issuecomment-1236917918>

    In Zig, both infinity and nans to integer result in:
    `thread 20520 panic: integer part of floating point value out of bounds`
    In DMD implementation of D, all infinity and nans to integer result in zero (tested float32, float64 and float80).
    Go outputs `-2147483648` for infinity and nans (so I would expect it to be prone to undefined behavior).
    Rust is too big for me to bother trying :)
    
    Anyway, I also tend to be in favor of *defined* behavior, whatever it may be.
    
    P.S. correction: in DMD, low-level `cast(uint)` results in zero, while high-level templated `to!uint` results in an exception:
    ```
    std.conv.ConvOverflowException@d:\gear\dmd2\windows\bin64\..\..\src\phobos\std\conv.d(1563): Conversion positive overflow
    ----------------
    0x00000001400012D6
    0x0000000140001132
    0x000000014000106E
    0x0000000140009783
    0x00000001400095DF
    0x00000001400096DF
    0x00000001400095DF
    0x00000001400094F6
    0x0000000140005969
    0x0000000140001114
    0x000000014004BECE
    0x00007FFAB6237034 in BaseThreadInitThunk
    0x00007FFAB6902651 in RtlUserThreadStart
    ```

--------------------------------------------------------------------------------

On 2022-09-05T17:30:50Z, dockimbel, commented:
<https://github.com/red/red/issues/4722#issuecomment-1237332743>

    So maybe throwing an error on `as integer! 1.#NaN` is the best thing to do?

--------------------------------------------------------------------------------

On 2022-09-05T18:06:40Z, greggirwin, commented:
<https://github.com/red/red/issues/4722#issuecomment-1237365546>

    There is a broader philosophical question (signaling vs non-signaling NaNs, and how Red uses each in a given context, but I think there's a guiding indicator for `as integer!` throwing an error here: https://en.wikipedia.org/wiki/NaN#Integer_NaN

--------------------------------------------------------------------------------

On 2022-09-05T18:07:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4722#issuecomment-1237365733>

    > So maybe throwing an error on `as integer! 1.#NaN` is the best thing to do?
    
    I think so. Let it crash, so the coder may add checks if NaN is to be handled. And then the same for everything outside the 32-bit integer range.

--------------------------------------------------------------------------------

On 2023-02-02T08:52:43Z, rebolek, commented:
<https://github.com/red/red/issues/4722#issuecomment-1413357766>

    > Does `system/tests/source/units/float-test.reds` succeed for you? I don't have access to @rebolek's Pi anymore.
    
    Strange, I don't remember deleting your account.

