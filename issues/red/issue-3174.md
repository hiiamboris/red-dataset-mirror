
#3174: literal arguments and get arguments doesn't work as expected
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
<https://github.com/red/red/issues/3174>

### Expected behavior
I expect this syntax to be identical to the one that [R2 have](http://www.rebol.com/docs/core23/rebolcore-9.html#section-3.2), however it doesn't work as expected. 

I also vaguely remember that @dockimbel told me that this feature is not (yet?) implemented correctly and in fact follows R3 style.

What I expect:
```Red
>> foo: func [:x][body-of :x]
== func [:x][body-of :x]
>> foo foo
== [body-of :x]
```

```Red
>> bar: func ['x][reverse x]
== func ['x][reverse x]
>> bar (1 + 2)
== (2 + 1)
```

```Red
>> foo: func ['x][type? x]
== func ['x][type? x]
>> foo foo
== word!
>> foo :foo
== get-word!
```
### Actual behavior
```Red
>> foo foo
*** Script Error: reflect does not allow word! for its value argument
*** Where: reflect
*** Stack: foo body-of  
```
```Red
>> bar (1 + 2)
*** Script Error: reverse does not allow integer! for its series argument
*** Where: reverse
*** Stack: bar  
```
```Red
>> foo: func ['x][type? x]
== func ['x][type? x]
>> foo foo
== word!
>> foo :foo
*** Script Error: x is missing its 'x argument
*** Where: x
*** Stack: foo  
```
So far it seems that `:arg` behaves like `'arg` should, i.e. passes argument literally, and `'arg` is "crippled" and could be safely applied only to `word!` values. 
```Red
>> bar: func [:x][reverse x]
== func [:x][reverse x]
>> bar (1 + 2)
== (2 + 1)
```
Though here `:arg` indeed works as expected, but IMO it should be the same with `'arg`.

I wasn't able to pinpoint exact differences :disappointed: In short, `:arg` should fetch value of the argument without evaluation, and `'arg` should pass argument literally, as-is.

### Steps to reproduce the problem
Play around with examples from Rebol/Core guide and compare results in R2 and Red.

### Red version and build date, operating system with version.
Latest as of this report
```Red
>> about
Red for Windows version 0.6.3 built 28-Dec-2017/14:17:05+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2017-12-28T12:46:14Z, dark-november, commented:
<https://github.com/red/red/issues/3174#issuecomment-354283159>

    Actually, the expected behaviour should be R3-style, as this is the simpler and more flexible set of rules.
    
    For the details, see Andreas Bolka's treatise on the Red Mailing List 3 years ago: https://groups.google.com/forum/message/raw?msg=red-lang/fBFcgty3Ox4/aLn4WEwSY3UJ
    
    The gist of it is the following set of rules:
    
    > [R2] lit-args: if next value is get-word!, eval to fetch bound value; else pass next value as-is
    > [R2] get-args: if next value is word!, eval to fetch bound value; else pass next value as-is
    > 
    > [R3] lit-args: if next value is get-word! or get-path! or paren: eval to fetch bound value; else pass next value as-is
    > [R3] get-args: pass next value as-is
    
    Red appears to follow R3's improved behaviour, so I think this is "not a bug".

--------------------------------------------------------------------------------

On 2017-12-28T12:54:18Z, 9214, commented:
<https://github.com/red/red/issues/3174#issuecomment-354284099>

    @dark-november thank you for clarification! However, I would like to hear if this behavior is intentional or is a subject to change.

