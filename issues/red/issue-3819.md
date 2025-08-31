
#3819: `foreach-face` unexpected behavior
================================================================================
Issue is closed, was reported by planetsizecpu and has 14 comment(s).
<https://github.com/red/red/issues/3819>

Some findings on foreach-face last days:

1- Stack overflow when using `continue`  inside `foreach-face`:

![Finding1](https://user-images.githubusercontent.com/12875228/54350352-70c69780-464d-11e9-8069-ca19d22ac5e5.jpg)

2- `print` will modify values on objects:

![Finding2](https://user-images.githubusercontent.com/12875228/54350456-abc8cb00-464d-11e9-915f-b6d255de224f.jpg)

3- `return` inside `foreach-face` wont return a value:

; That loop works well and return none or value from face
`Ret: none
foreach-face cave [
    if face <> f [
        if overlap? face f [Ret: face/extra/name]
    ]
]
return Ret`

; That loop returns none or without value from face
`Ret: none
foreach-face cave [
    if face <> f [
        if overlap? face f [return face/extra/name]
    ]
]
return Ret`




Comments:
--------------------------------------------------------------------------------

On 2019-03-14T13:32:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/3819#issuecomment-472855215>

    @planetsizecpu please provide code snippets for developers so they can reproduce the bugs.

--------------------------------------------------------------------------------

On 2019-03-14T13:43:06Z, 9214, commented:
<https://github.com/red/red/issues/3819#issuecomment-472859684>

    1. Because `continue` interfers with internal `foreach` loop. To filter out faces, use `/with` with condition block instead.
    1. I highly doubt that this has anything to do with `foreach-face`, which is just a virtual tree traversal.
    1. `return` returns from `foreach-face`, which is a function.
    
    None of this looks like a bug to me (p.2 is not related to `foreach-face`, and is likely caused absence of `copy` in user code, or (unlikely) bug in console buffering), and rather belongs to `/help`  or `/bugs` Gitter rooms. 
    
    In the absence of any useful information (like minimal reproducible examples, Red version, actual code) we'll have great trouble processing this ticket.

--------------------------------------------------------------------------------

On 2019-03-14T17:38:25Z, planetsizecpu, commented:
<https://github.com/red/red/issues/3819#issuecomment-472981163>

    Yes, I guess -1- and -3- are related to break of control, returning func before `foreach-face` exits, I have seen this in other langs and I solved it by removing the break and checking out of the loop, but I thing it is worth to check is presence in code, don't you?
    -2- is intriguing to me, because "OVERLAPS" text only appears on the line I wrote here, how the hell has got written on the object? maybe it is related to GC, I didn't have time to test more by now, but I cant get it out of my mind, I have to dig a bit more in the weekend and provide more info.
    By now I don't want to upload the code to git, because I have to clean it a bit and set some funny comment right, maybe was too early to open this ticket, but I can't sleep quietly since -2-

--------------------------------------------------------------------------------

On 2019-03-15T22:39:47Z, endo64, commented:
<https://github.com/red/red/issues/3819#issuecomment-473463036>

    @planetsizecpu Please always keep the issue template's formatting and raise separate tickets for different issues. And of course it is always better to discuss on /bugs room before submitting an issue.
    
    Also note the #`number` automatically references the issue/PR with ID `number` so you're referencing issue 1, 2 and 3 now, which can confuse the developers. Please edit you issue and remove the references.
    
    Here is a test script:
    ```
    Red [Needs: View]
    win: layout [base "1" base "2" base "3"]
    foreach-face win [probe face/text continue]
    print "ok"
    ```
    
    When I compile the above script with an older version of Red, the output is:
    ```
    "1"
    "ok"
    ```
    
    With latest version (`date: 14-Mar-2019/17:49:29 commit: #43b26838` on Win10)
    ```
    "1"
    
    *** Runtime Error 98: assertion failed
    *** Cannot determine source file/line info.
    ```
    

--------------------------------------------------------------------------------

On 2019-03-16T08:53:16Z, planetsizecpu, commented:
<https://github.com/red/red/issues/3819#issuecomment-473512845>

    @endo64 Thx, I whas not aware of # meaning, I edited the issue, hand have it in account for next findings.
    It is difficult to repeat the failure with just a bit of code snippet, I have sent the entire scripts along with the project files to @qtxie so he can check what the problem is.

--------------------------------------------------------------------------------

On 2019-03-16T10:36:11Z, 9214, commented:
<https://github.com/red/red/issues/3819#issuecomment-473519125>

    @planetsizecpu instead of bothering one of the core developers personally, you should have tried to narrow down the problem by yourself and to reproduce it with minimal example(s), then report your findings back here, or at least extend the original report with information we've requested (Red and OS version, copy-pastable code, etc). "Difficult to repeat" likely means that your problem is a side-effect of your own mistake somewhere else in your code.
    
    It is in your responsibility (as a contributor) and in your interests (as a developer) to provide meaningful and informative bug reports (which, at the very least, follow standard issue template and provide reproducible examples). Shifting this responsibility on developers only adds to the burden they already have, and postpones solution of your problem indefinitely.

--------------------------------------------------------------------------------

On 2019-03-16T11:14:56Z, planetsizecpu, commented:
<https://github.com/red/red/issues/3819#issuecomment-473521375>

    @9214 I am sorry if I have not explained myself well. The code example -2- that I have put above is the one that generates the failure, but I can not reduce it so much to reproduce it because it is being called by an on-time event that in turn depends on other events on-time that its they depend on the keys pressed by the user and the movement of the faces, all this code also handles about 50 bmp files, and I do not know how I can reduce it so that the fault is reproduced. That's why I've thought about sending it to @qtxie like on other occasions.
    This is the problem, it is so complex that I can not reduce it and at the same time reproduce the fault,  because I don't know how to do it, so I'm sorry if it's my fault.
    If this can not be solved in this way, it is better to close the ticket, but over time someone may replay the same fault and report it.

