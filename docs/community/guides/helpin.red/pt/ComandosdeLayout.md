Original URL: <http://helpin.red/pt/ComandosdeLayout.html>

# Comandos de Layout

* * *

## GUI - Layout commands

* * *

VID DLS across

Red \[needs: view] ; "needs: view" is needed if the script is going to be compiled

view [

       across

       area 20x20 red

       area 20x20 blue

       area 20x20 green

]

![](http://helpin.red/lib/NewItem11.png)

VID DLS below

Red \[needs: view]

view [

       below

       area 20x20 red

       area 20x20 blue

       area 20x20 green

]

### ![](http://helpin.red/lib/NewItem12.png)

VID DLS return

##### return no modo across:

![](http://helpin.red/lib/return%20accross.png)

Red \[needs: view]; "needs: view" is needed if the script is going to be compiled

view [

       across

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem14.png)

##### return no modo below:

![](http://helpin.red/lib/return%20below.png)

Red \[needs: view]

view [

       below

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem15.png)

VID DLS space

Determina o novo offset de espaçamento que vai ser usado para posicionar as próximas faces.

Red \[needs: view]

view [

       across

       space 50x10

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem16.png)

VID DLS origin

Determina o offset da primeira face a aprtir do canto superior esquerdo do painel da janela.

Red \[needs: view]

view [

       across

       origin 70x20

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem17.png)

VID DLS at

Posiciona a próxima face em uma posição absoluta. Este modo de posicionamento apenas afeta a próxima face. Assim, as faces seguintes, colocadas após a face objeto do at, vão ser colocadas obedecendo a continuidade do posicionamento.

Red \[needs: view]

view [

       across

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       at 2x5

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem18.png)

VID DLS pad

Modifica a posição corrente do layout com um offset relativo. Todas as faces subsequentes são afetadas.

Red \[needs: view]

view [

       across

       area 20x20 red

       area 20x20 blue

       return

       area 20x20 green

       pad 10x10

       area 20x20 gray

       area 20x20 yellow

]

![](http://helpin.red/lib/NewItem19.png)

native! do

Este é o mesmo do do capítulo [Executando código](http://helpin.red/Executandocodigo.html). Neste caso, é usado para rodar códgio dentro de sua view.

Você  pode fazer isso:

Red \[needs: 'view]  
a: 33 + 12  
print a                ;imprime no console  
view [  
       text "hello"  
]

Mas isso vai te dar um error:

Red \[needs: 'view]  
view [  
       text "hello"  
       a: 33 + 12                ;ERROR!!!  
       print a  
]

Dentro da view, seu código tem que ficar assim:

Red \[needs: 'view]  
view [  
       text "hello"  
       do \[a: 33 + 12 print a]        ;OK!  
]
