red>> a: [2 4 6 8 1 3 5 7 6 2]
== [2 4 6 8 1 3 5 7 6 2]
red>> type? a
== block!
red>> first a
== 2
red>> a/4
== 8
red>> sort a
== [1 2 2 3 4 5 6 6 7 8]
red>> unique sort a
== [1 2 3 4 5 6 7 8]
red>> last a
== 8
red>> a
== [1 2 2 3 4 5 6 6 7 8]
red>> print ["um" "dois" lf "três" "quatro"]
um dois 
três quatro
red>> either 1 > 2 [
[    print "1 é maior que dois".][
[    print "1 é menor que dois."]
1 é menor que dois.
red>> 
