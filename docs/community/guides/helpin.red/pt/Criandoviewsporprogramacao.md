Original URL: <http://helpin.red/pt/Criandoviewsporprogramacao.html>

# Criando views por programação

* * *

* * *

## VID é o dialeto gráfico do Red. Todos os comandos da GUI  (base, across, style etc) são código VID.

## FACE TREE - é o object! de uma view gráfica.  view e show. só conseguem mostrar este object!

## LAYOUT transforma qualquer bloco contendo código VID em uma face tree.

## VIEW transforma (se necessário) um bloco de código VID em uma face tree e exibe como uma GUI.

## SHOW mostra a face tree. Pode mostrar um layout (ou mesmo uma view), mas não pode exibir uma GUI fora de um bloco de código VID. Dentro de um bloco VID, ele atualiza um rosto, no entanto, em Red, ao contrário do Rebol, essa atualização é automática, a menos que você altere as configurações em   system/view/auto-sync?, como explicado [aqui](http://helpin.red/Topicosavancados.html#autosync).

## Então, o argumento para view é apenas um bloco de código VID e você pode alterá-lo:

Red\[needs: view]

board: \[]

append board \[below button "Quit" \[quit] field ]

view board

![](http://helpin.red/lib/NewItem191.png)

## Usando variáveis externas como facets para view

## A função interna compose computa o conteúdo entre parênteses e permite "passar" parâmetros para a view.

Red \[needs: view]

txt: "My text"

size: 150

view compose \[ button (txt) (size)]

## ![](http://helpin.red/lib/NewItem190.png)

## Alterando uma GUI a partir da própria GUI

## Se a GUI for criada a partir de um bloco com compose e, em seguida, renderizada por view , qualquer alteração nos valores no bloco será refletida imediatamente na GUI :

Red\[needs: view]

board: compose [

       a: box blue 50x50

       button "Move blue box" \[a/offset: (a/offset: a/offset + 5x0)]

]   ; every click increases position of blue box

view board

## ![](http://helpin.red/lib/NewItem189.png)  few clicks →  ![](http://helpin.red/lib/NewItem188.png)

## Mostrando e escondendo faces

## Faces tem o atributo visible? que pode ser alterado de true (default) para false para ocultar uma face. No script a seguir, clique no botão para ativar e desativar a visibilidade do field :

Red \[needs: view]

view [

   f: field

   button "Hide field" \[f/visible?: not f/visible?]  

]

![](http://helpin.red/lib/NewItem187.png) click → ![](http://helpin.red/lib/NewItem186.png)

## Um exemplo mais elegante (por Toomas Vooglaid):

Red\[needs: view]

view [

  f: field

  button "Hide field" [

     face/text: pick [

        "Hide field" "Show field"

     ] f/visible?: not f/visible?

  ]

]

## ![](http://helpin.red/lib/NewItem185.png)  ←click →  ![](http://helpin.red/lib/NewItem184.png)
