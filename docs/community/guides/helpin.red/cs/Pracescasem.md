Original URL: <http://helpin.red/cs/Pracescasem.html>

# Práce s časem

* * *

* * *

native! wait

Zastaví exekuci na zadaný počet vteřin.

- Note: as of November 2017, the GUI Console does not work well with wait.

native! now

Vrací datum a čas:

&gt;&gt; now  
\== 12-Dec-2017/19:24:41-02:00

now/time - Vrací pouze čas (time!)

&gt;&gt; now/time  
\== 21:42:41

now/precise - Zvýšená preciznost údaje (date!)

&gt;&gt; now/precise  
\== 2-Apr-2018/21:49:04.647-03:00

&gt;&gt; a: now/time/precise  
\== 22:05:46.805                   ;a is a time!

&gt;&gt; a/hour  
\== 22                                ;hour is an integer!

&gt;&gt; a/minute  
\== 5                                ;minute is an integer!

&gt;&gt; a/second  
\== 46.805                          ;second is a float!

Tento skript vytvoří časový posun o 300 milisekun (0.3 sekundy):

Red \[]

thismoment: now/time/precise

print thismoment

while \[now/time/precise &lt; (thismoment + 00:00:00.300)]\[]

print now/time/precise

21:51:58.173  
21:51:58.473

now/year - Vrací pouze rok (integer!)

&gt;&gt; now/year  
\== 2018

now/month - Vrací pouze měsíc

&gt;&gt; now/month  
\== 4

now/day - Vrací pouze den měsíce

&gt;&gt; now/day  
\== 2

now/zone - Vrací časový odstup od UCT (GMT) (time!)

&gt;&gt; now/zone  
\== -3:00:00

now/date - Vrací pouze datum (date!)

&gt;&gt; now/date  
\== 2-Apr-2018

now/weekday - Vrací den tydne jako integer! (pondělí je den 1).

&gt;&gt; now/weekday  
\== 1

now/yearday - Vrací den roku (Julian).

&gt;&gt; now/yearday  
\== 92

now/utc - Univerzální čas (no zone) (date!)

&gt;&gt; now/utc  
\== 3-Apr-2018/0:53:50

VID DLS rate

Nastavení času lze také provést v dialektu [VID  s použitím aspektu](http://helpin.red/Pokrocilatemata.html) [rate](http://helpin.red/Pokrocilatemata.html).
