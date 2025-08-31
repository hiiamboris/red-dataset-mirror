Original URL: <http://helpin.red/pt/Imprimindocaracteresespeciais.html>

# Imprimindo caracteres especiais

* * *

* * *

### Essa informação foi obtida na documentação do Rebol, mas eu testei a maior parte deles em Red e parecem funcionar:

### Caracteres de controle:

Caracter

Definição

#"^(null)" or #"^@"

null (zero)

#"^(line)", or #"^/"

nova linha

#"^(tab)" or #"^-"

tab horizontal

#"^(page)"

new page (and page eject)

#"^(esc)"

escape

#"^(back)"

backspace

#"^(del)"

delete

#"^^"

caret character

#"^""

aspas

#"(0)" to #"(FFFF)"

caracteres em hex

Caracteres especiais para usar dentro de strings:

Caracter

Função

^"

imprime um " (aspas)

^}

insere um } (chave - fechar)

^^

insere um ^ (caret?)

^/

começa nova linha

^(line)

começa nova linha

^-

insere um tab

^(tab)

insere um tab

^(page)

nova página (?)

^(letter)

insere control-letter (A-Z)

^(back)

apaga um caracter atrás

^(null)

insere um carcter "null"

^(esc)

insere um caracter "escape"

^(XX)

insere um ASCII pelo número hexadecimal dele
