
#5246: Inconsistency of AT
================================================================================
Issue is closed, was reported by tph002 and has 2 comment(s).
<https://github.com/red/red/issues/5246>

In combination with clear find, I have correct results with :
>> f: ["11" "22" "33"]   (insert head   clear find f "33"   "00")   f
== ["00" "11" "22"]

or with:

>>  f: ["11" "22" "33"]   (insert skip   clear find f "33"  -2 "00")   f
== ["00" "11" "22"]

but the result is wrong with:

>>  f: ["11" "22" "33"]   (insert at   clear find f "33"  1 "00")   f
== ["11" "22" "00"]

The result est identical when using 2 instead of 1 :
>>  f: ["11" "22" "33"]   (insert at  clear find f "33"  2 "00")   f
== ["11" "22" "00"]

if I write this way, the result is correct:

>>  f: ["11" "22" "33"]   (clear find f "33")  (insert at f 1 "00")   f
== ["00" "11" "22"]



Comments:
--------------------------------------------------------------------------------

On 2022-11-28T14:52:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5246#issuecomment-1329241677>

    @tph002 please use [Gitter chat](https://gitter.im/red/help) to ask questions as you learn the basics.
    
    Series index is counted from its current offset, which is changed by `find`. In your `at` example, `-2` is the correct index.

