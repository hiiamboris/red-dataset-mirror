
#4990: [Regression] FORALL destroys stack
================================================================================
Issue is closed, was reported by hiiamboris and has 26 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4990>

**Describe the bug**

Ruined my Spaces demos ;)

Script:
```
Red []
s: "abc" 
forever [
	forall s [probe s continue]
]
```
Output after ~1 second:
```
"abc"
"bc"
"c"
"abc"
"bc"
"c"
*** Internal Error: stack overflow
*** Where: mold
*** Stack: probe
```

This also opens a good opportunity to catch & locate the No CAT for THROW:
```
Red []
s: "abc" 
view [base rate 100 on-time [forall s [unview continue]]]
```
Results in:
```
*** Runtime Error 95: no CATCH for THROW
*** in file: common.reds
*** at line: 281
***
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
```

**Expected behavior**

Cat thrown, stack stays afloat.

**Platform version**
Regressed between
`Red 0.6.4 for Windows built 12-Sep-2021/20:36:44+03:00  commit #9aea165`
and
`Red 0.6.4 for Windows built 18-Sep-2021/18:49:23+03:00  commit #5d45a0e`


Comments:
--------------------------------------------------------------------------------

On 2021-11-02T12:41:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/4990#issuecomment-957477940>

    Other issues where `95: no CAT for THROW` appears (may be somewhat related): #4897 #4547 [#4497 (comment)](https://github.com/red/red/issues/4497#issuecomment-639074552) #4375 [#4323 (comment)](https://github.com/red/red/issues/4323#issuecomment-819673337) [#4319 (comment)](https://github.com/red/red/issues/4319#issuecomment-631968841)
    

--------------------------------------------------------------------------------

On 2021-11-03T14:21:18Z, dockimbel, commented:
<https://github.com/red/red/issues/4990#issuecomment-959220933>

    > This also opens a good opportunity to catch & locate the No CAT for THROW:
    
    That should be in another ticket, as it does not seem related to the original issue.

--------------------------------------------------------------------------------

On 2021-11-03T14:41:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/4990#issuecomment-959288740>

    Looks related to me as it doesn't happen in 12-Sep build.

--------------------------------------------------------------------------------

On 2022-02-23T17:15:21Z, dockimbel, commented:
<https://github.com/red/red/issues/4990#issuecomment-1049015394>

    @hiiamboris I cannot reproduce this issue. I tried compiling and running from GUI console, all works fine. I've waited more than a minute in both cases.

--------------------------------------------------------------------------------

On 2022-02-23T17:40:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/4990#issuecomment-1049039695>

    Really? That would be weird. Because I can reproduce both errors with any console (debug/release, GUI/CLI). No CAT happens in about a second, no need to wait.

--------------------------------------------------------------------------------

On 2022-02-23T17:41:42Z, dockimbel, commented:
<https://github.com/red/red/issues/4990#issuecomment-1049040833>

    On which platform? I'm testing on W10 here.

--------------------------------------------------------------------------------

On 2022-02-23T17:42:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4990#issuecomment-1049041532>

    Both Windows and Linux.

--------------------------------------------------------------------------------

On 2022-02-23T17:42:49Z, dockimbel, commented:
<https://github.com/red/red/issues/4990#issuecomment-1049041860>

    Did you try with the latest commit?

--------------------------------------------------------------------------------

On 2022-02-23T17:43:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4990#issuecomment-1049042946>

    `Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7`
    did anything change since?

--------------------------------------------------------------------------------

On 2022-02-23T17:45:52Z, dockimbel, commented:
<https://github.com/red/red/issues/4990#issuecomment-1049044614>

    I can only reproduce the one with `view`, the first script works fine for me.

--------------------------------------------------------------------------------

On 2022-02-23T17:51:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4990#issuecomment-1049049143>

    Tried compiling. With `-c -e` both errors remain as described. With just `-c` first script is OK (of course, compiled forall is different), `view` one is crashing with no cat.

--------------------------------------------------------------------------------

On 2022-02-23T18:08:59Z, dockimbel, commented:
<https://github.com/red/red/issues/4990#issuecomment-1049065732>

    Let me know if this fix works for you.

--------------------------------------------------------------------------------

On 2022-02-23T18:16:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4990#issuecomment-1049072092>

    Yes, fixed!

