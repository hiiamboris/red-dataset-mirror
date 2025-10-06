red>> caminho: 'a/b
== a/b
red>> type? caminho
== path!
red>> insert :caminho 'aqui
== a/b
red>> caminho
== aqui/a/b
red>> append :caminho 'la
== aqui/a/b/la
red>> find :caminho 'b
== b/la
red>> caminho/2
== a
red>> a: 3x4
== 3x4
red>> a/x
== 3
red>> a/y
== 4
red>> 
