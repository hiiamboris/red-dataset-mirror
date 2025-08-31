
#4682: [Parse] double quote is recognized as a part of URL! with matching by datatype in binary mode
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4682>

**Describe the bug**
When matching a literal form of a `url!` inside Parse, trailing double quote is recongnized as a part of it.

**To reproduce**
```red
>> parse to binary! {https://example.org"} [copy match url! (probe to url! match)]
https://example.com%22
== true
```

**Expected behavior**
```red
>> parse to binary! {https://example.org"} [copy match url! (probe to url! match)]
https://example.com
== false
```

**Platform version**
e5876af, W10.



