red>> a: 25
== 25
red>> b: [1 2 3 4 5]
== [1 2 3 4 5]
red>> c: 26
== 26
red>> sum: func [a b][a + b]
== func [a b][a + b]
red>> sum 1 2
== 3
red>> a: 25
== 25
red>> b: [1 2 3 4 5]
== [1 2 3 4 5]
red>> sum: func ["Soma dois números" a b][a + b]
== func ["Soma dois números" a b][a + b]
red>> type? b
== block!
red>> type? a
== integer!
red>> sum a c
== 51
red>> sum a b
*** Script error: block type is not allowed here
*** Where: +
red>>
red>> x: sum
*** Script error: sum is missing its a argument
*** Where: sum
red>> x: :sum
== func ["Soma dois números" a b][a + b]
red>> x 2 3
== 5
red>> type? x
*** Script error: x is missing its a argument
*** Where: x
red>> type? :x
== function!
red>>
