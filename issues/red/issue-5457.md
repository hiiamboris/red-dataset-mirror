
#5457: Lexer-test #4781 fails on Raspberry Pi
================================================================================
Issue is closed, was reported by PeterWAWood and has 10 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/5457>

**Describe the bug**
```
>> do %lexer-test.red
~~~started test~~~ lexer
===group=== issues
--test-- #4781 FAILED**************
~~~finished test~~~  lexer
  Number of Tests Performed:      500
  Number of Assertions Performed: 912
  Number of Assertions Passed:    911
  Number of Assertions Failed:    1
****************TEST FAILURES****************
```
The issue seems to be related to float (in)accuracies:
```
>>    3:3:3.3000000001 = transcode/one "3:3:3.3"
== false
>> transcode/one "3:3:3.3"
== 3:03:03.3
```
**To reproduce**
As above

**Expected behavior**
The behaviour shoud be as consistent as possible across all platforms.

**Platform version**
```
>> about/debug
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5075 date: 22-Dec-2023/9:07:34 commit: #6cb7d502bcbfae8b00630adee6561909eee2b478 ]
PLATFORM: [ name: "Raspbian GNU/Linux 11 (bullseye)" OS: 'Linux arch: 'aarch64 version: 6.1.21 build: "#1642 SMP PREEMPT Mon Apr  3 17:24:16 BST 2023" ]
--------------------------------------------
```



Comments:
--------------------------------------------------------------------------------

On 2024-01-02T10:19:34Z, PeterWAWood, commented:
<https://github.com/red/red/issues/5457#issuecomment-1873838437>

    A suggestion is to check each part of the time value separately:
    ```
    --assert 3 = first transcode/one "3:3:3.3"
    --assert 3 = second transcode/one "3:3:3.3"
    --assertf~= 3.3 third transcode/one "3:3:3.3" 1E-13
    ```
    This should work uniformly on different architectures.

--------------------------------------------------------------------------------

On 2024-01-04T03:23:08Z, qtxie, commented:
<https://github.com/red/red/issues/5457#issuecomment-1876256448>

    It fails on Windows too.
    ```
    >> about
    Red 0.6.4 for Windows built 2-Jan-2024/19:40:02+08:00  commit #b34f787
    >> 3:3:3.3000000001 = transcode/one "3:3:3.3"
    == false
    ```

--------------------------------------------------------------------------------

On 2024-01-04T18:11:39Z, greggirwin, commented:
<https://github.com/red/red/issues/5457#issuecomment-1877548688>

    ```
    >> t: transcode/one "3:3:3.3"
    == 3:03:03.3
    >> t/second
    == 3.299999999999272
    >> t: 3:3:3.3000000001
    == 3:03:03.3
    >> t/second
    == 3.300000000099317
    ```

--------------------------------------------------------------------------------

On 2024-01-04T18:50:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/5457#issuecomment-1877597670>

    Looks like an issue with `equals?` to me, not with the test.

--------------------------------------------------------------------------------

On 2024-01-13T15:33:27Z, dockimbel, commented:
<https://github.com/red/red/issues/5457#issuecomment-1890503575>

    This is another compiler vs interpreter difference. The compiler's lexer (using R2) does not produce the exact same float representation as the runtime lexer. I have changed the test to run only through the interpreter until we get rid of the compiler.

