
#3692: Elusive bug seemingly involving parse
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3692>

**Describe the bug**

An elusive and persistent crash involving parse & GC.
At first I thought it's a GC bug, but now I'm more inclined to think that there's an alloc/free issue in parse somewhere. The bug never appeared to me with `recycle/off`, however this might be incidental...

**To reproduce**

I have prepared 2 ways to trigger the bug:
- https://gitlab.com/snippets/1793901 - this initial script builds a map-index of words in files
- https://gitlab.com/snippets/1794085 - this reduced script just parses file lines and forgets them

Both ways crash for me (W7, various builds of 2018 - Dec 31, Dec 30, Dec 18, Dec 7, and a few more)

I am unable to produce a smaller snippet that will trigger it for certain. Any attempt to isolate it reduces the chances of it manifesting, so at this point the best way to find out what's happening is likely to analyze the code armed with the knowledge of GC & parse internals and make educated guesses. That, or scan the aforementioned internals for allocation bugs.

What else sometimes helps me to trigger it:
- comment/uncomment some irrelevant line(s) of code in `index*.red` (after `quit` or some never used words)
- versions built with `-d` seem more likely to catch it




Comments:
--------------------------------------------------------------------------------

On 2019-01-01T03:17:42Z, dockimbel, commented:
<https://github.com/red/red/issues/3692#issuecomment-450707257>

    Thanks for the reducing it as much as possible, we'll take it from there.
    
    @qtxie It was suggested by @9214 that we sometimes document the process of debugging complex bugs for educational purposes, this one looks like a one we could fully document.
     

--------------------------------------------------------------------------------

On 2019-01-01T11:16:15Z, dockimbel, commented:
<https://github.com/red/red/issues/3692#issuecomment-450722963>

    The bug has been fixed. This is the detailed log of the whole debugging session, done by me and Qingtian. It took us about 3.5 hours working in parallel the first hour, then together in the resolution of the bug. Without the logging process, it would have taken 1 or 1.5 hour less to figure out the cause and the proper fix, and I must say it is particularily tedious to do such detailed logging (I have dropped some extra fine-grained probing cases that were not successful), though I hope it could serve as an example to other contributors for the methods we use to investigate crashing cases caused by particularily complex bugs that are triggered by a GC pass.
    
    **1. Reproducing the issue**
    
    The description provides steps to reproduce the issue, but using consoles instead of direct compilation of the script. So the first thing to do is try to isolate the crash from the consoles and interpreter by compiling the input script directly in debug mode.
    
    Bingo, it can exhibit the same crash, and with the extra bonus of a much smaller call-stack:
    ```
    *** Runtime Error 1: access violation
    *** in file: /c/dev/Red/runtime/parse.reds
    *** at line: 499
    ***
    ***   stack: red/parser/loop-bitset 026C0B28h 0251D4C4h 0 -1 0019FDD0h 0
    ***   stack: red/parser/loop-token 026C0B28h 0251D4C4h 0 -1 0019FDD0h 0 0
    ***   stack: red/parser/process 026C0B28h 0251D554h 0 0 0251D534h
    ***   stack: red/natives/parse* true -1 0 -1
    ***   stack: index-file
    ***   stack: build-index
    ```
    
    Now let's confirm that the GC is involved by trying again with `recycle/off`. Script indeed runs without trouble to its end. So this hints that a memory corruption triggered by the GC is occuring. At this point, we don't know if the GC code is the root cause, or if it's an issue in the runtime code (more probable) that is "revealed" by the moved memory regions during the GC collecting phase.
    
    **2. Investigating possible causes of the bug**
    
    Looking at the stack trace, it crashes in Parse code, more precisely in `loop-bitset` which is an optimized bitset matching loop (`any`, `some` or manual looping using integer(s)). 
    
    The only rule in the input script that matches that pattern is `any word-char`. Let's probe the bitset before the rule by injecting a `(?? word-char)` before the rule and see if we can see something wrong in the bitset before the crash. Surprisingly, the script runs fine to the end without crashing. So, we are facing a so-called [heisenbug](https://en.wikipedia.org/wiki/Heisenbug), and this is usually the symptom of a nasty memory corruption.
    
    So, we remove the probing code in the rule, and go see the line 499 in %parse.reds, to get more clues. The referred line is:
    ```
    cnt: cnt + 1
    ```
    which is very unlikely to crash, as that would mean the generated code for such expression is wrong, which is by experience, extremely unlikely. So, let's wrap that part of the code with some logs to confirm if the crash really comes from there or not:
    ```
    prin "+"
    if match? [
        p: p + unit
        cnt: cnt + 1
    ]
    prin "-"
    ```
    
    Result is inconclusive as the nested loop is called too many times, and after 5mn of run time, the program still hasn't halted in any way.
    
    Anyway, unprecise error line reporting in R/S is caused by macros being expanded at block-level, so new-line metadata gets messed up quickly (to be improved in the future). 
    
    Though, just above the reported error line, there is a macro lying there: `BS_TEST_BIT(pbits cp match?)`, so let's manually expand it to see if we can get a more accurate reporting. The code becomes:
    ```
    either size < cp [							;-- virtual bit
        match?: not?
    ][
        ;BS_TEST_BIT(pbits cp match?)
        pos: pbits + (cp >> 3)
        match?: pos/value and (as-byte 128 >> (cp and 7)) <> null-byte				
    ]
    ```
    Now we get the line `match?: pos/value...` reported in the crash log. Looking at it, the only possible crash is the `pos` pointer dereferencing at `pos/value`, so that the pointer is probably pointing at a wrong location. Let's confirm that with an assertion:
    ```
    either size < cp [							;-- virtual bit
        match?: not?
    ][
        ;BS_TEST_BIT(pbits cp match?)
        pos: pbits + (cp >> 3)
        assert pos < as byte-ptr! s/tail
        match?: pos/value and (as-byte 128 >> (cp and 7)) <> null-byte				
    ]
    ```
    Indeed, we now get an "assertion failed" instead of a "access violation". So `pbits` is wrong or `cp` is vastly out of range. Let's try with probing `cp` first.
    
    Though, we have an issue with probing, as we are in a deeply nested loop and anything printed there will result in too many logs, that would make it difficult to reach the right position in an acceptable time frame. We need to put some conditions to reduce the logs to a much smaller amount. We can notice that the crash always happened after 8 GC passes, as in debug mode, the GC passes are reported like that:
    ```
    root size: 2192, root max: 4152, cycles: 8
    ```
    As it never reaches more than 8 passes, we can use the internal GC passes counter to only log after the 8th pass. So the code becomes:
    ```
    if collector/stats/cycles > 8 [?? cp]
    either size < cp [							;-- virtual bit
        match?: not?
    ][
        ;BS_TEST_BIT(pbits cp match?)
        pos: pbits + (cp >> 3)
        assert pos < as byte-ptr! s/tail
        match?: pos/value and (as-byte 128 >> (cp and 7)) <> null-byte				
    ]
    ```
    Running the code now gives us:
    ```
    ...
    cp: 103
    cp: 52
    cp: 67
    cp: 50
    cp: 56
    cp: 99
    cp: -1159942176
    
    *** Runtime Error 98: assertion failed
    *** in file: /c/dev/Red/runtime/parse.reds
    *** at line: 500
    ***
    ***   stack: red/parser/loop-bitset 00000062h 0045C809h 1 0 00000001h 2950
    ***   stack: red/parser/loop-bitset 02780B28h 02762E54h 0 -1 0019FE10h 0
    ***   stack: red/parser/loop-token 02780B28h 02762E54h 0 -1 0019FE10h 0 0
    ***   stack: red/parser/process 02780B28h 0265D4D4h 0 0 0265D4B4h
    ***   stack: red/natives/parse* true -1 0 -1
    ***   stack: index-file
    ***   stack: build-index
    ```
    So the culprit is `cp`, causing the `pos` pointer to refer an invalid memory area, and crashing then on dereferencing. The odd negative value of `cp` hints at a possible high address value, so let's use Red console to convert it to an hex value:
    ```
    >> to-hex -1159942176
    == #BADCAFE0
    ```
    Ah, finally something interesting, that is a special value used by the GC compacting routine when compiled in debug mode, to mark the newly freed contiguous area ahead of the in-use area (the memory chunk "heap", that is available for new series allocations). So, in this last call to `loop-bitset`, the bitset slot seems to be referring to a buffer that was moved by the GC, but the node pointer was not updated, or wrongly updated.
    
    `cp` is extracted from the `p` buffer, which is referring to the input series. Given the input source code, we can infer that the corrupted string series is coming from the simple-io code used for loading it from disk and splitting by lines (`read/lines` in input script), or from the Unicode processing code (UTF-8 to one of the internal format).
    
    So, let's dump the content of the input string buffer to see if there's anything odd by injecting a conditional `dump4 s` before the `until` loop: 
    ```
    if collector/stats/cycles > 8 [dump4 s]		
    ```
    We get:
    ```
    Hex dump from: 0297CB4Ch
    
    0297CB4C: A0000004 0270BC78  00000090 0297CB60  ?..?x?p??...`???
    0297CB5C: 0297CBF0 00000009  00000009 00000061  ?????...?...a...
    0297CB6C: 0000003A 00000020  00000022 00000067  :... ..."...g...
    0297CB7C: 00000034 00000043  00000032 00000038  4...C...2...8...
    0297CB8C: 00000063 BADCAFE0  00000039 00000041  c...????9...A...
    0297CB9C: 00000031 00000035  00000048 00000066  1...5...H...f...
    0297CBAC: 00000033 00000069  00000045 00000047  3...i...E...G...
    0297CBBC: 00000030 00000037  00000036 00000065  0...7...6...e...
    
    *** Runtime Error 98: assertion failed
    *** in file: /c/dev/Red/runtime/parse.reds
    *** at line: 500
    ***
    ***   stack: red/parser/loop-bitset 00000062h 0045C7F3h 1 0 00000001h 2950
    ```
    This is a typical series buffer memory dump. The header part is 5 32-bit words long, and followed by the series data.
    
    `A0000004` contains flags and meta-info. The last byte indicates the buffer's unit in (here 04 => 32-bit) 
    `0270BC78` is the back-reference for the series node pointer.
    `00000090` is the size of the allocated buffer (without the 160-bit header).
    `0297CB60` is the "offset" pointer, indicating the beginning of the series data.
    `0297CBF0` is the "tail" pointer, indicating where the data ends.
    
    A first check to do there, is ensure that those values are consistent, so that what tail - offset gives, is less than the allocated size. That's the case here.
    
    We can notice three important information there:
    
    1. We can spot the `BADCAFE0` pattern in the series buffer.
    2. The string is using UCS-4 encoding, as each character is stored in 32-bit (confirmed by the `04` value in the first header word). 
    3. We can partially extract the input string that makes it choke: `a: "g4C28c?A15Hf3iEG076e..."`
    
    Let's search for the beginning of the this pattern (we take only `a: "g4C28c`, as the next character is corrupted) in the source files. We can find it in %tests\source\units\series-test.red at line 1366:
    ```
        --test-- "sort-str-1"			;-- 4 bytes code point
            a: "g4C28c𠃌9A15Hf3iEG076eBIdbFaDh"
            --assert "0123456789AaBbCcdDEefFGghHIi𠃌" = sort a
    ```
    That matches the UCS-4 input string above. We can immediatly notice that the `BADCAFE0` slot corresponds to the Chinese Unicode character on position 7 of the string. This hints that the UTF-8 to UCS-4 conversion code is probably the culprit in this corruption.
    
    So let's now explore the UTF-8 conversion code in %runtime/unicode.reds. The main function for such conversion is `load-utf8-buffer`. It starts by loading in Latin1 mode, then upgrades the string to higher encoding if a higher Unicode code is encountered. There are many branches there, and the path that concerns us in this case is Latin1 to UCS-4 upgrade, which happens at line 451:
    ```
    true [
        s/tail: as cell! buf1
        unit: UCS-4
        s:    Latin1-to-UCS4 s		;-- upgrade to UCS-4
        buf4: as int-ptr! s/tail
        end:  (as byte-ptr! s/offset) + s/size
    
        buf4/value: cp
        buf4: buf4 + 1
    ]
    ```
    So let's first see if `cp` gets the wrong value that we see in the memory dump above by inserting the following check:
    ```
    true [
        s/tail: as cell! buf1
        unit: UCS-4
        s:    Latin1-to-UCS4 s		;-- upgrade to UCS-4
        buf4: as int-ptr! s/tail
        end:  (as byte-ptr! s/offset) + s/size
    if cp = -1159942176 [print "cp is already wrong" halt]
        buf4/value: cp
        buf4: buf4 + 1
    ]
    ```
    The result is negative, that line is never printed, so `cp` is never wrong. As we are calling `Latin1-to-UCS4` function, it could be an edge case problem, as that function can expand the series buffer if too small, triggering a GC pass in the middle of that code. As `cp` is read from `src`, and that's a direct pointer to a string buffer, it could be that `src` not being refreshed after `Latin1-to-UCS4` call, it could then point to a wrong memory location. But that hypothesis is quickly dropped as the input strings passed to the UTF-8 loader are allocated using `allocate` which relies on `malloc()`, so is indifferent to Red's GC.
    
    At this point, we strongly suspect a edge case problem, probably related to a string buffer expansion in `Latin1-to-UCS4`, triggering a GC pass, and causing the memory corruption. We need now to analyse more in depth `Latin1-to-UCS4` and its possible side-effects in a GC pass context.
    
    In the `Latin1-to-UCS4` function, the relevant part is:
    ```
    used: as-integer s/tail - s/offset
    used: used << 2
    if used > s/size [					;-- ensure we have enough space
        s: expand-series s used + 4				;-- reserve one more for edge cases
    ]
    ```
    Now that we are very close to finding the root cause, Qingtian is proposing to leave the conclusion as an exercise for the reader, as dinner time is passing already.... 😉  Though, it might be still too hard for readers to figure it out, so let's unpack the last steps.
    
    The first hint in the code above is that `used` is appearing alone in the test that decideds for the expansion or not of the series buffer. But when expansion is happening, we request `used + 4` bytes instead of `used`... So, as the comment implies, we need to reserve one more slot in the buffer for an extra character, but we miss the chance to expand the buffer if we are on that aformentioned edge case. If we try to replace the conditional expression by `used + 4 > s/size`, the crash disappears! 💯 
    
    **3. Providing a fix for the issue**
    
    As I vaguely remember that this conditional expression has been the cause of issues in the past, I have a quickly look at the other similar functions used for upgrading internal string representations, this is what we find there:
    ```
    Latin1-to-UCS2:
    ...
    used: used << 1 
    if used + 2 > s/size [				;-- ensure we have enough space
        s: expand-series s used + 2			;-- reserve one more for edge cases
    ]
    ...
    
    Latin1-to-UCS4:
    ...
    used: used << 2
    if used > s/size [				;-- ensure we have enough space
        s: expand-series s used + 4			;-- reserve one more for edge cases
    ]
    ...
    
    UCS2-to-UCS4:
    ...
    used: used << 1
    if used > s/size [				;-- ensure we have enough space
        s: expand-series s used + 4
    ]
    ...
    ```
    We can see that `UCS2-to-UCS4` exhibits the same bug, while `Latin1-to-UCS2` does not, hinting at a past fix... interesting, let's use `git blame` feature to examine the history of changes on that line:
    
    ![image](https://user-images.githubusercontent.com/411393/50572356-e0bcd400-0df9-11e9-9fca-6d978916ac36.png)
    
    So we see that the line 181 was modified by commit ec6b1fac7106a053bc71da6c86cba2b0b1ddef87. Let's git blame the previous version now:
    
    ![image](https://user-images.githubusercontent.com/411393/50572380-807a6200-0dfa-11e9-8a4c-9614de9b78b4.png)
    
    And the version before:
    
    ![image](https://user-images.githubusercontent.com/411393/50572382-9ee05d80-0dfa-11e9-990f-564cb032108d.png)
    
    Now, we have a complete history of what happened there, to shed more lights on why the issue was fixed for one of the conversion functions and not the others. We can first notice that the initial code was correct, but not very clear as the `>=` comparator is used instead of more natural `>` (trigger an expansion if the needed size is *strictly* bigger than the already allocated one). That subtle conditional condition is probably the cause of the subsequent issues. The first change commit introduced the bug in all three functions, that was then fixed by the subsequent commit, but only on `Latin1-to-UCS2` function. 
    
    When we look at the commit that introduced the bug, we want to know if it was related to a bug fix or something else. The commit is b5e37988b458199d1f922edcda00fbeb0ebdb8f6 and is related to the big refactoring done to move many series actions code into the parent virtual type `series!`. It seems that the bug was introduced in an attempt to fix a regression introduced by the big refactoring, though it's speculation as nor Qingtian nor myself can remember the cause of that particular change. Anyway, it confirms that the original code was correct and that the conditionl expression needs to account for the extra slot as does the expansion call.
    
    We can now implement a safe fix for it, and spread it other the thee similar functions. After running all the whole Red unit tests to ensure that this fix causes no regression, we can finally submit it to red/red repo and have a well-deserved dinner!. 😀 

--------------------------------------------------------------------------------

On 2019-01-02T19:25:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/3692#issuecomment-450958935>

    An elaboration on why an extra character is added to the buffer :point_up: [January 2, 2019 8:16 AM](https://gitter.im/red/red?at=5c2c4913f6166a3027a6eee0)

