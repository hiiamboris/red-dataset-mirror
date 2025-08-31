
#2048: `0 = 0` in a SWITCH case does not return TRUE
================================================================================
Issue is closed, was reported by dockimbel and has 12 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/2048>

Following code ouputs FALSE instead of TRUE:

```
Red/System []

foo: func [return: [logic!]][
    switch 1 [1 [0 = 0]]
]
probe foo
== false
```

Though, using any other integers for the comparison works as expected:

```
Red/System []

foo: func [return: [logic!]][
    switch 1 [1 [123 = 123]]
]
probe foo
== true
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-20T06:17:57Z, iArnold, commented:
<https://github.com/red/red/issues/2048#issuecomment-227058468>

    For what it is worth: I use a version from 15-6-2016 commit nr 6329 and that is still ok, returning true.

--------------------------------------------------------------------------------

On 2016-06-20T09:49:52Z, dockimbel, commented:
<https://github.com/red/red/issues/2048#issuecomment-227097978>

    @iArnold Tested with last commit on 14th, a commit from 15th and first commit from 16th, all return `false`. Moreover, there is no commit hash in 2016 containing "6329"... Congratulations for wasting my time...again!

--------------------------------------------------------------------------------

On 2016-06-20T10:16:14Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2048#issuecomment-227103594>

    @dockimbel Shouldn't it return `true`?
    
    This code suggests there is a bug:
    
    ```
    Red/System []
    print ["using 0 = 0" lf]
    print [0 = 0 lf]                                        ;--true
    f: func [return: [logic!]][0 = 0]
    print [f lf]                                            ;--true
    print [switch 1 [1 [0 = 0]] lf]                         ;--false
    switch 1 [1 [print [0 = 0 lf]]]                         ;--true
    switch 1 [1 [print f lf]]                               ;--true
    print lf                                                ;--needed because previous lf got "eaten"
    f1: func [return: [logic!]][switch 1 [1 [0 = 0]]]
    print [f1 lf]                                           ;--false
    
    print ["using 1 = 1" lf]
    print [1 = 1 lf]                                        ;--true
    f2: func [return: [logic!]][1 = 1]
    print [f2 lf]                                           ;--true
    print [switch 1 [1 [1 = 1]] lf]                         ;--true
    switch 1 [1 [print [1 = 1 lf]]]                         ;--true
    switch 1 [1 [print f2 lf]]                              ;--true
    print lf                                                ;--needed because previous lf got "eatien"
    f3: func [return: [logic!]][switch 1 [1 [1 = 1]]]
    print [f3 lf]                                           ;--true
    ```

--------------------------------------------------------------------------------

On 2016-06-20T10:21:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2048#issuecomment-227104637>

    Yes, it should return TRUE. Though in your test code, putting the `switch` as an argument to a function call is currently not supported (there was a ticket with similar limitation using `either`).

--------------------------------------------------------------------------------

On 2016-06-20T11:04:15Z, iArnold, commented:
<https://github.com/red/red/issues/2048#issuecomment-227113036>

    @dockimbel Truly sorry to waste your or for that matter anybody's time.
    Just tested this issue to HELP you because I have a version that is a couple of days older, so I could give you a hint if it is due to a recent change. It is in my best interest too that you can work without too much interruption. 
    
    Somehow this does not work out between us all too well, despite my best intentions, you have to believe me on that.
    
    I had to check if I indeed did use the newest zip that I had downloaded. It is indeed https://github.com/red/red/tree/02cb58c28f3a350c65bf65147648974b8e3beda5 the commit is 3629 from 15-6 
    
    Kind regards,
    
    Arnold

--------------------------------------------------------------------------------

On 2016-06-20T11:47:06Z, iArnold, commented:
<https://github.com/red/red/issues/2048#issuecomment-227120665>

    Next older version I had before that was red-master-6253-20160610.zip, but having the gui-console built on the 15th it must have been the one I mentioned earlier. It has time (now\* is in natives.reds) and the configuration file.

