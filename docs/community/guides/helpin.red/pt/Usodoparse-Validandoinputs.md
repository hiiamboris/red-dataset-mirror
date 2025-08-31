Original URL: <http://helpin.red/pt/Usodoparse-Validandoinputs.html>

# Uso do parse - Validando inputs

* * *

* * *

Validando entradas alfanuméricas:

Antes de prosseguir, devo avisá-lo que o datatyping do Red pode causar alguns problemas à programação. Por exemplo, um número de um único dígito em Red pode ser um integer!, um string!, um char! , ou qualquer outra coisa. Portanto, se você tiver alguns erros inexplicáveis ​​em seu script, verifique se os datatypes são compatíveis.

Esse é um script que solicita ao usuário que digite 4 números de um dígito e verifica se a entrada está OK até que a entrada seja "q":

Red \[]

entry: ""

while \[entry &lt;&gt; "q"] [

       entry: ask "Enter four digits in the 1-8 range: "

       either (parse entry \[some \["1" | "2" | "3" | "4" | "5" | "6" | "7" | "8"]]) and ((length? entry) = 4) [

               print "OK"]

               [

               print "Not OK!"

               ]

]

Isso funciona, mas \["1" | "2" | "3" | "4" | "5" | "6" | "7" | "8"] pode ser substituido por charset \["12345678"]:

Red \[]

entry: ""

validchar: charset \["12345678"]

while \[entry &lt;&gt; "q"] [

       entry: ask "Enter four digits in the 1-8 range: "

       either (parse entry \[some validchar]) and ((length? entry) = 4) [

               print "OK"]

               [

               print "Not OK!"

               ]

]

Como o parse verifica caracter por caracter, charset \["12345678"] também pode ser escrito como charset \[#"1" - #"8"] ! Red entende que essa é uma seqüência de caracteres. Assim, seu programa pode aceitar qualquer caractere ASCII numérico e minúsculo usando charset \[#"0" - #"9" #"a" - #"z"].

Simples validador de número de telefone (do manual da Rebol / Core) - Regras referindo-se a outras regras:

Red \[]

digits: charset "0123456789"

area-code: \["(" 3 digits ")"]

phone-num: \[3 digits "-" 4 digits]

print parse "(707)467-8000" \[\[area-code | none] phone-num]

true

Simples validador de e-mail (do blog do Red):

Red \[]

digit:   charset "0123456789"

letters: charset \[#"a" - #"z" #"A" - #"Z"]

special: charset "-"

chars:   union union letters special digit

word:    \[some chars]

host:    \[word]

domain:  \[word some \[dot word]]

email:   \[host "@" domain]

print parse "john@doe.com" email

print parse "n00b@lost.island.org" email

print parse "h4x0r-l33t@domain.net" email

true

true

true

Validando expressões matemáticas escritas como texto (do manual do Rebol/Core):

Observe que este exemplo usa regras recursivas (uma regra que se refere a si mesma).

Red \[]

expr:    \[term \["+" | "-"] expr | term]

term:    \[factor \["\*" | "/"] term | factor]

factor:  \[primary "\*\*" factor | primary]

primary: \[some digit | "(" expr ")"]

digit:   charset "0123456789"

print parse "1+2\*(3-2)/4" expr        ; vai retornar true

print parse "1-(3/)+2" expr           ; vai retornar false

true

false
