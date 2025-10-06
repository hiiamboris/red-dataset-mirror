red>> oldadd: :+
== make op! [["Returns the sum of the two values" value1 [number! cha...
red>> newadd: func [a b][
[    either percent? b [
[    return a oldadd (a * b)][
[    return a oldadd b]]
== func [a b][either percent? b [return a oldadd (a * b)] [return a o...
red>> newadd 120 10%
== 132.0
red>> +: make op! :newadd
== make op! [[a b]]
red>> 120 + 10%
== 132.0
red>>
