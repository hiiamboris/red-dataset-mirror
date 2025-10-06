red>> pessoa: object [
[    nome: "Zé"
[    sobrenome: "Ninguém"
[    idade: 21
[    apresenta: does [print ["Olá! Meu nome é" nome "e tenho" idade "anos."]]]
== make object! [
    nome: "Zé"
    sobrenome: "Ninguém"
    idade: ...
red>> pessoa/idade: 20
== 20
red>> pessoa/apresenta
Olá! Meu nome é Zé e tenho 20 anos.
red>> eu: make object! pessoa
== make object! [
    nome: "Zé"
    sobrenome: "Ninguém"
    idade: ...
red>> eu/nome: "Guaracy"
== "Guaracy"
red>> eu/idade: 123
== 123
red>> pessoa/apresenta
Olá! Meu nome é Zé e tenho 20 anos.
red>> eu/apresenta
Olá! Meu nome é Guaracy e tenho 123 anos.
red>> 
