Original URL: <http://helpin.red/DebuggingParse.html>

# Debugging Parse

* * *

* * *

Parse dialect is powerful, but it's also hard to visualize and notoriously difficult to debug. Before you proceed to the more advanced features of parse, I suggest you learn how to debug your code. There are two ways that I'm aware of: using the parse-trace function and printing information along the evaluation.

### function! parse-trace

Parses the input, but also prints (traces) every step of the process.

Red\[]

a:  \["fox" "owl" "rat"]

print parse-trace a \["fox" "owl" "rat"]

--&gt;

  match: \["fox" "owl" "rat"]

  input: \["fox" "owl" "rat"]  

  ==&gt; matched

  match: \["owl" "rat"]

  input: \["owl" "rat"]  

  ==&gt; matched

  match: \["rat"]

  input: \["rat"]  

  ==&gt; matched

return: true

true

Red\[]

a:  \["fox" "owl" "rat"]

print parse-trace a \[\["fox" | "cow"] "owl" "rat"]

--&gt;

  match: \[\["fox" | "cow"] "owl" "rat"]

  input: \["fox" "owl" "rat"]  

  --&gt;

    match: \["fox" | "cow"]

    input: \["fox" "owl" "rat"]    

    ==&gt; matched

    match: \[| "cow"]

    input: \["owl" "rat"]    

  &lt;--

  match: \["owl" "rat"]

  input: \["owl" "rat"]  

  ==&gt; matched

  match: \["rat"]

  input: \["rat"]  

  ==&gt; matched

return: true

true

print statements:

Put print statements in strategic locations to inform the status of the evaluation:

Red\[]

a:  \["fox" "owl" "rat"]

print parse a ["fox" (print "reached fox")

                  "owl" (print "reached owl")

                  "rat" (print "reached the end")

                 ]

reached fox

reached owl

reached the end

true

[&lt; Previous topic](http://helpin.red/Parse.html)                                                                                          [Next topic &gt;](http://helpin.red/Matching.html)
