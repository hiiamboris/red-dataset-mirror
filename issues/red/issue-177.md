
#177: "Erreur de segmentation" due to recursion
================================================================================
Issue is closed, was reported by mfoucrier and has 6 comment(s).
[status.resolved]
<https://github.com/red/red/issues/177>

Below sample of code that generates this error :

```
Red/System [
    Title:   "Red/System small demo app"
    File:    %finobacci.reds
]

fibo: func [
    n [integer!]            ; nombres de finobacci
    return: [integer!]
][
    either n<= 1 
        [ n ]
        [ fibo (n - 1) + fibo (n - 2) ]
]

f: 0
until [
    print [fibo f " "]
    f: f + 1
    f = 4           ; if f>=4 --> erreur de segmentation, si f=3 Ok !
]
print newline
print newline
```



Comments:
--------------------------------------------------------------------------------

On 2011-10-04T13:32:43Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/177#issuecomment-2286183>

    It probably blows out the stack space. Red/System is a low level language, so it uses the machine stack. Calculating Fibonacci numbers grows explosively for higher numbers, so it would be expected to outgrow the limited machine stack.
    
    On the other hand, I don't know how far a comparable C program would get. Maybe the Red/System limits should be tweaked.
    
    Eventually, rewriting the algorithm without recursion, or waiting for the higher level Red language would fix it.

--------------------------------------------------------------------------------

On 2011-10-04T14:20:06Z, dockimbel, commented:
<https://github.com/red/red/issues/177#issuecomment-2286776>

    The error is caused by a wrong expression in the `either` statement. The following expression:
    
    ```
    fibo (n - 1) + fibo (n - 2)
    ```
    
    is evaluated as: `fibo (+ (n - 1) (fibo (n - 2)))`
    
    So the `+` operator applies to `(n - 1)` and `fibo (n - 2)` which is not the desired result (hence the stack overflow error).
    
    The correct expression to use is: 
    
    ```
    (fibo n - 1) + (fibo n - 2)
    ```
    
    After making that change and using `f = 10` as ending expression in the `until` block, I get a correct output:
    
    ```
    0 1 1 2 3 5 8 13 21 34
    ```
    
    Also, the `n<= 1` expression requires an extra space after `n` to be correct. You are lucky that the REBOL loader used by the Red/System compiler is able to catch and fix such typo.

--------------------------------------------------------------------------------

On 2011-10-04T21:01:36Z, mfoucrier, commented:
<https://github.com/red/red/issues/177#issuecomment-2291341>

    Thank you very much for your answer.

