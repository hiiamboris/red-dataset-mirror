
#3341: The alpha transparency background color is ignored in text faces
================================================================================
Issue is closed, was reported by smarks159 and has 6 comment(s).
<https://github.com/red/red/issues/3341>

### Expected behavior
When creating a text face the alpha transparency of the background color should be applied
### Actual behavior
The alpha transparency value in the text face is ignored.

### Steps to reproduce the problem
create a text face with an alpha transparency of any value other than zero. The color is correct but the alpha transparency value is ignored.
```
view [ text 153.204.255.255 ]
```
using base instead of text has the correct behavior
```
view [ base 153.204.255.255 ]
```
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 595 date: 6-Apr-2018/13:49:30 commit: #f53f9073931e1acc7ee00e9ddad4615e14326a68 ]
PLATFORM: [ name: "Windows 7" OS: 'Windows arch: 'x86-64 version: 6.1.0 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-22T02:09:21Z, qtxie, commented:
<https://github.com/red/red/issues/3341#issuecomment-383348879>

    It's a known limitation in native controls. 

--------------------------------------------------------------------------------

On 2018-04-22T02:46:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3341#issuecomment-383351058>

    @smarks, join the chat on gittter.im/red/red (and other rooms). Often times you'll get a quick answer, and save a ticket.

--------------------------------------------------------------------------------

On 2018-04-22T15:27:31Z, smarks159, commented:
<https://github.com/red/red/issues/3341#issuecomment-383389598>

    Thanks.  I will make sure to use gitter first next time.

