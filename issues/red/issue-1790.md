
#1790: Console crash when viewing an image from a web address
================================================================================
Issue is closed, was reported by Zamlox and has 0 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/1790>

When I execute following command within Red 0.6.0 gui console it will crash:
`view  [image http://www.ece.rice.edu/~wakin/images/lenaTest1.jpg]`

After executing in debug mode  I got following output:
`--== Red 0.6.0 ==--
Type HELP for starting information.

opts: context [type offset size text color enable?...

**\* Runtime Error 1: access violation
**\* in file: /D/dev/Red/source/red/runtime/datatypes/common.reds
**\* at line: 38

---

**\*   stack: red/alloc-at-tail 00000000h
**\*   stack: red/block/rs-append 00000000h 0049B1ACh
**\*   stack: red/simple-io/request-http 0 024C41D0h 00000000h 00000000h true false true
**\*   stack: red/url/read 024C41D0h 024C41C0h 024C41C0h true false true 024C41C0h
**\*   stack: red/actions/read 024C41D0h 024C41C0h 024C41C0h true false true 024C41C0h
**\*   stack: red/actions/read\* -1 -1 1 -1 1 -1
**\*   stack: load
**\*   stack: ctx224~pre-load 0034DD60h
**\*   stack: ctx224~fetch-options 0034DD60h
**\*   stack: layout 0034DD60h
**\*   stack: view
**\*   stack: red/_function/call 0255D7DCh 0035388Ch
**\*   stack: red/interpreter/eval-code 0255D7DCh 0257E290h 0257E290h false 00000000h 00000000h 0255D7DCh
**\*   stack: red/interpreter/eval-expression 0257E280h 0257E290h false false
**\*   stack: red/interpreter/eval 024C3B80h true
**\*   stack: red/natives/do\* false -1
**\*   stack: red/interpreter/eval-arguments 0255C99Ch 0255064Ch 0255064Ch 00000000h 00000000h
**\*   stack: red/interpreter/eval-code 0255C99Ch 0255063Ch 0255064Ch true 00000000h 00000000h 0255C99Ch
**\*   stack: red/interpreter/eval-expression 0255063Ch 0255064Ch false true
**\*   stack: red/interpreter/eval-arguments 0255BF3Ch 0255062Ch 0255064Ch 0255060Ch 02550660h
**\*   stack: red/interpreter/eval-code 0255BF3Ch 0255061Ch 0255064Ch true 0255060Ch 02550660h 0255BF3Ch
**\*   stack: red/interpreter/eval-path 0255060Ch 0255061Ch 0255064Ch false false false false
**\*   stack: red/interpreter/eval-expression 0255061Ch 0255064Ch false false
**\*   stack: red/interpreter/eval 024C3B50h true
**\*   stack: red/natives/catch\* true 1
**\*   stack: ctx255~try-do 0034CCC8h
**\*   stack: red/_function/call 0253A740h 0034CCC8h
**\*   stack: red/interpreter/eval-code 0253A740h 02550D10h 02550D60h true 00000000h 00000000h 0253A740h
**\*   stack: red/interpreter/eval-expression 02550D00h 02550D60h false true
**\*   stack: red/interpreter/eval-arguments 0255BF3Ch 02550CF0h 02550D60h 02550CD0h 02550D74h
**\*   stack: red/interpreter/eval-code 0255BF3Ch 02550CE0h 02550D60h true 02550CD0h 02550D74h 0255BF3Ch
**\*   stack: red/interpreter/eval-path 02550CD0h 02550CE0h 02550D60h false false false false
**\*   stack: red/interpreter/eval-expression 02550CE0h 02550D60h false false
**\*   stack: red/interpreter/eval 024C3AD0h true
**\*   stack: red/natives/unless\* false
**\*   stack: red/interpreter/eval-arguments 0255C83Ch 02550BACh 02550BCCh 00000000h 00000000h
**\*   stack: red/interpreter/eval-code 0255C83Ch 02550B7Ch 02550BCCh false 00000000h 00000000h 0255C83Ch
**\*   stack: red/interpreter/eval-expression 02550B7Ch 02550BCCh false false
**\*   stack: red/interpreter/eval 024C3AB0h true
**\*   stack: red/natives/do\* true -1`



