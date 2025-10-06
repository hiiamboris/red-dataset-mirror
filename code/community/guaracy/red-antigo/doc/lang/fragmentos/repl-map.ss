red>> a: #(1 a 4 b 7 c 2 z t "x")
== #(
    1 a
    4 b
    7 c
    2 z
    t: "x"
)
red>> a/t
== "x"
red>> a/4
== b
red>> type? a
== map!
red>> a/t: "novo"
== "novo"
red>> a
== #(
    1 a
    4 b
    7 c
    2 z
    t: "novo"
)
red>> 