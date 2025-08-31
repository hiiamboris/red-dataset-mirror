Original URL: <http://helpin.red/cs/Sub-dialektShape.html>

# Sub-dialekt Shape

* * *

Sub-dialekt Shape umožňuje vytvářet tvary (kresby) jako bloky. Použití dialektu shape má tuto skladbu:

                shape  ( příkazy dialektu Shape )

Specifické rysy tohoto dialektu jsou:

- každý kreslící příkaz začíná na aktuální pozici pera
- pozici pera lze měnit bez kreslení zadáním cílové polohy příkazem move
- tvary jsou automaticky uzavírány - spojením posledního bodu s prvním
- generované tvary lze zadat do příkazu fill-pen pro vytváření individuálních výplní
- kreslící příkazy používají implicitně absolutní (relativní k piškotu) souřadnice; relativní (relativní k poslední pozici) souřadnice jsou aktivní ve verzi 'lit-word příkazu.

V argumentu funkce shape můžete použít tyto příkazy a vlastnosti:

move, arc, curve, curv, qcurve, qcurv, hline, vline, line, line-width, line-join, line-cap, pen, fill-pen.

Modře označené entity se deklarují stejně jako v dialektu Draw.

move

Přemístí pero na novou pozici, nic se nekreslí:

Red \[needs: view]

myshape: [

       line 10x10 70x70  ; line from 10x10 to 70x70

       move 10x70        ; přemístí pero na pozici 10x70

       line 10x10        ; kreslí čáru z aktuální (10x70) pozice

    ]

view compose/deep/only [base draw [shape (myshape)

    ] ]

![](http://helpin.red/lib/NewItem119.png)

Relativní pozice

Souřadnice se stanou relativní, přidá-li se apostrof před příkaz:

Red \[needs: view]

myshape: [

       line 10x40 40x40  ; horizontální čára do středu

       'move 0x-10       ; posun aktuální pozice vzhůru

       'line 20x0        ; konec čáry relativně k aktuální pozici

    ]

view compose/deep/only \[base draw \[shape (myshape)]]

![](http://helpin.red/lib/NewItem120.png)

line

Nakreslí úsečku mezi dvěma body. Je-li zadáno více bodů, kreslí se další úsečky, napojované na předchozí.

Red \[needs: view]

myshape: \[line 10x10 70x70]

view compose/deep/only [

       base draw [

           shape (myshape)

       ] ]

![](http://helpin.red/lib/NewItem117.png)

Všimněte si upřesnění compose/deep/only a závorek kolem myshape.  Tyto náležitosti jsou zřejmě při práci s DSL Shape povinné.

Upřesnění /deep přikazuje vyhodnotit zanořenou závorku.

Upřesnění /only přikazuje  ... nutno doplnit.

Automatické uzavírání tvaru

V následujícím příkladu jsou explicitně zadány pouze dvě přímky. Příkaz  fill-pen  byl přidán jenom pro zvýraznění uzavřené plochy:

Red \[needs: view]

myshape: [

       line 10x70 40x10 70x70

]

view compose/deep/only \[base draw \[ fill-pen blue shape (myshape)]]

![](http://helpin.red/lib/NewItem121.png)

hline a  vline

Kreslí horizontální nebo vertikální přímku z aktuální pozice pera.

Red \[needs: view]

myshape: [

       move 10x10   ; nastaví pero na 10x10

       hline 30     ; horizontále X = 30 (délka 20)

       vline 30     ; vertikála Y = 30 (výška 20)

       'hline 30    ; horizontála délky 30

       'vline 30    ; vertikála délky 30

       'hline -20   ; horizontála záporné délky 20

                    ; lomená čára se posléze uzavře

]

view compose/deep/only \[base draw \[shape (myshape)]]  

![](http://helpin.red/lib/NewItem122.png)

arc (liší se od Draw-arc)

arc evokuje absolutní souřadnice  
'arc evokuje relativní souřadnice

                                                                        Kreslí oblouk mezi aktuální polohou pera a koncovým bodem oblouku. Oblouk je definován úsekem fiktivní elipsy s poloměry r-x, r-y a úhlem odklonu vodorovné osy elipsy od souřadnicové osy x.

Syntaxe:      arc  &lt;end&gt;  &lt;r-x&gt; &lt;r-y&gt;  &lt;angle&gt;  (plus nepovinné: sweep, large)

![](http://helpin.red/lib/NewItem134.png)     large : kreslí červený oblouk  
                           sweep : kreslí modrý oblouk  
                     sweep large : kreslí fialový oblouk

Bez doplňku sweep, large kreslí zelený oblouk. Oklon elipsy v obrázku je 0 stupňů.

Všimněte si, že zadáváte pouze koncovou pozici oblouku. Počáteční pozice je daná aktuální polohou pera. Je-li tedy arc prvním příkazem argumentu pro shape,  musíte se nejprve přesunout (move) do počáteční pozice.

Red \[needs: view]

myshape\_1: [

       move 10x40

       arc 70x40 10 5 0 ]

myshape\_2: [

       move 10x40

       arc 70x40 30 10 0 sweep ]

myshape\_3: [

       move 30x30

       arc 60x60 10 10 315 ]   ; u kružnice je hodnota úhlu irelevantní

myshape\_4: [

       move 10x40

       arc 70x40 10 5 45 ]

view compose/deep/only [

       base draw \[ fill-pen blue shape (myshape\_1)]

       base draw \[ fill-pen blue shape (myshape\_2)]

       base draw \[ fill-pen blue shape (myshape\_3)]

       base draw \[ fill-pen blue shape (myshape\_4)] ]

![](http://helpin.red/lib/NewItem126.png)

Odlišné parametry  radius-x a radius-x vytvoří eliptický oblouk.

curve

Kreslí kubickou Bezierovu křivku, danou třemi až čtyřmi body. Připouští absolutní nebo relativní ('curve) souřadnice.

Red \[needs: view]

myshape\_1: [

       move 10x70

       curve 30x20 50x20 70x70   ; 2 kontrolní a koncový bod

    ]

view compose/deep/only [base draw [ fill-pen blue shape (myshape\_1)

    ] ]

![](http://helpin.red/lib/NewItem127.png)

curv ,  qcurve  a  qcurv

Všechny tři příkazy generují Bezierovy křivky s absolutními či relativními (') souřadnicemi.

- qcurv    kreslí hladkou kvadratickou Bezierovu křivku z 1+1 bodů.
- qcurve  kreslí kvadratickou Bezierovu křivku z alespoň 1+2 bodů;
- curv      kreslí hladkou kubickou Bezierovu křivku z alespoň 1+1 bodů;

Tyto křivky používají počáteční, koncový a kontrolní bod či body. Pěkná animace je na Wikipedii, viz  [https://en.wikipedia.org./wiki/Bézier\_curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve)

Red \[needs: view]

myshape\_1: [

       move 10x40       ;starting point

       curv    30x10        40x40         50x60          70x40

       ;  control point   control point   control point   endpoint

    ]

view compose/deep/only [base draw [ fill-pen blue shape (myshape\_1)

    ] ]

![](http://helpin.red/lib/NewItem128.png)
