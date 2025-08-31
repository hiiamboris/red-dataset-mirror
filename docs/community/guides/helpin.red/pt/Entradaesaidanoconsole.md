Original URL: <http://helpin.red/pt/Entradaesaidanoconsole.html>

# Entrada e saída no console

* * *

* * *

### Nota: utilizar os comandos de entrada e saída do console pode causar problemas se você compilar os seus programas. Faz sentido, se você compilar, o console simplesmente não está lá!

### native! print

print envia dados para o console. Após os dados, envia um newline character (nova linha) para o console. Ele avalia o argumento antes de colocá-lo no console.

Red \[]

print "hello"

print 33

print 3 + 5

hello

33

8

### native! prin

prin também manda dados para o console, mas não envia o  newline character . Ele avalia o argumento antes de colocá-lo no console.

Red \[]

prin "Hello"

prin "World"

prin 42

HelloWorld42

### function! probe

probe manda o console o seu argumento sem avaliá-lo, mas também retorna o argumento.  Lembre que  print avalia o argumento. probe manda para o argumento para o console "como ele é" por assim dizer.  
Pode ser usado para debugging como uma maneira de mostrar o código sem alterá-lo.

&gt;&gt; print \[3 + 2]  
5

&gt;&gt; probe \[3 + 2] \[3 + 2]  
\== \[3 + 2]

&gt;&gt; print probe \[3 + 2]  
\[3 + 2]  
5

Descrito também [aqui](http://helpin.red/Acessandoeformatandodados.html), após mold.

### function! input

Lê uma string a partir do console. Note que qualquer número digitado no console será convertido para uma string. newline character são removidos.

Red \[]

prin "Enter a name: "

name: input

print \[name "is" length? name "characters long"]

John

John is 4 characters long

### routine! ask

A mesma coisa que input, mas exibe uma string fornecida por você.

Red \[]

name: ask "What is your name: "

prin "Your name is "

print name

What is your name: John

Your name is John
