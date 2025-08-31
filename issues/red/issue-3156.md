
#3156: Crash when assigning result of function in object to a word
================================================================================
Issue is closed, was reported by rebolek and has 30 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3156>

### Expected behavior

```
>> c: context [f: func[a][""]]
== make object! [
    f: func [a][""]
]
>> t: c/f []
== ""
```

### Actual behavior

```
>> c: context [f: func[a][""]]
== make object! [
    f: func [a][""]
]
>> t: c/f []

*** Runtime Error 1: access violation
```

### Steps to reproduce the problem

See above. Also, here's stack trace:

```
*** Runtime Error 1: access violation
*** in file: /home/sony/Code/red/runtime/datatypes/context.reds
*** at line: 283
***
***   stack: red/_context/set F6A0D7ECh F6A0D7FCh
***   stack: red/word/set
***   stack: red/interpreter/eval-expression F6805564h F6805564h false false false
***   stack: red/interpreter/eval F6A0D7CCh true
***   stack: red/natives/catch* true 1
***   stack: ctx357~try-do F7F50D6Ch
***   stack: ctx357~do-command F7F50D6Ch
***   stack: ctx357~eval-command F7F50D6Ch
***   stack: ctx357~run F7F50D6Ch
***   stack: ctx357~launch F7F50D6Ch
***   stack: ***_start
```

### Red version and build date, operating system with version.

Custom build from latest sources (21-Dec-2017/10:47:01+01:00), Ubuntu 17/10.


Comments:
--------------------------------------------------------------------------------

On 2017-12-21T11:30:39Z, meijeru, commented:
<https://github.com/red/red/issues/3156#issuecomment-353328579>

    Looks like regression after this commit: [9178838](https://github.com/red/red/commit/9178838f7569b6e3d28fedcf070f04ab7e6e4e33)

--------------------------------------------------------------------------------

On 2017-12-21T12:12:39Z, rebolek, commented:
<https://github.com/red/red/issues/3156#issuecomment-353336109>

    @meijeru Actually, it's this commit: https://github.com/red/red/commit/bca86785936b0750b994702daa15734361237f1f

--------------------------------------------------------------------------------

On 2017-12-21T12:15:31Z, meijeru, commented:
<https://github.com/red/red/issues/3156#issuecomment-353336648>

    So @dockimbel and @qtxie have enough food for thought :smile:

--------------------------------------------------------------------------------

On 2017-12-21T12:38:00Z, dockimbel, commented:
<https://github.com/red/red/issues/3156#issuecomment-353340667>

    Thanks for identifying those culprit commits, that's a significant time-saver for us! :+1: 

--------------------------------------------------------------------------------

On 2017-12-21T12:39:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3156#issuecomment-353340872>

    Relates to #3128 

--------------------------------------------------------------------------------

On 2017-12-21T12:39:43Z, rebolek, commented:
<https://github.com/red/red/issues/3156#issuecomment-353340994>

    You're welcome!
    Actually, I needed working console, so I had to find which commit works ;)

--------------------------------------------------------------------------------

On 2018-01-05T09:02:49Z, toomasv, commented:
<https://github.com/red/red/issues/3156#issuecomment-355505021>

    works with explicitly set type:
    ```
    t: to-string c/f []
    ```

--------------------------------------------------------------------------------

On 2018-01-05T12:44:40Z, 9214, commented:
<https://github.com/red/red/issues/3156#issuecomment-355546497>

    Maybe related (crashes the console)
    ```Red
    graph: make deep-reactor! [
        data: [
            red  10x10 10
            blue 40x40 20
        ]
    ]
    
    view/no-wait [
        base 500x500 with [
            draw: collect [
                foreach [color size center] graph/data [
                    keep compose [fill-pen (color) circle (size) (center)]
                ]
            ]
        ]
    ]
    ```
    ```Red
    *** Runtime Error 1: access violation
    *** at: 0042586Ch
    ```

--------------------------------------------------------------------------------

On 2018-01-16T18:02:23Z, greggirwin, commented:
<https://github.com/red/red/issues/3156#issuecomment-358050954>

    Also reported as https://github.com/red/red/issues/3202

--------------------------------------------------------------------------------

On 2018-01-21T00:16:13Z, gltewalt, commented:
<https://github.com/red/red/issues/3156#issuecomment-359212789>

    Also works with `reduce`
    
    ```
    >> c: context [f: func[a][""]]
    == make object! [
        f: func [a][""]
    ]
    >> t: reduce c/f []
    == ""
    ```

--------------------------------------------------------------------------------

On 2018-01-21T04:29:35Z, gltewalt, commented:
<https://github.com/red/red/issues/3156#issuecomment-359223124>

    `t: c/f []`
    
    Shows all zeros for node before crash. Is that normal or does that mean it was set to null somehow?
    https://imgur.com/ljmGqng

--------------------------------------------------------------------------------

On 2018-02-05T16:19:17Z, meijeru, commented:
<https://github.com/red/red/issues/3156#issuecomment-363135144>

    Another example, in which the binding just does not take place:
    ```
    >> p: 1
    == 1
    >> p
    == 1
    >> p: system/platform ;; function call
    == Windows
    >> p
    == 1
    ```

--------------------------------------------------------------------------------

On 2018-02-05T20:18:25Z, toomasv, commented:
<https://github.com/red/red/issues/3156#issuecomment-363208558>

    I checked with all the other system-words and `platform` was the only one not binding.

--------------------------------------------------------------------------------

On 2018-02-07T19:58:08Z, meijeru, commented:
<https://github.com/red/red/issues/3156#issuecomment-363891559>

    Right. That is because `platform` is a function.

--------------------------------------------------------------------------------

On 2018-03-11T11:50:47Z, 9214, commented:
<https://github.com/red/red/issues/3156#issuecomment-372109306>

    Adieu! :beers: :bear: 

