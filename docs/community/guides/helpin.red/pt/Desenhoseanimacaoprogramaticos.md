Original URL: <http://helpin.red/pt/Desenhoseanimacaoprogramaticos.html>

# Desenhos e animação programáticos

* * *

* * *

Executar desenhos usando ferramentas de programação Red (loops, matemática, ramificações, etc.) requer alguma estruturação do script. Eu sugiro a seguinte estrutura como regra geral:

Red \[needs: view]

draw-changing: function \[  ]

view compose/deep/only [

       face focus

       draw\[commands (arguments)]

       on-event \[ draw-changing ]

]

draw-changing - Estas são as funções a serem chamadas de um event para fazer cálculos e, em seguida, alterar o campo "draw" do objeto da face. Você deve alterar este campo daqui porque não pode mudá-lo de dentro do bloco do dialeto draw.

face focus -  Alguns events (como key) parecem só ser gerado se houver  focus nas faces como base ou box, cuidado.

draw - Executa o dialeto draw. Qualquer argumento calculado (variável) deve estar entre parênteses para ser computado por compose/deep/only.  

on-event - Chama a função apropriada de draw-changing, considerando o tipo de evento.

Animação simples:

Red \[needs 'view]

position: 0x0        

update-canvas: func \[] [        

   position: position + 1x1

   canvas/draw:  reduce \['circle position 5]

]

view [

   canvas: base 100x100  rate 25

   on-time \[update-canvas]

]

![](http://helpin.red/lib/NewItem204.png)

Explicando o código:

Red \[needs 'view]

{ "position" é o centro do círculo que vai se mover

aqui ele está no canto superior esquerdo}

position: 0x0        

{a função "update-canvas" faz todo o

processamento necessário e "passa" a

rotina de draw para o objeto de "canvas". 

Observe três coisas no código abaixo:

1- Sim, draw é um campo de um objeto!

2- Você deve usar "reduce" para enviar o

valor atual da posição;

3- Deve haver um apóstrofo antes

"circle". "circle" é um comando do

dialeto draw, e por isso deve ser passado "como é"}

update-canvas: func \[] [        

   position: position + 1x1

   canvas/draw:  reduce \['circle position 5]

]

{A rotina do view cria uma base chamada

"canvas" que se atualiza 25 vezes

por segundo}

view [

   canvas: base 100x100  rate 25

   on-time \[update-canvas]

]

Para mostrar que a canvas é um objeto!, feche a visualização gráfica depois uns instantes, mas deixe o console aberto. Digite ? canvas no console. Você vai ter:

&gt;&gt; ? canvas

CANVAS is an object! with the following words and values:

    type             word!         base

    offset           pair!         10x10

    size             pair!         100x100

    text             none!         none

    image            none!         none

    color            tuple!        128.128.128

    menu             none!         none

    data             none!         none

    enabled?         logic!        true

    visible?         logic!        true

    selected         none!         none

    flags            none!         none

    options          block!        length: 6  [style: base vid-align: top at-o...

    parent           object!       [type offset size text image color menu dat...

    pane             none!         none

    state            none!         none

    rate             integer!      25

    edge             none!         none

    para             none!         none

    font             none!         none

    actors           object!       \[on-time]

    extra            none!         none

    draw             block!        length: 3  \[circle 37x37 5]

    on-change*       function!     \[word old new /local srs same-pane? f saved]

    on-deep-change*  function!     \[owner word target action new index part]

No próximo exemplo, em vez de alterar o bloco de draw , vamos fazer um append  com novos comandos de draw . O resultado é que todos os desenhos anteriores são mantidos (na verdade, são redesenhados, mas ...), criando um rastro de desenhos:

Red \[ needs 'view ]

position: 0x0

command: \[]        ; initialized to prevent error.

update-canvas: func \[] [

   position: position + 1x1

   append command reduce \['circle position 5]

   canvas/draw:  command

]

view [

   canvas: base 100x100  rate 25

   on-time \[update-canvas]

]

![](http://helpin.red/lib/NewItem203.png)

Note que se você fechar a janela gráfica e digitar ? canvas no console, você verá um longo bloco como o valor de draw:

&gt;&gt; ? canvas

...

    draw     block!   length: 84  [circle 1x1 5 circle 2x2 5 circle 3x3 5 circle 4x4 5 ...

...

Um exemplo de programa desenhado:

Red \[needs: view]

drawcircles: does [

   command: \[pen red fill-pen blue]

   repeat x 8 [

       repeat y 8 [

           position:(x * 11x0) + (y * 0x11)

           append command reduce \['circle position 4]

       ]

   ]

           canvas/draw:  command

]

view [                

   canvas: base 100x100

   do \[drawcircles]

]

![](http://helpin.red/lib/NewItem202.png)

Você poderia ter escrito o programa acima sem usar uma função, mas você precisaria do refinamento no-wait para view , assim:

Red \[needs: view]

command: \[pen red fill-pen blue]

view/no-wait [                

   canvas: base 100x100

]

{o refinamento "no-wait" acima permite

script criar a view (base) e, em seguida

continuar direto para o bloco do"repeat".

Sem "no-wait", o script permaneceria no

bloco do "view"}

repeat x 8 [

   repeat y 8 [

       position:(x * 11x0) + (y * 0x11)

       append command reduce \['circle position 4]

   ]

]

canvas/draw:  command

probe command {apenas para mostrar o que foi enviado para draw.

Você deve usar o probe em vez de print, porque print

tenta computar (avaliar), e "caneta" e "círculo" não têm

valor, o que gera um erro}

[pen red fill-pen blue circle 11x11 4 circle 11x22 4 circle 11x33 4 circle 11x44 4 circle 11x55 4 circle 11x66 4 circle 11x77 4 circle 11x88 4 circle 22x11 4 circle 22x22 4 circle 22x33 4 circle 22x44 4 circle 22x55 4 circle 22x66 4 circle ...

Você vê que Red atualiza automaticamente a base com os desenhos gerados pelo bloco do draw , mesmo depois que a face já foi criada por View. Isso acontece porque no Red, ao contrário do Rebol, o padrão é que sempre que você alterar algum campo do objeto face, esta é atualizada automaticamente. Isso não teria acontecido se você adicionasse a instrução system/view/auto-sync?: off no início do script, conforme descrito [aqui](http://helpin.red/Topicosavancados.html#autosync) .

O programa Paint mais simples do mundo:

Red \[needs: view]

newposition: 40x40                ;desculpe, mas sempre começa no centro.

linedraw: func \[offset] [        ;func, não function. Variáveis são globais.

   oldposition: newposition

   newposition: offset        

       ; agora vamos adicionando linhas ao bloco de draw:

   append canvas/draw reduce\['line oldposition newposition]

]

view [

canvas: base draw\[]                ;crea um campo draw no objeto.

   on-down [                        ;quando um botão é clicado...

       do \[linedraw event/offset]  ;envia a posição do mouse.

   ]        

]

Toda vez que você clica no mouse na base, um novo segmento de linha é desenhado:

![](http://helpin.red/lib/NewItem201.png)

Aqui está uma versão muito melhorada do script que, no entanto, não usa a estrutura "regra geral":

Red \[needs: view]

EnableWrite: false

view [

   canvas: base 150x150 white all-over

   draw\[]

   on-down [                              ;quando clica o mouse...

       EnableWrite: true              ;... habilita desenho...

       startpoint: event/offset    ;...e pega a posição do cursor

   ]

   on-up \[EnableWrite: false]        ;quando o botão é solto, desabilita o desenho

   on-over [                              ;quando o cursor está sobre a base...

       if EnableWrite [        

           endpoint: event/offset        ;pega a posição atual

                       ; agora vai adicionando linhas...

           append canvas/draw reduce\['line startpoint endpoint]

           startpoint: endpoint

       ]  

   ]        

]

Observe que o flag all-over permite que o evento over crie eventos para cada movimento do mouse, conforme explicado [aqui](http://helpin.red/Topicosavancados.html#allover) .

![](http://helpin.red/lib/NewItem200.png)

Movimentando um shape com as setas do teclado

Esse script desenha um "alien" no centro de uma  base  e permite que as teclas de seta movam a shape para cima, para baixo, para a esquerda e para a direita. Ele usa a transformação translate para fazer o movimento. Observe o uso da compose para computar o que está entre parênteses.

Red \[needs: view]

pos: 28x31                ; This is the initial position of the "alien"

{O seguinte bloco é apenas a forma de um "alien"}

alien: [line 4x0 4x2

'hline 2 'vline 2 'hline -2 'vline 2

'hline -2 'vline 2 'hline -2 'vline 6

'hline 2 'vline -4 'hline 2 'vline 4

'hline 2 'vline 2 'hline 4 'vline -2

'hline -4 'vline -2 'hline 10 'vline 2

'hline -4 'vline 2 'hline 4 'vline -2

'hline 2 'vline -4 'hline 2 'vline 4

'hline 2 'vline -6 'hline -2  'vline -2

'hline -2 'vline -2 'hline -2 'vline -2

'hline 2 'vline -2 'hline -2 'vline 2

'hline -2 'vline 2 'hline -6 'vline -2

'hline -2 'vline -2 'hline -2

move 6x6 'hline 2 'vline 2 'hline -2 'vline -2

move 14x6 'hline 2 'vline 2 'hline -2 'vline -2

]

{A próxima função atualiza o bloco 'draw' do objeto cosmos.

Remove a palavra 'translate e o par seguinte!

a partir do início do bloco e, em seguida, insere 'translate

novamente e o par da posição atualizado!}

update-cosmos: func \[] [

       remove/part cosmos/draw 2    

       insert cosmos/draw reduce \['translate pos]

]                

view compose/deep/only [

       cosmos: base black focus ; use focus para ter evento on-key

       draw [

               translate (pos)         ; translação inicial. Centraliza o "alien"

               pen white        

               fill-pen white

           shape (alien)

       ]

       on-key  [

               switch event/key [

                       up        \[pos: pos - 0x1]        ; decreases y axis

                       down        \[pos: pos + 0x1]        ; increases y axis

                       left        \[pos: pos - 1x0]        ; decreases x axis

                       right \[pos: pos + 1x0]        ; increases x axis

               ]

             update-cosmos

       ]

]

![](http://helpin.red/lib/NewItem199.png)

Sugiro você alterar o program para testar a transformação  rotate .

Movendo duas ou mais shapes separadamente

O script a seguir usa a seta para a esquerda e para a direita para mover a  "nave espacial", e "z" e "x" para mover o "alien".Observe o escopo de reduce e compose :

Red \[needs: view]

;======= initial positions: ========

alienposition: 28x15

shipposition: 32x60

;======= just the shapes ===========

alien: [line 4x0 4x2

'hline 2 'vline 2 'hline -2 'vline 2

'hline -2 'vline 2 'hline -2 'vline 6

'hline 2 'vline -4 'hline 2 'vline 4

'hline 2 'vline 2 'hline 4 'vline -2

'hline -4 'vline -2 'hline 10 'vline 2

'hline -4 'vline 2 'hline 4 'vline -2

'hline 2 'vline -4 'hline 2 'vline 4

'hline 2 'vline -6 'hline -2  'vline -2

'hline -2 'vline -2 'hline -2 'vline -2

'hline 2 'vline -2 'hline -2 'vline 2

'hline -2 'vline 2 'hline -6 'vline -2

'hline -2 'vline -2 'hline -2

move 6x6 'hline 2 'vline 2 'hline -2 'vline -2

move 14x6 'hline 2 'vline 2 'hline -2 'vline -2

]

spaceship: [move 0x12 'hline 14 'vline -6

'hline -2 'vline -2 'hline -4 'vline -4 'hline -2

'vline 4  'hline -4 'vline 2 'hline -2 'vline 6

]

;======= The draw block updating function ======

; this time we create the whole block and just replace

; the original cosmos/draw

update-cosmos: does[

   drawblock: reduce compose/deep[

       'pen white

       'fill-pen white

       'translate alienposition \[shape \[(alien)]]

       'translate shipposition \[shape \[(spaceship)]]

   ]

   ;probe drawblock ;uncomment if you want to see it

   cosmos/draw: drawblock

]

view compose/deep/only [

   cosmos: base black focus

;this "draw" be "executed" only once:

   draw [        

       pen white

       fill-pen white

       translate (alienposition) \[shape (alien)]

       translate (shipposition) \[shape (spaceship)]

   ]

; now the draw block will be recreated on every key press

   on-key  [

               switch event/key [

                       #"z"        \[alienposition: alienposition - 1x0]        ; decreases x axis

                       #"x"        \[alienposition: alienposition + 1x0]        ; increases x axis

                       left \[shipposition: shipposition - 1x0]            ; decreases x axis

                       right \[shipposition: shipposition + 1x0]        ; increases x axis

       ]

      update-cosmos ; calls the "draw block recreating function"

       ]

]

![](http://helpin.red/lib/NewItem198.png)
