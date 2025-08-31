Original URL: <http://helpin.red/cs/Introspekce.html>

# Introspekce

* * *

Introspekce:

* * *

## Průběh funkce  parse lze zobrazit pomocí funkce parse-trace.

PARSE  parse-trace        

Provede parsování vstupu a rovněž vytiskne průběh procesu krok za krokem.

a:  \["fox" "owl" "rat"]

print parse-trace a \[\[ "box" | "fox" ] "owl"  "rat"]

--&gt;

  match: \[ \["cow" | "fox"] "owl" "rat"]

  input: \["fox" "owl" "rat"]  

  --&gt;

    match: \["cow" | "fox"]

    input: \["fox" "owl" "rat"]    

    ==&gt; not matched

    match: \["fox"]

    input: \["fox" "owl" "rat"]    

    ==&gt; matched

  &lt;--

  match: \["owl" "rat"]

  input: \["owl" "rat"]  

  ==&gt; matched

  match: \["rat"]

  input: \["rat"]  

  ==&gt; matched

  return: true

  true

Průběh procesu parsování lze také zjistit vhodným vložením příkazů print :

a:  \["fox" "owl" "rat"]

print parse a ["fox" (print "reached fox")

               "owl" (print "reached owl")

               "rat" (print "reached the end") ]

reached fox

reached owl

reached the end

true
