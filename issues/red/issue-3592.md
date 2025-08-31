
#3592: `make error!` should cause error immediately
================================================================================
Issue is closed, was reported by bitbegin and has 32 comment(s).
<https://github.com/red/red/issues/3592>

**Describe the bug**
In Rebol:

```
>> x: func [a][if a = 1 [make error! "333"] 3]
>> x 1
** User Error: 333
** Near: make error! "333"
>>
```

In Red: 

```
>> x: func [a][if a = 1 [make error! "333"] 3]
== func [a][if a = 1 [make error! "333"] 3]
>> x 1
== 3
>> 
```

`make error!` should cause error immediately, otherwise there are no way to throw this error!.

**To Reproduce**
```
>> x: func [a][if a = 1 [make error! "333"] 3]
== func [a][if a = 1 [make error! "333"] 3]
>> x 1
== 3
>> 
```

**Expected behavior**
```
>> x: func [a][if a = 1 [make error! "333"] 3]
>> x 1
** User Error: 333
** Near: make error! "333"
>>
```

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Platform version(please complete the following information):**
```
Red 0.6.3 for Windows built 13-Nov-2018/23:49:48+08:00 commit #7404492
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-17T15:33:31Z, meijeru, commented:
<https://github.com/red/red/issues/3592#issuecomment-439625644>

    To throw the error, `do` it. See also `source cause-error`

--------------------------------------------------------------------------------

On 2018-11-19T21:07:49Z, endo64, commented:
<https://github.com/red/red/issues/3592#issuecomment-440041984>

    This was a design decision IIRC. @greggirwin ?

--------------------------------------------------------------------------------

On 2018-11-19T21:08:14Z, greggirwin, commented:
<https://github.com/red/red/issues/3592#issuecomment-440042109>

    This is an intentional design change. (typing at the same time Endo).

--------------------------------------------------------------------------------

On 2018-11-19T21:08:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3592#issuecomment-440042247>

    The console evaluates errors if it sees them, but errors are not "hot" during normal evaluation.
    ```
    >> make error! 1
    *** Throw Error: return or exit not in function
    *** Where: ??? 
    
    >> reduce [make error! 1]
    == [make error! [
        code: 1
        type: 'throw
        id: 'return
        arg1: none
        arg2: none
        arg3: none
        near: none...
    ```

--------------------------------------------------------------------------------

On 2018-11-20T01:47:37Z, bitbegin, commented:
<https://github.com/red/red/issues/3592#issuecomment-440106769>

    I don't think we can just close this issue, as there are some reasons we should fix this design.
    
    1: now `make error!` only give an error type value, we just can return it, and if it's last value in `try` block, it'll be caught:
    
    ```
    >> x: func [a][if a = 1 [return make error! "333"] 3]
    == func [a][if a = 1 [return make error! "333"] 3]
    >> print try [x 1]
    *** User Error: "333"
    *** Where: ???
    ```
    
    But, if it's not last value, it'll be discarded:
    
    ```
    >> x: func [a][if a = 1 [return make error! "333"] 3]
    == func [a][if a = 1 [return make error! "333"] 3]
    >> print try [x 1 2]
    2
    >> 
    ```
    
    2: `make error!` not be designed as an exception? This will be strange behavior, and not uniform with other places
    
    3: if `make error!` be designed as an exception, but just give an error! type value, there should exist `throw` method to raise it. (As `throw` be used in `catch/throw` block, maybe lead into other keyword like `raise` )
    
    

--------------------------------------------------------------------------------

On 2018-11-20T02:10:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3592#issuecomment-440111106>

    Reopened, so Nenad can comment definitively.
    
    1) is only true in the console. As shown in my `reduce` example, error values are not discarded, they are just not hot when created with `make`.
    
    2) I believe it is NOT designed to be an exception, but a way to create error values, which may be used in various ways. Listing some other places that are inconsistent with this would be good.
    
    3) That's what `cause-error` is for.

--------------------------------------------------------------------------------

On 2018-11-20T02:28:10Z, bitbegin, commented:
<https://github.com/red/red/issues/3592#issuecomment-440114458>

    here is other example, https://github.com/red/wallet/blob/master/libs/int256.red#L78
    
    ```
    	set 'i256-to-int function [bigint [vector!] return: [integer!]][
    		repeat idx 12 [if (bigint/:idx) <> 0 [make error! "i256-to-int error!"]]
    		high: bigint/15 << 16
    		if negative? high [high: 65536 + high]
    		if negative? low: bigint/16 [low: 65536 + low]
    		high + low
            ]
    ```
    
    it be expected to raise an error, but actually nothing will happen. I know `cause-error 'user 'message "i256-to-int error!"` can do same thing, but code has a little long. 

--------------------------------------------------------------------------------

On 2018-11-20T04:03:57Z, qtxie, commented:
<https://github.com/red/red/issues/3592#issuecomment-440130468>

    1. `make error!` give an error type value. I think it more consistent than cause an exception immediately, consider that `make datatype! ...` will return a value of the datatype for all the other datatypes.
    2. If you want to cause an exception, use `cause-error`, **do** the error value or if you prefer shorter code, write a helper function.
    ```
    throw-error: func [msg][do make error! msg]
    ```

--------------------------------------------------------------------------------

On 2018-11-20T04:45:50Z, bitbegin, commented:
<https://github.com/red/red/issues/3592#issuecomment-440136572>

    `do` is that what i want

--------------------------------------------------------------------------------

On 2018-11-20T08:40:06Z, endo64, commented:
<https://github.com/red/red/issues/3592#issuecomment-440188860>

    @greggirwin What do you think adding `throw-error` to the language, it would be good for compatibility with Rebol as well.

--------------------------------------------------------------------------------

On 2018-11-21T00:27:27Z, greggirwin, commented:
<https://github.com/red/red/issues/3592#issuecomment-440480012>

    `Cause-error` was chosen intentionally as the name, to differentiate it from `throw`, which is for non local flow control in Red. In R2, where errors were hot, the `cause-error/throw-error` funcs were subtly different. We have https://github.com/red/red/wiki/%5BDOC%5D-Error-handling for notes on this. I suggest someone take the lead on detailing the behaviors, so we can make sure we're actually filling holes in functionality, and making each function clear in its goals.

--------------------------------------------------------------------------------

On 2018-11-21T00:28:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3592#issuecomment-440480260>

    Assuming @bitbegin is good now, we can probably close this ticket, but note that we should doc this area deeply, as it's a place where many languages fall down and where we may help avoid many mistakes in the future, which is a big help to devs across the board.

--------------------------------------------------------------------------------

On 2018-11-21T08:37:09Z, DideC, commented:
<https://github.com/red/red/issues/3592#issuecomment-440580404>

    OK, but for that to be clear to me: what about the `i256-to-int` function example above?
    If I understand correctly the behaviour, the line with the `make error` is just useless actually, no ?

--------------------------------------------------------------------------------

On 2018-11-21T10:12:02Z, endo64, commented:
<https://github.com/red/red/issues/3592#issuecomment-440608505>

    @DideC  It should be updated to `do make error! "i256-to-int error!"` I think.

--------------------------------------------------------------------------------

On 2018-12-09T19:26:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3592#issuecomment-445564124>

    Or use `cause-error`.

--------------------------------------------------------------------------------

On 2018-12-09T19:27:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3592#issuecomment-445564203>

    Added a link to this ticket in https://github.com/red/red/wiki/%5BDOC%5D-Error-handling

