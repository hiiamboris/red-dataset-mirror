Original URL: <http://helpin.red/pt/Faces.html>

# Faces

* * *

## GUI - Faces

* * *

VID DLS base

Face mais básica. Pode ser  usada para criar outras faces. Por default, vai mostrar apenas um fundo cinza.

Red \[needs: view]        

view [

       base

]

![](http://helpin.red/lib/NewItem21.png)

     box e       image

A bem da verdade, estas não são faces, mas [styles](http://helpin.red/Topicosavancados.html) da face base .  box é uma base com uma cor transparente e image é uma base que espera uma opção image! , se nenhuma for forneceida, é mostrada uma imagem vazia com fundo branco.

Nota: o tamanho default  para base e box é 80x80, mas para image, é 100x100.

Red \[needs: view]

view [

       base

       box

       image

       image %smallballoon.jpeg

]

![](http://helpin.red/lib/NewItem139.png)

#### facets:

Quando o Red interpreta o código e encontra uma face, ele procura um dos datatypes a seguir após essa face. Cada um tem um significado que vai mudar a aparência da face mostrada. Seu uso vai ficar claro nos exemplos de faces dados mais adiante.

Da [documentação](https://doc.red-lang.org/en/vid.html#_datatypes):

Datatype

O que faz

integer!

Determina a largura da face.

pair!

Determina a largura e altura face.

tuple!

Especifica a cor de fundo da face.

issue!

Especifica a cor de fundo usando notação hex (#rgb, #rrggbb, #rrggbbaa).

string!

Especifica o texto a ser mostrado pela face.

percent!

Determina a facet data (útil para progress e slider ).

logic!

Determina a facet data (útil para check e radiotypes).

image!

Determina a imagem de fundo.

url!

Carrega o conteúdo apontado pela URL.

block!

Determina a ação para o evento default da face.

get-word!

Usa uma função existente como ator.

Uma lista de facets copiada da documentação é dada no final deste capítulo.

Então, usando facets com a face  base :

Red \[needs: view]

view [

       base "HELLO!" 130x100 %balloon.jpeg                ;balloon.jpeg é uma imagem salva no mesmo...

]                                                                ;...diretório que o executável Red.

![](http://helpin.red/lib/NewItem22.png)

#### face text e facet text

Existe uma face chamada text e uma facet também chamada text..

Sobre a facet text: podem ser colocadas na maior parte das faces e podem ser formatadas tanto em estilo como em posição na face. O código a seguir...

Red \[needs: view]        

view [

       button "hello"

       button "bold" bold

       button "underline" underline

       button "strike" strike

       return

       button "top" 70x70 top

       button "middle" 70x70 middle ;vertical

       button "bottom" 70x70 bottom

       return

       button "left" 70x70 left

       button "center" 70x70 center ;horizontal

       button "right" 70x70 right

       return

       button "mix1" 70x70 top left

       button "mix2" 70x70 top center

       button "mix3" 70x70 top right

       return

       button "No" 70x70 right bold ; does not work!

]

... resulta em:

![](http://helpin.red/lib/NewItem23.png)

VID DLS text

O evento que dispara a ação defautl é o click (veja action facets)

Red \[needs: view]

view [

       text "Hello"

]

![](http://helpin.red/lib/NewItem24.png)

Apesar de h1, h2, h3, h4 e h5 não serem propriamente faces (são[](http://helpin.red/Topicosavancados.html)[styles](http://helpin.red/Topicosavancados.html)), Eu acho que devo descrevê-los aqui, já que são faces de texto com tamanhos e fontes diferentes e são bem úteis quando você está trabalhando com texto:

Red \[needs view]

view [

       below

       h1 "Hello"

       h2 "Hello"

       h3 "Hello"

       h4 "Hello"

       h5 "Hello"

]

![](http://helpin.red/lib/NewItem25.png)

#### O objeto font

Talvez você já tenha tentado atribuir uma cor ao seu texto e notou que simplesmente adicionando, digamos,  blue após a face  text apenas faz o fundo ficar colorido, mas nãoa fonte. Para formatar a onte usada para exibir strings emfaces, existe uma coisa na documentação chamada "font object". Pense nela como simplesmente um conjunto de comandos para formatar a fonte. Você os escreve após declarar sua face, junto com as outras facets.

font-name &lt;Nome de fonte válido instalado no sistema operacional&gt;

font-size &lt;Tamano da fonte em points&gt;

font-color &lt;Cor da fonte, no formato R.G.B, R.G.B.A ou o nome da cor&gt;

Você também pode adicionar bold italic underline ou strike.

Então:

Red \[needs: view]

view [

       text "hello" font-name "algerian" font-size 18 font-color red bold

       text "hello" font-name "algerian" font-size 18 font-color blue

       text "hello" font-name "broadway" font-size 15 font-color green strike

       text "hello" font-name "arial" font-size 12 font-color cyan underline

]

![](http://helpin.red/lib/NewItem26.png)

VID DLS button

O evento que dispara a ação default é o click.

Red \[needs: view]

view [

       button

]

![](http://helpin.red/lib/NewItem27.png)

#### action facets

A maioria das faces permite uma action facet, isto é um bloco de comandos que é disparado por um evento. Este evento pode ser um click do mouse (chamado "down" pelo Red) ou outra coisa como pressionar a tecla enter ou fazer uma seleção.

Para os buttons, o que dispara a action facet é o evento "down"  (mouse click) e no próximo exemplo, ele dispara o comando  quit que encerra o programa.\[quit] é a action facet ( deveria ser chamada default actor?, você pode criar seus próprios actors conforme descrito [aqui](http://helpin.red/EventseActors.html)).

Red \[needs: view]

view [

       button 50x40 "click me" \[quit]

]

![](http://helpin.red/lib/NewItem28.png)

#### cores

Se você rodar o programa abaixo...

Red \[needs: view]

view [

       base 30x30 aqua  text "aqua"       base 30x30 beige text "beige"  

       base 30x30 black text "black"     base 30x30 blue   text "blue"                

       return

       base 30x30 brick text "brick"      base 30x30 brown text "brown"  

       base 30x30 coal text "coal"       base 30x30 coffee   text "coffee"              

       return

       base 30x30 crimson text "crimson"  base 30x30 cyan text "cyan"    

       base 30x30 forest text "forest"   base 30x30 gold text "gold"                  

       return

       base 30x30 gray text "gray"        base 30x30 green text "green"  

       base 30x30 ivory text "ivory"     base 30x30 khaki text "khaki"                  

       return

       base 30x30 leaf text "leaf"        base 30x30 linen text "linen"  

       base 30x30 magenta text "magenta" base 30x30 maroon  text "maroon"              

       return

       base 30x30 mint text "mint"        base 30x30 navy text  "navy"    

       base 30x30 oldrab text "oldrab"   base 30x30 olive text "olive"                  

       return

       base 30x30 orange text "orange"    base 30x30 papaya text "papaya"

       base 30x30 pewter text "pewter"   base 30x30 pink text "pink"                  

       return

       base 30x30 purple text "purple"    base 30x30 reblue text "reblue"

       base 30x30 rebolor text "rebolor"  base 30x30 red text "red"

]

...você obterá:

#### ![](http://helpin.red/lib/NewItem29.png)

#### faces são objects

Cada face é um clone do objeto padrão face! e você pode mudar seus atributos (as facets) durante a execução (runtime):

![](http://helpin.red/lib/button3.png)

Dentro da action facet, você pode se referir aos atributos da face usando face/&lt;atributo&gt;:

![](http://helpin.red/lib/button4.png)

 Rode o script abaixo e clique no botão para você ter uma idéia da complexidade de uma face como "button":

Red \[needs: view] view \[b: button \[print b]]

VID DLS check

Red \[needs: view]

view [

       check

]

![](http://helpin.red/lib/NewItem30.png)

O evento que dispara a action facet é o change. O estado corrente do está no atributo  /data (true ou false)

![](http://helpin.red/lib/check2.png)

A propósito, o estilo do programa acima não é o correto, apenas me pareceu mais didático. Veja o Red's [Coding Style Guide](https://doc.red-lang.org/v/v0.6.0/Coding-Style-Guide.html).

VID DLS radio

O evento que dispara a action facet é o change. O estado corrente está no atributo /data

Cria um botão de rádio, com um texto opcional mostrado à esquerda ou a direita. Apenas um botão de rádio por painél pode estar ativado.

Red \[needs: view]

view [

       r1: radio "on" \[t/text: "on"]

       t: text "none"

       return

       below

       r2: radio "off" \[t/text: "off"]

       r3: radio "uh?" \[t/text: "uh?"]

]

![](http://helpin.red/lib/NewItem31.png)

VID DLS field

Campo para entrar com texto.

O evento que dispara a action facet é o enter. The events that triggers the action facet is enter. O estado corrente (texto no campo) está no atributo /data. Isto funciona nos dois sentidos, você pode ler o atributo mas também pode mudá-lo durante a execução. Entretanto se você tentar mudar /data durante a execução com códgio dentro do bloco de view mas fora da action facet, será gerado um erro.

Red \[needs: view]

view [

       field

]

![](http://helpin.red/lib/NewItem32.png)

Este exemplo imprime seu input no console quando você aperta enter::

Red \[needs: view]

view [

       f: field \[print f/text]

]

field permite uma facet no-border \*:

Red \[needs: view]

view [

       f: field no-border

]

![](http://helpin.red/lib/NewItem33.png)

\*Para sua informação, a documentação chama no-border de "flag", não de facet.

VID DLS area

O evento que dispara a action facet é o change. O texto dentro da area fica no atributo /text. Você pode mudar o texto atribuindo strings para /text.

Red \[needs: view]

view [

       area

]

![](http://helpin.red/lib/NewItem34.png)

Uma vez que cada change (mudança) dispara um evento, cada tecla digitada dentro da  area executa a action facet:

![](http://helpin.red/lib/area2.png)

VID DLS text-list

O evento que dispara a action facet é selection. As strings a serem listadas estão no atributo /data. O índice dos dados (string) selecionados estão no atributo  /selected

Red \[needs: view]

view [

       tl: text-list 100x100 data[

       "Nenad" "Gregg" "Qtxie"        "Rebolek"

       "Speedy G." "Myke" "Toomas"

       "Alan" "Nick" "Peter" "Carl"

       ]

       \[print tl/selected]

]

![](http://helpin.red/lib/NewItem35.png)

3

Para usar a string selecionada, um possível snipped de código seria:

pick face/data face/selected

Isto é a mesma coisa que: pick \["Nenad" "Greg" "Qtxie" "Rebolek" (...)] 3

VID DLS progress

Acho que não permite uma action facet, é só um display. O estado corrente está no atributo  /data, como um percent! ou um  float! entre 0 e 1.

Red \[needs: view]

view [

       below

       text "Enter percentage"

       text "0 - 1 (float):"

       field \[p/data: to percent! face/data]

       p: progress

]

![](http://helpin.red/lib/NewItem36.png)

VID DLS slider

O evento que dispara a action facet é change.  A percentagem corrente está no atributo  /data , como um datatype  percent! .

Red \[needs: view]

view [

       title "slider"

       t: text "Percentage"

       slider 100x20 data 10% \[t/text: to string! face/data]

]

Mova o cursor do slider para ver o valor percentual:

![](http://helpin.red/lib/NewItem38.png)

VID DLS panel

Cria uma nova área onde você pode exibir faces usando a sintaxe explicada até aqui. Acho que o exemplo abaixo é auto-explicativo. Me parece que não permite action facets.

Red \[needs: view]

view [

       panel red \[size 100x120 below text red "Panel 1" check button "Quit 1" \[quit]]

       panel gray \[size 100x120 below text gray "Panel 2" check button "Quit 2" \[quit]]

]

![](http://helpin.red/lib/NewItem39.png)

VID DLS tab-panel

Cria um conjunto de painéis dos quais só um pode ser exibido num dado momento, selecionado por uma aba. Me parece que não permite action facets. Os dados ficm em : &lt;tab-panel&gt;/data - Bloco de nomes de tabs (strings).  
&lt;tab-panel&gt;/pane - Lista de painéis correspondentes a lista de tabs (block!).  
&lt;tab-panel&gt;/selected - Índice do painel selecionado ou  none  (integer!) (read/write). Isto é, o painel que tem o foco, 1 para o primeiro, 2 para o segundo e assim por diante.

Red \[needs: view]

view [

       Title "Tab-panels"

       tab-panel 200x100 [

               "Tab 1 " \[text "First panel"]

               "Tab 2 " \[text "Second panel"]

               "Tab 3 " \[text "Third panel"]

       ]

]

![](http://helpin.red/lib/NewItem40.png)

E cada painel permite um conjunto de faces:

Red \[needs: view]

view [

       Title "Tab-panels"

       tab-panel 110x140 [

               "Tab 1 " [

               below

               text font-color blue "First panel"

               button "quit" \[quit]

               check "check to quit" \[quit]

               ]

               "Tab 2 " \[text "Second panel"]

       ]

]

![](http://helpin.red/lib/NewItem41.png)

VID DLS group-box

Da [documentação](https://doc.red-lang.org/en/view.html#_group_box): Um group-box é um container de outras faces, com uma moldura visível ao ser redor. Este é um estilo temporário que vai ser removido quando o Red tiver a facet edge.

Me parece ser só um painel com moldura.

Red \[needs: view]

view [

       group-box "box 1" \[size 110x120 below text "box1" check button "Quit 1" \[quit]]

       group-box gray \[size 110x120 below text "box2" check button "Quit 2" \[quit]]

       group-box "box 3" olive \[size 110x120 below text "box2" check button "Quit 2" \[quit]]

]

![](http://helpin.red/lib/NewItem165.png)

VID DLS drop-down

O evento que dispara a action facet é enter.

Da [documentação](https://doc.red-lang.org/en/view.html#_drop_down): "Este tipo representa uma lista vertical de strings, mostradas em uma moldura colapsável. Uma scrollbar vertical aparece automaticamente se o conteúdo não cabe na moldura. A facet data aceita valores arbitrários, mas somente strings serão adicionados à lista a ser exibida. Valores extras (não strings) podem ser usados para criar arrays associativos, usando as strings como chaves. A facet selected é um índice de base 1 indicando a posição da string selecionada na lista, mas não na facet data."

Você pode digitar na caixa de texto. O conteúdo da caixa de texto vai estar no atributo /text depois de você digitar "enter".

Red \[needs: view]

view [

       t: text "--&gt;"

       drop-down "Choose one" data [

               "First"

               "Second"

               "Third"

       ] \[ t/text: pick face/data face/selected ]

]        ;precisa apertar enter para mudar o texto

![](http://helpin.red/lib/NewItem45.png)

Exemplo usando [events](http://helpin.red/EventseActors.html):

Red \[needs: view]

view [

       t: text "--&gt;"

       drop-down "Choose one" data \["First" "Second" "Third" "Fourth"]

       on-change \[ t/text: pick face/data face/selected ]

]

![](http://helpin.red/lib/NewItem46.png)

VID DLS drop-list

O evento que dispara a action facet é change.

Similar ao drop-down, mas você não pode escrever na caixa de texto e não mostra um texto default.

![](http://helpin.red/lib/droplist.png)

VID DLS menus

menu é uma facet, mas me parece que quem aprende Red quer saber "quais são as widgets disponíveis" e menu tem cara e jeito de widget. Assim eu acho que deve constar aqui, como face, mesmo que tecnicamente seja outra coisa.

É pouco documentada. Toomas Voograid gentilmente forneceu alguns exemplos de menus. O primeiro é a reescrita de um exemplo tirado do site do Nick Antonaccio's [Short Red Code Examples](http://redprogramming.com/Short%20Red%20Code%20Examples.html).  

Red \[needs: view]

view/options \[area 400x400] [

   menu: [

       "No Submenus" [

           "Print" prnt

           ---

           "Quit" kwit

       ]

       "Sub-menus" [

           "Sub-menus" [

               "Submenu1" s1

               "Submenu2" s2

               "Submenu3" [

                   "Submenu4" s4

               ]

           ]

       ]

   ]

   actors: make object! [

       on-menu: func \[face \[object!] event \[event!]][

           if event/picked = 'kwit \[unview/all]

           if event/picked = 'prnt \[print "print menu selected"]

           if event/picked = 's4 \[print "submenu4 selected"]

       ]

   ]

]

![](http://helpin.red/lib/NewItem169.png)

The second example is a simple framework of a text editor using menus:

Red \[title: "Menus" needs: 'view]

view/options \[editor: area 500x300][

  menu: \["Main" \["Open..." open "Save as ..." save-as "Save" save]]

  actors: object \[on-menu: func \[face event /local new-name][switch event/picked [

     open \[if new-name: request-file \[editor/text: read editor/extra: new-name set-focus editor]]

     save-as \[if new-name: request-file/save \[write editor/extra: new-name editor/text]]

     save \[write editor/extra editor/text]

]]]]

![](http://helpin.red/lib/NewItem170.png)

The third example makes a menu appear when you right-click on text:

Red \[needs: view]

view [text "Try menu" with [

   menu: \["Change text" change]

   actors: object \[on-menu: func \[f e][

       switch e/picked [change [

           view/flags [text "Please enter new text:" field [

               f/text: face/text unview

           ]]\[modal]

]]]]]]

![](http://helpin.red/lib/NewItem171.png)

This last example can be rewritten using on-menu event:

Red \[needs: view]

view [

   text "Try menu"

   with \[menu: \["Change text" change]]

   on-menu [

       f: face

       if event/picked = 'change [

           view/flags [

               text "Please enter new text:"

               field \[f/text: face/text unview]

           ]\[modal]

       ]

   ]

]

VID DLS camera

Acessa um stream de camera.

Red \[]

view [

   cam: camera 130x100 select 1

]

![](http://helpin.red/lib/NewItem240.png)

Este script salva uma foto do stream da câmera como uma imagem .jpeg:

Red \[]

count: 0

snapshot: does [

   load rejoin \[mold '% 'picture count: count + 1 '.jpeg]

]

view [

   cam: camera 120x100 select 1

   button "Save picture" \[save/as snapshot to-image cam 'jpeg]

]

* * *

### Facets de acordo com a [documentação](https://doc.red-lang.org/en/view.html#_face_object) do Red:

Facet

Datatype

Obrigatório?

Aplicação

Description

type

word!

yes

all

Tipo de componente gráfico

offset

pair!

yes

all

Posição de offset partindo do topo esquerdo da janela-mãe.

size

pair!

yes

all

Tamanho da face.

text

string!

no

all

Texto mostrado na face.

image

image!

no

some

Imagem mostrada no fundo da face.

color

tuple!

no

some

Cor de fundo no formato R.G.B ou R.G.B.A.

menu

block!

no

all

Barra de menu ou menu contextual.

data

any-type!

no

all

Content data da face.

enabled?

logic!

yes

all

Habilitar ou desabilitar eventos de input na face.

visible?

logic!

yes

all

Mostras ou ocultar a face.

selected

integer!

no

some

Para listas, o índice do elemento escolhido corrente.

flags

block!, word!

no

some

Lista de palavras chaves alterando a exibição ou o comportamento da face.

options

block!

no

some

Propriedes extras da face no formato \[name: value].

parent

object!

no

all

Retro-referência à face-mãe (se houver).

pane

block!

no

some

Lista de faces-filhas exibidas dentro da face.

state

block

no

all

Informação interna sobre o estado da face (usada só pelo View engine).

rate

integer!, time!

no

all

Timer da face. Um integer! determina frequencia, um time! determina duração, none encerra.

edge

object!

no

all

(reservado)

para

object!

no

all

Referência para o objeto de posicionamento de texto.

font

object!

no

all

Referência para o objeto de formatação da fonte.

actors

object!

no

all

Handler de eventos fornecido pelo usuário.

extra

any-type!

no

all

Uso livre - dados opcionais do usuário ligados à face.

draw

block!

no

all

Lista de comandos de Draw a serem desenhados na face.
