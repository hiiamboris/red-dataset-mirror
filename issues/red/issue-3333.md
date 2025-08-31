
#3333: dump-reactions instabilities and regression since march
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3333>

### consider the script:
```
Red []
c: make reactor! [x: 1]
r: context [ x: is [c/x] ]
dump-reactions
```
### 1) (Almost) Expected behavior
being copy-pasted to the GUI console window works almost fine:
```
1
:---  Source: object [x]
   Field: x
  Action: [c/x]
  Target: x
2
:---  Source: object [x]
   Field: x
  Action: [c/x]
  Target: x
```

"almost" because I've no idea why there are 2 reactions: if you change the 3rd line to `r: context [ y: is [c/x] ]` (note **y:**) there will be only 1 reaction

#### 2) even funnier, replace 3rd line with: `x: is [c/x]` and you get 3 weird reactions:
```
1
:---  Source: object [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! symbol! context! 
   Field: c
  Action: [c/x]
  Target: x
2
:---  Source: object [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! symbol! context! 
   Field: x
  Action: [c/x]
  Target: x
3
:---  Source: object [x]
   Field: x
  Action: [c/x]
  Target: x
```

### Actual behavior
#### 3) being ran from command line as `'red ticket15.red'`:
```
*** Script Error: append does not allow none! for its series argument
*** Where: append
*** Stack: dump-reactions 
```

#### 4) same, with --cli switch:
```
1:---
  Source: object
   Field: x
  Action:
  Target: x
2:---
  Source: object
   Field: x
  Action:
  Target: x
```
note the empty action

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 633 date: 12-Apr-2018/10:39:17 commit: #f56b72e152d47fea33ba9e38937077cb9356d04d ]
PLATFORM: [ name: "Windows 7" OS: 'Windows arch: 'x86-64 version: 6.1.0 build: 7601 ]
--------------------------------------------
```
notes:
- all versions I have since march 30, 2018 behave like this
- versions up to march 26, 2018 exhibit behaviors 4) 2) and 1) only, but not 3)
- stable 0.6.3 throws an access violation with --cli switch, but otherwise like 1) and 2)


Comments:
--------------------------------------------------------------------------------

On 2018-04-12T16:30:25Z, greggirwin, commented:
<https://github.com/red/red/issues/3333#issuecomment-380866255>

    If you `print` first this goes away. If you `prin` it does not. Something in the new GUI console related to that.

--------------------------------------------------------------------------------

On 2018-04-19T09:19:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/3333#issuecomment-382668699>

    I see that issue 3) was solved, however issues 2) and 4) remain:
    - `is` still produces 2-3 reactions (while `react [x: c/x]` makes one)
    - and in --cli the output is nonsensical

--------------------------------------------------------------------------------

On 2018-04-19T13:53:10Z, qtxie, commented:
<https://github.com/red/red/issues/3333#issuecomment-382744171>

    Sorry, I thought it just the gui-console's issue.

