red>> pertence: func [v l][
[      t: append copy [] v
[      t = intersect t l
[    ]
== func [v l][t: append copy [] v t = intersect t l]
red>> pertence 3 [1 3 5 7]
== true
red>> pertence 3 [2 4 6 8]
== false
red>> ∈: make op! :pertence
== make op! [[v l]]
red>> 3 ∈ [2 4 6 8 3]
== true
red>> 3 ∈ [1 2 4 6 99]
== false
red>>
