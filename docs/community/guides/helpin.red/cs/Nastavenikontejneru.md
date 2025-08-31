Original URL: <http://helpin.red/cs/Nastavenikontejneru.html>

# Nastavení kontejneru

* * *

* * *

Tato nastavení definují úpravy okna (windows), které bude obsahovat další prvky GUI. Na rozdíl od hodnot aspektů je nutné hodnoty pro parametry okna uvést jejich příslušnými názvy: size, title a backdrop:

VID DLS size -  Nastavuje velikost okna v pixelech.

![](http://helpin.red/lib/size.png)

Nezadáme-li velikost okna, provede to Red za nás. Není-li okno veliké tak aby mohlo zobrazit část titulku  (min. 212 x ...), nelze jej přemisťovat. Implicitní velikost okna je 110x110 px.

VID DLS title - Nastaví titulek v záhlaví okna.

![](http://helpin.red/lib/title.png)

VID DLS backdrop - Nastaví barvu pozadí okna.

![](http://helpin.red/lib/backdrop.png)

### Upřesnění - refinements

Další možností modifikace okna (windows) jsou upřesnění: options, flags a no-wait. Options a flags jsou aspekty piškotů a definují se v blocích za hlavním blokem  view .

#### Options je aspekt, který určuje vlastnosti piškotu window ve formátu \[name: value]. Hodnotou v samostatném bloku za blokem view lze vyjádřit dva parametry okna:

- offset - odsazení okna od levého horního rohu obrazovky, uváděné v pixelech ve formátu pair!
- size    - velikost okna v pixelech ve formátu pair! (lze tedy velikost okna zadat dvojím          způsobem

Red \[needs: view]

view/options [                       ; /deklarace upřesnění

   button 100x40 "click me" \[quit]]

   \[offset: 100x70]                 ; definice upřesnění

![](http://helpin.red/lib/offset.png)

#### Flags - je aspekt, který rovněž mění zobrazení nebo chování piškotu window. Disponuje řadou parametrů (flagů):

- modal - vyžaduje pozornost (focus) tím, že zmrazí všechna ostatní okna, dokud modální okno nezavřete. Vytvoříte-li okno s flagy modal, no-title a no-border, je velmi obtížné se jej  zbavit.
- resize - umožní změnu velikosti okna (implicitní je stálá velikost).

<!--THE END-->

![](http://helpin.red/lib/flagsmodalresize.png)

- no-title - nezobrazuje název okna

<!--THE END-->

![](http://helpin.red/lib/flagsnotitle.png)

- no-border - odebere rámeček kolem okna

<!--THE END-->

![](http://helpin.red/lib/flagsnoborder.png)

- no-min - eliminuje tlačítka 'min' a 'max' v záhlaví okna

<!--THE END-->

![](http://helpin.red/lib/flagsnomin.png)

- no-max - tlačítko 'max' se zobrazí jako neaktivní

<!--THE END-->

![](http://helpin.red/lib/flagsnomax.png)

- no-buttons - nezobrazí žádné tlačítko (maximize, minimize, close) v záhlaví okna

<!--THE END-->

![](http://helpin.red/lib/flagsnobuttons.png)

- popup - pouze pro Windows - činí z okna výsuvné okno (popup). Umožňuje ostatním oknům zůstat aktivní. Zavře se při přesunu fokusu na jiné okno.

#### No-wait - je upřesnění pro funkci view, přikazující aby nebyla aplikována implicitní smyčka událostí ( jaká že? ...)

Actors

Viz dedikovanou[](http://helpin.red/Udalostiaakteri.html)[kapitolu](http://helpin.red/Udalostiaakteri.html).

Zadání ikony - Chodí jenom při kompilaci kódu, nikoliv při jeho interpretaci!

Nejde o nastavení okna ale snad se to sem hodí. Chcete-li zadat svoji ikonu do okna, musíte ji přidat v deklaraci záhlaví skriptu :: icon: &lt;path-to-icon&gt;:

![](http://helpin.red/lib/settinganicon.png)
