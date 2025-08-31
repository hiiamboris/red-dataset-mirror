
#4128: Weird #include behavior with #macros
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/4128>

Somewhat related are https://github.com/red/REP/issues/56 https://github.com/red/red/issues/2484 https://github.com/red/red/issues/3921

**Describe the bug**

Under some circumstances #included #macros are not being expanded.
Using a similar, to REP 56 file structure:
```
> dir /b /s
4.red    
q        
q\1.red  
q\2.red  
q\3.red  
```
The contents of each file (whole lot can be [downloaded here](https://gitlab.com/uploads/-/system/personal_snippet/1911504/6efeeb0e9fc1c608ca824b7362434393/bug4128.zip)):
```
>type 4.red
Red [] #include %q/2.red probe [NOT-EXPANDED]

>type q\1.red
Red [] #macro ['NOT-EXPANDED] func [s e] [ [EXPANDED] ]

>type q\2.red
Red [] #include %1.red probe [NOT-EXPANDED]

>type q\3.red
Red [] do expand-directives rejoin [load %1.red 'do [probe [NOT-EXPANDED]]]
```
The result of execution of `2.red` is expected:
```
>red "q\2.red"
[EXPANDED]
```
`3.red` is a nasty workaround (kudos to @9214) that does the same without #include, using interpreter:
```
>red "q\3.red"
[EXPANDED]
```

What's interesting is that when I then #include `2.red` (which works fine) from the parent (or any other) directory, macros are not expanded anymore in both `4.red` (that includes previously working `2.red`) and `2.red`:
```
>red "4.red"
[NOT-EXPANDED]
[NOT-EXPANDED]
```
Note that no error message is given by #include.

Now if I just copy `q/1.red` into `1.red` (into the parent directory where `4.red` resides):
```
>red "4.red"
[EXPANDED]
[EXPANDED]
```
All of the sudden expansion works again, even though `q/2.red` includes `q/1.red` and gives an error if `q/1.red` is inaccessible. So it shouldn't be affected by `1.red` in the parent directory.

What a mess! ☻

**Expected behavior**
```
>red "4.red"
[EXPANDED]
[EXPANDED]
```
With only `q/1.red` and not the other `1.red` present.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Oct-2019/15:33:41+03:00 commit #ed913ef
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-29T17:56:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/4128#issuecomment-829469658>

    This mess is really bothersome :/

--------------------------------------------------------------------------------

On 2024-01-04T17:10:44Z, SkySpiral7, commented:
<https://github.com/red/red/issues/4128#issuecomment-1877469519>

    I don't understand macros very well but what you described sounds like the same thing that I ran into. Here's my minimum reproducible example in case it helps narrow down the issue. If this is a different (but related) issue then let me know and I'll open a separate issue.
    
    **To reproduce**
    First create 3 files:
    ```red
    Red [
       Title: "have red run this"
       File: %top.red
    ]
    ;#include %assert.red
    #include %anotherFolder/assert-test.red
    ```
    ```red
    Red [
       Title: "use #assert"
       File: %anotherFolder/assert-test.red
    ]
    #include %../assert.red
    #assert
    ```
    ```red
    Red [
       Title: "define #assert"
       File: %assert.red
    ]
    #macro [#assert] func [s e] [
       return [print "Macro executed"]
    ]
    ```
    Then run `red top.red`. The macro won't be executed even though assert-test.red includes and uses the macro. The macro is silently ignored with no error message (should fail with "no value" or something).
    
    However adding `#include %assert.red` in top.red (before the other `#include`) will cause it to work as expected. Additionally if assert-test.red is in the same folder as top.red then things will also work as expected.
    
    Compiling with `-c` or `-r` has the same behavior. Replacing `#include` with `do` has same behavior.
    
    **Expected behavior**
    Red files should be able to include and use macros regardless of folder structure. If any macro fails to expand then an error message should be given.
    
    **Platform version**
    ```
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.4 ahead: 5080 date: 2-Jan-2024/11:40:02 commit: #b34f787db17d22f5e83fa341db4873a309dff1c2 ]
    PLATFORM: [ name: "Ubuntu 22.04.3 LTS" OS: 'Linux arch: 'x86_64 version: 6.2.0 build: {#40~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Thu Nov 16 10:53:04 UTC 2} ]
    --------------------------------------------
    ```

