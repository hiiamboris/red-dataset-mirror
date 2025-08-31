
#2304: Preprocessor syntax error seems un-called for
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2304>

This program snippet constructs part of a draw block:
```
scale-start: as-pair 50 canvas/size/y - 10
insert tail grid compose [
  line-width 3
  line (scale-start) (scale-start + 200x0)
  <more lines ...>
]
```
The result with the latest interpreter is: 
```
*** Preprocessor Error: Syntax error
*** Where: (200x0)
(halted)
```



Comments:
--------------------------------------------------------------------------------

On 2016-11-07T17:42:39Z, Zamlox, commented:
<https://github.com/red/red/issues/2304#issuecomment-258906499>

    I got also similar problem when I updated my sandbox from upstream. I compiled `gui-console` and then running `shape-test.red` gave similar error:
    
    ```
    --== Red 0.6.1 ==-- 
    Type HELP for starting information. 
    
    red>> change-dir to-red-file "D:\Work\red\fork\red\tests"
    == %/D/Work/red/fork/red/tests/
    red>> 
    red>> do %shape-test.red
    *** Preprocessor Error: Syntax error
    *** Where: 200x0 200x-100
    (halted)
    red>> 
    ```

--------------------------------------------------------------------------------

On 2016-11-07T18:26:17Z, meijeru, commented:
<https://github.com/red/red/issues/2304#issuecomment-258919110>

    This confirmation should make it easy for Doc or qtxie to home in on the error: somehow, pairs are disliked by the preprocessor.

--------------------------------------------------------------------------------

On 2016-11-07T18:57:51Z, Zamlox, commented:
<https://github.com/red/red/issues/2304#issuecomment-258928111>

    In my case, `expand` function from`preprocessor.r` somehow finds a `#case` within `shape-test.red` code. But there is no macro in that file. After instrumenting red source code I got:
    
    ```
    red>> do %shape-test.red
    matched #case
    [200x0 200x-100 
        move 0x0
    ]
    ```
    
    where instrumented code is:
    
    ```
    | s: #case (print "matched #case" probe s) [set cases block! | e: (syntax-error s e)] e: (
    ```
    
    Makes no sense to me.

--------------------------------------------------------------------------------

On 2016-11-08T12:40:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2304#issuecomment-259126308>

    I can reproduce the issue with the `%shape-test.red` file.

