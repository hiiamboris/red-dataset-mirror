
#4928: Routine typechecks aren't working
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4928>

**Describe the bug**

A few tests.

## 1
```
Red []
rou: routine [x [float!]][probe "entered"]
probe rou 123
```
Compiling with `-r -d` I get:
```
*** Runtime Error 98: assertion failed
*** in file: /d/devel/red/red-src/red/runtime/datatypes/float.reds
*** at line: 67
***
***   stack: red/float/get 00000062h
***   stack: red/float/get 02754A34h
```
Expected: error during compilation

## 2

Same, but interpreted call
```
Red []
rou: routine [x [float!]][probe "entered"]
do [probe rou 123]
```
Compiled output is fine:
```
*** Script Error: rou does not allow integer! for its x argument
*** Where: rou
*** Stack: probe
```

## 3

```
Red []
rou: routine [x [string!]][probe "entered"]
probe rou 123
```
Compiled as `-d -r` output:
```
entered
123
```

Wrapped in `do []` it throws a runtime error as expected.

----

So when compiled it is clueless about the type, unless one of these lines crashes it:
https://github.com/red/red/blob/1e4fb1b4aa4238c1c56b2c26890fdf3879be5384/runtime/interpreter.reds#L290-L295

When interpreted it tries to check the type, but also may crash as in #4927 


**Expected behavior**

- no crashes
- compiler errors when routine typecheck fails

Right now, routine code has to do all the checks manually, and types/typesets cannot be used for documenting the accepted types, having to accept `any-type!` for each argument.

**Platform version**
```
Red 0.6.4 for Windows built 4-Jul-2021/2:04:09+03:00  commit #1e4fb1b
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-21T18:30:28Z, dockimbel, commented:
<https://github.com/red/red/issues/4928#issuecomment-884402185>

    They are "not working" because they are not implemented yet. The `issue-4928` branch is providing an implementation for that feature. It works fine, but still needs extra work before merging to master. Support for multiple types per argument is not planned (too heavy to support in the compiler).

--------------------------------------------------------------------------------

On 2021-07-21T19:12:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4928#issuecomment-884429285>

    We should at least be able to use typesets for documentation. And do the checks manually then.

--------------------------------------------------------------------------------

On 2021-07-22T14:58:12Z, dockimbel, commented:
<https://github.com/red/red/issues/4928#issuecomment-884981198>

    Support for a few standard typesets has been added: https://github.com/red/red/commit/6c7556e17e4d928df5ef694543ebf81c46aa5c94
    
    I just need to write some unit tests for those cases, then I can merge that branch.
    
    > We should at least be able to use typesets for documentation. And do the checks manually then.
    
    Remember that the compiler needs to generate a function spec that is compilable by R/S compiler. So it needs to be able to convert the typesets into something that has meaning at R/S level (with the help of the Red runtime library). That is what has been done by the above commit. So, only a limited subset of standard typesets is supported. User-created typesets cannot be supported, as the compiler cannot map it to anything useful at R/S level (though, we could use `red-value!` as kitchen sink here...).

--------------------------------------------------------------------------------

On 2021-07-23T13:54:58Z, dockimbel, commented:
<https://github.com/red/red/issues/4928#issuecomment-885656104>

    Tests and fixes have

