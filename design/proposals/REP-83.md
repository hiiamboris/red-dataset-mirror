
#83: WISH: /only on REPLACE
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 0 comment(s).
<https://github.com/red/REP/issues/83>

I kindly request `/only` in `REPLACE` to use the following coding pattern:

```
>> x: [foreach %values SSS [print %values]]
== [foreach %values SSS [print %values]]
>> z: [a b]
== [a b]
>> SSS: [1 5 2 6 3 7]
== [1 5 2 6 3 7]
>> replace/deep/all x %values z  
== [foreach a b SSS [print a b]] ; !!!
; !!!! It should be replace/deep/all/only
; !!!! The result should be: [foreach [a b] SSS [print [a b]]
>>
```

%values could be any usable datatype, I have chosen this in my example just to be more visible.




