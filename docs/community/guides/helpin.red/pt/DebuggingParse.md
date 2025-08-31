Original URL: <http://helpin.red/pt/DebuggingParse.html>

# Debugging Parse

* * *

* * *

O dialeto Parse é poderoso, mas também é difícil de visualizar e notoriamente difícil de depurar. Antes de prosseguir para os recursos mais avançados da análise, sugiro que você aprenda como depurar seu código. Há duas maneiras que eu conheço: usar a função parse-trace e imprimir informações ao longo da computação.

### function! parse-trace

Faz o parse da entrada, mas também imprime (rastreia) todas as etapas do processo.

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

usar print:

Coloque instruções print em locais estratégicos para informar o status da computação:

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
