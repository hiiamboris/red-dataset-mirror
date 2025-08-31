
#2813: DOC: make image! with 4-element tuple and transparency byte is allowed - the latter is ignored
================================================================================
Issue is open, was reported by meijeru and has 0 comment(s).
[type.documentation]
<https://github.com/red/red/issues/2813>

```
>> make image! [1x1 1.2.3.4 #{FF}]
== make image! [1x1 #{010203} #{04}]
```



