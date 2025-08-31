
#5619: Treat a digit (or digits)  followed by ' as a valid integer
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.wish] [test.written]
<https://github.com/red/red/issues/5619>

**Describe the wish**
123" is not currently considered a valid integer. It causes a script error.
```
--== Red 0.6.6 ==-- 
Type HELP for starting information. 

>> type? 123'
*** Syntax Error: (line 1) invalid integer at 123'
*** Where: set
*** Near : transcode/trace buffer :delimiter-lex
*** Stack: error? load
>> 
```

When a user is entering a number using the ' thousands separator, the following can be observed:


|key pressed: | text value | data type | data value |
|-----------------|---------------|--------------|---------------|
|      1            |         "1"     | integer!    |         1       |
|      2            |       "12"     | integer!    |       12       |
|      3            |     "123"     | integer!    |     123       |
|       '            |    "123'"     | none!       |    none       |
|     4             | "123'4"      | integer!    |    1234       |

It can create an additional special case that needs to be dealt with in event handlers.

Accepting 123' as an integer! seems to be consistent with accepting 123. as a float!
 
**Hoped for behavior**
A digit (or digits) followed by a ' will be accepted as a valid integer

**Platform version**

-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 67 date: 30-May-2025/6:49:11 commit: #979d8e1bf808fd0c43ebe58806404f1be010f9c1 ]
PLATFORM: [ name: "Raspbian GNU/Linux 12 (bookworm)" OS: 'Linux arch: 'aarch64 version: 6.12.25 build: {#1 SMP PREEMPT Debian 1:6.12.25-1+rpt1 (2025-04-30)} ]
--------------------------------------------
Note: The OS is a 32-bit version


Comments:
--------------------------------------------------------------------------------

On 2025-06-15T20:55:29Z, meijeru, commented:
<https://github.com/red/red/issues/5619#issuecomment-2974687673>

    I see two incompatible reasonings here: if the single quote is a **separator** as you yourself call it, it must be between two digits; if it is a filler without meaning, it can be at the end. Of course the most relaxed solution is to call it a filler that can be anywhere (except at the very beginning). In any case, it is not a **thousands separator** because it is not compulsory to have it mark off 3 digits.

--------------------------------------------------------------------------------

On 2025-06-16T19:00:40Z, greggirwin, commented:
<https://github.com/red/red/issues/5619#issuecomment-2977748466>

    "group separator" is the term we should use. 

