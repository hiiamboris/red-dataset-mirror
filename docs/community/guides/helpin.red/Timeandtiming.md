Original URL: <http://helpin.red/Timeandtiming.html>

# Time and timing

* * *

* * *

native! wait  [Red-by-example](http://www.red-by-example.org/#wait)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-no-wait-a-refinement-of-view.-and-wait-)

Stops the execution for the number of seconds given as argument.

- Note: as of November 2017, the GUI Console does not work well with wait.

native! now  [Red-by-example](http://www.red-by-example.org/#now)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-now-time-append-and-form-)

Returns date and time:

&gt;&gt; now  
\== 12-Dec-2017/19:24:41-02:00

Refinements

/time - Returns time only. time!

&gt;&gt; now/time  
\== 21:42:41

/precise - High precision time. date!

&gt;&gt; now/precise  
\== 2-Apr-2018/21:49:04.647-03:00

&gt;&gt; a: now/time/precise  
\== 22:05:46.805                ;a is a time!

&gt;&gt; a/hour  
\== 22                        ;hour is an integer!

&gt;&gt; a/minute  
\== 5                        ;minute is an integer!

&gt;&gt; a/second  
\== 46.805                        ;second is a float!

This script creates a delay of 300 miliseconds (0.3 seconds):

Red \[]

thismoment: now/time/precise

print thismoment

while \[now/time/precise &lt; (thismoment + 00:00:00.300)]\[]

print now/time/precise

21:51:58.173  
21:51:58.473

/year - Returns year only. integer!

&gt;&gt; now/year  
\== 2018

/month - Returns month only. integer!

&gt;&gt; now/month  
\== 4

/day - Returns day of the month only. integer!

&gt;&gt; now/day  
\== 2

/zone - Returns time zone offset from UCT (GMT) only. time!

&gt;&gt; now/zone  
\== -3:00:00

/date - Returns date only. date!

&gt;&gt; now/date  
\== 2-Apr-2018

/weekday - Returns day of the week as integer! (Monday is day 1).

&gt;&gt; now/weekday  
\== 1

/yearday - Returns day of the year (Julian). integer!

&gt;&gt; now/yearday  
\== 92

/utc - Universal time (no zone). date!

&gt;&gt; now/utc  
\== 3-Apr-2018/0:53:50

VID DLS rate  [Red-by-example](http://www.red-by-example.org/#0rate)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-rate-sets-a-timer-for-a-face.-)

Timing may also be achieved with [VID dialect (GUI) using the](http://helpin.red/Advancedtopics.html) [rate](http://helpin.red/Advancedtopics.html) [facet](http://helpin.red/Advancedtopics.html).

[&lt; Previous topic](http://helpin.red/Printingspecialcharacters.html)                                                                                          [Next topic &gt;](http://helpin.red/Errorhandling.html)
