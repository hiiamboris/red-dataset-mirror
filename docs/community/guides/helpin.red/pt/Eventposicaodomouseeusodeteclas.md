Original URL: <http://helpin.red/pt/Eventposicaodomouseeusodeteclas.html>

# Event! posição do mouse e uso de teclas

* * *

* * *

## Toda a vez que um event! acontece em uma face, você pode obter informação sobre ele de  event/&lt;see list below&gt;.

## Mouse position:

## Então, no exemplo simples abaixo, nós imprimimos o tipo de evento e as coordenadas do mouse quando um  down (click) do mouse acontece:

Red \[needs: view]

view [

   base 100x100

   on-down [

               print event/type

               print event/offset

       ]

]

down  
39x57  
down  
86x43

## Key pressed:

## Curiosamente, no exemplo acima você só obtém none!  se você tentar imprimir event/key, mas no exemplo abaixo, usando on-key como evento, você obtém não apenas a tecla apertada, mas também as coordenadas do mouse! Na verdade, você obtém as coordenadas do mouse onde quer que ele esteja na tela, referidas ao canto superior esquerdo da face.

Red \[needs: view]

view [

   area 100x100

   on-key [

               print event/type

               print event/offset

               print event/key

       ]

]

key  
\-59x84  
r  
key  
\-36x59  
s  
key  
\-116x79  
o

## Algumas faces parecem não gerar eventos de key. Por exemplo, se você substituir area por base no exemplo acima, não obterá nenhum resultado no console.

## Segue uma lista de eventos da  [Documentação oficial do Red](https://doc.red-lang.org/en/view.html):

Campo

Valor retornado

type

Tipo de evento (word!).

face

Objeto da face onde o evento ocorreu (object!).

window

Janela onde o evento ocorreu (object!).

offset

Offset do cursor do mouse relativa à face quando o evento ocorreu (pair!). Para eventos de gestos, retorna as coordenadas do ponto central.

key

Tecla pressionada (char! word!).

picked

Novo item selecionado em uma face (integer! percent!). Para um evento down do mouse em um text-list, ele retorna o index do item embaixo do mouse ou  none. Para um evento  wheel retorna o número de passos de rotação, um número positivo indica rotação para frente, e vice-versa. Para um evento menu, retonra o ID correspondente do menu (word!). Para um gesto de zoom, retonra o percentual representando o aumento/redução. Para outros gestos o valor depende do sistema (por enquanto).

flags

Retorna uma lista de uma ou mais (block!).

away?

Retorna true se o cursor sai dos limites da face(logic!). Só funciona se o evento  over estiver ativo.

down?

Retonra true se  o botão esquerdo do mouse foi pressionado (logic!).

mid-down?

Retonra true se o botão central do mouse foi pressionado (logic!).

alt-down?

Retonra true se o botão direito do mouse foi pressionado (logic!).

ctrl?

Retonra true se  CTRL foi pressionado (logic!).

shift?

Retonra true se  SHIFT foi pressionado (logic!).
