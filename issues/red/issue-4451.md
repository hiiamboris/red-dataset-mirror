
#4451: [Compiler] GET-PATH! literals are malformed
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/4451>

**Describe the bug**
`get-path!` literals are compiled as `get-path!` with `get-word!` at the head, as in:
```red
>> to get-path! [:foo bar]
== ::foo/bar
```

**To reproduce**
The following snippet:
```red
probe quote :foo/bar
```

When compiled, results in:
```red
::foo/bar
```

**Expected behavior**

```red
:foo/bar
```

**Platform version**

W10, `master` branch, commit 172c5fb1.



