
#4637: runtime lexer does not support +1.#INF
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4637>

**Describe the bug**
As mentioned in the recent [blog post](https://www.red-lang.org/2020/08/redsystem-new-features.html), Red/System now supports `+1.#INF` as a supplement for `1.#INF`, both denoting a positive infinity. Since R/S is a dialect of Red, one would expect that the same literal form is supported in both of them. This expectation does not hold on practice.

**To reproduce**
Red/System script:
```red
Red/System [] probe +1.#INF
```
Compiled:
```red
1.#INF
```
Red script:
```red
Red [] probe +1.#INF
```
Interpreted:
```red
*** Syntax Error: (line 1) invalid float at +1.#INF
*** Where: transcode
*** Stack: do-file expand-directives load  
```
Compiled:
```red
1.#INF
```

**Expected behavior**
I expect runtime lexer to support `+1.#INF` the same way it supports `1.#INF` and `-1.#INF`.

**Platform version**
b3a77d3, W10.



