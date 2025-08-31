
#3445: draw `line` gradient issues
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3445>

### Actual behavior
`line` doesn't deploy the gradient on itself:
```
view [base 200x200 draw [line-width 20 pen linear blue red line 9x9 190x190 circle 99x99 90 ]]
```
![](https://i.gyazo.com/9695314671f470921838ddaf8facc526.png)

and (is it a bug too?) - it follows the previously deployed gradient:
```
>> view [base 200x200 draw [line-width 20 pen linear blue red circle 99x99 40 line 9x9 190x190 ]]
```
![](https://i.gyazo.com/abc9e6636d49fc8149272b0cf87064e7.png)

Both issues do not happen if `line 9x9 190x190` is replaced by `shape [line 9x9 190x190]`

### Expected behavior
```
>> view [base 200x200 draw [line-width 20 pen linear blue red circle 99x99 90 line 9x9 190x190 ]]
```
![](https://i.gyazo.com/e3d0a4eea0319d4d012c5361c8a1a437.png)

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 750 date: 12-Jun-2018/15:07:14 commit: #e62b63d51cdc5d5f6033eb3fa366fd94be0b2deb ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2019-02-21T18:34:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/3445#issuecomment-466113942>

    Should be reopened as the same bug lies in `curve`:
    
    `view [base 250x250 draw [line-width 20 pen linear cyan purple box 10x10 50x50 curve 10x10 240x10 240x240 ]]`
    ![](https://i.gyazo.com/6e01021f66bf90d887c1993932ffe6ff.png)
    `curve` uses gradient applied by `box`
    
    without `box` `pen linear` doesn't work at all:
    `view [base 250x250 draw [line-width 20 pen linear cyan purple curve 10x10 240x10 240x240 ]]`
    ![](https://i.gyazo.com/85d470db6d831ce2af25470a862b7b0d.png)
    

--------------------------------------------------------------------------------

On 2020-03-11T00:25:38Z, qtxie, commented:
<https://github.com/red/red/issues/3445#issuecomment-597383955>

    Smart gradient pen/fill-pen haven't been implemented for some primitives (curve, arc, etc.).
    You have to specify the offset, start and end of the gradient for those primitives.

