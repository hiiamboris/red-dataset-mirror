
#3738: cause-error incompatible with R2/R3 as it does not accept string! as an argument
================================================================================
Issue is closed, was reported by Dobeash and has 12 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/3738>

**Describe the bug**

In R2/R3 the following works:
```
cause-error 'user 'message "blah"
```

but Red requires:
```
cause-error 'user 'message ["blah"]
```

**To reproduce**

```
cause-error 'user 'message "blah"
```

**Suggested Fix**

Gregg Irwin proposed changing the spec and switching from `reduce` to `compose`:

```
cause-error: func [
    {Causes an immediate error throw, with the provided information} 
    err-type [word!] 
    err-id [word!] 
    args [block! string!] 
][
    args: compose [(:args )]
    do make error! [
        type: err-type 
        id: err-id 
        arg1: first args 
        arg2: second args 
        arg3: third args
    ]
]
```


Comments:
--------------------------------------------------------------------------------

On 2019-01-15T22:07:45Z, endo64, commented:
<https://github.com/red/red/issues/3738#issuecomment-454570364>

    Related [conversation](https://gitter.im/red/bugs?at=5c3cfbca8318994524ed09f5)

--------------------------------------------------------------------------------

On 2019-01-18T02:32:26Z, greggirwin, commented:
<https://github.com/red/red/issues/3738#issuecomment-455406078>

    Yay! I get a coding assignment! :^)

--------------------------------------------------------------------------------

On 2019-02-11T15:57:07Z, 9214, commented:
<https://github.com/red/red/issues/3738#issuecomment-462380809>

    @greggirwin I believe this one can be closed.

--------------------------------------------------------------------------------

On 2019-02-11T17:20:36Z, greggirwin, commented:
<https://github.com/red/red/issues/3738#issuecomment-462414298>

    Was there a PR other than mine (which needed fixes)?

--------------------------------------------------------------------------------

On 2019-02-11T17:48:36Z, 9214, commented:
<https://github.com/red/red/issues/3738#issuecomment-462424883>

    @greggirwin nope, I thought yours fixed the issue.

--------------------------------------------------------------------------------

On 2019-02-11T21:49:00Z, greggirwin, commented:
<https://github.com/red/red/issues/3738#issuecomment-462508285>

    @hiiamboris found a problem, related to how the test system works with errors, so I need to revisit.

