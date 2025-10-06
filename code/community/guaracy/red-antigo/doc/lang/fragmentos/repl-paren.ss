red>> a: [12 34 (44 + 66) 77]
== [12 34 (44 + 66) 77]
red>> type? a
== block!
red>> type? a/1
== integer!
red>> type? a/3
== paren!
red>> a/1
== 12
red>> a/3
== (44 + 66)
red>> 
