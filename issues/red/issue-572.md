
#572: Return from func
================================================================================
Issue is closed, was reported by johnk- and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/572>

Using 'return within a func changes the behaviour in this example.

sp: func [x y] [return parse "aa" [collect [keep skip]]] 
print sp "q" "w"
w

sp: func [x y] [parse "aa" [collect [keep skip]]]
print sp "q" "w"
a



