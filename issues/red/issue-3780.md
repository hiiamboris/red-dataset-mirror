
#3780: dehex bug on the Mac 
================================================================================
Issue is closed, was reported by rebred and has 22 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3780>

**Describe the bug**
`dehex "%238710" ` gives the following error
```
*** Access Error: invalid UTF-8 encoding: #{E7262300}
*** Where: dehex
*** Stack:  
```
**To reproduce**
Steps to reproduce the behavior:
`dehex "%238710"`

**Expected behavior**
A clear and concise description of what you expected to happen.

== "#8710"

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 4-Feb-2019/19:45:38+01:00 commit #a4d8240
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-14T00:18:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/3780#issuecomment-463430840>

    Strangely, the same code is OK on W7 0.6.4 30-Jan-2019.

--------------------------------------------------------------------------------

On 2019-02-14T07:34:37Z, greggirwin, commented:
<https://github.com/red/red/issues/3780#issuecomment-463523294>

    I can't reproduce on Win10. This seems like it shouldn't be platform specific.

--------------------------------------------------------------------------------

On 2019-02-14T09:03:46Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3780#issuecomment-463548029>

    In the cli-console: 
    
    ```text
    >> about
    Red 0.6.4 for macOS built 14-Feb-2019/16:55:25+08:00
    
    >> dehex "%238710"
    == "#8710"
    ```
    
    In the gui-console:
    ```text
    >> dehex "%238710"
    == "#8710"
    >> about
    Red 0.6.4 for macOS built 14-Feb-2019/16:57:04+08:00
    ```

--------------------------------------------------------------------------------

On 2019-02-14T10:03:47Z, 9214, commented:
<https://github.com/red/red/issues/3780#issuecomment-463567870>

    `dehex` isn't platform-specific.

--------------------------------------------------------------------------------

On 2019-02-14T20:28:22Z, rebred, commented:
<https://github.com/red/red/issues/3780#issuecomment-463782097>

    `dehex "%9C%26%238721%3B%AE%B4%86%A9%F8%83%26%238706%3B%26%23729%3Bpdsjbkz"`
    
    gives the following error
    ```
    *** Access Error: invalid UTF-8 encoding: #{F8832623}
    *** Where: dehex
    *** Stack:  
    
    ```
    
    

--------------------------------------------------------------------------------

On 2019-02-14T20:50:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/3780#issuecomment-463790524>

    Could be something to do with endianness? @rebred is your Mac OS on big-endian CPU?

--------------------------------------------------------------------------------

On 2019-03-12T10:55:10Z, 9214, commented:
<https://github.com/red/red/issues/3780#issuecomment-471952600>

    > dehex "%9C%26 ...
    
    Unless I'm missing something, `9C` is a continuation byte (starts with `10`) and cannot be the first byte of a code unit. Makes me think that this string doesn't use UTF-8 encoding table at all.
    ```red
    >> enbase/base #{9C} 2
    == "10011100"
    ```

--------------------------------------------------------------------------------

On 2019-09-10T23:04:06Z, dockimbel, commented:
<https://github.com/red/red/issues/3780#issuecomment-530153350>

    Revelant definitions: https://en.wikipedia.org/wiki/Percent-encoding

--------------------------------------------------------------------------------

On 2020-03-23T19:40:59Z, 9214, commented:
<https://github.com/red/red/issues/3780#issuecomment-602815163>

    Cf. [RFC 3986](https://tools.ietf.org/html/rfc3986), a valid set of percent-encoded characters is:
    
    
    ! | # | $ | % | & | ' | ( | ) | * | + | , | / | : | ; | = | ? | @ | [ | ]
    -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | --
    %21 | %23 | %24 | %25 | %26 | %27 | %28 | %29 | %2A | %2B | %2C | %2F | %3A | %3B | %3D | %3F | %40 | %5B | %5D
    
    Thus:
    
    In the [original](https://github.com/red/red/issues/3780#issue-410013226) report (which no one ever been able to reproduce):
    
    | Part | Decoding |
    |:-|:-|
    | `%23 8710` | `#8710` |
    
    Note the reported error message:
    
    ```red
    *** Access Error: invalid UTF-8 encoding: #{E7262300}
    *** Where: dehex
    *** Stack:  
    ```
    `E726` are trash bytes that precede `23` (`#` character), which is then followed by a null byte. That doesn't match the provided input. And if it does then the input is malformed and cannot be properly decoded.
    
    In [subsequent](https://github.com/red/red/issues/3780#issuecomment-463782097) report:
    
    | Part | Decoding |
    |:-|:-|
    | `%9C` | Trash byte |
    | `%26%23 8721 %3B` | `&#8721;` |
    | `%AE%B4%86%A9%F8%83` | Trash bytes |
    | `%26%23 8706 %3B` | `&#8706;` |
    | `%26%23 729 %3B` | `&#729;` |
    | `pdsjbkz` | `pdsjbkz` |
    
    
    Unless someone provides a reproducible example, I propose we close this.

--------------------------------------------------------------------------------

On 2020-07-30T12:07:39Z, 9214, commented:
<https://github.com/red/red/issues/3780#issuecomment-666325514>

    ↑ ping.

--------------------------------------------------------------------------------

On 2020-10-05T11:46:12Z, dockimbel, commented:
<https://github.com/red/red/issues/3780#issuecomment-703579364>

    Closing as it can't be reproduced.

