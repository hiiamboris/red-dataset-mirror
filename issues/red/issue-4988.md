
#4988: [Regression] get path evaluates its argument
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4988>

**Describe the bug**
```
>> about
Red 0.6.4 for Windows built 13-Jun-2021/10:10:47+03:00  commit #79ded2f
>> c: context [f: does [print 123]] get 'c/f
== func [][print 123]

>> about
Red 0.6.4 for Windows built 4-Jul-2021/2:04:09+03:00  commit #1e4fb1b
>> c: context [f: does [print 123]] get 'c/f
123
```

**Expected behavior**

No evaluation.



Comments:
--------------------------------------------------------------------------------

On 2021-10-30T07:18:44Z, qtxie, commented:
<https://github.com/red/red/issues/4988#issuecomment-955164477>

    `get/any` works as expected.
    ```
    >> c: context [f: does [print 123]] get/any 'c/f
    == func [][print 123]
    ```
    
    In the interpreter, the get value will be evaluated if no `/any` refinement. https://github.com/red/red/blob/master/runtime/interpreter.reds#L733

--------------------------------------------------------------------------------

On 2021-10-30T07:50:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4988#issuecomment-955168140>

    `get/any` shouldn't even exist IMO ;)

--------------------------------------------------------------------------------

On 2021-10-30T18:51:57Z, greggirwin, commented:
<https://github.com/red/red/issues/4988#issuecomment-955576806>

    Good note @qtxie but `/any` is there _only_ for `unset!` handling, isn't it?

--------------------------------------------------------------------------------

On 2021-10-31T02:57:45Z, qtxie, commented:
<https://github.com/red/red/issues/4988#issuecomment-955627829>

    @greggirwin According to the documents, yes. I pointed it out as I don't see a code branch to handle this case. The `get?` parameter in `interpreter/eval-path` should be used for it, but it's set by the `/any` refinement now. @dockimbel Do we need to add another `any?` parameter for the function? 

--------------------------------------------------------------------------------

On 2022-03-08T15:47:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4988#issuecomment-1061922308>

    Result of `? system/console/do-command` is fun

--------------------------------------------------------------------------------

On 2022-06-28T12:36:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/4988#issuecomment-1168666233>

    ```
    >> o: object [x: 1 unset 'x]
    == make object! [
        x: unset
    ]
    >> ? o/x
    *** Script Error: value needs a value
    *** Where: set
    *** Near : ? o/x
    *** Stack: ? help-string  
    ```

