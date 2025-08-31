# Archived messages from: [gitter.im/red/Spanish](/gitter.im/red/Spanish/) from year: 2018

## Thursday 12nd April, 2018

planetsizecpu

[08:17](#msg5acf16255f188ccc1558535e)Hola reducers de habla castellana, solo ponerme a vuestra disposición por si puedo ayudar en algo, aunque yo también estoy aprendiendo este fantástico lenguaje, en mi \[repo](https://github.com/planetsizecpu) hay algunos ejemplos interesantes.

## Friday 7th December, 2018

0xJes

[02:59](#msg5c09e2098336e22a7df2fd72)Hola...

[03:00](#msg5c09e256178d7860a198f735)Se inglés pero no soy muy bueno, así que preguntare por aquí primero

[03:03](#msg5c09e2ef4808192b03f9142e)Estoy aprendiendo Red mientras hago una aplicación para modificar una serie de videojuegos específicos

[03:07](#msg5c09e40b33d9e119919244d0)Estoy obteniendo este error: `*** Script Error: invalid DATA facet content [sides: 4 unknown5: 0] *** Where: on-change-facet *** Stack: view do-events do-actor do-safe save-fur on-face-deep-change*`

[03:18](#msg5c09e66f8d4f3a2a7c81e2fd)He aquí el código:

[03:19](#msg5c09e6ab33d9e1199192509b)

```
Red
save-fur: has [][
	i: (to integer! fur-selection/selected) * 2
	?? fur-script/data
	?? furnitures/:i/script

	print type? fur-script/data
	print type? furnitures/:i/script

	furnitures/:i/script: fur-script/data
]
```

[03:20](#msg5c09e6ef8b656e2b04d56624)fur-script/data: 8027  
furnitures/:i/script: 8027  
integer  
integer  
&lt;el error que puse mas arriba&gt;

[03:24](#msg5c09e7f580986419d5503185)Antes de eso, sucede esto:

```
fur-script/data: furnitures/:i/script
```

[03:28](#msg5c09e8c24808192b03f93680)No creo que sea suficiente la información que os doy... si tal, publico el código fuente entero en github o en pastebin para este propósito

## Monday 10th December, 2018

planetsizecpu

[17:21](#msg5c0ea08c178d7860a1b5e27a)Hola Jesús yo también estoy aprendiendo Red, puedo ejecutar la función pero no basta, se necesita el script para verlo, de todas formas no veo claro lo de `furnitures/:i/script` ese `:` creo que sobra para acceder a la word `i`

## Tuesday 11st December, 2018

0xJes

[23:36](#msg5c104a1026de6f0822bd4deb)Ya no tengo ese problema, se arregla en la versión 0.6.4

[23:37](#msg5c104a51f992693c7a5c9836)La consola gráfica de la 0.6.4 no me iba en wine y por eso usaba la 0.6.3

[23:39](#msg5c104aa24808192b03211fea)usar la `i` como iterador no me funciona sin la `:`

[23:40](#msg5c104ae34808192b032120e6)Red cree que estoy intentando acceder a la variable `i` dentro del bloque la cual no existe

[23:40](#msg5c104af7f4880a60a264142f)O eso creo que es lo que sucede...

## Wednesday 12nd December, 2018

planetsizecpu

[09:57](#msg5c10db793de4e816e24c1c07)Ya pero recuerda que en Red no existen variables ni asignación, solo palabras.

## Thursday 13th December, 2018

0xJes

[00:03](#msg5c11a1dc11bb5b2504a6872a)Vale!
