
#5294: Invalid codepoints cause a mess
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5294>

**Describe the bug**

I tried to use `string!` datatype for something it was not designed for - a self-expanding vector that would occupy minimal space most of the time, but would expand automatically when it has values over 7 bits in length. Looks like legit use, no? String can have 32 bits per char internally.

It turns out I can't normally do that though:
```
>> to char! 110000h
*** Script Error: value out of range: 1114112
*** Where: to
*** Near : to char! 1114112
*** Stack:
```

There's a hack though (floats):
```
>> to char! 1e9
== #"빲�"
>> to integer! to char! 1e9
== 1000000000
```

But it causes errors:
```
>> s: form to char! 1e9
== "빲�"
>> view [base s]
Error: to-utf16 codepoint overflow
Error: to-utf16 codepoint overflow
Error: to-utf16 codepoint overflow

>> transcode form to char! 1e9
*** Script Error: Invalid char! value: #"빲�"
*** Where: transcode
*** Near : transcode form to char! 1000000000.0
*** Stack:
```

And if I enable highlighting it terminates the GUI console:
```
>> gui-console-ctx/terminal/color?: on
== true
>> s: form to char! 1e9
== "빲�"
Error: to-utf16 codepoint overflow
*** Script Error: Invalid char! value: #"빲�"
*** Where: transcode
*** Near : exit
*** Stack: ask ask
Error: to-utf16 codepoint overflow

(terminated, brutally)
```

**Expected behavior**

I suppose my use case won't be supported, so I'm left with manual vector conversion. 
Floats case must be fixed then though.

On a second thought, what if unicode *consortium* decides one day 1.1M codepoints isn't enough, and widens the range. What then? Will Red apps just stop working?

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4629 date: 28-Jan-2023/11:28:13 commit: #ec0c31279023590e285fb2e1869380670ee0239f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-03-06T18:28:36Z, greggirwin, commented:
<https://github.com/red/red/issues/5294#issuecomment-1456723934>

    I wouldn't expect this to work at all. Strings are not binary data in our world. If Unicode does that, it won't be just Red that has a problem.

--------------------------------------------------------------------------------

On 2023-03-16T15:45:43Z, dockimbel, commented:
<https://github.com/red/red/issues/5294#issuecomment-1472228928>

    After the fix:
    ```
    >> to char! 1e9
    *** Script Error: value out of range: 1000000000.0
    *** Where: to
    *** Near : to char! 1000000000.0
    *** Stack: 
    ```

--------------------------------------------------------------------------------

On 2023-03-16T15:46:32Z, dockimbel, commented:
<https://github.com/red/red/issues/5294#issuecomment-1472230360>

    > On a second thought, what if unicode consortium decides one day 1.1M codepoints isn't enough, and widens the range. What then? Will Red apps just stop working?
    
    If that happens, we just raise the upper limit for characters to whatever they decide to put it. 

