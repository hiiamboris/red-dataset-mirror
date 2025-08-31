
#3393: Access violation on modification of a series manually owned by an object
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3393>

### Expected behavior
Something that is not a segfault.

### Actual behavior
```
*** Runtime Error 1: access violation
*** at: 0807DCF5h
```

### Steps to reproduce the problem
```red
r: object [
    a: [1 2 3]

    on-change*: func [word old new][
        print ['on-change* tab word]

        modify old 'owned none
        modify new 'owned reduce [self word]
    ]
]

r/a: [3 2 1]
reverse/part r/a 2 ; <--
```

### Red and platform version
I guess this applies to the latest version on all platforms.


Comments:
--------------------------------------------------------------------------------

On 2018-05-19T23:11:36Z, nedzadarek, commented:
<https://github.com/red/red/issues/3393#issuecomment-390438645>

    I can reproduce it on the new console:
    > Red 0.6.3 for Windows built 4-May-2018/12:55:23+02:00 commit #1c0952c
    
    and the old console: 
    >Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00
    
    It seems that the problem is with `new`.
    ` modify new 'owned reduce [self word]` - doesn't work
    `modify new 'owned none` - works

