# Archived messages from: [gitter.im/red/red/France](/gitter.im/red/red/France/) from year: 2021

## Friday 1st January, 2021

ldci

[11:25](#msg5fef0699ac9d8e7463e3b7d9)Bonne Année à tous :)

## Monday 4th January, 2021

ldci

[11:16](#msg5ff2f929aa6bb528c38d56b8)redCV et red OpenCV sont à jour sur GitHub pour une compatibilité avec le nouveau compilateur Red. RedCV supporte maintenant les images thermiques des caméras Flir.

## Thursday 7th January, 2021

Boum69

[19:28](#msg5ff760d803529b296bd6ee03)Bonne année à tous. Encore du super travail. Juste pour info, quelle est la différence entre redCV et red OpenCV 🤔

## Friday 8th January, 2021

ldci

[06:31](#msg5ff7fc2de578cf1e95d525cc)@Boum69. Red OpenCV est un portage écrit en Red/System qui permet d'appeler les DLL d'OpenCV pour environ 600 fonctions de base écrites en C. redCV est un mixte de Red/System et de Red et utilise beaucoup les routines.redCV est plus simple à utiliser que redOpenCV, mais ne comporte pas encore toutes les fonctions similaires à OpenCV. Selon ses besoins, on peut utiliser l'un ou l'autre.

Boum69

[10:51](#msg5ff8391881c55b09c7f56940)Ok merci pour tous ces renseignements. Je teste cela dès que possible. Encore bravo !

## Tuesday 25th May, 2021

Boum69

[22:44](#msg60ad7dc40ff6de262b2b90cc)Bonsoir à tous,

[22:47](#msg60ad7e71801b07264e6c22ed)J'ai une question concernant la compilation de script red sous Windows nécessitant View. Après la compilation, on obtient un exécutable qui ouvre en arrière plan une fenetre de commande MS DOS. Est il possible de créer un EXE sans cette fenetre de commande ?

[22:47](#msg60ad7e90bdecf719a07c92db)Merci par avance de votre retour et bonne soirée à vous

## Wednesday 26th May, 2021

ldci

[05:09](#msg60add820fec22b4786df9c1b)@Boum69 Oui avec l’option -t: red -t Windows nomdufichier.red

Boum69

[07:47](#msg60adfd1e688a2624b8b1900c)Ah super 👍😉. Merci beaucoup j'essaierai ça ce soir . Bonne journée

## Thursday 27th May, 2021

Boum69

[07:27](#msg60af49d99d18fe19982b287f)Merci mille fois, j'avais essayé plein d'options en vain. Maintenant ça fonctionne🙂

ldci

[08:56](#msg60af5eb39d18fe19982b55ae)Super

## Monday 14th June, 2021

fvanzeveren

[08:04](#msg60c70d88c705e53c1c8ec31b)Bonjour, cela fait un certain temps (pour ne pas dire un temps certain) que je n'ai plus programmé en Rebol/Red. Je m'y remets, mais je me demande un peu quel est le statut du développement de red? Le langage est-il encore activement développé... ou bien est-il dans un état un peu végétatif. Je m'inquiète de voir que la dernière version 064 date d'Aout 2020... Merci pour vos retourz. François.

ldci

[08:09](#msg60c70ea1a5d5740d6123cd35)Bonjour François: ça fait plaisir de te revoir:) Red est très actif en ce moment et avance à grand pas. Les Automated builds, master branch sont mis à jour quasi-quotidiennement et intégrent de plus en plus de fonctionalités intéressantes. Red est suffisament mature pour développer des applications pros. Regarde ici: https://github.com/ldci/Face.

fvanzeveren

[11:25](#msg60c73cc1d161a54f051510c9)@ldci Merci pour ces précisions. Cela me rassure :) J'ai entrepris d'adapter mon script simetrics.r (http://www.rebol.org/view-script.r?script=simetrics.r) pour Red... et je viens de decouvrir que Rebol et Red se comportent différemment lors d'une division: rebol retourne toujours un 'decimal, alors que Red retourne un 'integer quand les opérandes sont des 'integer... C'est ballot parce que je dois parcourir tout le code à la recherche de division pour vérifier si je ne dois pas forcer un 'to-float sur une des opérandes...

## Tuesday 15th June, 2021

fvanzeveren

[08:12](#msg60c860f03169e23498685c82)J'ai upgradé vers la version "nightly build" et mon problème de `divide` et quelques autres sont résolus :) Je me demandais toutefois si une librairie SQL existait pour Red? Merci.

## Wednesday 16th June, 2021

ldci

[07:32](#msg60c9a90e5e8dfc4f118415c9)@fvanzeveren. Tu trouverasun SQL Light ici: https://github.com/red/code

## Tuesday 6th July, 2021

fvanzeveren

[08:35](#msg60e415c4bef0c66d9d4164e0)Merci @ldci :)

## Sunday 15th August, 2021

ldci

[19:47](#msg61196f3c949a3d73863a70fa)Bonsoir à tous. redCV est en version 2.0 maintenant: https://github.com/ldci/redCV

## Saturday 25th December, 2021

ldci

[11:01](#msg61c6f9f882a4667b2544e4e8)Un joyeux Noël à toutes et tous :)

## Monday 27th December, 2021

ldci

[15:17](#msg61c9d923bfe2f54b2eed32d1)\[!\[image.png](https://files.gitter.im/5673a46816b6c7089cbf24ff/2vXq/thumb/image.png)](https://files.gitter.im/5673a46816b6c7089cbf24ff/2vXq/image.png)

[15:18](#msg61c9d951d143b14f83eb48a4)Allez pour la fin d'année, un code Red qui crée des. emojis qu'on peut ensuite utiliser dans son programme.

[15:20](#msg61c9d9c99a33545406f42841)Le plus amusant a été de parser un site Web pour récupérer les valeurs des codes. Parse est vraiment puissant :)

## Tuesday 28th December, 2021

Boum69

[07:05](#msg61cab7399a33545406f5ad5e)Bonjour @ldci et félicitations pour ce travail. C'est très original et très prometteur !! Joyeux Noël avec un peu de retard 🙂

ldci

[19:26](#msg61cb64eed41a5853f92381c9)@Boum69. Le code est ici: https://github.com/ldci/Red-System

Boum69

[23:10](#msg61cb997b6d9ba23328959dbd)Super! Merci pour ce partage ! Bonne soirée

## Wednesday 29th December, 2021

ldci

[16:44](#msg61cc905e5dc6213cd4b7c5d4)Utilisation amusante de l'unicode.

```
Rectangular representation
For N = 10 , we have  110 objects 

🔴🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵
🔴🔴🔵🔵🔵🔵🔵🔵🔵🔵🔵
🔴🔴🔴🔵🔵🔵🔵🔵🔵🔵🔵
🔴🔴🔴🔴🔵🔵🔵🔵🔵🔵🔵
🔴🔴🔴🔴🔴🔵🔵🔵🔵🔵🔵
🔴🔴🔴🔴🔴🔴🔵🔵🔵🔵🔵
🔴🔴🔴🔴🔴🔴🔴🔵🔵🔵🔵
🔴🔴🔴🔴🔴🔴🔴🔴🔵🔵🔵
🔴🔴🔴🔴🔴🔴🔴🔴🔴🔵🔵
🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔵
Sum Number by color = 55 objects
```

Boum69

[19:49](#msg61ccbbc95dc6213cd4b81558)Super! J'ai hate de pouvoir tester cela. Je suis actuellement en déplacement mais j'ai trop hâte de pouvoir tester cela.
