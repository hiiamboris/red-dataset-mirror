
#5285: [Regression] Parse's `collect into` is now broken
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5285>

Likely after https://github.com/red/red/commit/1ea076c4177b31897663433490c45049f1e93045

**Describe the bug**

There's some weird character reordering going on when `collect into` is used:
```
[collect into out rule] "p-------dgg bt bst n mrs"
[collect into out rule] "p-rs------dgg bt bst n m"
[collect after out rule] "p-rs- m-st n-t b- b-gg-d"
```

I also notice orders of magnitude slowdowns on big buffer, likely due to insert being used instead of append.

**To reproduce**

```
Red [] 

vowel: charset "aeiou"
str: {parse must not be bugged}

out: {}
rule: [
	(clear out)
	any [keep to vowel skip keep (#"-")]
	keep to end
]
parse str b: [collect into  out rule] print [mold b mold out]
take/last append str "¿"			;) alters the output!
parse str b: [collect into  out rule] print [mold b mold out]
parse str b: [collect after out rule] print [mold b mold out]
```

**Expected behavior**

`collect after` result is the correct one

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4641 date: 16-Feb-2023/19:09:20 commit: #abd0b500915c59b913eed264967d90055b285261 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


