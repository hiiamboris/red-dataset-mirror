
#578: PARSE COLLECT INTO looses insertion end
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/578>

I'm using COLLECT INTO to implement functions with an /into refinement, but it's hard to make them consistent with reduce/into and compose/into, because it returns the start of the insertion instead of the end. This information is hard to reconstruct from outside PARSE. I think COLLECT INTO would be more useful it it returned the end of the insertion, so you can cascade them like INSERT.

red>> b: next [1 2]
== [2]
red>> parse [3] [collect into b [keep integer!]]
== true
red>> b
== [3 2]



