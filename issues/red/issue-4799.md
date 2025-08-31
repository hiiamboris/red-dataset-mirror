
#4799: Binary and string equality
================================================================================
Issue is closed, was reported by zwortex and has 0 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/4799>

Binary and string equality differ according to the order of the test. 
I guess all cases should return false.

```
a: "foo"
b: to-binary a
equal? a b ; false
equal? b a ; true
strict-equal? a b ; false
strict-equal? b a ; true
```


