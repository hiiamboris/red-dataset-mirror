Original URL: <http://helpin.red/pt/EventseActors.html>

# Events e Actors

* * *

* * *

## Eventos:

Clicar no mouse, passar o cursor sobre alguma coisa, apertar teclas etc., são eventos que muitas vezes devem ser associados com código. No último capítulo nós vimos que existe algo chamado action facet que executa código quando disparado por algum evento. Você pode adicionar mais blocos associados a eventos usando o seguinte leiaute:

![](http://helpin.red/lib/eventlayout.png)

Existe uma extensa lista de eventos possíveis na [documentação](https://doc.red-lang.org/en/view.html#_events). Ela está copiada no fim deste capítulo para referência.

Cada face aceita um conjunto de eventos, isto é, nem todos eventos se aplicam a todas as faces.

Eu fiz uma lista curta de eventos. Eu não vejo razão para dar um exemplo de cada evento existente, uma vez que a lógica é a mesma:

down - botão esquerdo do mouse foi pressionado; 

over - cursor so mouse passando sobre uma face;

Red \[needs: view]

view [

       t: area 40x40 blue

       on-down \[quit]

       on-over \[either t/color = red \[t/color: blue]\[t/color: red]]

]

wheel - roda do mouse sendo acionada;

Red \[needs: view]

list: \["first" "second" "third" "fourth"]

view [

       t: text "Place your cursor over here and roll the wheel"

               on-wheel [

                       t/text: first list

                       list: next list

                       if tail? list \[list: head list]

               ]                

]

key-down - uma tecla foi pressionada:

Red \[needs: view]

list: \["key" "another key" "one more key"]

view [

       below

       text "Click inside field and press a key"

       t: text 100

       a: field

               on-key-down [

                       t/text: first list

                       list: next list

                       if tail? list \[list: head list]

               ]

]

![](http://helpin.red/lib/NewItem47.png)

time - o tempo ajustado da facet  rate da face expirou.

O próximo exemplo "pisca" um texto com um tempo de 1 segundo (veja rate no capítulo  [GUI- Tópicos avançados](http://helpin.red/Topicosavancados.html)):

Red \[needs: view]

view [

       t: text "Now you see..." rate 1

               on-time \[either t/text = "" \[t/text: "Now you see..."]\[t/text: ""]]

]

close - este é um evento de janela (window) disparado quando a janela é fechada. É útil para incluir código que deve ser executado quando o usuário encerra o script.

Red \[needs: view]

view [

       on-close \[print "bye!"]        

       button \[print "click"]

]

### Actors

Actors como se chamam as funções de tratamento de eventos (event handling functions, ou event hadlers) no Red, isto é, o código dentro do bloco depois de  on-&lt;event&gt; . Então porque não chamá-los de event handlers como quase todas as outras linguagens? Eu acho que é porque eles são um objeto dentro da face, como você pode ver se rodar o código abaixo e clicar na face area:

Red \[Needs: view]

view [

       t: area 40x40 blue on-down \[print t] ;click to quit

       on-over \[either t/color = red \[t/color: blue]\[t/color: red]]

]

Você vai ver no console, perto do fim da impressão, um objeto com os actors descritos:

(...)

edge: none

para: none

font: none

actors: make object! [

   on-down: func \[face \[object!] event \[event! none!]]\[print t]

   on-over: func \[face \[object!] event \[event! none!]]\[either t/color = red \[t/color: blue] \[t/color: red]]

]

extra: none

draw: none

(...)

#### Lista de nomes de eventos names:

Name

Origem

Causa

down

mouse

Botão esquerdo do mouse pressionado.

up

mouse

Botão esquerdo do mouse solto.

mid‑down

mouse

Botão central do mouse pressionado.

mid‑up

mouse

Botão central do mouse solto.

alt‑down

mouse

Botão direito do mouse pressionado.

alt‑up

mouse

Botão direito do mouse solto.

aux‑down

mouse

Botão auxiliar do mouse pressionado.

aux‑up

mouse

Botão auxiliar do mouse solto.

drag‑start

mouse

Início do arrastar (drag) de uma face.

drag

mouse

Face sendo arrastada.

drop

mouse

Uma face arrastada foi solta.

click

mouse

Click do botão esquerdo do mouse (apenas na face button).

dbl‑click

mouse

Duplo-click esquerdo do mouse.

over

mouse

Cursor do mouse passando sobre uma face. Este evento é disparado uma vez quando o cursor entra na face e outra vez quando o cursor sai da face. Se a facet flags tem a flag all‑over , então todos os eventos intermediários são criados também.

move

mouse

Uma janela foi movimentada.

resize

mouse

Uma janela foi redimensionada.

moving

mouse

Uma janela está sendo movimentada.

resizing

mouse

Uma janela está sendo redimensionada.

wheel

mouse

A roda do mouse está sendo movimentada.

zoom

touch

Um gesto de zoom (pinching) foi reconhecido.

pan

touch

Um gesto de pan (sweeping) foi reconhecido.

rotate

touch

Um gesto de rotação foi reconhecido.

two‑tap

touch

Um gesto de duplo toque (double tapping) for reconhecido.

press‑tap

touch

Um gesto de  press-and-tap foi reconhecido.

key‑down

keyboard

Uma tecla foi pressionada.

key

keyboard

Foi dada entrada em um caracter ou uma tecla especial foi pressionada (exceto control, shift ou menu).

key‑up

keyboard

Uma tecla pressionad foi solta.

enter

keyboard

Tecla Enter foi pressionada.

focus

any

A face recebeu o foco.

unfocus

any

A face perdeu o foco.

select

any

Uma seleção foi feita em uma face com múltiplas escolhas.

change

any

Uma mudança ocorreu em uma face que aceita entradas de dados do usuário (input de texot ou seleção em uma lista).

menu

any

Uma entrada do menu foi escolhida..

close

any

Uma janela foi fechada.

time

timer

O delay determinado para o rate de uma face expirou.

Notas:

- Eventos touch não estão disponíveis para Windows XP.+
- Um ou mais eventos  moving sempre precedem um do tipo  move .
- Um ou mais eventos  resizing sempre precedem um do tipo resize.
