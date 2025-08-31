
#4574: Remainder raises errors where should return a NaN
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4574>

**Describe the bug**

Since we have qNaN arithmetic mostly, even `sqrt -1.0 = 1.#NaN`, I suggest following the rest of the world with `remainder` as well.
Right now it's:
```
>> 1.0 % 0.0
*** Math Error: attempt to divide by zero
*** Where: %
*** Stack:  

>> 1.#inf % 1.0
== 1.#NaN

>> 1.#inf % 0.0
*** Math Error: attempt to divide by zero
*** Where: %
*** Stack:  
```
I suggest all of the results should be `1.#NaN`.

https://en.wikipedia.org/wiki/NaN#Operations_generating_NaN
> Remainder x % y when x is an infinity or y is zero.

(source is IEEE-754 I believe)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-Jun-2020/23:30:17+03:00 commit #b452716
```



