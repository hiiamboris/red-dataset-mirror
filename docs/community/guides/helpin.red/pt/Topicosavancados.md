Original URL: <http://helpin.red/pt/Topicosavancados.html>

# Tópicos avançados

* * *

* * *

VID DLS style

style é usado para criar faces personalizadas.

Red \[Needs: view]

view [

       style myface: base 70x40 cyan \[quit]

       myface "Click to quit"

       myface "Here too"

       panel red 90x110 [

               below

               myface "And here"

               myface "Also here" blue

       ]

]

![](http://helpin.red/lib/NewItem48.png)

### function! view e  function! unview

##### Múltiplas janelas em uma tela

view também pode ser usado para mostrar janelas com faces ([a face tree](https://doc.red-lang.org/en/view.html#_the_face_tree)) que foram criadas em outra parte do código.  unview fecha uma view. O código a seguir cria duas janelas idênticas mas independentes (com face trees diferentes) em partes diferentes da tela:

Red \[needs: view]

my-view: \[button {click to "unview"} \[unview]]

print "something"  ;do something else

print "biding my time" ;do something else

view/options/no-wait my-view \[offset: 30x100]

view/options/no-wait my-view \[offset: 400x100]

unview permite o refinamento /only para atuar em apenas uma janela:

Red \[needs: view]

v1: view/options/no-wait [

   backdrop blue

   button "unview blue"\[unview/only v1]

   button "unview yellow" \[unview/only v2]

][    ;options:

   offset: 30x100

]

v2: view/options/no-wait [

   backdrop yellow

   button "unview blue"\[unview/only v1]

   button "unview yellow" \[unview/only v2]

][    ;options:

   offset: 400x100  

]

![](http://helpin.red/lib/unview3.png)

Refinamentos para  view:

    /tight           =&gt; offset e origin iguais a zero.

    /options     =&gt;

    /flags          =&gt;

    /no-wait     =&gt; Retorna imediatamente, não espera.

Refinamentos para unview:

    /all           =&gt; Fecha todas as views.

    /only        =&gt; Fecha uma dada view.

VID DLS loose

loose é uma facet que permite que a face seja arrastada (drag) pelo mouse.

Red \[needs: view]

view [

       size 150x150

       base blue 50x50 "Drag me" loose

]

![](http://helpin.red/lib/loose2.png)

VID DLS all-over

O evento on-over normalmente acontece quando o cursor "entra" ou "sai" da face. Quando usamos a facet all-over todo o evento que acontece enquanto o cursor está sobre a face, como movimentos e clicks, gera um evento on-over.

No exemplo a seguir, o quadrado da esquerda só muda de cor quando o cursor entra ou sai, mas o quadrado da direita muda de cor com qualquer movimento sobre ele, bem como com clicks do botão::

Red \[needs: view]

view [

       a: base 40x40 blue

               on-over \[either a/color = red \[a/color: blue]\[a/color: red]]

       b: base 40x40 blue all-over

               on-over \[either b/color = red \[b/color: blue]\[b/color: red]]

]

![](http://helpin.red/lib/NewItem108.png)

VID DLS hidden

Faz a face invisível por default. Um dos usos possíveis é criar uma face oculta com um rate, assim você pode ter rotinas temporizadas sem a necessidade de mostrar uma face.

Red \[needs: view]

view [

       button "I'm here"

       button "I'm not" hidden

       button "Here too"

]

![](http://helpin.red/lib/NewItem109.png)

VID DLS disabled

Desabilita uma face, ou seja, a face não vai processar nenhum evento até ser habilitada.

Red \[needs: view]

view [

       button "I should quit, but I don't" disabled \[quit]

       button "Quit" \[quit]

]

![](http://helpin.red/lib/NewItem110.png)

VID DLS select

Determina a facet selecionada na face corrente. Usada geralmente para listas, para indicar qual item é pré-selecionado.

Red \[needs: view]

view [

       tl: text-list 100x100 data  [

       "Nenad" "Gregg" "Qtxie"        "Rebolek"

       "Speedy G." "Myke" "Toomas"

       "Alan" "Nick" "Peter" "Carl"

       ] select 6

       \[print tl/selected]

]

![](http://helpin.red/lib/NewItem111.png)

VID DLS focus

Dá o foco para a face corrente quando a janela é mostrada pela primeira vez. Somente uma face pode ter o foco. Se vários focus forem usados em diferentes faces, apenas a última pega o foco.

Red \[needs: view]

view [

field

field

field focus

field

]

![](http://helpin.red/lib/NewItem112.png)

VID DLS hint

Fornece uma mensagem dentro das faces de field quando o campo está vazio. Tem a função de orientar o usuário. O texto desaparece quando um novo conteúdo é inserido por digitação do usuário ou mudando o atributo face/text faces.

Red \[needs: view]

view [

field

field hint "hint here"

]

![](http://helpin.red/lib/NewItem113.png)

VID DLS default

Define um valor default para a facet data nas faces  text e field .

Red \[needs: view]

view [

       a: field 100 default "My default"

       b: field 100 "My text default"

       do [

               print a/text

               print a/data        ; "data" was defined by "default" facet

               print b/text

               print b/data        ; this will give you an error, as "data" was not defined yet

       ]

]

![](http://helpin.red/lib/NewItem114.png)

My default  
My default  
My text default  
\*\** Script Error: My has no value  
\*\** Where: print  
\*\** Stack: view layout do-safe

VID DLS with

Suponha que você quer criar uma face cujas facets são avaliadas no momento da criação. Você não pode fazer computação nos "argumentos" de sua face, então você usa  with .

Isto não funciona:

Red \[needs: view]

a: 2

b: 3

view [

       base a * 30x40 b * 8.20.33

]

Isto funciona:

Red \[needs: view]

a: 2

b: 3

view [

       base with [

               size: a * 30x40  

               color: b * 8.20.33

       ]

]

![](http://helpin.red/lib/NewItem116.png)

VID DLS rate

rate é uma facet que tem um timer. Quando termina o tempo do timer um evento on-time é gerado. Note que se o argumento de rate é um integer!, significa "vezes por segundo", então um rate de 20 é mais rápido que um rate de 5. Você pode dar um argumento tipo time! para ajustar o rate para um tempo.

Este código faz o texto piscar:

Red \[needs: view]

view [

       t: text "" rate 2

       on-time \[either t/text = "" \[t/text: "Blink"] \[t/text: ""]]

]

Este código faz uma animação tosca onde uma base azul atravessa a janela:

Red \[Needs: 'View]

view[

   size 150x150

   b: base 40x40 blue "I move" rate 20

       on-time \[b/offset: b/offset + 1x1]

]

Rates mais lentos:

Para períodos superiores a 1 segundo, use um argumento tipo time! para o rate:

Red \[Needs: view]

view[

   t: text "" rate 0:0:3

       on-time \[either t/text = "" \[t/text: "Blink" print now/time]\[t/text: "" print now/time]]

]

function! react

react é uma facet que vincula o comportamento de uma face aos dados de outra face.

O exemplo clássico:

Red \[Needs: view]

view[

   progress 100x20 20% react \[face/data: s/data]

       s: slider 100x20 20%

]

A face  progress bar reage ao ajuste da face slide :

![](http://helpin.red/lib/NewItem49.png)

    /link        =&gt; vincula objetos usando uma relação reativa.

    /unlink      =&gt; remove uma relação existente.

    /later       =&gt; roda a reação na próxima mudança, ao invés de agora.

    /with        =&gt; &lt;uso interno&gt;

function! layout

layout é usado para criar views personalizadas sem mostrá-las. Você atribui o layout a uma palavra e, então, para mostrá-la, você usa view ou unview. Com layout voce pode deixar janelas GUI "prontas" para tarefas específicas.

O código abaixo mostra uma janela, e só mostra a outra quando você fecha a primeira.

Red \[needs: view]

my-view: layout \[button {click to "unview"} \[unview]]

print "something"  ;do something else

print "biding my time" ;do something else

view/options my-view \[offset: 30x100]

view/options my-view \[offset: 400x100]

Obter o tamanho da tela:

&gt;&gt; print system/view/screens/1/size  
1366x768

Criar uma view de tela inteira:

Red \[needs: view]

view \[size system/view/screens/1/size]
