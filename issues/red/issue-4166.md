
#4166: bugs in `react?`
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4166>

**Describe the bug**

1. `react?/target` only works after `is`, not after `react`:
```
>> r: reactor [x: y: 1]
>> react [r/y: 2 * r/x]
== [r/y: 2 * r/x]
>> react? r 'x
== [r/y: 2 * r/x]
>> react?/target r 'y
== none
>> react?/target r in r 'y
== none
>> react?/target r 'r/y
*** Script Error: react? does not allow path! for its field argument
*** Where: react?
*** Stack: react?  
```
There should also be tests for this in %reactivity-test.red.

2. `react?/target` can be tricked:
```
>> r: reactor [x: 1 y: is [x * 2]]
>> o: object [on-change*: :r/on-change* x: 1 y: 2]
>> react?/target r 'y
== [x * 2]
>> react?/target o 'y
== [x * 2]            ;) bug - should be none
>> r/x: 3
== 3
>> r
== make object! [
    x: 3
    y: 6
]
>> o
== make object! [
    x: 1               ;) unaffected by the reaction, as it should be
    y: 2
]
```
To fix (2) `=?` should be used here: https://github.com/red/red/blob/19853a8b3cc3ed3b75960d21693d45519e8f2f6a/environment/reactivity.red#L233

3. Same problem with `react/unlink`:
https://github.com/red/red/blob/19853a8b3cc3ed3b75960d21693d45519e8f2f6a/environment/reactivity.red#L296
```
>> r: reactor spec: [x: 1 y: is [x * 2]]
>> o: object [on-change*: :r/on-change* x: 1 y: 2]
>> dump-reactions
1
:---  Source: object [x y]
   Field: x
  Action: [x * 2]
  Target: y
>> react/unlink last spec o
== [x * 2]          ;) react/unlink accepted `o` and removed a reaction on `r`
>> dump-reactions
>>
```

4. I'm lazy to invent a scenario to trip this bug, but this line doesn't seem logical at all:
https://github.com/red/red/blob/19853a8b3cc3ed3b75960d21693d45519e8f2f6a/environment/reactivity.red#L300 
So, if it found a `reaction` but the first found object didn't match the one expected, it should stop searching? Should be rewritten.

**To reproduce**

```
clear-reactions
r: reactor [x: y: 1]
react [r/y: 2 * r/x]
react? r 'x
react?/target r 'y
react?/target r in r 'y
react?/target r 'r/y
```
```
clear-reactions
r: reactor [x: 1 y: is [x * 2]]
o: object [on-change*: :r/on-change* x: 1 y: 2]
react?/target r 'y
react?/target o 'y
```
```
clear-reactions
r: reactor spec: [x: 1 y: is [x * 2]]
o: object [on-change*: :r/on-change* x: 1 y: 2]
dump-reactions
react/unlink last spec o
dump-reactions
```

**Expected behavior**

(1) `react?/target r 'y` should yield  `[r/y: 2 * r/x]`
(2) `react?/target o 'y` should yield `none`
(3) `react/unlink last spec o` should yield `none`
(4) I suggest rewriting the while loop to be more transparent


Note that #4165 should be fixed first. If that is done, many functions in `reactivity.red` will become one-liners and should be rewritten (including this one).

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Nov-2019/10:17:45+03:00 commit #b2aafe6
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-16T20:35:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4166#issuecomment-644997939>

    On a second thought, (1) probably shouldn't be supported after all, as that would require `react` to process set-paths also, save them as targets, whereas it doesn't seem to provide any useful value save for the use of `react?` which will still suffer from set-path processing being unreliable for Red's dynamic nature.

--------------------------------------------------------------------------------

On 2022-09-23T17:09:11Z, dockimbel, commented:
<https://github.com/red/red/issues/4166#issuecomment-1256455091>

    > react?/target only works after is, not after react
    
    That's how it's intended, the documentation should be improved to reflect that.

--------------------------------------------------------------------------------

On 2022-09-23T17:11:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4166#issuecomment-1256457286>

    And what's the point of secrecy around `is` reactions?

--------------------------------------------------------------------------------

On 2022-09-24T10:40:20Z, dockimbel, commented:
<https://github.com/red/red/issues/4166#issuecomment-1256935960>

    I don't get what you mean.

--------------------------------------------------------------------------------

On 2022-09-24T11:00:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4166#issuecomment-1256940534>

    I mean `is` creates a reaction just as `react` does, but you're saying that the target of `is` cannot be tested with `react?/target`, by design. Why?
    
    Ah, sorry, it's the other way around. No questions then.

--------------------------------------------------------------------------------

On 2022-09-24T11:12:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4166#issuecomment-1256943458>

    I propose the following docstring:
    `` /target "Check if it's a target of an `is` reaction instead of a source" ``

--------------------------------------------------------------------------------

On 2022-11-25T15:34:12Z, dockimbel, commented:
<https://github.com/red/red/issues/4166#issuecomment-1327633227>

    All processed/fixed:
    (1) https://github.com/red/red/commit/47b2d034f68f131f9c6abf5d596dddb65389ccb1
    (2) (3) https://github.com/red/red/commit/e957a6ab403d82297bb477e8db146a76beb8a500
    (4) https://github.com/red/red/commit/081d42e63e3f6029c1fff8f4abe763172fefa77b

