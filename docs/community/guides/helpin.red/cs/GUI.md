Original URL: <http://helpin.red/cs/GUI.html>

# GUI

* * *

## GUI - Přehled

* * *

V následujících kapitolách budou jednotlivé elementy a parametry grafického rozhraní (GUI) -  kontejnery (containers), dispozice (layouts), piškoty (faces) a aspekty (facets) popsány zevrubně. Pro orientaci a vědomí vzájemné souvislosti je vhodné, uvést několik základních informací předem.

V následujícím schematu uvedené elementy screen, window, button, ..., jsou všechno piškoty (faces), kterých je aktuálně 18 (area, base, button,  camera, check, drop-down, drop-list,  field, group-box,  panel, tab-panel,  progress, radio, slider, screen,  text, text-list, window).

Piškot screen zastupuje obrazovku počítače a může obsahovat jeden či více piškotů window. Piškot window (okno) je kontejnerem pro další i zanořené piškoty. Tyto dva elementy mají dominantní postavení; od ostatních piškotů se liší zejména tím, že si je interpret Redu vytvoří automaticky při aplikaci některého z dalších deklarovaných piškotů.

Uvnitř piškotu windows lze jako kontejnery použít také piškoty panel, group-box a tab-panel.

Aplikací se míní realizace příkazu view na základě interně vytvořeného [stromu piškotů](https://doc.red-lang.org/cs/view.html#_strom_piskot_).

Vzájemnou hierarchii piškotů vyjadřují aspekty pane (zeznam dětí, na které piškot ukazuje) a parent (odkaz na rodičovský piškotq). Aspektů je aktuálně 23, vyjadřují vlastnosti jednotlivých piškotů a jsou nedílnou součástí každého piškotu.

![](http://helpin.red/lib/face-tree.png)Pěknou prezentaci vztahů mezi piškoty screen, window a button získáme realizací tohoto kódu:

                &gt;&gt;   view \[b: button \[print b]]

případně     &gt;&gt;   view \[button \[print face]]   ; face zde má roli žolíka

případně     &gt;&gt;   view \[button \[probe face]]

![](http://helpin.red/lib/NewItem27.png)

#### Stiskem levého tlačítka myši s kurzorem v tmavošedém poli spustíme provedení příkazu (print b, případně probe face). V okně interaktivní konzoly Redu se vytiskne výpis všech aspektů s přiřazenými hodnotami u všech tří použitých piškotů (screen, window a button). Zanoření piškotů je deklarováno v aspektu parent a pane. Vřele doporučuji si tento postup vyzkoušet.

#### Výpis aspektů v konzole je dvakrát zanořený. Piškot typu button odkazuje svým aspektem parent na piškot windows a ten zase na screen. Takto jsou jednotlivé komponenty grafického objektu vzájemně propojeny.

Výpis aspektů pro jednotlivé piškoty (kromě screen a window) lze také získat realizací tohoho kódu:

![](http://helpin.red/lib/builtinhelp1.png)

Zadáte-li příkaz  ? a  samostatně v následně otevřené konzole, kterou si předtím roztáhnete na celou šířku obrazovky, bude váš výpis přehlednější.

#### Jednoduchý začátek

Red vytváří grafické prostředí (GUI) tak, že jej popíše v bloku view. Tento popis je velmi přímočarý a ve své nejjednodušší formě by mohl vypadat takto:

![](http://helpin.red/lib/guibasic0.png)

Má-li být skript kompilován, musí mít v záhlaví Red \[needs: view] . Je-li spouštěn z interakční konzoly Redu, není tohoto záhlaví zapotřebí, neboť konzola  modul View již obsahuje.

Příklad skriptu:

Red \[needs: view]  

view[

       base

       button

       field

]

A jeho výsledné GUI:

![](http://helpin.red/lib/guibasics2.png)

Dokumentace Redu označuje viditelné objekty grafického rozhraní názvem face (neboli widget, neboli piškot). Tyto piškoty jsou vloženy do kontejneru windows  podle zadaného uspořádání (layout).

K následujícímu obrázku nutno poznamenat, že layout je pouze uspořádání následných piškotů base, button a field v piškotu (kontejeneru) window, nikoliv kontejner jak naznačeno :

![](http://helpin.red/lib/guidescription.png)

Příkazy pro uspořádání piškotů (layout commands) se píši před vlastní definice piškotů:

![](http://helpin.red/lib/guibasic1.png)

V následující ukázce deklaruje příkaz below (layout command) řazení piškotů pod sebe, místo implicitního  across  (vedle sebe) první ukázky:

Red \[needs: view]

view[

       below        ; layout command

       base          ; face (widget)

       button        ; face (widget)

       field        ; face (widget)

]

Výsledné GUI:

![](http://helpin.red/lib/guibasics5.png)

Nastavení kontejneru (size, title, backdrop) popisuje jak má vypadat samotné okno. Toto nastavení i příkazy dispozice (layout commands) umožňují podrobnější specifikaci, jako je velikost, barva, atp. Aspekty (facets) piškotů  určují jejich vlastnosti a vzájemné vztahy.

Součástí piškotu může být také blok příkazů (actor neboli aktér), definující akci piškotu. Tento blok je posléze obsažen v aspektu actors.

 ![](http://helpin.red/lib/guibasics6.png)  ![](http://helpin.red/lib/coordinates1.png)

Příklad skriptu:

Red \[needs: view]

view[

       backdrop blue                           ; container setting  

       below                                      ; layout command    

       base 20x20                              ; face and facet        

       button 50x20 "press me" \[quit]   ; face, facets, actor

       field red "field"                         ; face and facets    

]

Výsledné GUI:

![](http://helpin.red/lib/guibasics8.png)

Red ví, co si počít s  jednotlivými zadanými hodnotami  již na základě jejich typu. Vidí-li pair! - ví, že jde o aspekt size; vidí-li string! - ví, že jde o aspekt text; vidí-li block! - ví, že jde o popis akce (face action), kterou má piškot zprostředkovat, uložený v aspektu actors. Zvláštním dobrodiním je skutečnost, že na pořadí aspektů nezáleží. Následující kódy rezultují v tomtéž GUI.

button 50x20 "press me" \[quit]     ; pair! string! block!  
button "press me" \[quit] 50x20  
button \[quit] 50x20 "press me"

Funkce  view umožňuje připojovat upřesnění, která mění okno samotné (nikoliv dispozici uvnitř okna). Tato upřesnění (refinements) jsou deklarována hned za slovem view a precizována ve stejně řazených samostatných blocích za hlavním blokem view :

#### ![](http://helpin.red/lib/guibasics9.png)

#### Zavedeným upřesněním funkce view jsou flags (slova, měnící zobrazení nebo chování okna) a options  (další vlastnosti okna ve formátu 'name: value'). Tato slova mají dva významy - jednak to jsou názvy aspektů a za druhé to jsou hromadná označení skupiny hodnot.

V následujícím skriptu se upřesněním /flags říká, že zobrazované okno je modálního typu (modal) a lze měnit jeho velikost (resize), zatímco upřesnění /options zajistí zobrazení okna v levém horním rohu obrazovky s posunem (offset) 50 pixelů dolů a 50 pixelů vpravo:

Red \[needs: view]

view/flags/options[

       size 300x100                            ; container setting

       below                                       ; layout command

       base 20x20                               ; face and facet

       button 50x20 "press me" \[quit]         ; face, 3facets and actor

       field red "field"                          ; face and 2 facets

]\['modal 'resize] \[offset: 50x50]      ; 2 flags and 1 option

Výsledné GUI:

#### ![](http://helpin.red/lib/guibasics11.png)

#### Podrobnější popis upřesnění pro window je uveden v následujcící kapitole.
