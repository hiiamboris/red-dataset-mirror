
#4547: [CRASH, Regression] GUI console blacks out and crashes with `colors: on` after path input
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.tested] [type.bug]
<https://github.com/red/red/issues/4547>

I think @qtxie recently fixed this, but it's back again.

**Describe the bug**
![](https://i.gyazo.com/3f16287e74aadaacdb0bf6981a54733b.gif)
Crash dump:
```
*** Runtime Error 95: no CATCH for THROW
*** in file: common.reds                
*** at line: 272                        
***                                     
***   stack: ***-uncaught-exception     
***   stack: ***-uncaught-exception     
```

**To reproduce**

1. Type `gui-console-ctx/terminal/color?: yes` \<Enter\>
2. Type `a/b/c`
3. Hit \<Escape\>

**Expected behavior**

No crash. No blackout of input line & Red version.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 24-Jun-2020/13:10:46
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-09T22:00:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4547#issuecomment-656372075>

    There's a whole set of open **crash** issues with the same signature `Runtime Error 95: no CATCH for THROW`:
    https://github.com/red/red/issues/3991 https://github.com/red/red/issues/4375 https://github.com/red/red/issues/4497  https://github.com/red/red/issues/4202 https://github.com/red/red/issues/4053 https://github.com/red/red/issues/4319
    Some of them are notoriously annoying.

--------------------------------------------------------------------------------

On 2022-09-06T09:10:52Z, qtxie, commented:
<https://github.com/red/red/issues/4547#issuecomment-1237877735>

    No issue anymore in commit 3f7754b097df97449241204b7796f5764ba7c7f2.

