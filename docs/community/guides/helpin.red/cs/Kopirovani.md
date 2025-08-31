Original URL: <http://helpin.red/cs/Kopirovani.html>

# Kopírování

* * *

* * *

Varování pro začátečníky: Přířazujete-li hodnotu slova  jinému slovu , proveďte to s příkazem COPY.

&gt;&gt; var1: var2                ; jste-li si jisti, co činíte

&gt;&gt; var1: copy var2        ; může vám ušetřit hodiny ladění

action! copy

Přiřadí kopii dat jinému slovu.

Lze použít ke kopírování řad a  [objektů](http://helpin.red/Objekty.html).

Nepoužívá se pro jednotlivé položky typu: integer! float! char! etc. Pro tyto účely můžeme jednoduše použít dvojtečku.

Pohleďme na jednoduché přiřazení (závislá kopie):

![](http://helpin.red/lib/copy1.png)

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; b: s  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/part s 4  
\== \["cat" "dog" "fox" "cow"]

&gt;&gt; b  
\== \["fly" "ant" "bee"]                ; změna se projeví u obou proměnných

Nyní na přiřazení s 'copy' (nezávislá kopie):

![](http://helpin.red/lib/copy2.png)

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; b: copy s  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/part s 4  
\== \["cat" "dog" "fox" "cow"]

&gt;&gt; b  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

'Nezávislost' se netýká vnořených řad (bloků). Příkaz  copy nemění odkaz na tyto vnořené řady. Chcete-li pro tento případ vytvořit nezávislou kopii, musíte použít upřesnění /deep.

copy/part

Omezuje délku (number! či series!) kopírované části.

&gt;&gt; a: "my house is a very funny house"  
&gt;&gt; b: copy/part a 8  
\== "my house"

copy/types

Kopíruje jenom určité typy neskalárních hodnot.

copy/deep

Kopíruje vnořené hodnoty.
