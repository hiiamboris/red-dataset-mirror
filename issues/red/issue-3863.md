
#3863: [text-list] Appended block in text-list is shown in reverse order.
================================================================================
Issue is closed, was reported by guaracy and has 8 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3863>

**Describe the bug**
After append a block in text-list, the values are showed in listbox in reverse order but, internally, l/data block is ok.

**To reproduce**
```red
Red [ Needs: 'view]

b: ["a" "b" "c" "d"]

view [
    l: text-list data ["1" "2"] 
    [
        print ["Selected " l/selected " : " l/data/(l/selected)]
    ]
    button "Append" [
        append l/data b
    ]
]
```
**Expected behavior**
List must show 1 2 a b c d and not 1 2 d c b a

![red-texlist](https://user-images.githubusercontent.com/5351477/56930401-eaf29480-6ab2-11e9-802c-8a6d11a09c71.png)

**Workarounds**

#1
`foreach i b [append l/data i]`

#2
`l/data: append l/data b`

#3 @greggirwin 
`append l/data b`
`show l`


**Platform version (please complete the following information)**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 230 date: 23-Apr-2019/10:35:24 commit: #6dcea4a482a8528d0dab8bf18f2b63785375e689 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```
Obs.

1. Seens to work fine on gtk branch by @rcqls

2. Not tested on Mac.



Comments:
--------------------------------------------------------------------------------

On 2019-04-29T22:23:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/3863#issuecomment-487765123>

    I confirm. W7, 22-Apr-2019/19:40:30+03:00 commit #9ac4430

--------------------------------------------------------------------------------

On 2019-04-29T22:26:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3863#issuecomment-487765766>

    @hiiamboris, your high-res-timer work is related to this?
    
    Another workaround is to `show` the text-list face after updating data.

--------------------------------------------------------------------------------

On 2019-04-29T22:38:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/3863#issuecomment-487768328>

    > @hiiamboris, your high-res-timer work is related to this?
    
    Not at all.

--------------------------------------------------------------------------------

On 2019-04-29T23:09:00Z, greggirwin, commented:
<https://github.com/red/red/issues/3863#issuecomment-487774541>

    My mistake. I thought #9ac4430 was your hi-res-timer commit.

