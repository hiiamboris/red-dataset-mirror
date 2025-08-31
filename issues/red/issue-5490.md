
#5490: Promotion inconsistency in `min/max pair float`
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/5490>

**Describe the bug**

```
>> min 1x1 (1.#inf,1.#inf) 
== (1, 1) 
>> min 1x1 1.#inf 
== *** Script Error: integer! overflow/underflow
*** Where: min
*** Near : min 1x1 1.#INF
```
These operations are reasonable to expect to be equivalent, but they aren't. Also:
```
>> max 1x1 (1.#nan,1.#nan) 
== (1.#NaN, 1.#NaN) 
>> max 1x1 1.#nan 
== *** Script Error: integer! overflow/underflow
*** Where: max
*** Near : max 1x1 1.#NaN
*** Stack: startup process-into process-into thrown call-cli-func do-events trap with-thrown process-any-event process-next-event dispatch with-stop process-event do-handlers do-handler trap with-thrown evaluate-since evaluate trap with-thrown capture-output fcatch with-thrown 
```

**Expected behavior**

Promote scalar into relevant 2D type then compute min/max.

**Platform version**
`Red 0.6.5 for Windows built 22-Feb-2024/16:47:26+03:00  commit #5521b51`


