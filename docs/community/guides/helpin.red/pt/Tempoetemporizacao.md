Original URL: <http://helpin.red/pt/Tempoetemporizacao.html>

# Tempo e temporização

* * *

* * *

native! wait

Pára a execução pelo número de segundos do argumento.

- Nota: pelo menos até novembro 2017, o console GUI não trabalhava bem com wait.

native! now

Retorna a data e a hora:

&gt;&gt; now  
\== 12-Dec-2017/19:24:41-02:00

Refinamentos:

/time - Retona apenas a hora. time!

&gt;&gt; now/time  
\== 21:42:41

/precise - data e hora de alta precisão. date!

&gt;&gt; now/precise  
\== 2-Apr-2018/21:49:04.647-03:00

&gt;&gt; a: now/time/precise  
\== 22:05:46.805                ;a é um time!

&gt;&gt; a/hour  
\== 22                        ;hora é integer!

&gt;&gt; a/minute  
\== 5                        ;minuto é integer!

&gt;&gt; a/second  
\== 46.805                        ;segundo é float!

Este script cria um dalay de 300 milisegundos (0,3 segundos):

Red \[]

thismoment: now/time/precise

print thismoment

while \[now/time/precise &lt; (thismoment + 00:00:00.300)]\[]

print now/time/precise

21:51:58.173  
21:51:58.473

/year - Retorna apenas o ano. integer!

&gt;&gt; now/year  
\== 2018

/month - Retorna apenas o mês. integer!

&gt;&gt; now/month  
\== 4

/day - Returns apenas o dia do mês. integer!

&gt;&gt; now/day  
\== 2

/zone - Retorna apenas o offset (diferença) do UCT (GMT) . time!

&gt;&gt; now/zone  
\== -3:00:00

/date - Retonra apenas a data. date!

&gt;&gt; now/date  
\== 2-Apr-2018

/weekday - Retorna o dia as semana como integer! (segunda-feira é 1).

&gt;&gt; now/weekday  
\== 1

/yearday - Returna o dia do ano (Juliano). integer!

&gt;&gt; now/yearday  
\== 92

/utc - Hora Universal UTC (sem zona). date!

&gt;&gt; now/utc  
\== 3-Apr-2018/0:53:50

VID DLS rate

A temporização também pode ser obtida com a facet rate do [dialeto VID](http://helpin.red/Topicosavancados.html)
