Original URL: <http://helpin.red/cs/Layout.html>

# Layout

* * *

## GUI - Layout

* * *

Rozložení (layout) piškotů uvnitř piškotu window je řízeno těmito pokyny: across, below, return, space, origin, at, pad. Implicitní nastavení pro window je:

- - počátek (origin) :  10x10
  - mezera (space) :  10x10
  - směr (direction) :   acros
  - přiřazení (alignment): top

Přiřazení může pro pokyny across, below a return nabývat hodnot top, middle, bottom, left, center, right nechodí, neznám syntaxi.

VID DLS across (top | middle| bottom)

Red \[needs: view] ; "needs: view" is needed if the script is going to be compiled

view [

       across           ; nepovinné, je to implicitní hodnota

       area 20x20 red

       area 20x20 blue

       area 20x20 green

]

![](http://helpin.red/lib/NewItem11.png)

VID DLS below (left |center | right)

Red \[needs: view]

view [

       below

       area 20x20 red

       area 20x20 blue

       area 20x20 green

]

### ![](http://helpin.red/lib/NewItem12.png)

VID DLS return

##### Mění zadaný mód across:

![](http://helpin.red/lib/return%20accross.png)

Red \[needs: view]

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

##### Mění zadaný mód below:

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

Zadá  odsazení (offset), platné pro následné piškoty.

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

Nastaví offset prvního piškotu od levého horního rohu okna.

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

Vloží následující jeden piškot do absolutně zadané pozice. Neovlivňuje umístění ostatních piškotů.

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

Mění dispozici okna relativním odsazením následujících piškotů od původně zadané polohy.

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

Jde o exekuční příkaz, popsaný v kapitole [Running code](http://helpin.red/Exekucekodu.html). V tomto případě je použit pro spuštění kódu uvnitř kontejneru view.

Lze bez problémů provést toto:

Red \[needs: 'view]  
a: 33 + 12  
print a                        ; vytiskne v konzole  
view [  
       text "hello"      ; zobrazí okno s textem          
]

Toto však vyvolá chybové hlášení:

Red \[needs: 'view]  
view [  
       text "hello"  
       a: 33 + 12                ;ERROR!!!  
       print a  
]

Uvnitř okna musí být blok podřízen příkazu "do":

Red \[needs: 'view]  
view [  
       text "hello"  
       do \[a: 33 + 12 print a]        ;OK!  
]
