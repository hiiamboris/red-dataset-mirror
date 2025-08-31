
#3487: FEAT: Make `help-string` available without console
================================================================================
Issue is closed, was reported by greggirwin and has 10 comment(s).
<https://github.com/red/red/issues/3487>

### Expected behavior

You should be able to use `help-string`, if not `help`, in non-console apps. If there is no console object, output should not wrap.

### Actual behavior

`help-string` crashes, because it depends on the console object existing to determine when to wrap output. 

### Steps to reproduce the problem

e.g. `print [help-string "-thru"]`

### Red and platform version
```
-----------RED & PLATFORM VERSION-----------
Should be the same on all.

RED: [ branch: "master" tag: #v0.6.0 ahead: 3561 date: 24-Jul-2018/23:29:28 commit: #f77e751ad310318172fd5b714c6f41c4b7004e9b ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-29T20:32:14Z, greggirwin, commented:
<https://github.com/red/red/issues/3487#issuecomment-408703869>

    Or maybe it should format just as the console would, truncating if needed, at a configurable width in characters.

--------------------------------------------------------------------------------

On 2018-07-29T21:26:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3487#issuecomment-408707096>

    @PeterWAWood since %help.reds isn't included by default--only for console builds--what is the standard way to include it for test purposes?

--------------------------------------------------------------------------------

On 2018-07-29T21:38:18Z, greggirwin, commented:
<https://github.com/red/red/issues/3487#issuecomment-408707768>

    I have this change made, but won't push a PR until I have tests, if we have a solution for that.

--------------------------------------------------------------------------------

On 2018-08-03T07:30:03Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3487#issuecomment-410170001>

    @greggirwin It should work if you include %help.reds in a #system block and then define a routine! to access it. 
    
    I hope that it won't require the `-r` option to compile.
    

--------------------------------------------------------------------------------

On 2018-08-04T17:27:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3487#issuecomment-410464967>

    Sorry, should have been %help.red, not %.reds. Just wasn't sure if #include-ing  was how you wanted things done. Thanks.

