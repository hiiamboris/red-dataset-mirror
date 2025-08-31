Original URL: <http://helpin.red/pt/Programacaoreativa.html>

# Programação reativa

* * *

* * *

A Programação Reativa cria um mecanismo interno que atualiza coisas automaticamente quando um tipo especial de objeto é modificado. Não há necessidade de chamar funções ou subrotinas para fazê-lo. Você muda o objeto A e alguma coisa B é automaticamente mudada também.

Reactor: é o objeto que, quando modificado, dispara as mudanças. É criado por make reactor! .

Expressão Reativa: é alterada quando o reacto muda. É criada por is .

action! make reactor! e op! is

Exemplo bem básico de Programação Reativa::

Red\[]

a: make reactor! \[x: ""]        ;reactor object - dispara mudanças quando alterado

b: is \[a/x]                                ;expressão reativa - muda quando "a" muda

forever [

       a/x: ask "?"                ;aqui nós entramos um valor para o campo 'x' de 'a'

       print b                        ;aqui nós imprimimos 'b' e... surpresa! ele mudou!

]

?house

house

?fly

fly

?bee

bee

Um reactor pode atualizar a si mesmo:

Red\[]

a:  make reactor! \[x: 1 y: 2 total: is \[x + y]]

forever [

       a/x: to integer! ask "?"

       print a/total

]

?33

35

?45

47

Cuidado para não criar um loop infinito. Isto acontece quando uma mudança diaspara uma mudança em sí mesma.

### deep-reactor!

Assim como copy tem o refinamento  /deep para alcançar valores aninhados (blocos dentro de blocos), também o reactor! tem esse refinamento.

Este programa deveria repetir o que você digita no console, mas não funciona:

Red\[]

a: make reactor! \[z: \[x: ""]]

b: object \[w: is \[a/z/x]]

b/w: "no change"

forever [

       a/z/x: ask "?"

       print b/w

]

?house  
no change  
?blue  
no change

Entretanto, se você muda para deep-reactor!:

Red\[]

a: make deep-reactor! \[z: \[x: ""]]

b: object \[w: is \[a/z/x]]

b/w: "no change"

forever [

       a/z/x: ask "?"

       print b/w

]

?house  
house  
?blue  
blue

function! react

Esta é a palavra pré-definida para criar GUIs reativas. Por favor, veja em  [GUI/Tópicos avançados](http://helpin.red/Topicosavancados.html).

* * *

Copiado e colado da [documentação](https://doc.red-lang.org/en/reactivity.html):

function! clear-reactions

Remove todas as reações definidas, incondicionalmente.

function! react?

Checa se um campo de um objeto é uma fonte de reação. Se for, retorna a primeira reação encontrada onde o campo do objeto está presente como fonte, caso contrário, retorna none . O refinamento /target checa se o campo é um alvo, ao invés de uma fonte, e retorna a primeira reação cujo alvo é esta fonte ou  none se não for encontrada.

    /target      =&gt; Checa se é um alvo ao invés de uma fonte.

function! dump-reactions

Mostra todas as reações registradas para debug.
