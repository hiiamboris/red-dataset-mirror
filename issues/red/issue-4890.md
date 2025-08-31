
#4890: reduce & compose destroy newline markers
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.wish]
<https://github.com/red/red/issues/4890>

**Describe the bug**
```
>> a: [
     1 + 
     2
     (3 +
     4) 5
     ]
>> compose a
== [
    1 + 
    2 7 5
]
>> reduce a
== [3 7 5]
```
When composing code or draw blocks, often there's a need to inspect the output visually. And it becomes a mess when new-line markers are not honored.

**Expected behavior**

I propose:
- compose retains newline state before it's parenthesis
- reduce retains newline state between expressions
```
>> a: [
[    1 + 
[    2
[    (3 +
(    4) 5
[    ]
>> compose a
== [
    1 + 
    2
    7 5
]
>> reduce a
== [
    3
    7 5
]
```
After all, it's easy to strip newlines, but hard to get them back in proper positions when they were removed.

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



