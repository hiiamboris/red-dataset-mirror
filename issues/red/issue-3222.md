
#3222: Documentation errs of Draw
================================================================================
Issue is closed, was reported by toomasv and has 2 comment(s).
<https://github.com/red/red/issues/3222>

### Expected behavior
Documentation and Red behaviour match.
### Actual behavior
Documentation for Draw says the order of transform arguments is `<angle> <center> <scale-x> <scale-y> <translation>`. But it is actually `<center> <angle>...`
### Steps to reproduce the problem
```
>> view compose/deep [box 100x100 draw [transform 50x50 20 1 1 0x0 [box 10x10 90x90]]]
>> view compose/deep [box 100x100 draw [transform 20 50x50 1 1 0x0 [box 10x10 90x90]]]
*** Script Error: invalid Draw dialect input at: [50x50 1 1 0x0 [box 10x10 90x90]]
*** Where: ???
```
### Red version and build date, operating system with version.
```
system/build
== make object! [
    date: 3-Feb-2018/19:18:46+02:00
```
W10Pro



Comments:
--------------------------------------------------------------------------------

On 2018-02-11T18:42:57Z, greggirwin, commented:
<https://github.com/red/red/issues/3222#issuecomment-364776176>

    https://github.com/red/docs/commit/e32dd4af593c1f85cf6f5c9afbe1ab0a86a94c11 fixes it for the English docs. Not sure I should try to fix the other langs.

