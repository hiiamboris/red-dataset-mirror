Original URL: <http://helpin.red/cs/Controlflow.html>

# Control flow

* * *

## Control flow:

* * *

## Klíčová slova:  break, if, into, fail, then, reject.

PARSE  break          TODO

Break out of a matching loop, always returning success.

PARSE  if (expr)

Vyhodnotí logický výraz v závorce; nemá-li tento hodnotu "true", zastaví parsování  a vrací "false":

&gt;&gt; parse \[x] \[if (1 = 1) skip]

== true

&gt;&gt; parse \[x] \[if (1 = 0) skip]

== false

Vyhodnocení logického výrazu v závorce lze použít k výběru alternativnímu pravidla:

      ![](http://helpin.red/lib/NewItem183.png)

&gt;&gt; parse \[6 3 7] \[integer! integer! if (1 = 1) \[integer! | string!]]

== true

&gt;&gt; parse \[6 3 7] \[integer! integer! if (1 = 0) \[integer! | string!]]

== false

PARSE  into           TODO

Switch input to matched series (string or block) and parse it with rule..

PARSE  fail            TODO

Force current rule to fail and backtrack.

PARSE  then          TODO

Regardless of failure or success of what follows, skip the next alternate rule.

PARSE  reject        TODO

Break out of a matching loop (such as any, some, while) and indicate failure.
