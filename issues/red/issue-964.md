
#964: Locals gathering broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/964>

```
Red []

f: function [] [
    either yes [
        x
    ][
        x: 0
    ]
]
```

**\* Compilation Error: undefined word x 
**\* near: [x]



Comments:
--------------------------------------------------------------------------------

On 2014-10-23T00:46:23Z, PeterWAWood, commented:
<https://github.com/red/red/issues/964#issuecomment-60178154>

    I've added test "funfun5" to function-test.red. It passes under the interpreter but gives a compilation error with the compiler. I have commented the test out. It is the last test in the file.

--------------------------------------------------------------------------------

On 2014-10-23T02:15:10Z, dockimbel, commented:
<https://github.com/red/red/issues/964#issuecomment-60183883>

    This is not a bug, I have changed FUNCTION in the compiler a few days ago, to only catch set-words at root level and not deep-catch them. I am still looking into this to decide which behavior should I retain for Red.

--------------------------------------------------------------------------------

On 2014-10-23T14:39:29Z, dockimbel, commented:
<https://github.com/red/red/issues/964#issuecomment-60248791>

    Deep-catching re-established for FUNCTION constructor. For now, we _need_ to have this feature, but we still need to figure out how to communicate about it to users...

--------------------------------------------------------------------------------

On 2014-10-23T23:35:56Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/964#issuecomment-60325640>

    What is there to communicate about being compatible with REBOL and your own interpreter, and why on earth would you change that?

--------------------------------------------------------------------------------

On 2014-10-24T02:14:03Z, dockimbel, commented:
<https://github.com/red/red/issues/964#issuecomment-60336251>

    See the discussion about troubles with FUNCTION in Rebol3! group on AltMe or Red's SO chat. Here are some examples that can trip up most users, and that are uneasy to explain to beginners:
    
    ```
    >> a: 0
    >> foo: function [][ o: object [a: 1] a = 0 ]
    >> foo
    == false
    ```
    
    ```
    >> a: 0
    >> foo: function [][ bar: function [ ][a: 1] a = 0 ]
    >> foo
    == false
    ```
    
    ```
    >> a: 0
    >> foo: function [][ bar: func [/local a][a: 1] a = 0 ]
    >> foo
    == false
    ```

