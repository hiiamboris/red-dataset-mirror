Original URL: <http://helpin.red/pt/GUI.html>

# GUI

* * *

## GUI - Visão geral

* * *

Os próximos capítulos vão descrever em detalhes cada um dos elementos do View Graphic Engine e do dialeto VID do Red  (faces, facets, definições do container, comandos de layout e refinamentos do view) mas eu acho que ter uma visão geral de como o Red cria GUIs ajuda a entender melhor como esses elementos se relacionam.

#### Um começo simples:

O Red cria GUIs descrevendo-as em um bloco de view. Essa descrição é simples e direta e, em sua forma mais simples, seria assim:

![](http://helpin.red/lib/guibasic0.png)

Se você vai compilar o seu script, você precisa adicionar "needs: view" no header do Red. Se você for rodar o script do console GUI, isto não é estritamente necessário, uma vez que o módulo View já está presente.

An example code of that:

Red \[needs: view]  ; "needs: view" é necessário se o script for ser compilado.

view[

       base

       button

       field

]

A GUI resultante:

![](http://helpin.red/lib/guibasics2.png)

A documentoação do Red chama coisas como botões e campos de "faces" (chamados "widgets" em algumas linguagens). Essas faces são colocadas em um layout dentro de um container (window)

![](http://helpin.red/lib/guidescription.png)

Existem palavras pré-definidas (comandos de layout) que definem como as faces serão exibidad neste layout. Estes comandos devem ser colocados antes das faces que eles alteram:

![](http://helpin.red/lib/guibasic1.png)

No exemplo a seguir, below (um comando de layout) diz ao Red para colocar as faces embaixo uma da outra, ao invés do default across do exemplo anterior:

Red \[needs: view]        ; "needs: view" is needed if the script is going to be compiled

view[

       below        ; layout command

       base        ; face (widget)

       button        ; face (widget)

       field        ; face (widget)

]

A GUI resultante:

![](http://helpin.red/lib/guibasics5.png)

Existem ainda os as definições do container, que descrevem como a própria janela deve parecer. E ambos, definições de container e comandos de layout podem permitir maior detalhamento, como tamanho, cor etc. As faces não apenas permitem esse detalhamento (chamado facets no jargão do Red), como ainda permitem a inclusão de um bloco de comandos a ser executado pela face (chamado "action facet") em caso de um evento, como o clicar de um botão.

 ![](http://helpin.red/lib/guibasics6.png)  ![](http://helpin.red/lib/coordinates1.png)

Código de exemplo:

Red \[needs: view]

view[

       backdrop blue        ;definição de container

       below                        ; comando de layout

       base 20x20                ; face e facet

       button 50x20 "press me" \[quit]        ; face, facets  e action facet

       field red "field"                ; face e facets

]

E a GUI resultante:

![](http://helpin.red/lib/guibasics8.png)

O Red entende o que fazer com uma facet simplesmente pelo seu  datatype!. Assim, se ele vê um pair! , ele sabe que é o tamanho da face, se ele vê um string! ele sabe que é o texto a ser exibido. Uma consequência interessante disso é que...

button 50x20 "press me" \[quit]  
button "press me" \[quit] 50x20  
button \[quit] 50x20 "press me"

... são todos a mesma coisa, isto é, they result in the same GUI.

A palavra pré-definida (comando)  view permite refinamentos que vão mudar a própria janela (não o layout dentro dela). Os refinamentos são descritos em blocos codificados após o bloco principal da view e devem ser codificados na mesma ordem que foram declarados naquele comando.

#### ![](http://helpin.red/lib/guibasics9.png)

No script a seguir, flags diz ao Red que a janela é do tipo modal e redimensionável, enquanto o refinamento options faz a janela aparecer no topo esquerdo da tela, 50 pixels para baixo e 50 pixels para a esquerda:

Red \[needs: view]

view/flags/options[

       size 300x100        ;container setting

       below                        ; layout command

       base 20x20                ; face and facet

       button 50x20 "press me" \[quit]        ; face, facets  and actor

       field red "field"                ; face and facets

]\['modal 'resize] \[offset: 50x50] ; flags and options

A GUI resultante:

#### ![](http://helpin.red/lib/guibasics11.png)
