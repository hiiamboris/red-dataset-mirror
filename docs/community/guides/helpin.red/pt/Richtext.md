Original URL: <http://helpin.red/pt/Richtext.html>

# Rich text

* * *

* * *

VID DLS rich-text

## rich-text é um face que pode exibir texto em itálico, negrito, colorido e com tamanhos de fonte diferentes. Eu acredito que existem duas maneiras de passar os parâmetros para um rich text:

## Primeiro método, usando [with](http://helpin.red/Topicosavancados.html#with) :

Red\[needs: view]

view [

   rich-text 150x50 "Little example of rich-text" with [

       data: \[1x6 italic 8x7 bold 16x2 168.168.168 18 19x9 255.0.0 8]

   ]

]

![](http://helpin.red/lib/NewItem183.png)

Explicando o primeiro método:

![](http://helpin.red/lib/NewItem182.png)

;número de caracteres

;posição do carater inicial

;tamanho fonte

;cor tem que ser um tuple

Se você não quiser usar tuples para cores, pode alterar a linha de data para::

data: reduce \[1x6 'italic 8x7 'bold 16x2 gray 18 19x9 red 8]

## Segundo método, usando  function! rtd-layout

rtd-layout retorna uma face em rich text a partir de um código-fonte RTD. Eu acredito que é mais simples, e permite que você use rich-text a partir de fontes externas, mas você deve ler o [capítulo de draw](http://helpin.red/Draw.html) antes, e lembre-se de usar compose/deep no view.  compose avalia as coisas entre parênteses, e é usado para "trazer" código de Red para o bloco do dialeto view , e é preciso ter um refinamento /deep porque os parênteses são aninhados dentro de colchetes..

Red\[needs: view]

myrtf: rtd-layout \[i "This " /i b "uses " /b red font 14 "rtd-layout" /font]

view compose/deep [

   rich-text 200x50 draw \[text 0x0 (myrtf)]

   rich-text 200x50 draw \[text 20x10 (myrtf)] ;the pair! locates the text

]

![](http://helpin.red/lib/NewItem181.png)

## Por favor, veja a [página de exemplos de rich-text](https://github.com/toomasv/learning/tree/master/snippets/rich-text) de Toomas Vooglaid. Com a permissão dele, coloquei abaixo alguns. O Toomas também tem um excelente  [gist](https://gist.github.com/toomasv) com uma variedade de exemplos de Red em vários tópicos.

Red [

 Author: "Toomas Vooglaid"

]

view [rich-text 200x50 "Little example of rich-text" with [

   data: \[1x6 italic 8x10 bold 16x2 168.168.168 19x9 255.0.0 18]]

]

rb: rtd-layout \[i "And " /i b "another " /b red font 14 "example" /font]

view compose/deep \[rich-text 200x50 draw \[text 0x0 (rb)]]

![](http://helpin.red/lib/NewItem180.png)

Red [

       Purpose: {Relatively simple rich-text demo}

       Help: {Enter text. Select some text, choose formatting from contextual menu (alt-click).

               Press "View" to see formatting, "Text" to return to text editing, "Clear" to clear                              formatting.}

]

count-nl: func \[face /local text n x][

       n: 0 x: face/selected/x

       text: copy face/text

       while [all [

               text: find/tail text #"^/"

               x &gt;= index? text

       ]][

               n: n + 1

       ] n

]

view compose [

       src: area wrap with [

               menu: \["Italic" italic "Bold" bold "Underline" underline]

       ]

       on-menu [

               nls: count-nl face

               append rt/data reduce [

                       as-pair face/selected/x - nls face/selected/y - face/selected/x + 1 event/picked

               ]

       ]

       at 16x12 rt: rich-text hidden with [

               data: copy \[]

               size: src/size - 7x3

               line-spacing: 15

       ]

       below

       button "View" [

               if show-rt: face/text = "View" \[rt/text: copy src/text]

               face/text: pick \["Text" "View"] rt/visible?: show-rt

       ]

       button "Clear" \[clear rt/data]

]

![](http://helpin.red/lib/NewItem179.png)

Red [

       Purpose: {Relatively simple rich-text demo}

       Help: {Select some text in first box, choose formatting from context-menu (alt-click).

               "Clear" clears formatting.}

]

count-nl: func \[face /local text n x][

       n: 0 x: face/selected/x

       text: copy face/text

       while [all [

               text: find/tail text #"^/"

               x &gt;= index? text

       ]][

               n: n + 1

       ] n

]

view compose [

       below src: area wrap with [

               menu: \["Italic" italic "Bold" bold "Underline" underline]

       ]

       on-menu [

               nls: count-nl face

               append rt/data reduce [

                       as-pair face/selected/x - nls face/selected/y - face/selected/x + 1 event/picked

               ]

       ]

       on-key \[rt/text: face/text rt/data: rt/data]

       return

       pnl: panel white with [

               size: src/size

               draw: compose \[pen silver box 0x0 (size - 1)]

               pane: layout/only compose [

                       at 7x3 rt: rich-text with [

                               size: src/size - 10x6 data: copy \[]

                       ]

               ]

       ]

       button "Clear" \[clear rt/data]

]

![](http://helpin.red/lib/NewItem178.png)
