
#1867: Parse goes into infinite loop after paren expression modified input series
================================================================================
Issue is closed, was reported by Zamlox and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1867>

When I execute following code:

```
rule: [any [to "[" start-mark: skip copy content to "]" skip end-mark: (insert/only remove/part start-mark end-mark content)]]
x: [1 2 "[" a b "]" 3 4]
parse x rule
```

parse will enter in continuous loop and I have to force close console.
Same code works well in Rebol2:

```
>> rule: [any [to "[" start-mark: skip copy content to "]" skip end-mark: (insert/only remove/part start-mark end-mark content)]]
== [any [to "[" start-mark: skip copy content to "]" skip end-mark: (insert/only remove/part start-mark end-mark content)]]
>> x: [1 2 "[" a b "]" 3 4]
== [1 2 "[" a b "]" 3 4]
>> parse x rule
== true
>> content
== [a b]
>> x
== [1 2 [a b] 3 4]
```



