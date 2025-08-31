Original URL: <http://helpin.red/cs/Notepad.html>

# Notepad++

* * *

* * *

## Provizorní IDE v Notepad++

Pěkné vývojářské prostředí Redu ve Windows lze vytvořit s použitím editoru Notepad++. Můžete postupovat podle následujících instrukcí nebo si stáhnout instalační složku [Red\_IDE](http://helpin.red/Red_IDE.zip). Tato zazipovaná složka obsahuje kromě potřebných konfiguračních souborů také aplikace notepad++.exe a red-063.exe.

Pokud si ji stáhnete, máte v jeho (anglickém)  Notepadu++ již přednastavený jazyk Red-lang i položku Red-run v menu Run, takže dále popisovaná nastavení nemusíte provádět. Složka Red\_IDE dokonce obsahuje připravenou pracovní složku Programy.

První spuštění red-063.exe ve složce RedIDE chvíli trvá, než otevře konzolu, protože se instaluje a provádí sestavení aplikace Red.

Následující pokyny popisují postup pro instalaci z individuálně stažených instalačních souborů:

1 - Vytvořte v počítači složku RedIDE/;

2 - Stáhněte si aktuální [Notepad++](https://notepad-plus-plus.org/download/v7.5.6.html) [.](https://notepad-plus-plus.org/download/v7.5.1.html) Určitě si vyberte  "minimalistický paket 32-bit x86".

![](http://helpin.red/lib/ide1.png)

3 - Rozbalte Notepad++ ve vytvořené složce RedIDE/.

4 - Stáhněte si aktuální verzi [Redu pro Windows](http://www.red-lang.org/p/download.html)  a přemístěte ji do složky RedIDE/.

5 - Stáhněte si konfigurační soubor [Red-lang.xml](https://github.com/Ungaretti/Notepad-config-file-for-Red-Language). Vložte jej rovněž do složky RedIDE/.

6 - Rovněž doporučuji, aby jste si uvnitř složky RedIDE vytvořili ještě složku Programy pro ukládání programů. Složka RedIDE nyní může vypadat takto:

![](http://helpin.red/lib/ide2.png)

7 - V otevřemém Notepad++ aktivujte nabídku “Syntaxe/Definovat vlastní syntaxi…” (případně Language/Define your language...) . V otevřeném okně klikněte na “Import…” a vyberte stažený “Red-lang.xml”. Vysouvací návěstí vám řekne, že byl import úspěšný.

![](http://helpin.red/lib/ide3.png)

8 - Zatrhněte políčko “Nerozlišovat malá a velká písmena”. Klikněte na “Uložit jako…” a uložte jako “Red”. Potom napište “red” do políčka “Přípona”. Obrázek dole je ve fázi "Uložte jako".

![](http://helpin.red/lib/ide4.png)

9 - Otevřte okno “Nastavení/Volby/Automatické dokončování”. Zatrhněte políčka pro “()”, “” “{}” and “\[]”. (If you can’t find those in the options, create a “matched pair”.)

![](http://helpin.red/lib/ide5.png)

10 - Otevřte okno “Spustit/Spustit..” , zapište název staženého binárního souboru Redu  a za mezeru opište tento text:  “$(FULL\_CURRENT\_PATH)”. Uložte, zadejte oblíbené klávesové zkratky a jméno - například  “Red\_Run” (pamatujte, že později můžete chtít něco jako “Red\_Compile” etc.) a klikněte “OK”.

![](http://helpin.red/lib/ide6.png)

11 - Zavřete a restartujte Notepad++.

12 - Otevřte v  Notepad++ nový dokument a opište dolní text. V případě tohoto "Red\[]" je Red výjimečně "case sensitive".

Red\[]  
print "Hello world!"

13 - Uložte program s extenzí .red (“MyFirst.red”). V zapsaném skriptu se zvýrazní vybraná slova. Doporučuji jej uložit do vytvořené složky Programy/. Klikněte “Spustit/Red\_Run”. Skript by se měl otevřít v grafické konzole Redu.

![](http://helpin.red/lib/ide7.png)

14 - Upravte rozměry obou aplikací a místěte je úhledně vedle sebe a máte hotové IDE.

![](http://helpin.red/lib/ide8.png)

15 - Silně doporučuji vytvořit si kopii složky “RedIDE/” jako například “RedIDE\_backup”.

16 - Nyní svůj skript zapíšete v Notepad++, uložíte jej a spustíte pokynem  “Run/Red\_Run”.

Všiml jsem si, že v dané konfiguraci jsou párové hranaté závorky zvýrazněny stejnou barvou jako kulaté závorky.. Je možné to změnit v Settings&gt;Style Configurator:

![](http://helpin.red/lib/bracketshighlight.png)

Znovu připomínám, že tato adaptace je možná  pouze s Notepad++ 32-bit.
