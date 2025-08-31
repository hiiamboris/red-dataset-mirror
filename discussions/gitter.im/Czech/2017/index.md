# Archived messages from: [gitter.im/red/Czech](/gitter.im/red/Czech/) from year: 2017

## Saturday 1st April, 2017

PeterWAWood

[10:48](#msg58df858f8fcce56b20bc8df3)Ahoj

rebolek

[10:54](#msg58df86d9bc370d964ed99ea2)Ahoj Petře 👍

## Sunday 2nd April, 2017

Tovim

[18:16](#msg58e140128fcce56b20c239be)Otevření tohoto prostoru velmi vítám. Pokud mi to moji čeští/moravští/slezští případně slovenštní "kolegové" dovolíte, rád bych vás zde obtěžoval dotazy ohledně vhodných převodů některých anglických termínů do češtiny.  
Výraz face/piškot bych zatím rád ponechal nějaký čas fermentovat a vrátil se k němu později. Jenom pro zajímavost poznamenávám, že piškot není jenom "sponge cake" ale také botka baleriny.  
Nyní bych chtěl zjistit, jak vhodně přeložit výraz "construction syntax" v poznámce na konci 6. kapitoly Map!datatype v oficiální dokumentaci Redu.  
Jak předcházející příklad napovídá, mohlo by toto slovní spojení označovat přiřazení deklarace útvaru "map" v literálové formě (literal syntax) k proměnné - viz:  
m: #(a: 1 b 2 "c" 3 d: 99)  
Zde použité označení "construction syntax" (skladba konstrukce?) je ojedinělé nebo se používá běžně?

pekr

[18:20](#msg58e14107bc370d964edf7ae0)Ke construction syntax - co se týče slova syntax, myslím si, že i v českém jazyce ve vztahu k IT se ustálily některé pojmy. Zde si myslím, že slovo "syntaxe" je zcela v pořádku?

[18:22](#msg58e14169f22385553d0062e8)V minulosti mi v článku pro Softwarové noviny změnili bez mého vědomí některá slova a docela mi to vadilo. Třeba "javské aplikace". To už bych raději přeložil jako aplikace Javy, připouštím, že mé javovské nemuselo být správné, nicméně javské mi zase zní jako kravské :-)

[18:23](#msg58e141a3408f90be667fa8aa)No a runtime jako "běhové prostředí". Tady je opravdu otázkou se možná podívat jinam a zbytečně nevymýšlet. Abych se vrátil ke Construction syntax, tak bych se asi nebál použít i "konstrukční syntaxe" ....

rebolek

[18:27](#msg58e1429b8e4b63533d8be168)Construction syntax se používá v Rebolu běžně (Red ho zatím moc nepodporuje), jak budu u počítače, pošlu nějaké odkazy.

Oldes

[18:44](#msg58e14686408f90be667fbbd4)\_piškoty_ mi na první pohled taky přišly dost úlet:)

## Monday 3th April, 2017

rebolek

[06:18](#msg58e1e93c8fcce56b20c461a1)Construction syntax - http://curecode.org/rebol3/ticket.rsp?id=1955

## Thursday 6th April, 2017

Tovim

[08:21](#msg58e5fa70ad849bcf4258296e)Podle vývodů v uvedeném odkazu a v něm odkazovaném článku \[REBOL Programming/mold]( https://en.wikibooks.org/wiki/REBOL\_Programming/mold) docházím k závěru, že termín "construction syntax", použitý v kapitole Red/Docs/Datový typ Map! je nepotřebný a matoucí, neboť se kryje s označením "literal syntax" - např. #(a 2 b true).

Poznámka na konci odstavce 6 je rovněž nepotřebná a matoucí, protože formát deklarace mapy je Redu lhostejný, neboť si jej jeho kompilátor (překladač?) stejně přeloží do literálové formy - např.:  
&gt;&gt; make map! \[a 2 b false]  
\== #(a 2 b false)

Ve zmíněné kapitole narážím ještě na jiné nejasnosti:

\* Ve druhém odstavci je legenda &lt;key&gt; : hashed key, accepted types: ...  
Míní se tím, že po zadání hodnot akceptovaných typů (any-word! any-string! integer! float!) jsou klíče uloženy v hashovaném formátu?

\* Druhá poznámka ve třetím odstavci říká, že ... "values are not reduced, so contstruction syntax is required for some special values like logic!".  
Ověřil jsem si, že to je Redu putna (pokud jsem to dobře pochopil), neboť akceptuje jak &gt;&gt; #(a 2 b true), tak make map! \[a 2 b true], které si převede.

Tož tak, pokračování příště. Zdravím

Oldes

[10:35](#msg58e61a067ea420cc42431741)

```
>> m: #(a 2 b true)
== #(
    a: 2
    b: true
)
>> type? select m 'b
== word!
>> m: #(a 2 b #[true])
== #(
    a: 2
    b: true
)
>> type? select m 'b
== logic!
```

[10:37](#msg58e61a668fcce56b20d63b95)Co se týká názvosloví, tak nejsem ten pravý:)

Tovim

[19:06](#msg58e691ab7ea420cc42456318)Děkuji, @Oldes, to je velmi zajímavé.  
Takže `#(co koliv)` je map!, pokud má závorka sudý počet prvků nebo je prázdná; u lichého počtu jde o Syntax Error.  
Naproti tomu `#[nic nebo cokoli]` je Syntax Error; `#[false]` je logic!.  
Existuje ještě nějaké jiné (kromě typů char!, binary!, issue!) použití znaku `#`?

Oldes

[19:16](#msg58e694238fcce56b20d8a141)On je tenhle serializovany syntax povetsinou jeste neimplementovany. Doporucuju zkusit jak to funguje v Rebolu prikazem `mold/all`

## Friday 7th April, 2017

Oldes

[09:48](#msg58e7607c8fcce56b20db89d5)

```
>> mold/all next "abc"
== {#[string! "abc" 2]}
>> mold/all tail "abc"
== {#[string! "abc" 4]}
>> mold/all "abc"
== {"abc"}
>>
```

V Redu to ale ještě není.

## Thursday 13th April, 2017

Tovim

[15:27](#msg58ef98d94cb8d09173897cbf)Hody, hody doprovody, já jsem malý zajíček, přinesl jsem pár vajíček.  
Vytvořil jsem si testovací book na adrese \[docs-cs] (https://tovim.gitbooks.io/docs-cs/content/) pro zobrazování diskutovaných změn.  
Prosím, zkuste se navigovat na `Datový typ Map!`, k němuž dodávám:  
\* Termín `construction syntax : #[none]` je použit pro vyjádření hodnoty `none` ve formátu `none!` a nikoliv `word!`. Jiné použití pro něco jiného jsem na webu nenašel (trvalo mi to dlouho).  
\* V odstavci \*\*3\** mi není jasné k čemu zavazuje (či nezavazuje) předurčený počet slotů, např `lp: #()3`. Když do `lp` vložím více jak tři páry, nic se na mne nezlobí.  
\* Poraďte mi prosím, jak označit klíč ve tvaru `string`:

```
>> mp: # (1 2 "3" 4)
>> type? mp/"3"
Syntax Error: invalid path! at {mp/"3"}
```

Zdravím.

rebolek

[16:52](#msg58efacbe8bb56c2d11a53252)Hody hody! Počet slotů je pro mě novinka, ale počítám, že to funguje stejně jako např. u bloku - je prealokován daný počet v paměti, který se následně může rozšiřovat.

Tovim

[18:53](#msg58efc9468bb56c2d11a5b796)Dík, beru.

## Wednesday 19th April, 2017

rebolek

[20:51](#msg58f7cde7a0e48562421e195f)Mistři!!!

## Thursday 20th April, 2017

Tovim

[18:57](#msg58f9048012d2409935815fdb)Sorry, chtěl jsem říci, že jsem byl s tvým vysvětlením spokojen - to jest, že jsem jej pochopil a že nebylo v rozporu s mými dosavadními znalostmi či představami. Protože jsem od přírody tvor líný, nacpal jsem dovětek k poděkování do jediného slova, což - uznávám, může působit domýšlivě a nezdvořile a tedy se omlouvám.

Oldes

[19:34](#msg58f90d583e27cac331aa0086)@Tovim Já to moc nesleduju, ale nebyla ta Bolkova hláška na výsledek hokejistů z Brna?

pekr

[19:51](#msg58f9113e12d2409935819e7a)Ja si myslim, ze urcite jo :-)

rebolek

[19:51](#msg58f91149d32c6f2f09256b8f)jojo :)

## Friday 21st April, 2017

Tovim

[09:07](#msg58f9cbd8cfec9192725e81ff)Jsemť to ťulpas. Tož congratulations!

## Wednesday 17th May, 2017

Tovim

[19:13](#msg591ca0e35e34568d5e64afe5)Přicházim s rozvahou, proč se mi nechce překládat "face" jako "tvář". V češtině neplatí odvození "interface" -&gt; "face".  
V reálném světě označuje termín face významnou část hlavy a tuto tvář má hlava jenom jednu. V Red/GUI však existuje celá řada "tváří". Celou tváří je i drobné tlačítko Button.  
V některých textech o Redu či Rebolu se ještě místo "face" používá termín "widget". Slovo widget je vymyšlené, neirituje nic proti ničemu. Pro češtinu je ale podmíněně vhodné, protože by se muselo psát podobně jako v Polsku "vidžit" anebo jako se psal u nás v dřívějších dobách fotbal, tedy football - ergo widget.  
Piškot je milé a veselé slovo, používá se i na nožkách tanečnic. Je to ale žel, také poživatina.  
Což tedy něco rovněž vymyšleného, např. grafin, grafon, ..., etc, etc. Pomozte mi, braši, něco vymyslet.

## Thursday 18th May, 2017

Oldes

[09:16](#msg591d66799f4f4ab05bd76d67)já bych to nepřekládal:)

## Friday 16th June, 2017

Tovim

[18:59](#msg59442aa802c480e6724f5a26)Nazdar mládenci. Z dišperace jsem si vyrobil maketu dokumentace Red/Core překladem a kompilací Rebol/Core (https://tovim.bitbucket.io).  
Potřeboval bych poradit, komu od Rebolu si mám říci o souhlas s použitím zdroje.  
Také bych rád věděl, kdo aktuálně píše dokumentaci k Redu. Nenad? Ten by o mém počinu měl případně také vědět.  
Nějak si s tím teď nevím rady. Chtěl bych znát vaše názory.

## Saturday 17th June, 2017

Oldes

[06:53](#msg5944d1e8142826e972c32ae0)Se obavam ze Nenad nebude nadseny z prelozene dokumentace Rebolu se zamenou slova za Red a dopsanim par zmem. On prava bere celkem vazne a mam pocit.. ze Carl se vyjadroval.. ze si nepreje aby byla dokumentace Rebolu pouzivana pro jine projekty. @pekr ma vetsi prehled.

rebolek

[07:49](#msg5944defaf31c8ced0c447931)Na překlad dokumentace k Rebolu by bylo potřeba zeptas se Carla, jenže ten moc nekomunikuje, tak nevím, jak moc to k něčemu bude.

## Monday 19th June, 2017

pekr

[10:28](#msg5947a750d83c50560c21b6c1)Sorry za prodlevu, nemoc, k tomu nějaké focení, práce, tak nebyl moc čas .... K tomu, co říkají Oldes s Rebolkem se toho moc dodat nedá, mají pravdu. RT, tedy Carl, se vyjádřil, že na určité assety si ponechává právo. Jedním z nich je právě dokumentace. Tu nelze použít jako základ pro nějaký derivát/klon Rebolu. Problém s Carlem je, že je děsně vytížený a je to typ člověka, co odpoví, pokud se mu chce, nebo také třeba vůbec. Tímto směrem bych tedy neuvažoval.

[10:29](#msg5947a76f02c480e6725b5aed)K Nenadovi dodám snad jen to, že ten hodně ctí licenční ujednání, takže by podobná věc u něj jistě neprošla ....

[10:31](#msg5947a7e76462d8493c28d61d)Klidne se Nenada může někdo z nás zeptat, nicméně si myslím, že odpověď je poměrně jasná ....

Tovim

[18:37](#msg594819e7142826e972cf81f5)Děkuji za projevené názory, vlastně potvrzují to, co jsem předpokládal. Postoj obou pivotmanů hodlám respektovat a nikde svůj kompilovaný překlad nenabízet a nešířit.  
Může být něco proti něčemu, když při nějakém dotazu v tomto roomu ohledně skladby kódu použiji k bližší ilustraci odkaz na "tovim.bitbucket.io"? Nějaké bych měl.  
Mohl bych se ptát v anglickém prostoru ale čeština mi jde přece jenom lépe než angličtina a jsem také poměrně líný.

rebolek

[18:40](#msg59481a9b5bf0bef94cc01a80)Určte to nebude nic proti ničemu.

[18:42](#msg59481b1d746f1fd6631c3fc5)Ani si nemyslím, že \*neoficiální* překlad dokumentace k Rebolu Carlovi nějak vadil, pokud bude prezentován přesně takto a za předpokladu dotazu na Carla. Prostě bych předpokládal předběžný souhlas do okamžiku, než to zakáže ;)

pekr

[19:09](#msg5948216d746f1fd6631c6167)Carlovi šlo možná jen o to, aby to někdo vevzal, nevydal z toho knihu, apod., a nevydělával na jeho práci. Kdo ví, třeba by mu to dneska už ani nevadilo - on se Rebol nakonec ani přes open-source release nestal automaticky žádným hitem ....

rebolek

[20:00](#msg59482d6fc98bc6d56384188d)Nestal, na což mělo určitě vliv to, že jakmile Carl vydal Rebol pod OSS licencí, tak nadobro zmizel.

## Tuesday 20th June, 2017

Tovim

[19:20](#msg59497586cf9c13503ca75a33)Zdař! Poslal jsem Nenadovi vysvětlující mail (v případě zájmu pošlu kopii), v němž jsem se zmínil, že jsem vás (O P R) se svým počinem seznámil a požádal jsem jej o vyjádření.

## Friday 23th June, 2017

Tovim

[15:18](#msg594d315f3230e14f3ae9090c)Nenad se vyjádřil přesně tak, jak jste předpokládali:  
"""  
The Rebol documentation is copyrighted to Rebol Technologies and Carl Sassenrath. He has expressed during the Rebcon conference in 2013 in Montreal, that the Rebol documentation could be in no way used by anyone else, including all the derivative languages from Rebol.

So it's very clear, we cannot duplicate or modify the Rebol documentation for Red. That is why we redirect people to the rebol.com website for now, until we write our own documentation from scratch (copying Rebol's doc is not an option).

Though, as you've noticed during the translation process, the Rebol/Core documentation is not that big, so writing a similar documentation from scratch for Red is doable even with our limited resources.  
"""

Doufám, že se nedopuštím indiskrece. Zdař!

## Saturday 24th June, 2017

Tovim

[16:14](#msg594e8ff5bf7e6af22c6bdba8)Ještě bych se chtěl vrátit ke svým poněkud zmateným závěrům (zejména z Apr. 06) při debatě o termínu `construction syntax`. Při bloumavém prohlížení (pěkné) dokumentace k PL Elm jsem narazil na použití `literal syntax - list`: \[1, 2, 3] a `konstruction syntax - array`: Array.fromList \[1, 2, 3]. Hned jsem si vzpomněl na použití těchto termínů v dokumentaci Red/Map!datatype.  
Mám zato, že rozdíl mezi literální syntaxí a konstrukční syntaxí je ten, že při deklaraci "objektu" prvním způsobem použiji pouze posloupnost literálů: { #(a: 1 b 2)}, zatímco při deklaraci druhým způsobem použiji nějakou pomocnou funkci (make): {make map! \[a: 1 b 2]}.  
Čím je ale syntaxe výrazu #\[none] (type? #\[none] =&gt; none!) konstrukční, jak tvrzeno, mi stále uniká. Zdař!

## Thursday 6th July, 2017

Tovim

[19:12](#msg595e8b844bcd78af56832fb3)Vracím se k poslední větě předchozího příspěvku. Asi jsem na to přišel - skladba výrazu #\[none] \*\*není konstrukční, nýbrž literálová\** {literální je špatně} -viz příspěvek Bohuslava Březovského (http://redlanguageblog.blogspot.cz/2016/11/safe-and-persistent-local-values.html?view=flipcard), Safe local values/Note: "Because literal map! is not reduced {in local: #(val: #\[none])} we have to use literal none! {ergo #\[none]} here, otherwise it would be word!". Zdař!

rebolek

[19:49](#msg595e943b1c8697534af9fe4b)Nesouhlasím s dvěma věcmi. Zaprvé jsem Boleslav ;) a za druhé se pro syntax v podobě `#[...]` používá v Redbolu spojení \*construction syntax\*. \*literal syntax* v případě mapy, `#(a b)` znamená, že takto zapsaná mapa v kódu odkazuje přímo na sebe, podobně, jako to dělají bloky. Naproti tomu například objekt podobnou formu zápisu nemá.

## Friday 7th July, 2017

Tovim

[14:23](#msg595f99604bcd78af5687b79a)Boleslave, omlouvám se za Bohuslava.  
Pro "konstruction syntax" jsem (zatím) našel dva chodící případy:

```
> #[none]  -->  none!
> #[false]   -->  logic! --> případně i pro "true"
```

Mohu z toho odvodit, že skladbu zvanou "construction syntax", mohu popsat výčtem?  
Prosím, prosím, co označuje název Redbol? Zdař!

rebolek

[14:44](#msg595f9e33c101bc4e3a605a2d)Redbol je souhrnné označení pro jazyky odvozené od Rebolu - Red + Rebol = Redbol.

[14:45](#msg595f9e84f5b3458e30226e8e)Výčtem ne, rozhodně je těch případů víc, stačí si pohrát s `mold/all`:

```
>> mold/all next [1 2 3]
== "#[block![1 2 3]2]"
```

(tohle je v Rebolu, Red to zatím neumí)

## Friday 22nd December, 2017

Tovim

[18:59](#msg5a3d560c0163b028106b2db5)Nazdar chlapci od Redů, čekaje na nové kapitoly dokumentace k PL Red, přeložil jsem pěkný tutoriál k PL Elm. Umístil jsem jej tam, kde jsem měl předtím svůj "divoký" překlad Rebol-&gt;Redu (https://tovim.bitbucket.io). Přeji vám pohodové vánoce a všechno nejlepší v novém roce. Těším se na Red 0.7. Pilně zkoumám problematiku creation vs literal vs construction syntaxe. Aleluja.
