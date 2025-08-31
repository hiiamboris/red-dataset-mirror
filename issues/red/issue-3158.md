
#3158: break/return in while loop doesn't return value
================================================================================
Issue is open, was reported by endo64 and has 12 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/3158>

`break/return`  returns the given value when used in all loop functions (`loop`, `repeat`, `forall` etc.) except `while`:

### Expected behavior

```
>> type? while [true] [break/return 1]
== integer!
```

### Actual behavior

```
>> type? while [true] [break/return 1]
== unset!
```

### Steps to reproduce the problem

### Red version and build date, operating system with version.

Red 0.6.3 / 21-Dec-2017/23:39:43+03:00
Win10 x64



Comments:
--------------------------------------------------------------------------------

On 2017-12-21T22:27:56Z, endo64, commented:
<https://github.com/red/red/issues/3158#issuecomment-353473696>

    I checked the source of `while` and found that `while` never returns a value, is it by design, if so how it is useful?

--------------------------------------------------------------------------------

On 2017-12-22T04:20:47Z, dockimbel, commented:
<https://github.com/red/red/issues/3158#issuecomment-353518742>

    There is at least one ticket about iterator functions return value. We need to decide on what each iterator should return, then implement it both for the compiler and interpreter.

--------------------------------------------------------------------------------

On 2017-12-22T17:46:21Z, 9214, commented:
<https://github.com/red/red/issues/3158#issuecomment-353645052>

    https://github.com/red/red/issues/2873

--------------------------------------------------------------------------------

On 2019-10-08T17:28:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/3158#issuecomment-539618980>

    To help you get closer to a decision :)
    
    | construct | returns when finished (value of the last expression) | returns when broken with `break/return` | returns when never entered | remarks
    | --- |--- |--- |--- |---
    | **forever** | N/A | any type | N/A |
    | **loop**    | any type | any type | none (unset in R2) |
    | **until**    | neither of: none false | any type | N/A | errors out when the last value is unset
    | **repeat** | any type | any type | none (unset in R2) |
    | **while**   | unset (any type in R2) | *unset* (any type in R2) | unset (none in R2) |
    | **foreach** | any type | any type | unset (none in R2) |
    | **remove-each** | unset (block in R2) | *unset (block in R2)* | unset (block in R2) | removes items even when last value is unset
    | **if** | any type | N/A | none |
    
    Especially "wrong" stuff I have marked in italic.
    Note also that when we return `none`, R2 returns `unset`. And when we return `unset`, R2 returns `none` :)
    
    So,
    1) What are the benefits of returning either one of `none` or `unset`? I'd say `none` is easier to deal with.
    2) Should we, as R2, return the block from `remove-each`? And should we allow to circumvent that with `break/return`?

--------------------------------------------------------------------------------

On 2019-10-09T13:42:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/3158#issuecomment-540006733>

    Let's have the same table for compiled Red, for fun:
    
    | construct | returns when finished (value of the last expression) | returns when broken with `break/return` | returns when never entered |
    | --- |--- |--- |--- |
    | **forever** | N/A | **seemingly random junk: `""`, `true`** | N/A |
    | **loop**    | any type | **last counter value** | none |
    | **until**    | neither of: none false | any type | N/A |
    | **repeat** | any type | **last counter value** | **last counter value (which is zero)** |
    | **while**   | **last value of conditional (false)** | **last value of conditional (true)** | **last value of conditional (false)** |
    | **foreach** | **an empty block** | **an empty block** | **an empty block** |
    | **remove-each** | **zero** | **zero** | **zero** | 
    | **if** | any type | N/A | none |
    
    In bold are differences from interpreted behavior.
    
    
    This is the test script I used:
    ```
    probe forever [break/return 100]
    probe forever [break/return 100]
    probe forever [break/return 100]
    print ""
    probe loop 1 [100]
    probe loop 1 []
    probe loop 1 [break/return 100]
    probe loop 0 [100]
    print ""
    probe until [100]
    ;probe until []
    probe until [break/return 100]
    print ""
    probe repeat i 1 [100]
    probe repeat i 1 []
    probe repeat i 1 [break/return 100]
    probe repeat i 0 [100]
    print ""
    probe foreach x [1] [100]
    probe foreach x [1] []
    probe foreach x [1] [break/return 100]
    probe foreach x [] [100]
    print ""
    x: 1 probe while [0 = x: x - 1] [100]
    probe while [yes] [break/return 100]
    probe while [no] [100]
    print ""
    probe remove-each x b: [1 2] [yes]  b
    probe remove-each x b: [1 2] [no]  b
    probe remove-each x b: [1 2] [()]  b
    probe remove-each x b: [1 2] [break/return 100]  b
    probe remove-each x b: [] [break/return 100]  b
    print ""
    probe if yes [100]
    probe if yes []
    probe if no [100]
    ```

--------------------------------------------------------------------------------

On 2021-06-01T12:59:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/3158#issuecomment-852103756>

    https://github.com/red/red/issues/1706#issuecomment-660306764 this should be linked here

