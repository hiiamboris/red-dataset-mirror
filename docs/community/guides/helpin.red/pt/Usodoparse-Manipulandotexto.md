Original URL: <http://helpin.red/pt/Usodoparse-Manipulandotexto.html>

# Uso do parse - Manipulando texto

* * *

* * *

Inserindo palavras no texto:

Red \[]

a: "Not great Britain nor small Britain, just Britain"

parse a \[any \[to "Britain" insert "blue " skip]]

print a

Not great blue Britain nor small blue Britain, just blue Britain

Observe que skip foi adicionado à regra para evitar um loop infinito: to leva o input para antes do match, portanto, "Britain" seria correspondido ininterruptamente se não usássemos o skip.

Removendo palavras do texto:

Red \[]

a: "Not great Britain nor small Britain, just Britain"

parse a \[ any \[to remove "Britain"]] ;seems to work the same as \[to "Britain" remove "Britain"]

print a

Not great  nor small , just

Explicando o código:

Primeiro:

![](http://helpin.red/lib/NewItem197.png)

; "any" repete a regra até que não encontre mais um match

Então:

![](http://helpin.red/lib/NewItem196.png)

; "to 'Britain" leva o input até ANTES do match ('Britain')  e remove esse match

Mudando palavras do texto:

Red \[]

a: "Not great Britain nor small Britain, just Britain"

parse a \[ any \[to "Britain" change "Britain" "Australia"]] ;\[to change "Britain" "Australia"] também funciona!

print a

Not great Australia nor small Australia, just Australia
