Original URL: <http://helpin.red/SomepitfallsofRedlearning.html>

# Some pitfalls of Red learning

* * *

* * *

Red is very productive. It's the most productive programming language I know. You can get so much done using so little code! It's also very easy to use after you learn it, but I would like to comment here some of the issues I found in the process. You can't really avoid these pitfalls, but your journey may be easier if you are aware of them.

\# 1 - New way of thinking. It takes longer to learn than expected:

Red's productivity comes with a price. Although the basic examples are easy, it seems to me that it's very hard do real programming in Red without grasping its major concepts. Red is not made of some basic building blocks that you put together as you please, in Red everything is interconnected. Evaluations, datatypes and dialects permeate all coding. Working with the concept of "code is data and data is code" takes practice to get used to. It's like learning a foreign language, you kind of absorb it by repetition.

\# 2 - Wrong datatypes in arguments:

A word in Red may have one of the many, many datatypes available, but functions expect a very definite set of datatypes in its arguments. You will soon find that bug where a seemingly innocent "variable" is crashing your script or giving unexpected results for no apparent reason. A very good idea is to start your debugging by checking the datatype of your arguments. One basic approach would be inserting some "print type? &lt;variable&gt;" in your code when things go wrong. You can find out what datatypes your function expects typing "? &lt;function&gt;" in the console.

\# 3 - Dialects use only dialect commands:

You will soon use the built-in dialects of Red, as VID (for GUI), parse or draw, and you will try to insert common Red structures inside the dialect block. Bad idea. Dialects may (or may not) have their own commands to let you use regular Red inside their block, but you can't just insert a loop or a branch without proper coding. For example, in VID, you may use do \[&lt;Red code&gt;] but other dialects require that you use external functions and then evaluate results using compose. More on that later, for now, just beware.

So:

Red \[needs: view]

parse \[xxx] \[only parse commands here]

view  [

       only view commands here

       draw\[only draw commands here]

]

[&lt; Previous topic](http://helpin.red/Evaluation.html)                                                                                          [Next topic &gt;](http://helpin.red/Consoleinputandoutput.html)
