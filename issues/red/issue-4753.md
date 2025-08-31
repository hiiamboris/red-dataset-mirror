
#4753: `as-pair special-float` doesn't error out
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4753>

**Describe the bug**
```
>> as-pair 1 -1.#inf
== 1x-2147483648
>> as-pair 1 1.#inf
== 1x-2147483648
>> as-pair 1 1.#nan
== 1x-2147483648
```
```
>> 1x1 * 1.#nan
== -2147483648x-2147483648
>> 1x1 * 1.#inf
== -2147483648x-2147483648
>> 1x1 * -1.#inf
== -2147483648x-2147483648
```
which allows the error to propagate further

**Expected behavior**

An error. Or when we have floating pairs we should allow `1.#nan x 1.#nan`? It may make sense in some applications but it will be a lexical nightmare probably.

**Platform version**
```
Red 0.6.4 for Windows built 4-Dec-2020/7:41:48+03:00 commit #382dd4e
```

Related: https://github.com/red/red/issues/3228


