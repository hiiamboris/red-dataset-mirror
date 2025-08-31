
#4250: crash when parsing corrupted float
================================================================================
Issue is closed, was reported by loziniak and has 10 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/4250>

In Red console I get this error when trying to parse truncated `float!` string, and console crashes:
```
>> to float! "12e4"
== 120000.0
>> to float! "12e"

*** Runtime Error 1: access violation
*** in file: /home/devel/prj/red/gtk/red-github/runtime/dtoa.reds
*** at line: 1334
***
***   stack: red/dtoa/parse-exponent 08457000h 081E00BEh
***   stack: red/dtoa/to-float 081E00BBh 081E00BEh FFACD93Ch
***   stack: red/string/to-float 081E00BBh 3 FFACD93Ch
***   stack: red/tokenizer/scan-float F5398EE3h 3 1 FFACD93Ch
***   stack: red/float/to 09A2D854h 09A2D864h 12
***   stack: red/actions/to 09A2D854h 09A2D864h
***   stack: red/actions/to*
***   stack: red/interpreter/eval-arguments F553A7E0h F5398E58h F5398E58h 00000000h 00000000h
***   stack: red/interpreter/eval-code F553A7E0h F5398E38h F5398E58h false 00000000h 00000000h F553A7E0h
***   stack: red/interpreter/eval-expression F5398E38h F5398E58h false false false
***   stack: red/interpreter/eval 09A2D824h true
***   stack: red/natives/catch* true 1
***   stack: ctx||512~try-do F7F229ECh
***   stack: ctx||512~do-command F7F229ECh
***   stack: ctx||512~eval-command F7F229ECh
***   stack: ctx||512~run F7F229ECh
***   stack: ctx||512~launch F7F229ECh
***   stack: ctx||529~launch F7F22530h
***   stack: ***_start
```
Instead crash I'd expect an informative error message.

Platform: `Red 0.6.4 for Linux built 10-Jan-2020/15:13:57+01:00`


Comments:
--------------------------------------------------------------------------------

On 2020-01-20T12:16:50Z, 9214, commented:
<https://github.com/red/red/issues/4250#issuecomment-576249343>

    Parsing and scanning (tokenizing) are two different things. @qtxie ☝️ I think you did some work on `dtoa` refactoring in `fast-lexer` branch? Worth addressing it there.

--------------------------------------------------------------------------------

On 2020-01-20T12:43:36Z, loziniak, commented:
<https://github.com/red/red/issues/4250#issuecomment-576257976>

    So, the error happens when this `float!` is tokenized, not parsed, as `red/dtoa/parse-exponent` method would suggest? I'd say that float is already a token, so it's processing can be called parsing. Although one could argue, that float token is itself composed of tokens – coefficient end exponent, right. It's so complicated... Thanks for explanation.

--------------------------------------------------------------------------------

On 2020-01-20T12:56:08Z, 9214, commented:
<https://github.com/red/red/issues/4250#issuecomment-576262373>

    From the outset, the issue's title suggested that there's something wrong with Parse or lexer itself, while in fact it's specific to low-level tokenizers that are only partially implemented.

--------------------------------------------------------------------------------

On 2020-02-07T09:35:20Z, qtxie, commented:
<https://github.com/red/red/issues/4250#issuecomment-583309143>

    FYI. Fixed in fast-lexer branch.

--------------------------------------------------------------------------------

On 2020-07-09T15:13:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/4250#issuecomment-656187193>

    Needs a regression test written and we can close it afterwards.

