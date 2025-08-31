
#4971: [View] CRASHES when RICH-TEXT face is created carelessly
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[status.problem] [status.reviewed] [type.design]
<https://github.com/red/red/issues/4971>

Related: https://github.com/red/red/issues/3814 https://github.com/red/red/issues/4269

**Describe the bug**

This bug was found by @GalenIvanov.
From newcomer's perspective this is a perfectly valid way to create a rich-text face: `make face! [type: 'rich-text]`. But that face is malformed because `rich-text` face has a few extra facets:
```
>> exclude words-of make-face 'rich-text words-of face!
== [tabs line-spacing handles]
```
Since @qtxie uses [indexed access to face fields](https://github.com/red/red/issues/3814#issuecomment-485115049), and that's *inside info*, people will keep tripping up on this issue and get View to crash (which is hard to debug when you don't know where to look).

GC is likely just a trigger here, not the culprit, though in more complex code I saw GC triggering a new cycle before finishing the previous: `root: 4828/7536, runs: 0, mem: 3281036root: 4828/7536, runs: 0, mem: 3281036 => 1825248, mark: 4.0ms, sweep: 2.0ms`

**To reproduce**

Run this in console:
```
txt: make face! [size: 50x50 type: 'rich-text text: "welwalla" font: make font! []]
caret-to-offset txt 0
recycle
```
To crash it:
```
root: 4828/7536, runs: 0, mem: 2290896
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/collector.reds
*** at line: 87
***
***   stack: red/collector/keep 00000000h
***   stack: red/_hashtable/mark 02D6A614h
***   stack: red/collector/mark-context 02D6A61Ch
***   stack: red/collector/mark-values 02C66600h 02C66610h
***   stack: red/collector/mark-block-node 02D6A604h
***   stack: red/collector/mark-values 02C684A0h 02C68500h
***   stack: red/collector/mark-block 02C68418h
***   stack: red/collector/mark-values 02C68418h 02C68468h
***   stack: red/collector/mark-block-node 02D6A4E0h
***   stack: red/collector/mark-values 02B6E4C8h 02B6E4D8h
***   stack: red/collector/mark-context 028DB1E8h
***   stack: red/collector/mark-values 02C24BA8h 02C24BC8h
***   stack: red/collector/mark-block-node 02D6CECCh
***   stack: red/collector/mark-context 02D6CED0h
***   stack: red/collector/mark-values 02C24548h 02C24558h
***   stack: red/collector/mark-block 02B72950h
***   stack: red/collector/mark-values 02B72950h 02B72A30h
***   stack: red/collector/mark-block-node 028DAF04h
***   stack: red/collector/mark-context 028DAF08h
***   stack: red/collector/mark-values 029C8908h 029C8928h
***   stack: red/collector/mark-block-node 028DE3F0h
***   stack: red/collector/mark-context 028DE3F4h
***   stack: red/collector/mark-values 029019F8h 029089C8h
***   stack: red/collector/mark-block-node 028E3880h
***   stack: red/collector/mark-context 028E3884h
***   stack: red/collector/mark-values 0279F02Ch 027B1DBCh
***   stack: red/collector/mark-block 0053B98Ch
***   stack: red/collector/do-mark-sweep
***   stack: red/natives/recycle* false -1 -1
***   stack: red/interpreter/eval-arguments 027BC7FCh 02C65048h 02C65048h 00000000h 00000000h 029013D8h
***   stack: red/interpreter/eval-code 029013D8h 02C65048h 02C65048h false 00000000h 00000000h 029013D8h
***   stack: red/interpreter/eval-expression 02C65048h 02C65048h false false false
***   stack: red/interpreter/eval 027BC7DCh true
***   stack: red/natives/catch* true 1
***   stack: ctx||568~try-do 02D71920h
***   stack: ctx||568~launch 02D71920h
***   stack: ctx||587~launch 02D71334h
```

**Expected behavior**

Instead of crashes, we should either display an error message that this is not a valid `rich-text` face, or all missing facets should be treated as being equal to `none`.

**Platform version**
```
Red 0.6.4 for Windows built 18-Sep-2021/18:49:23+03:00  commit #5d45a0e
```



