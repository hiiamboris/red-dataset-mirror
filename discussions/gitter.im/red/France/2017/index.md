# Archived messages from: [gitter.im/red/red/France](/gitter.im/red/red/France/) from year: 2017

## Sunday 1st January, 2017

ldci

[13:46](#msg58690818c02c1a3959d5ae8b)Bonne Année à tous :)

ghost~5585eedf15522ed4b3e236ae

[13:48](#msg58690895aa6be0472ff40afb)Bonnes année 2017 !

## Thursday 12nd January, 2017

dockimbel

[07:53](#msg587735f911e7a7f61d86cc0c)Bonne année à tous les redders ! ;)

## Sunday 15th January, 2017

ldci

[14:13](#msg587b8376300f220a66ede1ab)@dockimbel : Je suis ravi de voir que Red avance bien notamment avec le lien pour MS visual basic. J'ai fait beaucoup de pub pour Red et de plus en plus de mes collègues en Humanités Numériques sont persuadés que Red sera un langage adapté à leurs besoins. Une question récurrente de leur part: à quand la version View pour OSX?

## Monday 16th January, 2017

dockimbel

[03:36](#msg587c3faf074f7be763d69bc8)@ldci View/OSX est complet à 98%, tu peux le tester dans la branch `macGUI`. On prévoit une release officielle de cette version 1 mois après la sortie de la 0.6.2 (ce mois ci).

[03:36](#msg587c3fdb6c1635643c3389c0)@ldci Pour info, je suis sur Paris la semaine prochaine, dis-moi quand est-ce qu'on peut se voir ? ;-) Si d'autres reboler/redders sont intéressés, on peut s'organiser un diner ou un pot en commun.

rcqls

[07:35](#msg587c77c8cbcb28177075703d)@dockimbel Dommage pour moi, je suis du côté de Grenoble et cela fait un peu loin pour moi compte tenu en plus de mon emploi du temps un peu chargé la semaine prochaine.

DideC

[09:36](#msg587c941f074f7be763d80b3c)@dockimbel @ldci Si je peux, je tacherais de me joindre à vous. Pour moi, le mieux serais mercredi ou jeudi (je crois).

ghost~5585eedf15522ed4b3e236ae

[23:21](#msg587d556b11e7a7f61da558e7)Depuis Perpignan ça mefait un peu loin.

## Wednesday 18th January, 2017

ldci

[10:11](#msg587f3f6d6c1635643c43be63)Salut Nénad: je serai ravi de te voir soit mardi ou jeudi prochain. On pourrait se voir avec tous ceux qui le souhaitent pour un déjeuner informel. Je ne suis pas libre le soir malheureusement.

dockimbel

[10:12](#msg587f3f9f074f7be763e63599)Mardi me semble une bonne option, je ne suis pas sûr de rester à Paris au-delà de Mercredi. Un déjeuner convient très bien, on peut s'organiser çà dans le quartier du LDCI.

DideC

[13:02](#msg587f6756e836bf70105c482c)Pour un déjeuner, c'est sans moi. Dommage. Mais profiter bien !

ldci

[20:10](#msg587fcbc311e7a7f61db30ad3)@tous: je vous accueillerai tous avec plaisir au 4-14 Rue Ferrus à Paris. 2ème Etage EPHE Bureau 104:)

## Sunday 22nd January, 2017

ldci

[11:47](#msg58849bb6519afee26b99531f)Bureau 204. Oups

## Wednesday 25th January, 2017

ldci

[17:39](#msg5888e2d411e7a7f61de434e3)J'ai testé l'extension red pour l'éditeur de code de MS: génial sur mac et quelques pbs sous windows.Encore du bon boulot de la Red Team:)

## Wednesday 8th February, 2017

dockimbel

[11:52](#msg589b067721d548df2ce05cf6)@ldci Tu peux ouvrir des tickets pour le plugin Red pour VSCode sur: https://github.com/red/VScode-extension/issues

## Saturday 18th February, 2017

ldci

[16:44](#msg58a879e500c00c3d4f573a8e)Au final ça marche très bien sous windows également

## Tuesday 21st February, 2017

ldci

[13:33](#msg58ac41bbde50490822f70532)Je n'ai malheureusement pas beaucoup de temps pour Red en ce moment, mais j'ai regardé un peu comment Red se débrouille avec la récursivité. Pas mal du tout en fait

```
toArabic: function [s [string!] return: [integer!]] [
		nc: length? s 
		either nc = 1 [r: rvalue s/1] [
			n1: rvalue  s/1
			if n1 < rvalue s/2 [n1: negate n1]
			s: next s
			r: n1 + toArabic s
		]
	r
]

print toArabic "I"
print toArabic "III"
print toArabic "IV"
print toArabic "IX"
print toArabic "XXI"
print toArabic "MCDXC"
print toArabic "MCMXCIX"
```

A tester :)

## Wednesday 22nd February, 2017

ldci

[13:18](#msg58ad8fafde50490822fe5b60)Bien: je n'avais pas vu sur rosettacode.org que l'excellent DideC avait déjà répondu à cette question:)

DideC

[15:13](#msg58adaab600c00c3d4f7254ba)Aïe les chevilles ;-)

[15:15](#msg58adab057ceae5376a246539)Mais comme ta version n'utilise pas `parse`, rien ne t'empêche de la mettre en version 2 !

## Saturday 4th March, 2017

ldci

[09:51](#msg58ba8e191465c46a56e4e805)Bien calme en ce moment: une idée sur la date pour la versionOSX ?

dockimbel

[10:13](#msg58ba9367e961e53c7f9a372e)@ldci On va sans doute sortir la version 0.6.2 la semaine prochaine, pour la 0.6.3, qui contient le backend View pour Mac, sans doute 1 à 2 mois après. Le backend est implémenté à 98%, tu peux le tester dans la branche `macGUI`. On a également un nouveau composant Draw pour faire du rich-text dans cette branche, mais il n'est pas encore documenté.

## Monday 6th March, 2017

ldci

[09:18](#msg58bd296d1465c46a56f0d6da)@dockimbel Génial

## Thursday 9th March, 2017

SteeveGit

[13:46](#msg58c15cac9eb1bd81481f39f3) +

## Thursday 16th March, 2017

rcqls

[18:10](#msg58cad5252215a08f049356aa)@dockimbel Sympa cette explication sur le fonctionnement de Redbol sur red/help… Bonne nuit!

dockimbel

[18:20](#msg58cad7592215a08f04936239)Merci. ;-)

## Sunday 26th March, 2017

rcqls

[19:49](#msg58d81b370e4137042ab209f9)@dockimbel Trop fort! C’est comme d’hab juste impressionnant! Cela me tarde de tester la 0.6.3 annoncée très bientôt…. :clap:

## Monday 27th March, 2017

dockimbel

[03:06](#msg58d881c54cb8d091732d4d1a)Merci ! Je pense que ca va prendre un ou deux mois pour boucler la 0.6.3, on a quelques détails encore à régler sur le backend macOS pour View et un certain nombre de nouveautés à ajouter au langage. De toute façon, on va faire court, car on veut commencer la 0.7.0 le plus vite possible.

ldci

[08:15](#msg58d8ca0d408f90be665d412e)Rien que des bonnes nouvelles ce matin. Bravo dockimbel:)

dockimbel

[11:07](#msg58d8f2618fcce56b20a0f966)Merci François. :+1:

ldci

[12:12](#msg58d90191b52518ed4db05006)Génial: le call fonctionne parfaitement sous OSX  
prog: "open ~/Pictures/\*.jpg"  
call prog  
Appelle Apercu.App et affiche toutes images jpeg contenues dans le répertoire Pictures/

DideC

[12:58](#msg58d90c727ea420cc420d5593)Ah, j'avais un lundi matin de merde... jusqu'ici ;-)  
Merci doc :clap:

dockimbel

[16:00](#msg58d93709b52518ed4db16a31)De rien. ;-) Finalement, faire les releases le Dimanche soir ou Lundi matin est peut-être un bon plan. ;-)

StephaneVeneri

[21:39](#msg58d9869a8fcce56b20a3da30)Félicitation à toute l'équipe.  
Je suis à chaque fois impressionné par le travail accomplit.

## Tuesday 28th March, 2017

dockimbel

[08:03](#msg58da18ebb402a53211bd5283)Merci Stéphane ! ;-) Comme tu peux le voir au long de l'article, on a reçu un nombre important de contributions (plus que dans les précédentes versions).

## Wednesday 29th March, 2017

ldci

[07:14](#msg58db5edc0e4137042ac02ceb)@dockimbel : Génial la fonction clip de draw: je n'ai plus besoin de l'écrire pour RedCV :)

dockimbel

[08:19](#msg58db6e1b4cb8d0917339c2b2)`clip`et `image crop` sont des fonctions qui sont bien utiles en effect. ;-)

## Friday 7th April, 2017

jocko-jc

[07:10](#msg58e73b690e4137042af02efb)@dockimbel bonjour, Doc. Le merge de master et de macGUI est-il toujours d'actualité ? Au fait, il y a toujours un problème de lien sur les builds automatiques, et sur red-latest pour MacOSX.

dockimbel

[09:06](#msg58e7568e8fcce56b20db615d)Oui, j'espère aujourd'hui. Notre serveur de build étant situé en Chine, n'est pas accessible de manière fiable depuis notre serveur principal. Pour le moment, on doit lancer les builds Mac manuellement. On a reçu des propositions d'aide de la communauté pour nous aider à contourner le problème.

jocko-jc

[10:02](#msg58e7639a7ea420cc4248616a)Merci pour ta réponse. Bon courage !

## Monday 10th April, 2017

jocko-jc

[12:04](#msg58eb74d98e4b63533db426b7)view pour Mac est maintenant disponible dans la branche master ... et les liens des builds journaliers fonctionnent . Bravo !

dockimbel

[12:07](#msg58eb756a8fcce56b20ea00bf)Oui, on a reçu de l'aide d'un membre de la communauté pour installer une VM macOS en local sur notre serveur, finit les problèmes réseaux avec les builds sur des Mac ayant des connexions au net instables. ;-)

## Wednesday 12nd April, 2017

iarwain

[17:40](#msg58ee6686a0e4856242fa5b9d)Bonjour!  
Je suis l'évolution de Red depuis quelques temps déjà mais ce n'est qu'aujourd'hui que je peux finalement m'y pencher sérieusement pour un petit projet professionnel : un launcher pour un jeu publié sur \[Steam](https://partner.steamgames.com).  
Pour ce faire, j'aurais besoin de pouvoir m'interfacer avec la DLL de Steam mais je ne suis pas sûr de la marche à suivre.  
J'ai trouvé `#import` dans la doc de Red/System mais je ne sais pas comment mélanger/appeler ceci depuis le code du launcher écrit en Red.  
Est-ce qu'il y une documentation, un tutoriel ou un exemple dont je puisse m'inspirer disponible quelque part ?  
Merci d'avance !

Oldes

[18:46](#msg58ee760ab52518ed4d066723)@iarwain Vous pouvez vérifier ceci: https://github.com/red/code/blob/master/Library/Bass/bass.reds

[18:47](#msg58ee764369a692963ea46665)Qu'est-ce que vous voulez réaliser exactement?

iarwain

[18:47](#msg58ee7657f22385553d35714b)Merci de votre réponse, @Oldes

[18:49](#msg58ee76a669a692963ea46884)Je dois appeler des fonctions de la bibliothèque de Steam me permettant de savoir quels mods sont installés pour notre jeu. Le point qui est encore confus pour moi c'est la façon d'exposer le wrapper écrit en Red/System au code de mon application qui lui est écrit en Red.

Oldes

[18:49](#msg58ee76ce408f90be66b48f17)Steam utilise des classes c++ pour ne pas être si facile.

iarwain

[18:50](#msg58ee76f1f22385553d35750b)Ils exposent aussi une API C, dont je comptais me servir.

Oldes

[18:52](#msg58ee777df22385553d357794)J'ai un Steam SDK afin que je puisse l'expérimenter un peu, mais pas aujourd'hui.

iarwain

[18:54](#msg58ee77c98bb56c2d11a004c7)Pas de problème, mais je ne pense pas avoir de gros problèmes pour importer les fonctions dont j'ai besoin (il y en a peu) en Red/System. Mon problème c'est plus le workflow qui me permet d'exposer ce wrapper à l'application même.

[18:55](#msg58ee7837f22385553d357b57)Je vais regarder votre exemple avec BASS, je suis sûr que cela m'éclairera éventuellement. :)

Oldes

[18:56](#msg58ee7857b52518ed4d066fce)Vous voulez dire exposition à Red ou à une autre application?

iarwain

[18:57](#msg58ee788169a692963ea4712c)À Red, je pense que le maillon qui me manquait c'était `#system`

Oldes

[18:59](#msg58ee78f48bb56c2d11a00a5f)Vous pouvez faire quelque chose comme ceci: https://github.com/red/code/blob/master/Library/Bass/bass.red

[18:59](#msg58ee791c69a692963ea474fd)Ou simplement définir `routine`s pour chaque fonction au lieu du dialecte.

iarwain

[19:01](#msg58ee79a1b52518ed4d067658)Je pense ne pas vraiment savoir comment me servir ni de `#system` ni de `routine` pour le moment. J'ai probablement dû les manquer dans la documentation que j'ai trouvée.

[19:06](#msg58ee7aaa69a692963ea47c04)En aparté, toutes mes félicitations pour Machinarium !

## Thursday 13th April, 2017

sylvievathoux

[13:17](#msg58ef7a5a8bb56c2d11a4343c)Bonjour, comment faire pour ne pas lancer la console en même temps que son script ? J'ai beau chercher, je ne trouve pas la solution, si elle existe...  
Merci

dockimbel

[15:39](#msg58ef9b9c8bb56c2d11a4dd35)@sylvievathoux Bonjour, en utilisant l'option `--cli` et un script Red, la console ne s'ouvrira pas:

```
red --cli <script.red>
```

[15:53](#msg58ef9edf408f90be66b95797)@iarwain Bonjour, la seule doc actuellement disponible sur ce sujet se trouve sur le \[wiki](https://github.com/red/red/wiki/Red-tutorial-for-newcomers---French-version). Tu y trouveras un exemple simple d'intégration d'une lib exterieure à Red, via Red/System.

[15:54](#msg58ef9f1cbdf4acc11257c606)La version 0.6.3 de Red devrait apporter la possibilité de faire de même sans passer par Red/System, c'est à dire , de charger des librairies externes et d'importer leurs fonctions directement depuis Red.

[15:54](#msg58ef9f3b08c00c092a79a6ed)Si tu as des questions à ce sujet, n'hésite pas à les poser ici.

iarwain

[16:40](#msg58efaa0d08c00c092a79d7da)@dockimbel Merci pour ces info!

[16:51](#msg58efac998e4b63533dc69315)J'essaie aussi de m'instruire sur VID, principalement à l'aide de \[ce document](https://doc.red-lang.org/v/v0.6.2/en/vid.html) et avec les quelques tests que j'ai trouvés dans le dépôt git, mais je me heurte à quelques problèmes (notamment en ce qui concerne le centrage des faces ou le wrapping des textes). Est-ce qu'il y a d'autres ressources disponibles pour en apprendre plus à ce sujet?

dockimbel

[17:06](#msg58efb0008e4b63533dc6a34f)Peu de ressources dispo à ce sujet, tu peux regarder quelques exemples \[ici](http://www.red-by-example.org/vid.html). Le dialecte VID ne dispose pas encore de fonctionnalité de centrage, mais il est possible d'utiliser la fonction `center-face` pour compenser en attendant:

```
view [size 500x500 text "Hello!" on-created [center-face face]]
```

[17:06](#msg58efb02eb52518ed4d0b8307)(J'ai un message d'erreur dans la console en utilisant cette ligne de code, on va corriger çà demain).

sylvievathoux

[21:38](#msg58efeff369a692963eaa9599)@dockimbel Merci, effectivement, après compilation de la console dans le répertoire de travail, ça marche sous DOS, mais la même commande dans mon éditeur (npp) m'ouvre toujours la console...

## Friday 14th April, 2017

iarwain

[02:49](#msg58f038cdad849bcf428180ea)@dockimbel merci pour les info et la correction

[02:53](#msg58f039b78fcce56b20fe2b90)J'aurais une autre question pour toi, vu qu'il n'y a pas de uint64! dans Red/System en ce moment, y a-t-il une alternative pour importer des fonctions d'une bibliothèque C qui utilise des paramètres entier 64bit ? Si ce n'est pas le cas, aurais-tu des recommandations sur quelles parties du code de Red/System je devrais regarder pour rajouter ce support moi-même ?

dockimbel

[03:51](#msg58f0473208c00c092a7c2243)@sylvievathoux Tu peux tenter ceci: ouvre la console utilisée par npp directement, et tapes `flip-exe-flag %./` pour forcer la console à cacher la fenêtre DOS lors d'exécutions ultérieures.

[03:56](#msg58f0486b8fcce56b20fe5c7b)@iarwain Pour le moment, la seule option est d'utiliser 2 entiers 32-bit dans les specs d'import. Ajouter le support d'entiers 64-bit dans Red/System est dans notre roadmap (pour la 0.6.4), c'est difficilement contribuable, car ça nécessite des ajouts/changements important dans le compilateur et surtout dans le générateur de code (donc des connaissances très profondes sur le fonctionnement du compilateur Red/System).

iarwain

[03:59](#msg58f04938bdf4acc1125a5b33)Je vois, effectivement ça sonne peu accessible pour un nouveau venu.

[04:00](#msg58f049524cb8d091738c1b3e)J'imagine que la 0.6.4 est prévu pour dans un certain temps?

[04:00](#msg58f04977ad849bcf4281b521)Pour les 2 entiers 32-bit, est-ce que Red/System supporte des retours multiples (dans le cas ou le 64 bit est une valeur de retour d'une fonction)?

dockimbel

[04:09](#msg58f04b9269a692963eabbe70)Nous aimerions sortir la 0.6.3 à la fin du mois et la 0.6.4 fin du mois suivant, je pense que même avec les imprévus, on ne devrait pas trop déborder de ces échéances là.

[04:13](#msg58f04c78ad849bcf4281bd91)Tu peux définir un `float!` en retour (il est 64-bit), puis le convertir en 2 entiers 32-bit en mappant un struct par-dessus, le squelette devrait ressembler à çà:

```
two32!: alias struct! [high [integer!] low [integer!] ;-- Little-endian ordering

f64: foo
two32: as two32! :f64
```

[04:14](#msg58f04ca94cb8d091738c2558)Sinon, @ldci a dû rencontrer ce genre de cas déjà dans le binding OpenCV pour Red, il a peut-être de bons conseils à partager à ce sujet. ;-)

[04:16](#msg58f04d2208c00c092a7c3686)Sinon, @PeterWAWood a aussi developpé une petite lib pour gérer des entiers en 64-bit, mais je ne la retrouve plus...(@PeterWAWood could you please point me out to your 64-bit handling lib for R/S?)

iarwain

[04:34](#msg58f0513a8fcce56b20fe7986)Merci, je vais regarder ça. @Oldes a essayé de faire un test du wrapper Steam en utilisant un `#define integer64! float!` mais il s'est heurté à des problèmes apparemment, je n'ai pas le détail. Je vais regarder les binding pour OpenCV.

Oldes

[05:25](#msg58f05d3808c00c092a7c685c)https://github.com/PeterWAWood/Red-System-Libs/tree/master/I64

dockimbel

[06:00](#msg58f0656708c00c092a7c80c1)@Oldes Merci. ;-)

sylvievathoux

[12:14](#msg58f0bd0b8fcce56b20fff53a)@dockimbel Merci Doc. Malheureusement ça ne marche pas, la console est toujours là, y compris avec les scripts compilés (que ce soit en mode dev -c ou release -r). Bon, on fera avec pour l'instant...

[12:16](#msg58f0bd81408f90be66bd6044)Autre chose : peut-on générer ses face à la mode R2, genre "view layout make face! reduce \[...specs...]" ?

[12:31](#msg58f0c120a0e485624203cd54)@dockimbel A part ça, super boulot, bravo ! Déjà fan de R2, je sens que je vais migrer dès que le support du networking sera sorti. Manque un peu de finesse dans les possibilités de customisation des widgets (d'où ma question précédente), la manipulation des face objects etc, mais je présume que ce n'est que provisoire...

dockimbel

[12:46](#msg58f0c4b908c00c092a7de27f)@sylvievathoux Une alternative est de commenter la \[ligne](https://github.com/red/red/blob/master/environment/console/engine.red#L255) qui lance la console, et recompiler une version personalisée. Mais pour les mise à jour, tu dois alors garder un repo git local (clone de red/red) et faire un git pull manuel + recompilation de la console, à chaque fois que tu veux mettre à jour.

[12:48](#msg58f0c52c08c00c092a7de52d)&gt; Autre chose : peut-on générer ses face à la mode R2, genre "view layout make face! reduce \[...specs...]" ?

Oui, tout à fait, tu peux passer un arbre de faces à `view` directement, regarde \[cet exemple](https://github.com/red/red/blob/master/tests/view-test.red). Le dialect VID est optionel (mais \*très* pratique). ;-)

[12:52](#msg58f0c5fba0e485624203e002)Merci ! :+1: Pour la customisation des widgets, il y a beaucoup d'options possibles, certains ont déjà créés des widgets personalisé (même un treeview), mais il manque un framework qui permette de guider la création/customisation. On va ajouter çà dans les prochaines versions, morceaux par morceaux.

sylvievathoux

[13:04](#msg58f0c8d3ad849bcf42838bcb)@dockimbel Ok, génial, rien que pour décortiquer view-test.red ça va me prendre un moment, ça tombe bien je suis en vacances ;-)  
Je vais tester la recompilation. Pour VID, c'est une évidence, c'est même indispensable, mais le must de R2/Red, c'est de pouvoir combiner les deux. Entre ça et le fullstack design, je sens que ça va être un grand plaisir de migrer. Encore bravo, c'est un boulot impressionnant.

[13:43](#msg58f0d1f908c00c092a7e1331)@dockimbel Testé la recompilation selon tes indications, la console n'est plus là effectivement, mais elle est remplacée par une fenêtre DOS, enfin ce qui y ressemble, mais avec une icône Red !! Grrrr...  
Bon, c'est pas grave, ça ne m'empêche pas d'aller plus loin. Merci encore pour ta disponibilité.

dockimbel

[13:45](#msg58f0d266f22385553d3ee381)@sylvievathoux Tu utilises quelles options de compilation pour la console ?

sylvievathoux

[13:49](#msg58f0d34d4cb8d091738e0875)@dockimbel Je suis dans le repo, je lance rebol puis do/args %red.r "%monscript.red". pour la console, je me contente de celle qui est compilée au premier lancement de red-latest.exe...

[14:38](#msg58f0dec9408f90be66bdf0d7)@dockimbel En fait il s'agit bien de la console en mode client, alors que jusqu'à présent je l'avais en mode graphique. C'est comme si je lançais la commande "&gt;&gt; red --cli monscript.red"  
Voilà, j'ai dû rater une étape :-(

angellom1

[15:30](#msg58f0eaff08c00c092a7e83ac)hola

[15:30](#msg58f0eb10ad849bcf428426ae)only French? no Spanish?

[15:30](#msg58f0eb1c881b89e1014e57fd)i need a spanish forum for spanish ppl

[15:30](#msg58f0eb2d8e4b63533dcb57ec)is it possible?

dockimbel

[15:39](#msg58f0ed318e4b63533dcb6216)Hola! The English and main Red room is https://gitter.im/red/red, we also have a Chinese room, but no Spanish so far. If you need it I can create a red/spanish room? Though, nobody in the Red team speaks Spanish AFAICT (my own Spanish is too rusty, estudio la lengua española, pero he olvidado todo ;-)).

angellom1

[16:00](#msg58f0f2268bb56c2d11a9ec1e)i am very interested in red/Spanish channel

[16:01](#msg58f0f2488bb56c2d11a9ec66)i speak and write a little English but isn't enouf for me

[16:01](#msg58f0f264881b89e1014e78ae)dockimbel, create it, please

sylvievathoux

[16:01](#msg58f0f26b408f90be66be45da)@angellom1 Por qué no lo haces tu mismo ?

angellom1

[16:02](#msg58f0f2854cb8d091738e9204)i prefer the owner of red lang

[16:02](#msg58f0f29c8bb56c2d11a9ed63)prefiero que sea el dueño del lenguaje red

sylvievathoux

[16:03](#msg58f0f2c14cb8d091738e93a7)Claro, mejor hablar con Dios ;-) Si quieres te ayudo con traducciones, me permitiria practicar !

angellom1

[16:04](#msg58f0f327408f90be66be4843)dockimbel: I am angelluis nick at freenode

dockimbel

[16:20](#msg58f0f6c48e4b63533dcb8ad6)@angellom1 Done, you can join it there: https://gitter.im/red/Spanish

angellom1

[16:20](#msg58f0f6cef22385553d3f851d)ty

## Sunday 16th April, 2017

ldci

[14:47](#msg58f38407f22385553d47efdc)@tous: je profite de ce dimanche pour créer un blog (http://redlcv.blogspot.com) qui a pour fonction d'illustrer avec des exemples concrets ce que Red offre comme possibilités de traitement d'image. J'essaierai de mettre à jour assez régulièrement :)

dockimbel

[16:06](#msg58f39678a0e48562420d54f8)@ldci Cool !

angellom1

[16:07](#msg58f396dd881b89e101575746)nice! :)

[16:09](#msg58f39727a0e48562420d576d)i am suscribing to that blog :)

## Monday 17th April, 2017

sylvievathoux

[16:39](#msg58f4efbb0ed3020c3825a083)@ldci Cool (bis)  
D'autant plus cool que je n'arrive pas à localiser la doc sur le datatype image, ni sur le widget VID image, notamment, effect (fit aspect etc) est-il implémenté ? Avec tes exemples, j'ai déjà quelques réponses...

ldci

[19:32](#msg58f5184dad849bcf4292e766)@sylvievathoux : ravi de voir que ce que je fais sert à la communauté et de voir également que cette communauté s'agrandit de jour en jour. Bientôt plus d'exemples sur le blog :)

sylvievathoux

[20:00](#msg58f51eddf22385553d4dbe5a)@ldci Au plaisir de te tester !

## Tuesday 18th April, 2017

dockimbel

[07:11](#msg58f5bc3dbdf4acc1126d6828)@sylvievathoux La doc sur `image!`n'est pas écrite encore. Les effets sur images ne sont pas implémentés non plus, mais ca sera fait d'ici cet été (@ldci a bien prémaché le travail sur ce sujet).

## Wednesday 19th April, 2017

DideC

[09:31](#msg58f72e5d8e4b63533de1f334)@ldci Super et bravo pour ces exemples didactiques !

ldci

[11:40](#msg58f74c9b08c00c092a95a6a3)@dicde

[11:45](#msg58f74dd3881b89e10165a6eb)Merci pour les commentaires. Tu es le bienvenu si tu veux contribuer sur ce blog. En fait, les exemples que je donne sont des réponses aux étudiants SHS que j'essaye d'initier aux plaisirs du traitement d'image. Je profite de quelques jours de répit pour mettre à jour. Pour l'instant des exemples en pur Red, mais je vais monter en puissance avec RedCV, OpenCV et Pandore. En tout état de cause, Red est un langage fabuleux pour l'apprentissage de la programmation: merci à Nénad et à sa team pour tous les efforts déployés:)

sylvievathoux

[14:00](#msg58f76d73a0e48562421c4689)Je cherche à refléter les changements dans l'ordre des widgets dans un face/pane, donc leur ordre de superposition à l'écran. Je peux faire passer un widget au premier plan ou à l'arrière-plan mais entre ces 2 positions extrèmes, pas moyen (même si un dump-face me montre que ces changements sont bien pris en compte). Je mettrais bien un bout de code ici mais je n'ai pas trouvé comment formater mon texte sur ce blog...

ldci

[15:07](#msg58f77d2a8bb56c2d11c1e1e2)@sylvievathoux utilise switch to compose code (en bas à droite). Ce sera mieux avec tu code :smile:

sylvievathoux

[15:31](#msg58f782bebdf4acc11274d113)Ok !  
Voilà le code en question...  
C'est juste pour illustrer le propos, y'a rien d'optimisé !

```
win: layout [
	across
	b1: base "Loose" green 100x100 loose
	b2: base "Put back" red 100x100 [remove find win/pane b1 insert win/pane b1 b1/offset: b2/offset - 110x0]
	b3: base "On top" blue 100x100 [remove find win/pane b1 insert tail win/pane b1] 
	b4: base "Deeper" olive 100x100 [idx: idx - 1 remove find win/pane b1 insert at win/pane idx b1]
	b5: base "Dump" water 100x100 [print idx dump-face win] 
	return
	at 120x120 	b6: base orange 200x200
	at 150x150 	b7: base aqua 200x200
	at 180x180 	b8: base gold 200x200
] idx: length? win/pane view win
```

dockimbel

[15:49](#msg58f78711d32c6f2f091ebeb4)@sylvievathoux Plutôt que de faire des remove/insert, tu peux utiliser `move` pour çà. Sinon, effectivement, y'a quelquechose qui cloche avec l'ordre...

[15:59](#msg58f7895a8bb56c2d11c22396)Voici une version qui marche mieux:

```
win: layout [
    across
    b1: base "Loose" green 100x100 loose
    b2: base "Put back" red 100x100 [move find win/pane b1 win/pane b1/offset: b2/offset - 110x0 show win]
    b3: base "On top" blue 100x100 [move find win/pane b1 tail win/pane] 
    b4: base "Deeper" olive 100x100 [idx: idx - 1 remove find win/pane b1 insert at win/pane idx b1]
    b5: base "Dump" water 100x100 [print idx dump-face win] 
    return
    at 120x120     b6: base orange 200x200
    at 150x150     b7: base aqua 200x200
    at 180x180     b8: base gold 200x200
] idx: length? win/pane view win
```

[16:01](#msg58f789de8fcce56b2018c59e)Lorsque tu utilises `remove`, la face est détachée de l'arbre et les ressources systèmes correspondantes sont libérés, l'objet graphique est détruit, puis reconstruit lors de l'`insert`. Avec `move`, seule la position dans la liste est changée, l'objet graphique, lui, reste inchangé.

[16:03](#msg58f78a34a0e48562421ce46e)Néanmoins, ton code est correct et devrait fonctionner, il semble que la position en profondeur n'est pas recalculée lors de l'`insert` et la fenêtre n'est pas rafraichie. Je vais ouvrir un ticket à ce sujet.

sylvievathoux

[16:11](#msg58f78c42d32c6f2f091edacf)@dockimbel Merci Doc ! Je ne connaissais pas move. Mais visiblement ça ne suffit pas.  
J'aurai servi à qq chose ;-)

dockimbel

[16:13](#msg58f78caea0e48562421cefae)`move` est une nouvelle fonction (de type `action!`) introduite dans Red (non présent dans Rebol). `help move` pour plus d'info.

[16:27](#msg58f78fd9ad849bcf429d0e32)@sylvievathoux Problème corrigé, ticket fermé, tu peux télécharger la nouvelle version, ton code initial fonctionne maintenant correctement (je te conseille tout de même d'utiliser `move` qui est beaucou plus efficace pour bouger les faces dans un même `pane` ou entre deux `pane`.). ;-)

sylvievathoux

[16:52](#msg58f795d2881b89e101670039)@dockimbel Ça marche ! Magnifique...  
`move` n'est pas super intuitif, mais je vais m'y faire ! Je continue mes investigations, ça fait qq jours que je furète en adaptant des vieux scripts rebol2, et je suis conquis. Vivement le type image approfondi, mais je vais rester patient :-)

[17:41](#msg58f7a166f22385553d58092b)@dockimbel Souci avec la dernière version : le script suivant produit des effets curieux, alors qu'il marchait nickel avec la version précédente...

```
col: coal
text-col: orange
win: layout [
	size 400x400 pad 30x30
	style btn: base col font-color text-col font-size 20
	b1: btn "btn1" b2: btn "btn2" b3: btn "btn3"
]
b1/actors: b2/actors: b3/actors: context [
	size: 100x50
	on-over: function [f e] [
		f/color: pick reduce [col (col - 50)] e/away?
		f/font/color: pick reduce [text-col (text-col + 80)] e/away?
	]
	on-down: function [f e][f/color: col + 50 f/font/color: text-col - 80]
	on-up: function [f e][f/color: col - 50 f/font/color: text-col + 80]
] view win
```

[17:42](#msg58f7a196cfec91927255920c)PS : c'est peut-être pas le meilleur endroit pour poster du code ??

[17:45](#msg58f7a2208e4b63533de41f13)Les btns réagissent simultanément à l'évènement over sur l'un d'eux, comme si c'était une seule et même face !

[17:46](#msg58f7a28acfec9192725598d3)Le size: 100x50 n'est pas au bon endroit, c'est une étourderie mais ça marche qd même...

## Thursday 20th April, 2017

dockimbel

[02:02](#msg58f816b8bdf4acc112775fd6)@sylvievathoux Les objets `font` sont partagés par défaut lorsqu'un style es dérivé (`btn` dans ton code). Donc les trois boutons utilisant le même object `font`, les changements appliqués à cet objet se répercute sur toutes les autres faces l'utilisant. Un moyen simple pour forcer le clonage de l'objet `font` est de redéfinir une des propriétés pour chaque face utilisant le style `btn`, par exemple:

```
b1: btn "btn1" font-size 20
    b2: btn "btn2" font-size 20
    b3: btn "btn3" font-size 20
```

[02:05](#msg58f81782d32c6f2f09211e98)Rebol2/VID avait le même comportement et il fallait utiliser un `with [font: make font! []]` pour forcer le clonage de l'objet. Je pense qu'on pourrait intégrer un nouveau mot-clé pour forcer ce clonage plus proprement. Le partage par défaut est utile pour économiser les ressources, car les instances d'un style ne changent pas les propriétés de `font` en général, mais aussi pour automatiquement propager les changements à toutes les instances, quand c'est nécessaire.

sylvievathoux

[07:23](#msg58f861ef3e27cac331a6de05)@dockimbel Effectivement, en redéfinissant l'objet font pour chaque face ça marche, j'aurais dû y penser... Merci !

dockimbel

[07:24](#msg58f86219cfec919272587305)J'ai modifié le dialect VID pour améliorer çà, je le mettrai en ligne ce soir.

DideC

[08:04](#msg58f86ba1ad849bcf42a07bc4)`move` est cool !

sylvievathoux

[10:54](#msg58f89382881b89e1016af84c)

```
>> c: [1 "début" 2 "milieu" 3 "fin"]  ; == [1 "début" 2 "milieu" 3 "fin"]
>> b: [a b c d e f g h i j k] ; == [a b c d e f g h i j k]
>> move/part next find c 1 head b 1 ; == [2 "milieu" 3 "fin"]
>> move/part next find c 2 at b ((length? b) / 2) 1 ; == [3 "fin"]
>> move/part next find c 3 tail b 1 ; == []
>> c ; == [1 2 3]
>> b ; == ["début" a b c d "milieu" e f g h i j k "fin"]
```

Effectivement, `move` c'est très cool !

dockimbel

[12:49](#msg58f8ae6c3e27cac331a82e2a)

```
lisp
rotate: func [s [series!] /left][either left [move s tail s][move back tail s s] s]

>> s: "123456"
== "123456"
>> rotate s
== "612345"
>> rotate s
== "561234"

>> s: [a b c]
== [a b c]
>> rotate/left s
== [b c a]
>> rotate/left s
== [c a b]
>> rotate/left s
== [a b c]
```

DideC

[12:56](#msg58f8b0163e27cac331a835b4)C'est exactement ce que j'avais essayé ;-)

## Friday 21st April, 2017

dockimbel

[06:44](#msg58f9aa3212d240993583b631)@sylvievathoux Il est maintenant possible de faire:

```
style btn: base col font-color text-col font-size 20 init [face/font: make face/font []]
```

[06:44](#msg58f9aa56c1d3b50154067615)Mais je dois encore ajouter un mot-clé à VID pour simplifier ce besoin et eviter ce genre de code verbeux.

DideC

[07:38](#msg58f9b70cad849bcf42a6003d)Un mot clé `own-font` pour forcer le clonage, mais ça reste "verbeux" pour le reste.  
Ou un sous dialecte `base "avec ma police à moi" font ["Arial" 20 blue bold italic]` ?  
On peut imaginer cela aussi pour `para` puis `edge` plus tard.

dockimbel

[10:16](#msg58f9dbf9d32c6f2f09286ded)Je penser choisir le mot clé `clone` qui pourra être utilisé de différent manière:

```
style btn clone font [color: text-col size: 20]
style btn font-color text-col font-size 20 clone font
style btn font-color text-col font-size 20 clone [font para]
style btn font [color: text-col size: 20] clone [font para]
```

sylvievathoux

[11:43](#msg58f9f05d8e4b63533dedab7b)Et `new` ?  
Sinon, je ne trouve pas de docs sur crop, et je n'arrive pas à retrouver la discussion sur red english... Idem pour clip, j'ai des comportements bizarres, je ne dois pas avoir tout compris !

ldci

[15:05](#msg58fa1fa3f22385553d627a50)@dockimbel : un petit problème la version du 21 avril plante: Compiling Red console... -&gt; Bus Error: 10. Sur macOS bien sûr. Une idée?

dockimbel

[15:25](#msg58fa246712d240993585cecd)Oui, le merge de la branche struct-by-value cause des problèmes, ça devrait être réglé demain.

[15:27](#msg58fa24d08e4b63533deeab11)@sylvievathoux Un verbe est préférable, car le mot-clé attend un argument sur lequel il va agir.

sylvievathoux

[17:16](#msg58fa3e8b881b89e1017229d2)Ok chef ;-)

## Saturday 22nd April, 2017

sylvievathoux

[20:31](#msg58fbbd87c1d3b501540e62aa)@dockimbel Dans le code discuté précédemment (ordre des widgets dans un face/pane), j'ai rajouté un channel alpha pour b6, b7, b8, et là ça ne marche plus : les changements d'ordre des layers ne sont plus reflétés même s'ils sont toujours visibles dans face/pane.

## Sunday 23th April, 2017

dockimbel

[05:44](#msg58fc3f4acfec919272671784)@sylvievathoux Quel OS?

## Monday 24th April, 2017

sylvievathoux

[13:57](#msg58fe0434c1d3b50154161112)@dockimbel Désolé, parti en WE...  
Sur win7 32 mais aussi sur win 10 64 (pentium et i5), idem pour on-wheel sur win7 32 et win10 64 pentium (i5 ok)...

dockimbel

[14:28](#msg58fe0b9b881b89e1017ef52d)@sylvievathoux Sur Windows XP et 7, lorsqu'on utilise la transparence, Windows ne peut pas correctement gérer la superposition avec des faces non-transparentes. Par contre, entre face transparentes, l'ordre devrait être respecté. Sur Win10, ça devrait marcher correctement... Peux-tu me montrer le code que tu utilises?

sylvievathoux

[16:11](#msg58fe23c2cfec9192726ddb98)C'est toujours le même script, avec un rajout de couche alpha :

```
win: layout [
	across
	b1: base "Loose" green 100x100 loose
	b2: base "Put back" red 100x100 [move find win/pane b1 win/pane b1/offset: b2/offset - 110x0]
    b3: base "On top" blue 100x100 [move find win/pane b1 tail win/pane idx: length? win/pane]
	b4: base "Deeper" olive 100x100 [idx: idx - 1 remove find win/pane b1 insert at win/pane idx b1]
	b5: base "Dump" water 100x100 [dump-face win] 
	return
	at 10x120
	b6: base 255.255.0.100 200x200
	at 190x150
	b7: base 80.120.255.100 200x200
	at 370x180
	b8: base 80.150.0.100 200x200
] idx: length? win/pane view win
```

Pas eu le temps de tester sur d'autres versions...  
pour on-wheel, c'est ton script view-test.red, qui ne marche que sur mon pc le plus récent (j'ai testé d'autres scripts avec on-wheel, pas de pb sur l'i5 64b).

[16:28](#msg58fe279dd32c6f2f09376560)En fait c'est le déplacement d'une face opaque entre des faces transparentes.

[18:29](#msg58fe43f08e4b63533dfd1cce)Testé sur dell venue win10, ça marche nickel, toutes les combinaisons possibles ! Je vais refaire un round de tests sur les autres pc...

iarwain

[21:43](#msg58fe7167587a245e24449ccd)Petite question en passant : est-ce que `check` supporte le wrapping pour le texte associé ? Si oui, je n'arrive pas à le faire fonctionner et je dois probablement m'emmêler les pinceaux quelque part.

## Tuesday 25th April, 2017

dockimbel

[04:50](#msg58fed57f881b89e10181f681)@iarwain Pas sûr, je me souviens pas avoir testé cette option, mais il serait utile de pouvoir controler le wrapping via `para/wrap?` pour ce genre de texte (si ça n'est pas le cas déjà).

[04:54](#msg58fed668587a245e2445ecaf)@sylvievathoux  
&gt; En fait c'est le déplacement d'une face opaque entre des faces transparentes.

Windows XP/7 ne supportent pas cette fonctionnalité (on utilise des classes `window` pour chaque `face`). On a quelques idées pour contourner cette limitation, mais pas à court terme.

## Wednesday 26th April, 2017

ldci

[12:42](#msg590095cbc1d3b5015421131d)@dockimbel : avez-vous procédé à un changement interne pour le type vector! de la version 0.6.1 à la version 0.6.2? J'ai des fonctions pour RedCV qui ne fonctionnent plus correctement comme celle-ci  
`_rcvImage2Mat: routine [ src [image!] mat [vector!] /local pix1 [int-ptr!] dvalue [byte-ptr!] handle1 unit s h w x y r g b a gray int [red-integer!] ] [ handle1: 0 pix1: image/acquire-buffer src :handle1 w: IMAGE_WIDTH(src/size) h: IMAGE_HEIGHT(src/size) x: 0 y: 0 int: as red-integer! 0 dvalue: vector/rs-head mat ; a byte ptr s: GET_BUFFER(mat) unit: GET_UNIT(s) ;vector/rs-clear mat while [y < h] [ while [x < w][ a: pix1/value >>> 24 r: pix1/value and FF0000h >> 16 g: pix1/value and FF00h >> 8 b: pix1/value and FFh ;OK RGBA are correct gray: (r + g + b) / 3 ; -> to Grayscale mat _setMatValue as integer! dvalue unit gray int/value: gray x: x + 1 pix1: pix1 + 1 dValue: dValue + unit ] x: 0 y: y + 1 ] image/release-buffer src handle1 no ]`

[12:53](#msg59009852587a245e244dabc6)

```
var= formatted

_rcvImage2Mat: routine [

	src		[image!]
	mat		[vector!]
	/local
	pix1 	[int-ptr!]
	dvalue 	[byte-ptr!]
	handle1
	unit s
	h w x y 
	r g b a gray
	int  [red-integer!]	
] [
	handle1: 0
    pix1: image/acquire-buffer src :handle1
    w: IMAGE_WIDTH(src/size) 
    h: IMAGE_HEIGHT(src/size) 
    x: 0
    y: 0 
    int: as red-integer! 0
    dvalue: vector/rs-head mat	; a byte ptr
    s: GET_BUFFER(mat)
	unit: GET_UNIT(s)
    ;vector/rs-clear mat 
    while [y < h] [
       while [x < w][
			a: pix1/value >>> 24
       		r: pix1/value and FF0000h >> 16 
        	g: pix1/value and FF00h >> 8 
        	b: pix1/value and FFh 
        	;OK RGBA are correct
        	gray: (r + g + b) / 3 
        	; -> to Grayscale mat
        	_setMatValue as integer! dvalue unit gray
        	int/value: gray
           	x: x + 1
           	pix1: pix1 + 1
           	dValue: dValue + unit
       ]
       x: 0
       y: y + 1
    ]
    image/release-buffer src handle1 no
]
```

C'est mieux ainsi :)

dockimbel

[13:01](#msg59009a0dcfec9192727830e7)@ldci On a plus de 1200 commits dans la 0.6.2, donc c'est possible qu'il y ait eu des changements ou correctifs sur `vector!`. Peux-tu me dire quelle erreur tu as ? Vu que tu n'utilises que `vector/rs-head`, il a peu de chances que ça vienne de vector.

[13:12](#msg59009cac8e4b63533d06c086)@ldci Est-ce que tu utilises la 0.6.2 ou bien la dernière version sur master ?

[13:13](#msg59009d036aea30763d441933)Tu peux voir les changements sur le type `vector!` depuis la 0.6.1 jusqu'à présent:  
https://github.com/red/red/compare/v0.6.1...master#diff-4c66d0b49f1a9a2ec465aa59b828b7b4

[13:15](#msg59009d838bb56c2d11e4ed7b)Clique sur l'onglet "Files changed", puis descends jusqu'au fichier "runtime/datatypes/vector.reds", puis clique sur "Load diff" pour voir tous les changements.

ldci

[15:07](#msg5900b7c312d24099359e8541)@dockimbel : dernière version master pour macOS et 0.6.2 stable pour windows. Je regarde ASAP

## Saturday 29th April, 2017

sylvievathoux

[13:00](#msg59048e88881b89e101998a64)J'essaie de reproduire certains scripts r2 et leurs fonctionnalités. Mais jusqu'à maintenant, ce qui touche aux images dans les GUI doit se faire (plus ou moins bien) en grande partie au travers de Draw, donc, avant de me lancer dans des trucs compliqués (ou impossibles en l'état), voilà ma question : est-il prévu d'implémenter dans les prochaines versions un jeu d'Effects équivalents à ceux de r2 directement dans les faces (ou d'en pourvoir spécifiquement le type image) ?

dockimbel

[13:31](#msg5904959b12d2409935adb93e)Oui, c'est prévu, je ne peux pas te dire dans quelle version précisément, sans doute la 0.6.4.

## Sunday 30th April, 2017

sylvievathoux

[17:46](#msg59062301587a245e2462fd9c)@dockimbel Ok super !

ldci

[18:41](#msg59062fed881b89e1019eb629)@dockimbel j'ai avancé sur le problème des vectors avec cette fonction

[18:41](#msg59062ff6881b89e1019eb62f)

```
_setIntValue: routine [
	p		[integer!] ; address of mat element as integer
	unit	[integer!] ; size of integer 8 16 32 [1 2 4]
	value	[integer!]
	/local 
	p4
] [
	 p4: as int-ptr! p
     p4/value: switch unit [
			1 [value and FFh or (p4/value and FFFFFF00h)]
			2 [value and FFFFh or (p4/value and FFFF0000h)]
			4 [value]
	]
]

_setIntValue as integer! dvalue unit 127 ; correct
_setIntValue as integer! dvalue unit (r + g + b) / 3; incorrect
```

[18:48](#msg590631658e4b63533d1bfa9c)le problème est quand je passe une variable calculée comme ici un entier qui correspond à la valeur de gris (r + g + b ) / 3. Un probe mat me renvoie des valeurs négatives et positives! Cette routine marchait très bien avec la version 0.6.1  
Si maintenant j'essaye de remplacer cette routine par un appel direct du type vector/set-value j'obtiens une belle erreur de segmentation. J'avoue que je ne comprends pas où est l'erreur.

## Monday 1st May, 2017

dockimbel

[08:22](#msg5906f04dd32c6f2f09589167)@ldci Merci, on regarde çà... Je ne comprends pas les `as integer!`?? C'est du Red/System on dirait, mais c'est en dehors d'une routine, donc, ça devrait être du Red... Pourrais-tu stp me donner un exemple complet (mais minimal) qui soit compilable ?

ldci

[11:25](#msg59071b408bb56c2d11fd321d)@dockimbel Tu as tout à fait raison. C'est du code Red/System. La routine \_setInValue est appelée dans une autre routine

```
; Red Image -> 1 channel 2-D matrice with a grayscale 
; conversion to 8 16 or 32-bit matrices 

_rcvImage2Mat: routine [
	src		[image!]
	mat		[vector!]
	/local
	pix1 	[int-ptr!]
	dvalue 	[byte-ptr!]
	handle1
	unit s
	h w x y 
	r g b a grv
] [
	handle1: 0
    pix1: image/acquire-buffer src :handle1
    w: IMAGE_WIDTH(src/size) 
    h: IMAGE_HEIGHT(src/size) 
    x: 0
    y: 0 
    dvalue: vector/rs-head mat	; a byte ptr
    s: GET_BUFFER(mat)
	unit: GET_UNIT(s)
    ;vector/rs-clear mat 
    while [y < h] [
       while [x < w][
			a: pix1/value >>> 24
       		r: pix1/value and FF0000h >> 16 
        	g: pix1/value and FF00h >> 8 
        	b: pix1/value and FFh 
        	;OK RGBA are correct
        	; -> to Grayscale mat
        	grv: r + g + b / 3 
        	_setIntValue as integer! dvalue unit grv
           	x: x + 1
           	pix1: pix1 + 1
           	dValue: dValue + unit
       ]
       x: 0
       y: y + 1
    ]
    image/release-buffer src handle1 no
]
```

[11:28](#msg59071bd68bb56c2d11fd3488)Plusieurs solutions sont possibles pour remplacer , mais donnent toutes le même résultat quand on récupère la matrice  
On peut par exemple directement affecter la valeur au pointeur dvalue par

```
dvalue/value: as byte! grv
```

[11:33](#msg59071d006aea30763d5c3c96)Mais dans ce cas on se limite aux entiers entre 0 et 255.  
J'ai également essayé de mettre directement le code de \_setIntValue dans la routine \_rcvImage2Mat

```
p4: as int-ptr! dvalue
p4/value: switch unit [
		1 [grv and FFh or (p4/value and FFFFFF00h)]
		2 [grv and FFFFh or (p4/value and FFFF0000h)]
		4 [grc]
	]
```

[11:36](#msg59071dc28fcce56b2052fbf3)la dernière solution qui serait la plus élégante est d'appeler une des méthodes de vector avec vector/set-value dvalue as red-value! grv unit, mais dans ce cas on plante le code par une erreur de pointeur.  
A plus

sylvievathoux

[21:38](#msg5907aad7c1d3b501543c0c6c)@ldci Je suis impressionné et très intéressé par ta lib redCV, malheureusement je n'arrive pas à lancer les samples. J'obtiens divers messages d'erreur, celui qui revient le plus fréquemment est le suivant :

```
>> do %convolution.red
*** Access Error: invalid UTF-8 encoding: #{8E6E6164}
*** Where: read
```

J'ai beau gratter, je ne trouve pas de solution. J'ai testé sur win10 et win7 avec la build du 21/04.

[22:00](#msg5907afe1881b89e101a41df9)@ldci Bon, je suis un peu nul, je n'avais pas compilé... Par contre, à la compil, j'ai çà :

```
*** Compilation Error: invalid path value: OS-image/lock-bitmap
*** in file: %/c/dev/red/redCV-master/libs/core/rcvCoreRoutines.red
*** in function: exec/_rcvGetPixel
*** at line: 332
*** near:     [0
       bmp1:   OS-image/lock-bitmap as integer! src1/node false
       data1:
]
```

Pas cool...

## Tuesday 2nd May, 2017

dockimbel

[01:48](#msg5907e572881b89e101a4d576)@sylvievathoux Les scripts Red contenant du Red/System doivent être compilés en mode release (`-r`) ou bien via une customization de libRedRT (`-u`). Voir l'article sur la release 0.6.2 pour plus d'info.

ldci

[05:37](#msg59081b2f8fcce56b2056d58a)@sylvievathoux : bon Nénad a répondu pour moi. Tu peux aussi utiliser l'option -t Windows. Attention avec la version 0.6.2 quelques problèmes avec les matrices. On travaille dessus avec Nénad

sylvievathoux

[05:43](#msg59081c9808c00c092ad596db)@ldci @dockimbel Ok, merci ! C'est bien -r qui marche, -u me renvoie aux mêmes erreurs. Et -t, c'est quoi ? Je ne trouve pas la doc... En tous cas c'est dément, bravo François !

dockimbel

[06:52](#msg59082cacc1d3b501543dbb2f)@sylvievathoux `red --help` pour afficher l'aide.

ldci

[07:47](#msg590839a5f22385553d974168)@sylvievathoux Merci! essaye red -u -c FileName pour la première compilation . Cela crée la libRedRT. Ensuite juste red -c FileName pour les compilations suivantes ou pour un autre fichier. Ca marche bien sous macOS.  
L'option -t permet une cross-compilation en passant le nom de l'OS en paramètre.  
exemple red -c -t Darwin FileName -&gt; version macOS  
exemple red -c -t Windows FileName -&gt; version Windows 10

sylvievathoux

[09:20](#msg59084f666aea30763d60fb42)@ldci @dockimbel Ok, merci, je connaissais bien -t mais je ne l'avais pas remis dans ce contexte...

[10:10](#msg59085af8881b89e101a68d79)@ldci Autre souci : je suis obligé d'encoder tous les fichiers red en ANSI (et non pas UTF-8) pour pouvoir compiler (win7 win8 et win10)...

dockimbel

[10:35](#msg590860db8e4b63533d23ed58)@sylvievathoux ?? Red n'accepte que de l'UTF-8 en entrée pour les fichiers sources.

sylvievathoux

[10:52](#msg590864e08bb56c2d11022ff0)@dockimbel je ne comprends pas... C'est une manip' que je fais une fois au niveau de l'éditeur (np++) -&gt; convertir en ANSI, sinon j'ai une erreur "invalid raw data", mais par la suite les fichiers s'ouvrent bien en mode UTF-8 dans l'éditeur. Donc il ne change visiblement pas l'encodage mais cette manip m'est nécessaire...

[11:13](#msg590869c05f3e76601ede8917)@dockimbel Autre sujet : y-a-t'il un moyen de capter un cliqué-glissé sur une face sans 'loose ?

dockimbel

[11:16](#msg59086aab881b89e101a6d1b1)@sylvievathoux Regarde dans la \[doc View](https://doc.red-lang.org/en/view.html#\_options\_facet), et chercher les références à "drag" dans la page.

sylvievathoux

[11:28](#msg59086d6508c00c092ad6e6d7)@dockimbel je me suis mal exprimé : je ne souhaite pas déplacer la face, seulement capter le déplacement de la souris dans cette face après le clic (ou alors je n'utilise pas la bonne syntaxe pour drag-on dans VID)...

[14:14](#msg5908942df22385553d98dd4a)@dockimbel Je n'ai pas trouvé de solution, mais j'ai quand même testé 2-3 bricoles avec `loose` faute de mieux, notamment le confinement (fonction `confine` reprise de r2). J'ai des effets de sautillements sitôt que la face "draggée" s'éloigne des limites du conteneur.

```
win: layout [
	size 400x400
	b: base aqua loose 150x150
		on-drag-start [start: event/offset]
		on-drag [face/offset: confine face/offset + event/offset - start face/size 0x0 face/parent/size]
] view win
```

C'est grave Doc ? ;-)

## Wednesday 3th May, 2017

ldci

[11:23](#msg5909bdaeedf919574a7192f9)à tous: mon blog est mis à jour avec une illustration des routines RedCV pour accéder aux contenu d'une image en mémoire. Nénad, tu pourrais faire un lien sur le site de Red dans la partie documentation?

[13:29](#msg5909db3f8bb56c2d11086f9d)@dockimbel . Un problème spécifique à macOS

```
src1  	[image!]
    dst   	[image!]
    alpha 	[integer!]
    /local
	pix1 	[int-ptr!]
    pixD 	[int-ptr!]
    handle1 handleD 
    h w x y r g b a
][
	handle1: 0
    handleD: 0
    pix1: image/acquire-buffer src1 :handle1
    pixD: image/acquire-buffer dst :handleD

    w: IMAGE_WIDTH(src1/size)
    h: IMAGE_HEIGHT(src1/size)
    x: 0
    y: 0
    while [y < h] [
       while [x < w][
       		;a: pix1/value >>> 24
       		a: alpha
       		r: pix1/value and 00FF0000h >> 16 
        	g: pix1/value and FF00h >> 8 
        	b: pix1/value and FFh 
       		pixD/value: (a << 24) OR (r << 16) OR (g << 8) OR b
           	x: x + 1
           	pix1: pix1 + 1
           	pixD: pixD + 1
       ]
       x: 0
       y: y + 1
    ]
    image/release-buffer src1 handle1 no
    image/release-buffer dst handleD yes
]
```

[13:30](#msg5909db82f22385553d9e5506)Cette routine fonctionne parfaitement avec Windows 10 et pas avec macOS. Une idée?

[13:33](#msg5909dc40edf919574a722e16)Oups, désolé pour le coper/coller

## Friday 5th May, 2017

ldci

[11:53](#msg590c679e5c89dc53617ad804)@dockimbel . Encore un pb avec red 0.6.2. La routine suivante fonctionne parfaitement sous macOS mais pas sous windows qui me génère un Runtime Error 1: access violation at 6F04B6B3h. J'avoue que je ne vois pas l'erreur:)

```
_rcvBlend: routine [
    src1  	[image!]
    src2  	[image!]
    dst  	[image!]
    alpha	[float!]
    /local
        pix1 	[int-ptr!]
        pix2 	[int-ptr!]
        pixD 	[int-ptr!]
        handle1 handle2 handleD 
        h w x y
        a1 r1 g1 b1
        a2 r2 g2 b2
        a3 r3 g3 b3
        calpha
][
	handle1: 0
	handle2: 0
    handleD: 0
    pix1: image/acquire-buffer src1 :handle1
    pix2: image/acquire-buffer src2 :handle1
    pixD: image/acquire-buffer dst :handleD
	w: IMAGE_WIDTH(src1/size)
    h: IMAGE_HEIGHT(src1/size)
    x: 0
    y: 0
    a3: 0
    r3: 0
    g3: 0
    b3: 0
    calpha: 1.0 - alpha
    while [y < h] [
		while [x < w][
				a1: pix1/value >>> 24
       			r1: pix1/value and 00FF0000h >> 16 
        		g1: pix1/value and FF00h >> 8 
        		b1: pix1/value and FFh 
        		a2: pix2/value >>> 24
       			r2: pix2/value and 00FF0000h >> 16 
        		g2: pix2/value and FF00h >> 8 
        		b2: pix2/value and FFh 
        		a3: as integer! (alpha * a1) + (calpha * a2) 
        		r3: as integer! (alpha * r1) + (calpha * r2) 
        		g3: as integer! (alpha * g1) + (calpha * g2)
        		b3: as integer! (alpha * b1) + (calpha * b2)
        		pixD/value: (a3 << 24) OR (r3 << 16 ) OR (g3 << 8) OR b3
				x: x + 1
				pix1: pix1 + 1
				pix2: pix2 + 1
				pixD: pixD + 1
		]
		x: 0
		y: y + 1
	]
	image/release-buffer src1 handle1 no
	image/release-buffer src2 handle1 no
	image/release-buffer dst handleD yes
]
```

## Thursday 11st May, 2017

sylvievathoux

[14:03](#msg59146f188a05641b1170abfb)@ldci Trouvé une solution à ton problème ? On dirait que le Doc a déserté ;-)

@dockimbel Je ne comprends pas le comportement suivant quand je veux accéder aux membres d'une pair!  
1/ ça ne marche pas :

```
view [
	size 300x300
	f: field "Test" react [f/data: form bx/offset/x]
	return 	bx: base 100x100 loose
]
```

2/ Mais ça, ça marche :

```
view [
	size 300x300
	f: field "Test" react [ofst: bx/offset f/data: form ofst/x]
	return 	bx: base 100x100 loose
]
```

Pas grave, mais ça rallonge un peu le code...

## Saturday 13th May, 2017

ldci

[15:20](#msg5917242d2b926f8a674fef00)@sylvievathoux : mise à jour pour RedCV sur github: https://github.com/ldci/redCV

## Sunday 14th May, 2017

dockimbel

[03:43](#msg5917d26f2b926f8a6752434e)@sylvievathoux C'est un bug, a soumettre au bugtracker.

[03:46](#msg5917d2fe631b8e4e61d3231e)@ldci As-tu essayé de compiler en mode debug (`-d`) pour avoir une trace de la pile d'appel ?

[03:48](#msg5917d38a92217cca5873dc01)Sinon, les crashs qui n'apparaissent sur un OS et pas un autre doivent être renseignés sur le bugtracker pour qu'on puisse les traiter.

[03:54](#msg5917d50e0a783b6c0a96c8d8)@sylvievathoux  
&gt; @dockimbel je me suis mal exprimé : je ne souhaite pas déplacer la face, seulement capter le déplacement de la souris dans cette face après le clic (ou alors je n'utilise pas la bonne syntaxe pour drag-on dans VID)...

Ton code reproduit ce que le code View fait déjà en interne pour gérer le drag'n drop, du coup, ça rentre en conflit. Je ne suis pas sûr de comprendre ce que tu veux faire, mais pour capter le déplacement de la sours dans la face, il faut utiliser l'acteur `on-over`.

sylvievathoux

[15:22](#msg59187651f3001cd3421e489b)@dockimbel Merci Doc.  
Ce que je veux faire, c'est capter le cliqué glissé de la souris sans déplacer la face, comme par exemple pour "déplacer" une image dans une face sans déplacement de celle-ci (sans loose donc), autrement dit pouvoir modifier ses coordonnées d'affichage, comme on le ferait avec des sliders, mais avec la souris... et je n'ai pas trouvé avec `on-over`  
Peux-tu m'indiquer le lien pour le bug tracker ?  
@ldci Je vais tester de suite.

[19:21](#msg5918ae4c92217cca5876cd68)@dockimbel D'autre part, il m'est impossible de compiler des scripts qui contiennent des références à des faces qui sont préalablement définies à l'intérieur d'un bloc VID.  
Pour faire court, le script suivant s'exécute parfaitement dans la console mais ne compile pas (compilation error: undefined word...) :

```
center-it: func [in-face [object!] out-face [object!]][
	return out-face/offset + (out-face/size / 2) - (in-face/size / 2)
]
win: layout [cx: base 400x400 bx: base orange 100x100]
bx/offset: center-it bx cx
view win
```

pour compiler je dois passer par la déclaration explicite des faces, par exemple :

```
cx: make face! [type: 'base size: 300x300 offset: 10x10 color: coal]
bx: make face! [type: 'base size: 100x100 offest: 20x20 color: 255.255.0]
bx/offset: cx/offset + (cx/size / 2) - (bx/size / 2)

view win: make face! [type: 'window text: "Center it!" size: 350x350 pane: reduce [cx bx]]
```

...auquel cas je perds l'usage des fonctionnalités pré-définies (ici par exemple `center-it` ), et par conséquent je ne peux pas exploiter la commodité de VID.

Dernière chose, plus embêtante, après compil l'event `on-wheel` a disparu et `on-drag` génère un script error : "stack does not allow event! for its event argument" !

[19:52](#msg5918b59a92217cca5876e9d3)@dockimbel Je crois comprendre qu'à l'exécution dans la console il y a un binding de tous les mots au contexte de celle-ci, ce qui fait que les objets sont bien référencés quelque part, mais ça ne me dit pas comment résoudre mon problème. Sauf à me passer de VID...

## Monday 15th May, 2017

dockimbel

[01:47](#msg591908aed1a7716a0ac7e029)@sylvievathoux L'évènement `over` est décrit \[ici](https://doc.red-lang.org/en/view.html#\_event\_names).

[01:48](#msg5919090700efc2bb3e69d37e)&gt; comme par exemple pour "déplacer" une image dans une face sans déplacement de celle-ci (sans loose donc), autrement dit pouvoir modifier ses coordonnées d'affichage, comme on le ferait avec des sliders, mais avec la souris..

C'est exactement la fonction de l'attribut `loose`...

[01:53](#msg59190a16c4d73f445aa8e455)@sylvievathoux  
&gt; @dockimbel D'autre part, il m'est impossible de compiler des scripts qui contiennent des références à des faces qui sont préalablement définies à l'intérieur d'un bloc VID.

VID étant un dialect de Red, le block de code VID est vu par le compilateur comme un bloc de donnée, donc il ne peut déterminer que `cx` et `bx` y sont définis. Dans ce cas, il suffit simplement de les définir manuellement hors VID:

```
cx: bx: none
center-it: func [in-face [object!] out-face [object!]][
    return out-face/offset + (out-face/size / 2) - (in-face/size / 2)
]
win: layout [cx: base 400x400 bx: base orange 100x100]
bx/offset: center-it bx cx
view win
```

(En passant, `return` n'est pas nécessaire dans ce cas de figure, une fonction renvoit par défaut le résultat de la dernière expression évaluée)

[01:55](#msg59190a9700efc2bb3e69d8fc)Une autre option est de désactiver le "word strict checking" via une option de compilation à placer dans l'entête Red:

```
config: [red-strict-check?: no]
```

[01:57](#msg59190b092b926f8a67567ad2)&gt; .auquel cas je perds l'usage des fonctionnalités pré-définies (ici par exemple center-it )

Je n'ai pas compris... tu peux utiliser la fonction `center-it` exactement de la même manière...

[01:58](#msg59190b599f4f4ab05bc4ccb8)&gt; Dernière chose, plus embêtante, après compil l'event on-wheel a disparu

???  
&gt; et on-drag génère un script error : "stack does not allow event! for its event argument" !

Peux-tu me montrer un example court qui permette de réproduire ce pb ?

[01:59](#msg59190b8fd1a7716a0ac7ea10)Le bugtracker se trouve ici: https://github.com/red/red/issues

sylvievathoux

[05:35](#msg59193e1a83cb5db07330839f)@dockimbel Merci Doc. Mon center-it n'est là que pour illustrer mon propos, c'est un mauvais exemple effectivement... Pour `on-wheel` et `on-drag` , je n'ai rien de court et simple sous la main, mais je posterai ça dans la journée.

[05:42](#msg59193fdf00efc2bb3e6a8255)@dockimbel `loose` déplace la face, ce que je ne veux pas. Je veux "cliquer" sur une image contenue dans une face conteneur (dans le bloc `draw` de celle-ci évidemment) puis la "déplacer" sans déplacer la face conteneur. Donc je dois bien capter ce cliqué glissé autrement que par `loose`.

dockimbel

[06:10](#msg59194665631b8e4e61d80c12)Si l'image est dessinée via Draw, effectivement `loose` n'est pas une option. Je pensais que tu utilisais une face image dans une face conteneur.

[06:11](#msg5919469ef3001cd342212aba)Dans ton cas, tu peux utiliser `on-over`, mais tu dois faire manuellement la gestion du déplacement de l'image en fonction de la position du pointeur de la souris. Ce n'est pas un cas d'utilisation pour le mode `drag-on` qui s'applique aux faces uniquement.

sylvievathoux

[08:02](#msg591960a592217cca58793139)@dockimbel ...le problème de compil semble résolu : pour l'un de mes `actors` , j'avais omis de spécifier le typage des arguments face et event !

```
function [face event][...]
```

au lieu de :

```
function [face [object!] event [event!]][...]
```

J'ai reporté le bug sur les pair! et je vais poster un script décrivant mon problème de click'n'drag...

[12:01](#msg5919989f83cb5db0733213c6)@dockimbel Voilà un bout de code pour illustrer le blocage :

```
win: layout [cx: base 400x400 bx: base orange 100x100 all-over]
bx/actors: object [
	clicked: false
	on-down: function [face [object!] event [event!]][probe clicked: not clicked]
	on-over: function [face [object!] event [event!]][print rejoin [clicked " - " event/offset]]
	on-up: function [face [object!] event [event!]][probe clicked: not clicked]
] view win
```

L'event `on-over` ayant toujours l'antériorité sur `on-down` , la valeur de `clicked` est figée à false pendant tout le survol de bx, même si le click est bien capté. J'imagine bien un clonage de l'object `actors` pour chaque event, ce qui expliquerait l'étanchéité des contextes, mais je ne sais pas comment la contourner.

[12:22](#msg59199d8c631b8e4e61d98b04)@dockimbel J'ai trouvé une rustine avec `unset?` :

```
bx/actors: object [
	clicked: false
	inverse-clicked: func [][do clicked: not clicked]
	on-down: function [face [object!] event [event!]][inverse-clicked]
	on-over: function [face [object!] event [event!]][
		if not unset? clicked [
			print rejoin [clicked " - " event/offset]
		]
	]
	on-up: function [face [object!] event [event!]][inverse-clicked]
] view win
```

Le click est bien capté sur la face dont le flag est à `all-over`, mais c'est pas le top de l'élégance, donc pas trop l'esprit Red :smile:  
Il y a peut-être mieux ?

dockimbel

[12:27](#msg59199ec4631b8e4e61d9907c)@sylvievathoux

```
win: layout [cx: base 400x400 bx: base orange 100x100 all-over]
bx/actors: object [
    clicked: false
    on-down: func [face [object!] event [event!]][probe clicked: not clicked]
    on-over: func [face [object!] event [event!]][print [clicked " - " event/offset]]
    on-up:   func [face [object!] event [event!]][probe clicked: not clicked]
] view win
```

[12:31](#msg59199fbbf3001cd34222a763)Si tu utilises le constructeur `function`, tous les set-words sont capturés comme mots locaux, `clicked:` inclus. Donc soit tu passes en mode manuel avec `func`, soit tu ajoutes un `/extern clicked` dans chaque spec block.

[12:32](#msg59199fe88a05641b11840203)Sinon, le code suivant:  
`print rejoin [clicked " - " event/offset]`  
peut se réduire à :  
`print [clicked "-" event/offset]`

[12:33](#msg5919a00d8a05641b118402de)`print` applique un `reform` implicite sur le bloc.

[12:34](#msg5919a05e00efc2bb3e6c2b63)@sylvievathoux Pour info, j'ai modifié la categorie du type `event!`, de manière à ce qu'il puisse être omis (comme la plupart des autres types) dans la déclaration de l'acteur. ;-)

sylvievathoux

[12:34](#msg5919a06e00efc2bb3e6c2bb6)@dockimbel AArrrrrggggghhhh !!! func/function, les subtilités oubliées... Je suis allé un peu vite, désolé !  
Merci pour la dispo :smile: Je vais intégrer tout ça vite fait et l'apprendre par coeur !

dockimbel

[12:35](#msg5919a0a483cb5db073323abf)@sylvievathoux Il m'arrive aussi de me faire encore avoir par `function`, j'ai passé toutes mes années Rebol avec `func` uniquement. ;-)

sylvievathoux

[12:36](#msg5919a0c9f3001cd34222ac9d)@dockimbel Ben oui, pareil...

ldci

[15:14](#msg5919c5d992217cca587b1222)@dockimbel @sylvievathoux : erreur trouvée dans \_recvblend  
image/release-buffer src2 handle2 no ; et non image/release-buffer src2 handle1 no  
Mea culpa

dockimbel

[16:25](#msg5919d65c631b8e4e61dab496)@ldci Cool !

## Wednesday 17th May, 2017

sylvievathoux

[11:47](#msg591c383c00efc2bb3e77bd6f)@ldci J'ai vu qu'il y avait des limitations à la compile en mode dev, et vu que je n'arrive à compiler tes samples qu'en mode release, je présume ta lib est concernée par cette limitation... Du coup je n'ai pas pris le temps de tout tester (c'est assez long tout de même !) mais le peu que je vois me ravis.  
Je me permets une petite suggestion concernant en particulier le sample `ClipImage` : perso j'ai mis un fond à 255.255.255.240 à `p1` , ça permet de le déplacer en cliquant à l'intérieur du cadre, pas uniquement sur les bords. De plus, concernant son déplacement, ta méthode de confinement ne marche pas chez moi, alors je l'ai remplacée par une de ma composition, qui gère d'ailleurs le déplacement dans l'event `on-drag` de `p1` (et non dans le `react` de `canvas` ) avec l'auto-sync à off. Chez moi, c'est beaucoup plus fluide...  
Je continue mes investigations, belle lib !

[12:13](#msg591c3e659f4f4ab05bd28d6f)@ldci Rectif : le fond translucide est dans le block draw de p1 bien sûr !

ldci

[14:29](#msg591c5e3ac4d73f445ab78229)@sylvievathoux : merci pour la suggestion pour le fond translucide. Je vais mettre à jour :) Il y a quelques problèmes entre les versions windows et macOS de Red. . Sous macOS , après une premier compilation avec -u, red -c compile bien un exécutable Darwin sans recompiler la LibRT. Conséquence la compilation est hyper rapide. Sous Window 10, red -c crée un exécutable de type MS-DOS, ce qui crée des problèmes avec RedCV qui fait appel à du code Red/System. Du coup, tu es obligé d'utiliser red-c -t Windows , ce qui revient à utiliser le mode release et augmente le temps de compilation. Moyennant ce petit pb, tous les exemples de RedCV fonctionnent très bien avec Windows. Peut être que Nénad a une explication. Pour RedCV, je suis preneur de toutes les idées d'amélioration et de développement d'algos. Je finis actuellement des filtres binomiaux assez efficaces.

dockimbel

[14:53](#msg591c63ff8a05641b119050c6)Je pense qu'on pourrait basculer sur la cible `-t Windows` par defaut sur Windows, ou du moins ne pas forcer le mode release pour une cible sur le même OS.

sylvievathoux

[15:07](#msg591c67272b926f8a67653797)J'ai toujours le même message avec -u à savoir :

```
*** Access Error: invalid UTF-8 encoding: #{8E6E6164}
*** Where: read
```

Je n'ai pas trouvé la soluion, du coup je passe direct à -c.  
\-t Windows ne devrait pas changer grand chose pour moi, mais je ne suis pas égoïste ;-)

dockimbel

[15:20](#msg591c6a3733e9ee771cb7eaf0)Je viens de modifier le comportement de `-t` comme décrit plus haut.

[15:21](#msg591c6a7d631b8e4e61e628d5)@sylvievathoux Cette erreur est un problème d'encodage d'un fichier source qui n'est pas en UTF-8, alors qu'il le devrait.

sylvievathoux

[15:28](#msg591c6c0d33e9ee771cb7f592)@dockimbel Je les ai passés en revue un par un... Ou alors c'est npp qui me joue des tours.

## Sunday 21st May, 2017

sylvievathoux

[13:30](#msg5921966005e3326c67f3eb40)@dockimbel J'aurais éventuellement besoin de `switch` dans un gestionnaire d'événements. Malheureusement j'ai un comportement curieux. Ainsi, le code suivant marche :

```
win: layout [ a: base 200x200 b: base 200x200 c: base 200x200]
a/actors: b/actors: c/actors: context [
	on-down: func [face [object!] event] [
		if face = a [print "a"] if face = b [print "b"] if face = c [print "c"]
	]
] view win
```

Alors que le suivant ne marche pas :

```
win: layout [ a: base 200x200 b: base 200x200 c: base 200x200]
a/actors: b/actors: c/actors: context [
	on-down: func [face [object!] event] [
		switch face [a [print "a"] b [print "b"] c [print "c"]]
	]
] view win
```

dockimbel

[14:06](#msg59219ef0fa63ba2f7664f63a)@sylvievathoux `switch` ne réduit pas le block passé en argument, du coup, tu tentes de matcher un object avec des mots.

[14:11](#msg5921a02800efc2bb3e8cc162)Tu peux utiliser un `case` plutôt, et `same?` comme comparateur au lieu de `=` (très couteux pour des objets, alors que `same?` va comparer les références directement).

sylvievathoux

[14:15](#msg5921a11800efc2bb3e8cc453)@dockimbel Testé `case` et `same?` ! Ça marche nickel, merci Doc.

dockimbel

[14:27](#msg5921a3c4eec422e415d4477c):+1:

## Tuesday 23th May, 2017

ldci

[14:41](#msg59244a359f4f4ab05bf22310)@dockimbel : un pb de compilation avec les nouvelles versions red -c fileName pour di code qui appelle Red/System  
Compiling to native code...  
\*\** Compilation Error: invalid path value: OS-image/lock-bitmap  
Je suis obligé de passer par -r,  
Cela fonctionnait bien avant. Bizarre.

[15:09](#msg5924509e0a783b6c0ac8fb19)@dockimbel : résolu avec red clear. Très utile :)

dockimbel

[16:06](#msg59245df4f3001cd3424ee0c0)Si tu utilises Red via la version source, libRedRT n'est pas rafraichie automatiquement et nécessite un `red clear`. Si tu utilises la version binaire, normalement l'utilisation d'une nouvelle version de Red doit automatiquement mettre à jour une précédente version de libRedRT.

Oldes

[17:25](#msg5924709c631b8e4e61060c64)Sa2ww

## Saturday 27th May, 2017

ldci

[16:37](#msg5929ab3d0a783b6c0ade5a60)@dockimbel sur macOS, To-image ne fonctionne plus pour récupérer les images de la caméra

dockimbel

[16:54](#msg5929af535e34568d5e982246)@ldci Hmm, peux-tu stp ouvrir un ticket pour çà ?

ldci

[17:00](#msg5929b0be0ba4d59763e808fb)Je vais tester avantage

## Sunday 28th May, 2017

sylvievathoux

[13:32](#msg592ad162eec422e415f82749)@dockimbel Une idée du délai jusqu'à l'implémentation du datatype date! ?

ldci

[14:51](#msg592ae3d6631b8e4e611f2656)@dockimbel : ticket ouvert pour to-image. Qtxie est déjà dessus. Merci

dockimbel

[14:52](#msg592ae43700efc2bb3eb1f3b4)@sylvievathoux On prévoit de l'implémenter dans la version 0.6.5.

## Monday 29th May, 2017

sylvievathoux

[15:18](#msg592c3bc0fa63ba2f768f9488)@dockimbel Merci. Autre chose: existe-t-il un moyen de forcer l'affichage en mode 'maximize ?

dockimbel

[16:26](#msg592c4bb0631b8e4e61246108)@sylvievathoux Pas encore, mais tu peux récupérer la taille de l'écran, en déduire la taille max et retailler la fenêtre en conséquence avant de l'afficher. Ce n'est pas un vrai mode "maximisé", mais ça peut passer pour. ;-)

[16:27](#msg592c4be22b926f8a67a3fb27)Si tu en as vraiment besoin, il est possible d'ajouter une routine Red/System dans ton code pour envoyer un message à la fenêtre pour la maximiser, mais du coup, tu dois compiler ton script à chaque fois.

sylvievathoux

[17:39](#msg592c5cec631b8e4e6124a7ea)@dockimbel Ok. Pas de besoin urgent. Je passe bien par l'étape de "retaillage", mais effectivement je pensais à une routine. Au stade d'investigation où j'en suis, je peux mettre ça de côté pour plus tard ;-)

ldci

[17:48](#msg592c5ed12b926f8a67a45093)@tous: mise à jour d'OpenCV3-Red (https://github.com/ldci/OpenCV3-red) pour une comptabilité parfaite avec Red 0.6.2.

## Tuesday 30th May, 2017

dockimbel

[02:40](#msg592cdbb8631b8e4e61266479)@ldci Super ! :+1:

ldci

[08:13](#msg592d29b5fa63ba2f76931631)@dockimbel : manifestement encore quelques problèmes avec les images sous masOS  
\`  
\_rcvSetAlpha: routine [  
src \[image!]  
dst \[image!]  
alpha \[integer!]  
/local  
pix1 \[int-ptr!]  
pixD \[int-ptr!]  
handleS handleD  
h w x y  
][  
handleS: 0  
handleD: 0  
pix1: image/acquire-buffer src :handleS  
pixD: image/acquire-buffer dst :handleD  
w: IMAGE\_WIDTH(src/size)  
h: IMAGE\_HEIGHT(src/size)  
x: 0  
y: 0  
while \[y &lt; h] [  
while \[x &lt; w][  
pixD/value: pix1/value and 00FFFFFFh or (alpha &lt;&lt; 24)  
pix1: pix1 + 1  
pixD: pixD + 1  
x: x + 1  
]  
x: 0  
y: y + 1  
]  
image/release-buffer src handleS no  
image/release-buffer dst handleD yes  
]

[08:14](#msg592d29f100efc2bb3eba5f0d)Cette routine gère parfaitement la transparence sous Windows, mais pas sous macOS

dockimbel

[09:09](#msg592d36bff3001cd34271112b)@ldci Pas de problème connu sur Mac de ce coté là. Pourrais-tu m'envoyer un exemple complet qu'on puisse tester ?

ldci

[19:08](#msg592dc3200ba4d59763f6bc4d)Voir sur github le code transparency.red

## Wednesday 31st May, 2017

dockimbel

[06:02](#msg592e5c6cfa63ba2f769848b3)@ldci Je ne trouve pas ce fichier dans https://github.com/ldci/OpenCV3-red

[06:09](#msg592e5e2b0ba4d59763f8ea7f)Ok, trouvé dans redCV.

ldci

[08:26](#msg592e7e37f3001cd342769886)Oups, désolé j'étais en réunion et je n'ai pas précisé que c'était pour RedCV

## Friday 2nd June, 2017

ldci

[10:29](#msg59313e08167d046a7d5f6cd1)@dockimbel : Vector! J'ai trouvé le bug. Depuis la version 0.6.2, si on crée un vector 'Integer 8 , les valeurs supérieures à 127 deviennent négatives! Dans la version 0.6.1 on pouvait utiliser des valeurs entre 0 et 255. A +

dockimbel

[14:13](#msg593172937503e2b7060438d5)@ldci Oui, `integer!` est signé, donc `integer 8/16/32/64` se doivent de l'être également.

ldci

[14:15](#msg5931731d6549436c7d0caf20)OK Doc! si on veut du 8-bit non signé -&gt; Char!

[14:17](#msg5931738a6462d8493cd311e3)BTW, la version master du 2 juin me pose problème pour les images, j'ai du downgrader vers une version précédente (29 may). Des modifs en cours dans l'objet image?

dockimbel

[14:19](#msg593173e1cf9c13503c485c77)@ldci Oui, il y a eu plusieurs correctifs ces derniers jours. Si tu constates des régressions, stp ouvre un ticket ou bien poste un rapport dans red/bugs et met @qtxie en référence.

[14:20](#msg59317425eb257a8725cfefa2)@ldci Est-ce que le `integer 8` est la cause du problème dans le script %transparency.red ?

ldci

[15:58](#msg59318b4031f589c64f6a80f1)Suis en train de modifier pour les matrices

[15:59](#msg59318b606462d8493cd38f5d)Je regarde le reste après

[16:02](#msg59318bffeb257a8725d06d11)La bonne nouvelle c'est que le master humanités numériques ouvre à la rentrée et que je vais utiliser Red 🤗

dockimbel

[16:33](#msg593193647503e2b70604db56)Super! :+1:

PeterWAWood

[21:12](#msg5931d4b46462d8493cd4e61b)Rtyj

[21:12](#msg5931d4d16462d8493cd4e695)I

## Saturday 3th June, 2017

ldci

[10:08](#msg59328a8f31f589c64f6e0a69)@dockimbel: je suis en train de tester les changements de qtxie pour les images comme `bmp: OS-image/lock-bitmap src no`  
2 gros problèmes: la compilation avec l'option -c renvoie des erreurs bizarres du type `*** Compilation Error: undefined symbol: IMAGE_WIDTH`. J'obtiens un exécutable avec -r: les images se chargent correctement, les opérateurs CV ne fonctionnent plus: pas de mise à jour des images traitées quand j'applique les opérateurs ...

[10:09](#msg59328ac0ca6d4ae80cd8e2bf)j'ai envoyé un mail a qtxie :)

dockimbel

[10:24](#msg59328e7431f589c64f6e1835)@ldci Tu as bien fait.

## Sunday 4th June, 2017

ldci

[06:43](#msg5933ac1fca6d4ae80cdc8c8e)@dockimbel la regression pour les images est fixée sous macOS. Reste encore le problème de l'option -c qui génère `*** Compilation Error: invalid path value: OS-image/lock-bitmap` . l'option -r fonctionne bien.

[06:50](#msg5933adaff2dd2dba06693353)@dockimbel Autre problème: les instructions draw ne fonctionnent plus `plot: copy [line-width 2 pen red line 0x0 512x512 pen off pen green line 0x512 512x0 box 10x10 50x50 box 55x55 75X75]`

dockimbel

[10:51](#msg5933e62b02c480e6720e8fc2)@ldci  
&gt; Reste encore le problème de l'option -c

As-tu recompilé libRedRT en mode `-u` pour générer une version qui inclut les dépendences requises par ton code Red/System ?

ldci

[14:54](#msg59341f3cca6d4ae80cde0ee3)@dockimbel Oui, je recrée bien la libRedRT, mais j'obtiens ensuite une belle erreur à l'exécution `*** Runtime Error 1: access violation *** at: 000BB5D4h`. Par ailleurs la libRedRT est créé dans chaque répertoire de code Red. Ne serait-il pas mieux qu'elle soit créée un fois pour toute et placée dans .red?

[15:18](#msg593424d5cf9c13503c51ad23)@dockimbel Encore un problème sur macOS et Windows 10 `*** libRedRT Error: definition not found for red/OS-image/ctx-to-cgimage`

[15:19](#msg593424e631f589c64f735fd8)avec l'option -c

## Monday 5th June, 2017

dockimbel

[04:36](#msg5934dfe9167d046a7d6bd535)@ldci L'option `-u` crée une version de libRedRT spécifique au script passé en argument, elle doit donc être utilisée localement. Si tu veux l'utiliser pour tous les autres scripts, tu peux la copier (ainsi que les autres fichiers libRedRT* qui vont avec) dans le dossier `.red` ou `$HOME/.red`.

[04:37](#msg5934e0076462d8493cdeb45e)Pour les problèmes d'images sur macOS, on travaille dessus aujourd'hui.

ldci

[10:02](#msg59352c4ef2dd2dba066e27c6)@dockimbel merci pour les infos. Je continue les tests

## Wednesday 7th June, 2017

ldci

[09:05](#msg5937c1e56549436c7d241d5a)@dockimbel Suite des tests avec la version du 7 juin. L'option -u fonctionne. L'option -c également, mais à l'exécution du code compilé, on a une erreur `execution: *** Runtime Error 1: access violation *** at: 001DAF92h`. Il faut passer par - r pour avoir un code qui ne génère pas d'erreur. Les routines Red/System fonctionnent correctement maintenant, notamment pour RedCV. En revanche, les instructions Draw renvoient des erreurs `*** Script Error: invalid Draw dialect input at: [256x256 0.5 0.5 256x256 box 0x0 512x512]`. Ce code marchait parfaitement avant.

dockimbel

[09:38](#msg5937c98c02c480e6721e0ba7)@ldci Oui, il semble qu'il y ait un problème avec `-c` et le module View sur macOS. Je regarde çà.

[10:42](#msg5937d87b142826e9729015d4)@ldci Je n'arrive pas à reproduire. J'utilise la dernière version via les sources, j'ai testé avec plusieurs scripts View et je peux compiler et executer sans problème.

[10:42](#msg5937d89f6549436c7d24810d)As-tu nettoyé la version précédente de libRedRT ?

ldci

[10:45](#msg5937d92c7503e2b7061c576c)@dockimbel : OK je vais tester à partir des sources qui sont sur le site Red. A +

dockimbel

[11:56](#msg5937e9e231f589c64f82e72d)@ldci Regarde dans le groupe red/red.

## Saturday 10th June, 2017

ldci

[06:24](#msg593b9092f6a78eab48348b1a)@dockimbel Suite des tests: version 10 juin. L'option -c fonctionne à nouveau pour du code Red standard. Avec RedCV toujours une erreur `*** Compilation Error: undefined symbol: red/OS-image/lock-bitmap in file ....`. Il faut passer par -r pour compiler le code. On avance :)

[06:31](#msg593b92387503e2b7062b69d2)@dockimbel Bon toujours des problèmes: `*** Runtime Error 1: access violation*** at: A0E32FD3h`même après une compilation -r

[06:37](#msg593b93ad7503e2b7062b6e5d)la version du 9 juin ne générait pas de Runtime error:)

dockimbel

[07:45](#msg593ba3a27503e2b7062b9b74)@ldci `red/OS-image/lock-bitmap` ne fait pas partie de l'API libRedRT, du coup, il faut générer une version spéciale de libRedRT via `-u`.

[07:46](#msg593ba3bed83c50560cf4467a)&gt; Bon toujours des problèmes: `*** Runtime Error 1: access violation*** at: A0E32FD3h`même après une compilation -r

Comment le reproduit-on ?

ldci

[09:20](#msg593bb9c3142826e9729f78ff)@dockimbel j'utilise -u -c ce qui régénère bien la libRT, miasi j'obtiens la même erreur à la compile

[09:27](#msg593bbb72e531dbc905cbdb3e)Pour le runtime essayer les exemples de RedCV

dockimbel

[09:29](#msg593bbbe77503e2b7062beaa2)@ldci Qtxie est dessus.

[09:30](#msg593bbc5202c480e6722dd027)Pour les fonctions `OS-image`, si tu me donnes la liste exhaustive des fonctions `OS-image` que tu utilises, je peux les mettre dans les exports libRedRT, je pense que ça servira pour tout ceux qui veulent accéder au buffer image via R/S.

ldci

[12:51](#msg593beb59ca6d4ae80cfd7b19)@dockimbel En fait j'utilise pas mal de fonctions en relation avec red image. Ce qui est bizarre, c'est que jusqu'à la version du 29 mai, cela marchait bien. je vais regarder en détail les fonctions utilisées

[13:03](#msg593bee07f6a78eab4835b523)@dockimbel Bonne nouvelle, les options -u -c fonctionnent mais j'ai toujours un runtime error à l'exécution

[13:15](#msg593bf0d7ca6d4ae80cfd8f0a)@dockimbel Voici la liste  
Macros  
IMAGE\_WIDTH  
IMAGE\_HEIGHT

Functions  
;OS-Image  
OS-image/lock-bitmap  
OS-image/unlock-bitmap

;image!  
image/acquire-buffer  
image/release-buffer

;vector!  
vector/rs-head  
vector/rs-tail  
vector/rs-clear  
vector/get-value-int  
vector/get-value-float

[13:18](#msg593bf1a902c480e6722e841f)@dockimbel : j'ai downgradé vers la version du 9 juin

[13:25](#msg593bf35de531dbc905cc9bba)@dockimbel : la master du 9juin est clean:) Elle marche bien pour tout y compris RedCV :)

dockimbel

[13:34](#msg593bf56ae531dbc905cca29b)@ldci On arrive pas à reproduire le crash, après avoir essayé avec plusieurs scripts. Peux-tu me donner un script qui compile et qui permette de reproduire le crash.

ldci

[13:44](#msg593bf7a7d83c50560cf5560b)@dockimbel . Voici un code simple qui est OK avec le v du 9 juin mais qui plante avec la version du 10 juin

```
Red [
	Title:   "Matrix tests "
	Author:  "Francois Jouen"
	File: 	 %addMatrices.red
	Needs:	 'View
]

#include %../../libs/redcv.red ; for redCV functions

isize: 256x256
bitSize: 32
img1: rcvCreateImage isize
img2: rcvCreateImage isize
img3: rcvCreateImage isize

isFile: false

; loads any supported Red image 
loadImage: does [
	isFile: false
	canvas1/image/rgb: black
	canvas2/image/rgb: black
	canvas3/image/rgb: black
	tmp: request-file
	if not none? tmp [
		img1: rcvLoadImage tmp
		img2: rcvCreateImage img1/size			
		img3: rcvCreateImage img1/size
		mat1: rcvCreateMat 'integer! bitSize img1/size
		mat2: rcvCreateMat 'integer! bitSize img1/size
		mat3: rcvCreateMat 'integer! bitSize img1/size
		canvas1/image: img1
		rcvImage2Mat img1 mat1
		isFile: true
	]
]

; generate random image
generate: does [
	if isFile [
		rcvRandomMat mat2 127
		rcvMat2Image mat2 img2
		canvas2/image: img2
		mat3: rcvAddMat mat1 mat2
		rcvMat2Image mat3 img3
		canvas3/image: img3
	]
]


; Clean App Quit
quitApp: does [
	rcvReleaseImage img1 
	rcvReleaseImage img2
	rcvReleaseImage img3
	if isFile [
		rcvReleaseMat mat1
		rcvReleaseMat mat2
		rcvReleaseMat mat3
	]
	Quit
]



; ***************** Test Program ****************************
view win: layout [
		title "Add Matrices"
		button "Load" [loadImage]
		button "Generate" [generate]
		button "Quit" [quitApp]
		return
		text 100 "Source" 
		pad 156x0 text 100 "Random image"
		pad 156x0 text "Result"
		return
		canvas1: base isize img1
		canvas2: base isize img2
		canvas3: base isize img3
]
```

[13:46](#msg593bf83431f589c64f932934)@dockimbel Autre point, j'ai trouvé pour Draw, c'est l'instruction `transform`qui pose problème. J'ai remplacé par `translate`et `rotate`et tout marche. A plus

dockimbel

[14:46](#msg593c06317503e2b7062cec7a)@ldci Super, merci. On va tester çà.

ldci

[15:49](#msg593c14f7e531dbc905cd121c)@dockimbel . Un meilleur exemple de test, car dans le précédent j'ai modifié des libs qui ne sont pas à jour sur GitHub:)

```
Red [
	Title:   "Random test "
	Author:  "Francois Jouen"
	File: 	 %random.red
	Needs:	 'View
]

; last Red Master required!
#include %../../libs/redcv.red ; for redCV functions
margins: 10x10

; ***************** Test Program ****************************
view win: layout [
		title "Rand Tests"
		button 80 "Uniform"  [canvas/image: rcvRandomImage/uniform 512x512 255.255.255.0]
		button 80 "Random" [canvas/image: rcvRandomImage/alea 512x512 255.255.255.0]
		button 50 "Quit" [quit]
		return
		canvas: base 512x512 black	
]
```

[15:51](#msg593c1567d83c50560cf5c0d3)@dockimbel : un autre point à savoir sur macOS, quand on teste différentes versions de Red et qu'on supprime la libRT, IL FAUT VIDER sa poubelle!

dockimbel

[16:33](#msg593c1f61142826e972a0d6bb)@ldci Tu veux dire par là, que macOS va chercher les libs même dans la corbeille ?

ldci

[16:46](#msg593c226b142826e972a0e16c)Ben maintenant que j'ai tout supprimé la v du 9 juin marche parfaitement même avec -c 👍

[17:15](#msg593c293d6549436c7d353213)@dockimbel je commence à comprendre: dans certains cas le fichier libRedRT-extras.r file n'est pas régénéré et il faut forcer la compilation avec -u -c nom de fichier

[21:37](#msg593c668be531dbc905ce31ed)@dockimbel. Je perds mon latin: dans certain cas, le fichier libRedRT-extras.r contient bien les appels aux fonction dont j'ai besoin comme `red/OS-image/lock-bitmap`et dans d'autres cas non. La seule solution est -r pour compiler correctement le script . Help!

## Sunday 11st June, 2017

dockimbel

[01:25](#msg593c9bf4f6a78eab4837f634)`-u` génère un nouveau fichier de dépendances libRedRT-extras.r. `-c` va remettre ce fichier à zéro.

[01:25](#msg593c9c27cf9c13503c7395a0)Qingtian a essayé les deux scripts que tu as fourni plus haut, aucun des deux ne compile ici...

ldci

[10:20](#msg593d1965ca6d4ae80c014799)@dockimbel : avez vous utilisé la dernière version de RedCV qui inclut les modifications de Qingtian pour OS-Image? Cela devrait marcher. Je mettrai à jour GitHub quand nos problèmes macOS seront résolus. Je vais tester demain les versions Windows.

dockimbel

[11:32](#msg593d2a66f31c8ced0c24c989)@ldci Je crois que tu devrais directement remonter ce genre de problèmes à Qingtian, parce que passer par moi en intermédaire ne facilite pas les choses, étant donné que je n'ai codé ni le type image, ni le backend macOS. ;-)

ldci

[11:34](#msg593d2aadcf9c13503c754f4e)Ok Doc

dockimbel

[11:41](#msg593d2c4ee531dbc905d09520)@ldci Je crois qu'il y a un pb avec le format de ce fichier: https://github.com/ldci/redCV/blob/master/libs/imgproc/rcvImgProc.red

[11:41](#msg593d2c5c31f589c64f96fb75)Ca ressemble à un client Git sous Windows mal configuré ?

[11:42](#msg593d2cc3cf9c13503c75582b)@ldci Dans ce \[fichier](https://github.com/ldci/redCV/blob/master/libs/imgproc/rcvImgProcRoutines.red), pour quelle raison appelles-tu directement `OS-image/lock-bitmap` au lieu de `image/acquire-buffer`?

ldci

[13:07](#msg593d40a27503e2b70630d815)@dockimbel suggestion de qtxie

dockimbel

[13:08](#msg593d40bdcf9c13503c7599c6)Ok, je vais voir avec lui.

## Monday 12nd June, 2017

ldci

[17:49](#msg593ed44131f589c64f9d89c9)@dockimbel Pour macOS, il y a un gros problème avec" load". Le code suivant marche nickel avec windows 10 mais génère un runtime error avec macOS: l'image n'est pas renvoyée.

```
Red [
	Title:   "Load Image Red VID "
	Author:  "Francois Jouen "
	File: 	 %loadImage.red
	Needs:	 'View
]


margins: 10x10
rimg: make image! reduce [512x512 black]

loadImage: does [
	canvas/image: none
	fName/text: ""
	tmp: request-file
	if not none? tmp [
		rimg: load tmp
		fName/text: to string! tmp
		canvas/image: rimg
	]
]

view win: layout [
	title "Load Images"
	origin margins space margins
	button 50  "Load" [loadImage]
	fname: field 380
	button 50  "Quit" [quit]
	return
	canvas: base 512x512 rimg
	return
]
```

[18:08](#msg593ed8b76549436c7d3eedf9)Sinon tout le reste de RedCV fonctionne

[19:26](#msg593eeafa142826e972ab08c5)@dockimbel La bonne nouvelle c'est que -u -c fonctionne bien :)

## Tuesday 13th June, 2017

ldci

[12:46](#msg593fde9c6462d8493c0a6239)@dockimbel Problème corrigé avec la version red-13jun17-fd7889a. Merci :)

[18:35](#msg5940306902c480e6723ebf98)@dockimbel encore quelques problèmes mineurs sous macOS, mais on avance.

## Thursday 22nd June, 2017

ldci

[09:34](#msg594b8f197bf0f2951a2a6b63)Mise à jour de RedCV (https://github.com/ldci/redCV) et du blog (http://redlcv.blogspot.fr) avec de nouveaux opérateurs et de nouveaux exemples.

## Friday 23th June, 2017

ldci

[07:33](#msg594cc451bf7e6af22c649797)@dockimbel : il semble que negate a disparu des fonctions Red/System. Tu confirmes?

## Saturday 24th June, 2017

dockimbel

[07:07](#msg594e0fa6bf7e6af22c69e10b)@ldci Oui, cette macro créait trop de conflit avec des fonctions `negate` definies dans le runtime Red, on a décidé de la supprimer.

[07:07](#msg594e0fc5703e565c333a20e7)@ldci Super la détection de mouvement dans RedCV ! :+1:

[09:22](#msg594e2f64ad9c78184394e403)@ldci Je viens de pousser un commit qui va sans doute casser tes libraries de code Red sur Mac. J'ai renommé `MacOSX` en `macOS` pour la désignation de l'OS, donc il faut que tu mettes à jour ton code si tu utilises des tests sur le nom de l'OS dans les directives du préprocesseur (Red et R/S).

## Sunday 25th June, 2017

ldci

[20:09](#msg5950187ebf7e6af22c7161ec)@dockimbel : j'ai mis à jour pour RedCV et OpenCV: juste 2 lignes à corriger. Ted is great :)

[20:09](#msg5950188b6ae41d5d33836675)I mean Red :)

## Monday 26th June, 2017

dockimbel

[01:39](#msg595065ca703e565c3342e0ae)Cool ! ;-)

## Tuesday 27th June, 2017

sylvievathoux

[08:38](#msg5952196cc101bc4e3a261ad2)@dockimbel Est-il possible de récupérer un fichier d'image (jpg, png...) avec une combinaison des fonctions to-image et save/as à partir d'un layout ? J'ai essayé plein de choses (pas trouvé de doc) mais je n'ai obtenu des crashs de la vm !

dockimbel

[09:39](#msg595227e1c101bc4e3a2660d9)@sylvievathoux Ca ne pose pas de problème :

```
>> save %test.png to-image view/no-wait [text "Hello" button "ok"]
>> view compose [image (load %test.png)]
```

[09:40](#msg595227f976a757f808ade499)Peux-tu me fournir des exemples simples qui provoquent des crashs ?

sylvievathoux

[10:15](#msg5952305a6ae41d5d338c9163)@dockimbel En replaçant view par layout... C'est un peu crétin, je sais, vu que layout ne produit qu'un objet visiblement, et que j'ai pensé à tout sauf à view ! Désolé pour le dérangement :worried:

dockimbel

[10:17](#msg595230d211755ab056291a96)@sylvievathoux Je n'arrive pas à reproduire de crash en utilisant `layout`:

```
>> to-image layout [text "Hello" button "ok"]
== none
>> save/as %i.png to-image layout [text "Hello" button "ok"] 'png
*** Script Error: encode does not allow none! for its img argument
```

[10:18](#msg5952310076a757f808ae12c0)`to-image` ne fonctionne que sur des objets face! affichés à l'écran, donc `layout` seul est effectivement insuffisant.

sylvievathoux

[10:26](#msg595232bfad9c781843a52a8c)@dockimbel Vu le libellé de la fonction, j'ai pensé (obstinément) que to-image se chargeait implicitement du rendering des objets fournis. Le crash se produit sur win7 et win10 chez moi, pas testé sur d'autres plateformes.

[10:28](#msg59523350ceb5bef82eb644ec)@dockimbel Quant au code pour planter la vm, le tien marche bien chez moi !

dockimbel

[10:31](#msg5952340ead9c781843a530d3)`to-image` ne fait que capturer une face, la face doit être affichée (tu peux utiliser des coordonnées negatives ou hors écran pour cacher la fenêtre si nécessaire durant la capture). Il devrait être possible d'automatiser ce processus dans le futur et de permettre un rendu implicite.

sylvievathoux

[12:33](#msg595250a0703e565c334b982a)@dockimbel Ok ! En attendant une lib d'export pdf ;-) on peut toujours contrôler dans la visionneuse :

```
win: [backdrop navy base 400x400 red]

save %test.png to-image view/no-wait/flags/options win [no-title no-border] [offset: -500x-500]
unview win

call/shell rejoin ["rundll32 shimgvw,ImageView_Fullscreen " to-local-file/full %test.png]
```

Tout ça marche très bien. Cool.

## Wednesday 28th June, 2017

sylvievathoux

[09:20](#msg595374d6bf7e6af22c8053d1)@dockimbel Testé les coordonnées négatives sur win10 : pas de rendu ! Donc %test.png n'est qu'un carré noir... Sur win7 et XP ça marche.

dockimbel

[09:21](#msg5953753457a6e9f72e098645)@sylvievathoux Et avec des coordonnées positives, mais hors écran ?

sylvievathoux

[09:24](#msg595375dead9c781843aaff89)@dockimbel Idem, du moment qu'il n'y a pas de rendu écran =&gt; carré noir ! Mais ça marche toujours avec win7 et XP. Pas encore testé sur win8.

ldci

[15:24](#msg5953ca2176a757f808b5874b)@tous. Un challenge pour écrire une fonction convex hull. Celui qui réussit sera crédité du code de la fonction dans RedCV:)

```
def convex_hull(points):
    """Computes the convex hull of a set of 2D points.

    Input: an iterable sequence of (x, y) pairs representing the points.
    Output: a list of vertices of the convex hull in counter-clockwise order,
      starting from the vertex with the lexicographically smallest coordinates.
    Implements Andrew's monotone chain algorithm. O(n log n) complexity.
    """

    # Sort the points lexicographically (tuples are compared lexicographically).
    # Remove duplicates to detect the case we have just one unique point.
    points = sorted(set(points))

    # Boring case: no points or a single point, possibly repeated multiple times.
    if len(points) <= 1:
        return points

    # 2D cross product of OA and OB vectors, i.e. z-component of their 3D cross product.
    # Returns a positive value, if OAB makes a counter-clockwise turn,
    # negative for clockwise turn, and zero if the points are collinear.
    def cross(o, a, b):
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])

    # Build lower hull 
    lower = []
    for p in points:
        while len(lower) >= 2 and cross(lower[-2], lower[-1], p) <= 0:
            lower.pop()
        lower.append(p)

    # Build upper hull
    upper = []
    for p in reversed(points):
        while len(upper) >= 2 and cross(upper[-2], upper[-1], p) <= 0:
            upper.pop()
        upper.append(p)

    # Concatenation of the lower and upper hulls gives the convex hull.
    # Last point of each list is omitted because it is repeated at the beginning of the other list. 
    return lower[:-1] + upper[:-1]


# Example: convex hull of a 10-by-10 grid.
assert convex_hull([(i//10, i%10) for i in range(100)]) == [(0, 0), (9, 0), (9, 9), (0, 9)]
```

Cet exemple est en python, mais fonctionne imparfaitement avec Red.

## Friday 30th June, 2017

ldci

[23:52](#msg5956e44d329651f46e3ec14c)@dockimbel : j'ai résolu le problème de la convexe de Hull avec un algo récursif assez efficace. Ce qui serait super c'est qu'on ait une insertion ou une suppression d'une valeur d'une liste avec un index. En attendant j'ai écrit 2 fonctions qui le font.

```
removeAt: function [b [block!] index [integer!] return: [block!] 
"Removes element at index"
][
	s: copy b
	left: take/part s index
	reverse left
	remove left
	reverse left
	right: s
	append left right
]

insertAt: function [b [block!] index [integer!]  v return: [block!]
"Inserts value at index"
][
	s: copy b
	left: take/part s index
	append left v
	right: s
	append left right
]
```

[23:55](#msg5956e4d44bcd78af5662b79b)@dockimbel : je mettrai à jour RedCV dès que possible :)

## Saturday 1st July, 2017

dockimbel

[02:51](#msg59570e445a1ab55f64427c56)@ldci Je ne comprends pas le but de ces deux fonctions. Qu'est-ce qui ne va pas avec `remove at` et `insert at` ?

[02:52](#msg59570e55703e565c33608fd2)

```
lisp
>> list: [a b c d e f]
== [a b c d e f]
>> remove at list 3
== [d e f]
>> list
== [a b d e f]
>> insert at list 3 'z
== [d e f]
>> list
== [a b z d e f]
```

ldci

[11:41](#msg59578a546ae41d5d33a40786)@dockimbel : bon je devais être fatigué :) remove at et insert at fonctionnement parfaitement!

dockimbel

[12:02](#msg59578f51ad9c781843bcabc6);-)

## Sunday 2nd July, 2017

ldci

[08:25](#msg5958adf54bcd78af56688190)La lib RedCV est mise à jour (https://github.com/ldci/redCV) avec une version rapide pour les convexes

## Sunday 9th July, 2017

ldci

[17:08](#msg596263203230e14f3a3fb55a)@dockimbel . Help is needed. Salut Doc comme tu a s vu sur twitter je suis dans l'implementation d'un algo de détection de contours par snake. Red is bien adapté pour ce type de calcul. Néanmoins, comme cet algo nécessite de traiter plusieurs fois l'image, je dois optimiser avec du code Red/S. J'ai quelques problèmes avec les pair! . Voici un code red qui est ok mais lent.

```
getPoints: does [
	cPoints: copy []
	w: img1/size/x 
	h: img1/size/y
	x: 0 y: 0
	while [y <= w] [
		while [x <= h ] [
			idx: (y * w) + x + 1 
			if (binaryMat/:idx = 1) [ append cPoints as-pair (y) (x)]
			x: x + 1
		]
		x: 0
		y: y + 1
	]
]
```

que je cherche à accélérer en Red/S

```
; gets coordinates from a binary image
_rcvGetPoints: routine [
	bingradient 	[vector!]
	width			[integer!]
	height			[integer!]		
	points			[block!]
	/local
	x y idx x2
	mvalue mpoints
	pair
	v
][
	mvalue: vector/rs-head bingradient	; a byte ptr
	mpoints: block/rs-head points
	block/rs-clear points
	x: 0
    y: 0
    
    while [y < height] [
       while [x < width][
       		idx: mvalue + (y * width) + x + 1 
       		v: idx/value
       		pair: as red-pair! stack/arguments; [x y]
       		pair/x: x pair/y: y
       		;stack/set-last as red-value!
       		if (v = as byte! 1) [copy-cell as red-value! pair ALLOC_TAIL(points)]
       		x: x + 1
       ]
       x: 0
       y: y + 1
    ]
]
```

mais j'obtiens un erreur de type pointer. J'ai besoin de tes lumières :)

## Monday 10th July, 2017

dockimbel

[04:32](#msg59630347bf7e6af22cc0bb8a)@ldci Je vais regarder çà cet après-midi.

[04:33](#msg59630395329651f46e6f732e)@ldci Sinon, j'ai vu passer ton email où tu mentionnes des erreurs de positionnement pour les boutons sur macOS. Je travaille dessus aujourd'hui, si tu as des examples simples à me fournir, qui montrent le problème, je suis preneur.

[04:38](#msg596304c53230e14f3a41cb6a)@ldci Essaie çà:

```
_rcvGetPoints: routine [
    bingradient     [vector!]
    width            [integer!]
    height            [integer!]        
    points            [block!]
    /local
    x y idx x2
    mvalue mpoints
    v
][
    mvalue:  as byte-ptr! vector/rs-head bingradient
    mpoints: block/rs-head points
    block/rs-clear points
    x: 0
    y: 0

    while [y < height] [
       while [x < width][
               idx: mvalue + (y * width) + x + 1 
               v: idx/value
               if (v = as byte! 1) [pair/make-in points x y]
               x: x + 1
       ]
       x: 0
       y: y + 1
    ]
]
```

[04:40](#msg59630521bc46472974d3321e)Par défaut, `/rs-head` renvoit un pointeur de type `red-value!`, il faut donc le convertir.

[05:19](#msg59630e5e4bcd78af5693f9b4)Ah, non, `vector/rs-head` renvoit bien un `byte-ptr!`, donc le casting n'est pas nécessaire.

ldci

[10:35](#msg5963587b89aea4761d82b223)@dockimbel Meci

[10:37](#msg596358d84bcd78af56953c2c)Merci j'avais oublié le datatype pair! Pour les pas macOS c'est u problème d'alignement entre less boutons et les autres widgets comme les text et field

dockimbel

[10:37](#msg596359031c8697534a0bbfa9)@ldci J'aurai besoin d'examples concrets à étudier.

ldci

[10:44](#msg59635a9676a757f808f5f993)OK

```
Red [
	Title:   "Tests "
	Author:  "Francois Jouen"
	File: 	 %gradient.red
	Needs:	 'View
]

margins: 10x10
isize: 512x512

view win: layout [
	title "Snake"
	origin margins space margins
	button "Load image" []
	fsize: field 120 center
	button "Snake" []
	frender: field 120
	button "Quit" [quit]
	return
	text 100 "Flow + Gradient"
	pad 412x0
	text 100 "Snake"
	return
	canvas1: base isize 
	canvas2: base isize
	return
	text "Gradient Threshold"
	sl: slider 320 [
		threshold: to-integer face/data * 100
		fgt/text: form threshold
	]
	fgt: field 40 "0" 
]
```

dockimbel

[10:54](#msg59635cdac101bc4e3a6d9ec7)@ldci Super, merci !

ldci

[17:12](#msg5963b562bc46472974d669c0)@dockimbel génial pour les pairs: rapide et efficace

## Wednesday 12nd July, 2017

ldci

[10:29](#msg5965fa144bcd78af56a0ca21)@dockimbel : un problème avec les vector! quand j'appelle vector/set-value pour un float! -&gt; Compilation Error: type casting from float! to struct! is not allowed. Une suggestion?

dockimbel

[12:11](#msg5966120fbf7e6af22cce2afa)@ldci

```
vector/set-value as red-value! float/push <float>
stack/pop 1
```

[12:14](#msg59661295329651f46e7ccad6)Sinon, tu peux aussi juste stocker la valeur directement dans le buffer (voir le contenu de `vector/set-value`).

ldci

[13:16](#msg5966214af5b3458e303be697)@dockimbel Merci je vais tester dès que possible :)

[14:53](#msg596637cebf7e6af22ccefb1d)@dockimbel Pb résolu

```
_setFloatValue: routine [
	p		[integer!] ; address of mat element as integer
	value	[float!]
	unit	[integer!] ; size of float 32 64  [4 8]
	/local
	f	 [red-float!]
	pf	 [pointer! [float!]]
	pf32 [pointer! [float32!]]
	
][
	f: as red-float! as red-value! value
	either unit = 8 [
					pf: as pointer! [float!] p
					pf/value: f/value
				][
					pf32: as pointer! [float32!] p
					pf32/value: as float32! f/value
	]
]
```

[14:53](#msg596637f23230e14f3a500921)désolé pour la mise en page, j'ai été trop rapide

dockimbel

[16:58](#msg5966552376a757f808036ad6):+1:

ldci

[17:28](#msg59665c3cc101bc4e3a7ad650)@dockimbel Bon en fait cela ne fonctionne pas et j'ai encore une belle erreur de pointeur. Avec les integer ca fonctionne. Bon j'ai vraiment besoin de ces matrices de float!

## Thursday 13th July, 2017

dockimbel

[13:34](#msg596776cff5b3458e3041ff71)@ldci J'ai amélioré la gestion de la position et tailles par défaut des widgets sur macOS, fais-moi savoir si tu rencontres des aberrations.

ldci

[14:19](#msg5967815e4bcd78af56a78833)@dockimbel Parfait pour macOS: plus de décalage vertical pour les widgets :)

[14:23](#msg596782701c8697534a1e615d)@dockimbel : je reviens sur le problème des vectors

```
_setFloatValue: routine [
	p		[integer!] ; address of mat element as integer address
	v		[float!]
	unit	[integer!] ; size of float 32 64  [4 8]
	/local
	f 
	pt
	pt64 	[pointer! [float!]]
	pt32	[pointer! [float32!]]
	
][
	either unit = 8 [
					pt64: as float-ptr! p
					pt64/value: f/value
				][
					pt32: as float32-ptr! p 
					pt32/value: as float32! f/value
	]
]
```

Cette routine fait bien son travail et met à jour le pointeur avec la valeur en float! ou float32  
on peut aussi l'écrire de façon plus concise

```
f: as red-value! float/box v
vector/set-value as byte-ptr! p f unit
```

le problème qu'il me reste est que le tableau de vector n'est pas mis à jour en sortie de la routine qui appelle \_setFloatValue. Je dois passer à côté de quelque chose:)

[14:25](#msg596782ec2723db8d5e09152e)@dockimbel oups j'ai oublié: il faut initailiser f commee f: as float/box v

[14:30](#msg5967841d0de4d2545e23af19)@dockimbel la routine correctement écrite

```
_setFloatValue: routine [
	p		[integer!] ; address of mat element as integer address
	v		[float!]
	unit	[integer!] ; size of float 32 64  [4 8]
	/local
	f 		[red-float!]
	pt64 	[pointer! [float!]]
	pt32	[pointer! [float32!]]
	
][
	f: float/box v
	either unit = 8 [
					pt64: as float-ptr! p
					pt64/value: f/value
				][
					pt32: as float32-ptr! p 
					pt32/value: as float32! f/value
	]
]
```

dockimbel

[15:56](#msg5967983c2723db8d5e098987)@ldci A quoi sert `f: float/box v` ? Tu peux simplement stocker `v` directement.

ldci

[16:06](#msg59679a964bcd78af56a80b39)@dockimbel faire ceci entraine Error: type casting from float! to struct! is not allowed. Avec les intéger pas de pb, mais avec les floats le passage de paramètre se fait par référence il me semble

dockimbel

[16:14](#msg59679c7a329651f46e83cdaa)Normalement, il se fait par valeur aussi pour les floats.

ldci

[16:43](#msg5967a343f5b3458e3042ebe4)OK Doc je continue les tests

[20:49](#msg5967dcecc101bc4e3a817b95)@dockimbel : Cela fonctionne avec le type Float! Je confirme float/box v est obligatoire pour transformer la valeur en red-float! C'est cool, j'ai pu implémenter le calcul de distance de chanfrein nécessaire à la mesure du flux dans une image. Merci Red :)

## Monday 17th July, 2017

rcqls

[15:22](#msg596cd6440de4d2545e378694)Félicitations à la Red Team! @dockimbel Tu veux que j'essaie de me rappeler comment soumettre cette nouvelle version à Homebrew. Elle fait d’autant plus sens maintenant ou tu préfères que quelqu’un autre le fasse?

dockimbel

[16:00](#msg596cdf31f5b3458e30563ea7)@rcqls Merci ! Tu peux soumettre la nouvelle version.

## Tuesday 18th July, 2017

ldci

[05:27](#msg596d9c301c8697534a35284b)@dockimbel Bravo pour la version 0.6.3 :)

rcqls

[06:31](#msg596dab3e3230e14f3a6c9e8f)@dockimbel C’est fait et cela n’a pris que 15 minutes (validation incluse). Le système de mise à jour avec `brew cask` est extrêmement simple. Donc `brew cask install red` installe bien la version 0.6.3 . En revanche, le lien `red-latest` est cassé et `brew cask Install red-latest` ne marche pas bien que non utile maintenant puisque que l’officiel marche parfaitement.

dockimbel

[07:33](#msg596db9ce1c8697534a3599b3)@rcqls Merci ! :+1: Pour le `red-latest`, je confirme son absence, on regarde çà.

rcqls

[08:00](#msg596dc00dbc46472974fe473e)@dockimbel Sans aucune urgence car j’imagine que vous avez besoin de souffler après cet énorme travail, je me demande puisque macOS/View est superbement lancé, si la branche GTK doit être mise à jour pour que la communauté puisse aider à son développement. J’avoue que j’ai essayé plus d’une fois de démarrer. Notamment j’ai essayé de construire le binaire red à partir de la branche GTK sur un linux 32bits et au lancement du binaire la compilation de la 'Red console’ j’ai un `file access error: %gui.reds`. Je suppose que ce n’est pas la bonne façon de procéder ou peut-être que la branche GTK a besoin d’être remis à jour. Mais je répète aucune urgence!

dockimbel

[08:51](#msg596dcbf8bc46472974fe8091)@rcqls Le fichier est dispo maintenant.

[08:51](#msg596dcc261c8697534a35eb17)Mise à jour de la branche GTK: on s'en occupe.

rcqls

[08:53](#msg596dcc7c329651f46e9aaf6b)@dockimbel Super!

dockimbel

[08:53](#msg596dcc923230e14f3a6d26bb)Je pense que la branche GTK est utilisée depuis les sources uniquement, et des dépendances dans le fichier \[%include.r](https://github.com/red/red/blob/master/build/includes.r) sont manquantes. Tu n'as pas besoin du binaire Red, juste de la console, que tu peux compiler directement:

rcqls

[08:56](#msg596dcd271c8697534a35f047)Ok, j’essaierais..

dockimbel

[08:56](#msg596dcd331c8697534a35f058)

```
lisp
rebol -s red.r -r %environment/console/console.red
```

Il faut également ajouter à la main un `Needs: View` dans l'entête de ce fichier pour avoir le module View intégré.

rcqls

[08:56](#msg596dcd58329651f46e9ab33c)Merci! C’est plus clair maintenant!

## Wednesday 19th July, 2017

ldci

[08:23](#msg596f1708bc46472974040a25)@tous : Red/OpenCV3 est mis à jour et compatible avec Red 0.6.3. Le code est ici: https://github.com/ldci/OpenCV3-red

dockimbel

[09:02](#msg596f202f329651f46ea0724b)@ldci Super :+1:

## Friday 21st July, 2017

rcqls

[11:40](#msg5971e8191c8697534a4766b0)@dockimbel j’essaie depuis le début de la semaine de m’imprégner de la branche GTK en essayant de comparer avec les autres backends macos notamment. J’ai l’impression que le backend gtk3 n’est pas fait dans le même esprit que les 2 autres macOS et windows notamment avec le fichier classes.reds (enregistrement des classes et méthodes) manquant. Est-ce fait exprès car pas adapté au backend gtk3 ou doit-on faire une réorganisation avant même de continuer avec pour inconvénient de refaire ce qui fonctionne pour l’instant avec le backend gtk3?

## Saturday 22nd July, 2017

ldci

[08:39](#msg59730f374bcd78af56d4f9e1)@dockimbel : comment reproduire cet effet avec Red. C'est un code Rebol qui me permettait de répéter le pattern et de le déplacer en jouant sur l'offset.

```
; for repeated linear gradient
grad: [
	fill-pen linear '_grad-offset 
	repeat '_grad-start-rng '_grad-stop-rng '_grad-angle '_grad-scale-x '_grad-scale-y 
	'_grad-color-1
	'_grad-color-2
	'_grad-color-3
	box 
]
```

rcqls

[09:28](#msg59731ab8f5b3458e306f9ba1)@dockimbel Oublie juste ma remarque! Après réflexion, je pense que le mécanisme de gtk3 avec son système de fonction est moins adapté à un système de classe. Je continue donc à explorer… Dans l’ensemble, ce n’est pas si simple. Mettre une simple couleur à un label est comme tu me l’avais dit pas plutôt complexe!

dockimbel

[13:06](#msg59734dce2723db8d5e374fc0)@rcqls Tu devrais demander à @qtxie directement, il est l'auteur des backends Mac et GTK. Les widgets sont disponibles sous forme de classes à instancier en objets sur Windows et Mac, via une API dédiées. Sur GTK, je ne me souviens plus de quelle manière les widgets sont créées.

[13:07](#msg59734e2f4bcd78af56d5bec5)@ldci Regarde dans les exemples ici: https://github.com/red/red/blob/master/tests/complexpen-test.red

[13:08](#msg59734e5a3230e14f3a83a6d9)Les gradients avec pattern sont uniquement supportés sous Windows, pas dispo sur Mac (c'est plutôt complexe à implémenter, Windows le fournie via GDI+, mais macOS n'a pas d'équivalent, du coup, je ne sais pas quand ce sera fait). La doc est ici: https://doc.red-lang.org/en/draw.html#\_linear\_gradient\_fill

ldci

[13:14](#msg59734fa6329651f46eb10779)Ok dans mon souvenir c'est ok pour Windows

## Thursday 27th July, 2017

ldci

[10:35](#msg5979c1e189aea4761ddb4489)@dockimbel : quel serait le meilleur équivalent en Red/System de cette instruction java: if (v&lt;0) continue; J'ai essayé avec continue, mais on ne sort pas de la boucle appelante. Merci d'avance :)

dockimbel

[10:57](#msg5979c70945fc670746cfa46c)@ldci `continue` est censé marcher. Peux-tu me donner un exemple simple qui ne fonctionne pas ?

ldci

[13:34](#msg5979ebdf4bcd78af56ee9bad)@dockimbel . Voici les exemples de routine

```
_testAndSet: routine [
	output 		[vector!]
	nx 			[integer!] 
	ny 			[integer!] 
	w 			[integer!] 
	h 			[integer!] 
	newvalue 	[float!]
	/local
	mvalueOUT
	unit
	f
	ptr
][
	mvalueOUT: vector/rs-head output
	unit: _rcvGetMatBitSize output
	f: 0.0
	if any [ nx < 0 nx >= w] [exit]
	if any [ ny < 0 ny >= h] [exit]
	ptr: as integer! mvalueOUT + (((ny * w) + nx) * unit)
	f: _getFloatValue  ptr
	if (( f >= 0.0) and (f < newvalue)) [exit]
	_setFloatValue  ptr  newvalue unit
]



; output is a vector of float!

_rcvChamferCompute: routine [
	output 	[vector!]
	chamfer	[block!]
	w 		[integer!] 
	h 		[integer!] 
	/local
	x y
	v v2
	f
	unit
	idx
	mvalueOUT
	mtailOUT
	mvalueKNL
	n k
	dx dy dt
][

	mvalueOUT: vector/rs-head output
	mtailOUT: vector/rs-tail output
	mvalueKNL: block/rs-head chamfer
	unit: _rcvGetMatBitSize output
	
	; forward OK
	mvalueOUT: vector/rs-head output
	n: (block/rs-length? chamfer) / 3 
	y: 0
	while [y <= (h - 1)] [
		x: 0
		while [x <= (w - 1)] [
			f: _getFloatValue as integer! mvalueOUT 
			;if (f < 0.0) [continue]
			k: 0
			while [k < n][
				idx: mvalueKNL + (k * 3)
				v: as red-integer! idx
				dx: v/value
				idx: idx + 1
				v: as red-integer! idx
				dy: v/value
				idx: idx + 1
				v: as red-integer! idx
				dt: v/value
				f: f + dt
				_testAndSet output x + dx y + dy w h f 
				if (dy <> 0) [_testAndSet output x - dx y + dy w h f] 
				if (dx <> dy) [
					_testAndSet output x + dy y + dx w h f 
					if (dy <> 0) [_testAndSet output x - dy y + dx w h f ]
				]
				k: k + 1
			]	
			mvalueOUT: mvalueOUT + unit
			x: x + 1
		]	
		y: y + 1
	]

	; backward OK
	y: h - 1
	while [y >= 0] [
		x: w - 1 
		while [x >= 0] [
			f: _getFloatValue as integer! mtailOUT 
			;if (f < 0.0) [continue]
			k: 0
			while [k < n][
				idx: mvalueKNL + (k	 * 3)
				v: as red-integer! idx
				dx: v/value
				idx: idx + 1
				v: as red-integer! idx
				dy: v/value
				idx: idx + 1
				v: as red-integer! idx
				dt: v/value
				f: f + dt
				_testAndSet output x - dx y - dy w h f 
				if (dy <> 0) [_testAndSet output x + dx y - dy w h f ]
				if (dx <> dy) [
					_testAndSet output x - dy y - dx w h f 
					if (dy <> 0) [_testAndSet output x + dy y - dx w h f]
				]
				k: k + 1
			]
			
			mtailOUT: mtailOUT - unit
			x: x - 1
		]
		y: y - 1
	]
]
```

dockimbel

[14:20](#msg5979f6c376a757f80850038f)@ldci Donc si tu enlèves le commentaire sur cette ligne:

```
;if (f < 0.0) [continue]
```

la boucle `while` ne termine jamais ?

ldci

[15:51](#msg597a0c041c8697534a65ff64)@dockimbel : exact pour le passage en forward de la matrice

dockimbel

[16:02](#msg597a0ead4bcd78af56ef2ef8)@ldci Es-tu certain que `f` prenne une valeur `>= 0.0` à un moment donné ?

## Saturday 29th July, 2017

ldci

[22:18](#msg597d09bd45fc670746da70de)@dockimbel : oui. Basiquement à chaque fois que testa

[22:19](#msg597d09f3210ac26920390dc0)que testAndSet est appelée pour mettre à jour la distance

## Monday 31st July, 2017

tmpbci

[11:23](#msg597f1334bc464729743dfad4)plop

[12:04](#msg597f1ce4329651f46ed9b88c)suggestion pour install de red sur macos sur le site red-lang : passer par brew ? brew cask install red ?

[12:05](#msg597f1cfb2723db8d5e6026c8)ca cask tout seul

rcqls

[12:16](#msg597f1f9e76a757f8086054fe)@tmpbci voir \[homebrew-red](https://github.com/red/Homebrew-red)

tmpbci

[12:28](#msg597f227976a757f808606094)j'ai bien vu, c'est peut etre le plus simple pour que ce soit download et installé correctement

[12:29](#msg597f22bfa7b406262d46ccb2)vu de red-lang.org ?

rcqls

[12:31](#msg597f233d210ac269203f2dc7)Avec ces commandes tu peux passer de la dernière version `red-latest` (qui change très souvent puisque la Red Team est très active) à la version stable (actuellement la 0.6.3) qui est sur le repo officiel de Homebrew.

tmpbci

[17:57](#msg597f6f7176a757f80861bcf8)bon je vais poser la question quand meme peut etre apres avoir mal cherché : il y a des references vers rebol/networking, les binding zeromq : j'arrive a voir la page, .. bref est-ce que ca marche ? open ?

[17:57](#msg597f6f7ba7b406262d481d44)j'arrive pas a voir la page

[18:07](#msg597f71c576a757f80861c5d6)read http marche

[18:10](#msg597f7283bc464729743f8eff)ma question est comment on ouvre un port pour creer un serveur

[21:39](#msg597fa387614889d47508ab8d)et il y a que append pour concatener des strings ? ca marche que 2 par 2 ?

ldci

[21:54](#msg597fa70e2723db8d5e627367)Tu peux chaîner les append

## Tuesday 1st August, 2017

tmpbci

[09:10](#msg598045872723db8d5e64824e)hum, join, rejoin, et al sont dans le pipeline ?

[09:11](#msg598045a7c101bc4e3adaa2f4)ca marche dans le print, non ?

[10:37](#msg598059e9f5b3458e309e343e)ah rejoin existe

[10:37](#msg598059f72723db8d5e64d94a)juste pas dans les exemples en ligne

ldci

[16:15](#msg5980a92176a757f808667801)@tmpbci Content de te retrouver sur Red/France. Red est encore très jeune et certaines des fonctionnalités de Rebol sont en cours de développement. Mais ça avance à grands pas :)

tmpbci

[16:19](#msg5980aa1b76a757f808667c24)ldci: merci

[16:19](#msg5980aa28bc4647297444482d)content de te voir aussi

[16:21](#msg5980aa9d4bcd78af5604e5a4)il faut vraiment que l'on se voit

[16:22](#msg5980aad3329651f46edf9d85)j'ai fait des trucs qui peuvent interesser ton laboratoire

[16:22](#msg5980aad64bcd78af5604e672)http://sam.neurohack.net/

[16:26](#msg5980aba5bc46472974444e3a)j"espere sincerement que Red va garder une bonne partie du genome de rebol

[16:27](#msg5980ac094bcd78af5604ec96)je vois que ca a bien bien avancé depuis la derniere fois ou je l'ai essaye

[16:29](#msg5980ac6076a757f8086683f2)pour faire mon UI de stimulation pour notre IRM

[16:29](#msg5980ac784bcd78af5604eed0)j'ai plein d'onglets avec plein de pages qui donnent des exemples de red

[16:30](#msg5980acb01c8697534a7bf4ab)et j'essaie avec help les commandes non referencées

[16:30](#msg5980acb4614889d4750c9cc5)sur ces pages

[16:30](#msg5980acbf2723db8d5e664c82)et je cherche dans ces pages de chat

[16:32](#msg5980ad062723db8d5e664d15)je suis partant pour completer les pages red by example par exemple

[16:33](#msg5980ad4776a757f8086687ec)ou quelque part qui fait le tour des fonctionnalités a venir genre OSC

[16:45](#msg5980b03bf5b3458e309fbf5f)et pour passer pour un vieux schnok raleur :) les resultats de l'UI sont bien plus jolis que celle de Rebol, meme s'il manque encore des effets, zut je rale a nouveau :))

## Wednesday 2nd August, 2017

tmpbci

[12:06](#msg5981c042614889d475108dce)et je suis pas sur que ça prenne le chemin de la simplicité. Si j'ai bien compris il y a pas FOR de façon volontaire ?? il y a LOOP et WHILE mais pas FOR... la première chose comme programmeur avec un nouveau langage c'est de comparer a autre chose et la paf si tu veux faire une boucle tu doit faire ton compteur ??? Pareil pour le contenu de View, la simplicité dit que si ton texte est dans un tableau tu fais référence au tableau direct comme dans R2 et pas "oui mais il y a une différence entre le dialect de VID" : fuckit ou sinon ça va finir dans le brainfuck pythonesque.

[12:06](#msg5981c062c101bc4e3ae06185)Un langage de programmation est pour moi un moyen et pas un but et j'ai pas vraiment envie de rajouter des compteurs a LOOP parce qu'on a toujours besoin de FOR a un moment donné, non ?

[12:13](#msg5981c1f4614889d4751093d1)mon test avec que des multiplications par 0, mais beaucoup : Rebol 4m10 Red 3m20 Python 1m15

[12:22](#msg5981c405329651f46ee399bc)je fais semblant de râler mais c'est parce que j'aimerais vraiment que ça reste aussi simple a utiliser que Rebol

dockimbel

[12:53](#msg5981cb3745fc670746ead534)@tmpbci Pour répondre de manière courte et claire:  
\* Red est en v0.6.3, et pas en v1.0. Donc, il est incomplet et toujours considéré en \*alpha\*. Toutes les fonctionnalités prévues ne sont pas encore implémentées. Raler à ce sujet est inutile et contre-productif.  
\* Les espaces mis à disposition par l'équipe Red, que ce soit la mailing-list ou ici sur Gitter, sont des espaces \*modérés\*, avec un \[code de conduite](https://github.com/red/red/blob/master/CODE\_OF\_CONDUCT.md). Merci de prendre le temps de le lire.

tmpbci

[13:11](#msg5981cf8c614889d47510ca4a)Comme il est écrit dans un thread qui cause de la dispersion de la doc, je ne sais pas comment participer, comme j'ai pu écrire plus haut : comment et ou écrire que rejoin existe ?

dockimbel

[17:18](#msg59820949329651f46ee4d9d2)@tmpbci  
1\. Lance la console, tu obtiens un message: `Type HELP for starting information`  
2\. `>> help` =&gt; `what - Show a list of known functions or words`  
3\. `>> what` =&gt; `rejoin function! Reduces and joins a block of values.`

[17:18](#msg59820980c101bc4e3ae1b375)Sinon, plus directement: `>> help rejoin`.

## Thursday 3th August, 2017

ldci

[09:09](#msg5982e8521c8697534a842ebe)@dockimbel : test avec continue. Bon, pour que le test soit effe

[09:12](#msg5982e9054bcd78af560d2906)@dockimbel . Pour que le test if continue soit effectué, il doit ABSOLUMENT être placé après la mise à jour du compteur de la boucle, sinon on rentre dans une boucle infinie.

```
v: random 5
	print ["value " v]
	while [c <= 5 ] [
		print [ "Test " c] 
		c: c + 1 
		if v <= 3 [continue] 
		print ["After : " c ]
	]
```

dockimbel

[09:21](#msg5982eb03329651f46ee7b6ec)@ldci Pourrais-tu stp ouvrir un ticket concernant ce problème avec `continue` pour que je n'oublie pas de m'en occuper ?

tmpbci

[16:22](#msg59834dd476a757f808706fed)je dois vraiment pas etre clair, je sais utiliser help, mais je n'ai pas trouvé rejoin en cherchant dans les docs actuelles. Ma question est donc comment ajouter quelque chose a ces docs si on trouve quelque chose non documenté quelque part ?

jocko-jc

[16:22](#msg59834de1bc464729744e4e69)Voici des tests d'implémentation de text-to-speech pour red, sur plateformes windows et macOS. Cet exercice m'a permis de pratiquer 'call , ainsi que 'parse, sur ces deux plateformes. Je n'ai testé ce code qu'en français, mais il est en principe compatible avec les autres langues : https://github.com/jocko-jc/red-tts

ldci

[22:58](#msg5983aaa22723db8d5e71d1cd)@dockimbel ce n'est pas vraiment un problème et c'est même assez logique.On teste le compteur et ensuite on déclenche l'exception :)

[22:59](#msg5983aabc2723db8d5e71d202)@jocko-jc Super! je vais tester sour macOS.

[23:06](#msg5983ac7145fc670746f2141f)Bravo Jocko: cela fonctionne parfaitement sous macOS!

## Friday 4th August, 2017

dockimbel

[08:53](#msg5984360776a757f80873a446)@ldci Effectivement, `continue` n'est pas fautif dans ce cas là. ;-)

[09:03](#msg5984386c2723db8d5e73a205)@tmpbci  
&gt; Ma question est donc comment ajouter quelque chose a ces docs si on trouve quelque chose non documenté quelque part ?

La doc est ici: http://docs.red-lang.org. Elle est en cours d'écriture et ne couvre pas encore les fonctions dites "mezzanines". La priorité est donnée aux descriptions des types de données. Sinon, il y a un projet de documentation alternatif: http://www.red-by-example.org Tu peux contacter les mainteneurs de ce site, ils sont toujours à la recherche de nouveaux contributeurs (`mikepar` dans le groupe red/red).

[09:04](#msg5984389f329651f46eecab55)@jocko-jc Marche ici aussi sur Win7, mais avec un accent anglais, donc pas utilisable pour du contenu en français.

jocko-jc

[09:34](#msg59843f9c210ac269205264c5)@dockimbel j'ai modifié le code pour windows (liste des voix disponibles, changement de voix). Il est possible que la voix par défaut sur ta machine soit une voix anglaise. Tu peux choisir une voix française:

```
say " -v <Microsoft Hortense Desktop> bonjour à tous"
```

dockimbel

[09:40](#msg59844102c101bc4e3ae9cf5b)@jocko-jc Cette commande freeze la session Red ici.

jocko-jc

[09:51](#msg598443b4f5b3458e30ad312c)@dockimbel avec la dernière version du code ? Ici ça fonctionne avec windows 10

dockimbel

[10:06](#msg5984470ebc4647297451d2dd)@jocko-jc Dernière version, oui.

jocko-jc

[10:08](#msg598447b1bc4647297451d52e)@dockimbel alors j'essaierai de tester sur un win7 quand je pourrai

[10:47](#msg598450a8614889d4751a34be) @dockimbel problème identifié: l'espace devant le -v perturbe le parsing ... Décidément, je ne maîtrise pas encore très bien ce sport !

```
say "-v <Microsoft Hortense Desktop> bonjour à tous"
```

devrait fonctionner ... jusqu'à ce que je corrige mon code

dockimbel

[12:30](#msg598469021c8697534a89ffad)@jocko-jc Works now, though I still have the English voice.

jocko-jc

[13:02](#msg59847079bc46472974527d4f)@dockimbel il n'y a peut-être pas de voix française installée sur ton win7

[14:36](#msg59848678bc4647297452e713)Je crois me souvenir que windows 7 a quelques problèmes pour l'installation des voix françaises: voir par exemple http://www.edencast.fr/windows-x64-voix-fr-invisibles/

dockimbel

[15:11](#msg59848e86210ac2692053bbfd)@jocko-jc Merci. Apparement, c'est cuit pour Win7, j'essayerai sur Win10 demain.

## Wednesday 9th August, 2017

ldci

[09:49](#msg598ada954bcd78af5628c4a9)Bonjour à tous. J'ai intégré le calcul des distances de chamfer dans redCV (https://pbs.twimg.com/media/DGoan63W0AAcU6W.png). Je mettrai à jour le site Github à mon retour de vacances. Bon été à tous :)

## Wednesday 23th August, 2017

dockimbel

[12:40](#msg599d77d0ee5c9a4c5feefffd)@ldci Bravo, RedCV va vraiment devenir un produit phare dans l'ecosystème Red. :clap:

## Thursday 24th August, 2017

ldci

[09:42](#msg599e9f6f614889d475800c97)@dockimbel Merci, on a encore du chemin à faire, mais ça avance. Red est suffisamment mature pour que je puisse l'utiliser dès la rentrée pour un enseignement sur les humanités numériques (https://www.univ-psl.fr/fr/main-menu-pages/4783) . Une belle pub!

dockimbel

[10:13](#msg599ea6c4210ac26920b7d518)@ldci Très bonne nouvelle ! On a un paquet d'évolutions qui vont arriver d'ici la fin d'année, avec entre-autres le support Android. ;-)

solisoft

[10:26](#msg599ea9d0ee5c9a4c5ff43be9)Le support GTK est prévu aussi ?

dockimbel

[10:28](#msg599eaa33578b44a046e24999)@solisoft Jette un oeil dans le group red/gui-branch. ;-) Si tu as de l'expérience dans l'utilisation de l'API GTK, tu peux y contribuer.

solisoft

[10:34](#msg599eabbc614889d475804ac2)malheureusement pas vraiment

## Thursday 31st August, 2017

ldci

[13:51](#msg59a814758f4427b462bad998)@ tous. Bon j'ai amélioré le calcul des distances de chamfer pour Red 0.6.3 (https://twitter.com/fjephe/status/903253069391159296). L'idée maintenant est d'utiliser ces fonctions pour une détection par snake. A suivre ...

sylvievathoux

[17:29](#msg59a8476266c1c7c477000b3c)@dockimbel Sur macOS fill-pen black ou fill-pen 0.0.0 ne donne rien. J'ai cherché un peu (peut-être pas assez...) mais je n'ai rien trouvé sur le sujet. C'est pas primordial, juste pour le report.

## Friday 1st September, 2017

ldci

[08:36](#msg59a91c00162adb6d2e574f0c)@sylvievathoux Selon Nénad, la gestion des gradients n'est pas encore optimale sous macOS.

sylvievathoux

[09:15](#msg59a92541bc46472974e51183)@ldci Ok, merci. Beau boulot redCV !

## Saturday 2nd September, 2017

dockimbel

[12:59](#msg59aaab23c101bc4e3a81ae4f)@sylvievathoux @ldci Je crois que ça mérite un ticket avec un exemple de code.

sylvievathoux

[13:15](#msg59aaaeedbac826f05471dd57)@dockimbel Le truc le plus simple possible :

```
view [base 200x200 draw [fill-pen black box 200x200]]
```

ne marche pas (sur macOS, sur win10 pas de problème). Ce qui suit marche :

```
view [base 200x200 draw [fill-pen 1.1.1 box 200x200]]
```

Oldes

[15:15](#msg59aacb2f162adb6d2e5e1e88)@sylvievathoux ne devrait-il pas être:

```
view [base 200x200 draw [fill-pen black box 0x0 200x200]]
```

sylvievathoux

[21:16](#msg59ab1faa210ac26920eb849d)@Oldes @dockimbel Exact. Mais c'est juste un oubli dans le recopiage. Donc :

```
view [base 200x200 draw [fill-pen black box 0x0 200x200]]
```

ne marche pas sur macOS (pas de couleur dans la box). En revanche, les autres rebol-colors marchent bien.

## Wednesday 6th September, 2017

ldci

[13:37](#msg59affa0e66c1c7c4771f836e)@sylvievathoux : le problème est corrigé avec la dernière version du 6 septembre :)

sylvievathoux

[16:23](#msg59b020f5614889d475c97ac0)Impec !

## Thursday 7th September, 2017

sylvievathoux

[08:38](#msg59b105984e50cfde27127bc7)@dockimbel Chez moi, le type de code suivant pose problème sur win 8.1 (coordonnées composées avec `at` ) :

```
win: [b1: base 200x200 yellow at 100x100 b2: base red 200x200]
append win [at b2/offset + 20x20 b3: base blue 50x50]
view layout win

*** Script Error: VID - invalid syntax at: [+ 20x20 b3:]
*** Where: do
```

Pas vu de pb sur win 10 ni sur OSX.

dockimbel

[12:58](#msg59b14264614889d475ce519d)@sylvievathoux Ce genre d'erreur n'est pas lié à la plateforme. Est-ce que tu utilises exactement la même version sur les autres OS ?

[12:59](#msg59b142b8bc46472974073616)Tu devrais poster ce genre de rapport dans le groups red/bugs, et laisser les autres utilisateurs tenter de reproduire l'erreur. Si c'est confirmé, alors un ticket doit être ouvert.

sylvievathoux

[14:17](#msg59b1550f9acddb240711a7d6)@dockimbel Effectivement, je ne travaillais pas sur ce poste avec la latest, je pensais l'avoir vérifié... désolé pour le dérangement :worried:

## Monday 18th September, 2017

sylvievathoux

[17:32](#msg59c0032d7b7d98d30d0e8527)@dockimbel J'ai un script qui plante à cause d'une fonction qui prise isolément, marche dans la console :

script %modify.red :

```
modify: func [clr [tuple!]][
    set [r g b] reduce [clr/1 clr/2 clr/3]
    return as-color to-integer r * 0.5 to-integer g * 0.2 to-integer b * 1
]
win: layout [  base 400x70 ] view win
```

Le script ne fait rien de particulier, si ce n'est d'appeler 'View.  
Essai console :

```
>> modify: func [clr [tuple!]][set [r g b] reduce [clr/1 clr/2 clr/3] return as-color to-integer r * 0.5 to-integer g * 0.2 to-integer b * 1]
== func [clr [tuple!]][set [r g b] reduce [clr/1 clr/2 clr/3] return as-color to-integer r * 0.5 to-integer g * 0.2 to-integer b * 1]
>> t: 100.90.53
== 100.90.53
>> modify t
== 50.18.53
>> do %modify.red
*** Script Error: modify does not allow object! for its clr argument
*** Where: modify
*** Stack: do-file layout eval-set-path modify
```

Je cale...

## Tuesday 19th September, 2017

dockimbel

[03:57](#msg59c095b97b7d98d30d1124a7)@sylvievathoux Le mot `modify` est utilisé pour une des actions déjà:

```
>> help modify
USAGE:
     MODIFY target field value

DESCRIPTION: 
     Change mode for target aggregate value. 
     MODIFY is an action! value.

ARGUMENTS:
     target       [object! series!] 
     field        [word!] 
     value        [any-type!] 

REFINEMENTS:
     /case        => Perform a case-sensitive lookup.

RETURNS:
     [map! file!]
```

Si tu redéfinis ce mot dans le context global, tu rends l'environement instable.

[03:59](#msg59c09604210ac269204ace82)La protection des mots importants pour le système devrait arriver dans la 0.8.0, avec les modules.

sylvievathoux

[11:36](#msg59c1013acfeed2eb652950e4)@dockimbel Le fait que la fonction marche dans la console m'avait enlevé l'idée de la tester... Merci.

## Sunday 24th September, 2017

ldci

[14:45](#msg59c7c50e210ac2692068591d)@dockimbel Une question : j'ai un block! contenant des pairs comme par exemple snakeData: \[100x100 ...256x100]. Un snakeData/(pos) renvoie sans pb la valeur associée à la position pos. Existe -il un moyen plus rapide (par une routine) pour accéder plus rapidement ) la valeur recherchée? Un appel de ce type as red-pair! (block/rs-abs-at snakeData pos) renvoie TOUT le block. Merci d'avance :)

[14:58](#msg59c7c8037b7d98d30d2f7873)@dockimbel : trouvé: as red-pair! copy-cell as cell! s/offset + pos as cell! snakeData

## Monday 25th September, 2017

dockimbel

[03:29](#msg59c87809bc46472974707126)@ldci `as red-pair! (block/rs-abs-at snakeData pos)` te renvoit un pointeur sur l'élément à l'index `pos` (base 0).

ldci

[07:24](#msg59c8af2f32fc8b7e4038dec7)@dockimbel : j'ai testé ta solution, mais cela me renvoie tout le block  
`getSnakeValue2: routine [ snakeData [block!] pos [integer!] return: [pair!] /local ][ as red-pair! (block/rs-abs-at snakeData pos) ]`  
renvoie tout le block

[07:25](#msg59c8af6a177fb9fe7efc867a)en revanche celle ci

```
getSnakeValue: routine [
	snakeData	[block!]
	pos			[integer!]
	return:		[pair!]
	/local
	s
][
	s: GET_BUFFER(snakeData)
	assert s/offset + pos < s/tail 
	as red-pair! copy-cell as cell! s/offset + pos as cell! snakeData	
]
```

me renvoie bien l'élément à la position n

dockimbel

[13:04](#msg59c8feebbac826f054f83579)@ldci  
&gt; @dockimbel : j'ai testé ta solution, mais cela me renvoie tout le block

Parce que la valeur n'est pas empilée au bon endroid dans la stack Red. Voilà une version qui devrait marcher correctement (non-testé):

```
getSnakeValue2: routine [snakeData [block!] pos [integer!]][
	 SET_RETURN(block/rs-abs-at snakeData pos) 
]
```

[13:06](#msg59c8ff57177fb9fe7efe063b)La valeur de retour de la routine n'a d'importance que si tu l'appelles depuis une fonction R/S. Si tu invoques une routine depuis Red, la valeur de retour doit être placée via la macro `SET_RETURN(...)`, ou bien via l'appel `stack/set-last`.

ldci

[13:17](#msg59c901dbbac826f054f84698)@dockimbel \`stack/set-last block/rs-abs-at snakeData pos' fonctionne parfaitement

## Friday 29th September, 2017

ldci

[21:30](#msg59cebb8abac826f0541690c9)@dockimbel : Je suis en train de tester red avec la dernière version de macOS (High Sierra). Cela fonctionne bien mais il y aura des chose à revoir au niveau de Red. Voici un exemple de message  
2017-09-29 23:28:18.706 canny\[6572:992995] warning: &lt;NSRemoteView: 0xd66b0b0&gt; determined it was necessary to configure &lt;RedOpenPanel: 0x272c870&gt; to support remote view vibrancy

## Saturday 30th September, 2017

dockimbel

[06:29](#msg59cf39e2210ac269208ce01f)@ldci Merci. On va passer en High Sierra notre mac mini au bureau et regarder çà. Tu as un petit exemple de code pour reproduire ce message ?

## Sunday 1st October, 2017

ldci

[16:51](#msg59d11d1ef7299e8f53958dc8)@dockimbel : c'est le request-file qui génère les messages d'avertissement :worried:

## Wednesday 4th October, 2017

ldci

[12:27](#msg59d4d3c0f7299e8f53a89d8b)@tous la bibliothèque RedCV vient d'être mise à jour ici https://github.com/ldci/redCV

## Saturday 7th October, 2017

ldci

[08:21](#msg59d88e99bbbf9f1a38315bfb)@dockimbel Support camera macOS. Encore quelques problèmes avec l'objet camera sous macOS. Les cam usb sont bien reconnues et on peut les activer sans problème. En revanche on ne peut pas arrêter le flux des images. Enfin camera/image plante le code et to-image camera ne fonctionne pas correctement.

dockimbel

[09:06](#msg59d89925210ac26920b946c4)@ldci Tu as un exemple de code simple ?

ldci

[09:09](#msg59d899cbb59d55b82382aa5a)@dockimbel : je vais de préparer un exemple (sans RedCV) :)

[09:19](#msg59d89c26bbbf9f1a38318a0c)@dockimbel : un exemple de code

```
Red [
	Title:   "Test camera Red VID "
	Author:  "Francois Jouen"
	File: 	 %camera.red
	Needs:	 'View
]

iSize: 320x240
margins: 10x10
cam: none ; for camera

view win: layout [
		title "Red Cam"
		origin margins space margins
		btnQuit: button "Quit" 60x24 on-click [quit]
		return
		cam: camera iSize
		canvas: base 320x240  rate 0:0:1 on-time [canvas/image: to-image cam ] ;cam/image
		return
		text 40 "Select" 
		cam-list: drop-list 180x32 on-create [
				face/data: cam/data
			]
		onoff: button "Start/Stop" 85x24 on-click [
				either cam/selected [
					cam/selected: none
					canvas/rate: none
					canvas/image: black
				][
					cam/selected: cam-list/selected
					canvas/rate: 0:0:0.04;  max 1/25 fps in ms
					]
			]
		do [cam-list/selected: 1 canvas/rate: none ]
]
```

[10:16](#msg59d8a998bac826f054462066)@dockimbel : cam/image -&gt; none et to-image -&gt; 00 ou FFh mais pas d'image

[10:24](#msg59d8ab77e44c43700a042e5f)@dockimbel : test avec Windows 10 to-image fonctionne parfaitement mais pas camera/image

[17:11](#msg59d90aba210ac26920baf732)@dockimbel : indépendamment de ce petit pb sous macOS, j'ai réussi à connecter 4 caméra ensemble avec Red! Génial :)

[17:28](#msg59d90eb4b20c642429d46dbb)et voila le code

```
Red [
	Title:   "Test camera Red VID "
	Author:  "Francois Jouen"
	File: 	 %cam4.red
	Needs:	 'View
]

iSize: 320x240
margins: 10x10
cam1: none ; for camera1
cam2: none ; for camera2
cam3: none ; for camera3
cam4: none ; for camera4

render: func [acam alist][
	either acam/selected [acam/selected: none][acam/selected: alist/selected]
]

view win: layout [
	title "Red Cam"
	origin margins space margins
	btnQuit: button "Quit" [quit]
	return
	cam1: camera iSize
	cam2: camera iSize
	return 
	camList1: drop-list 220 on-create [face/data: cam1/data]
	onoff1: button "Start/Stop" on-click [render cam1 camList1]
	camList2: drop-list 220 on-create [face/data: cam2/data]
	onoff2: button "Start/Stop" on-click [render cam2 camList2]
	return
	cam3: camera iSize
	cam4: camera iSize
	return
	camList3: drop-list 220 on-create [face/data: cam3/data]
	onoff3: button "Start/Stop"  on-click [render cam3 camList3]
	camList4: drop-list 220 on-create [face/data: cam4/data]
	onoff4: button "Start/Stop" on-click [render cam4 camList4]
	do [camList1/selected: 1 camList2/selected: 2 camList3/selected: 3 camList4/selected: 4]
]
```

## Wednesday 11st October, 2017

ldci

[08:50](#msg59dddb72bbbf9f1a3848ff1e)@dockimbel : je suis en train de mettre à jour mes différents portages de bibliothèques externes pour Red. Une question: comment puis-je avoir accès à la liste compléte des infix operators de Red/System? L'idée est de supprimer les références externes comme la math.reds de Kaj. Merci d'avance.

dockimbel

[08:52](#msg59dddbd0210ac26920d0e049)@ldci Tu peux utiliser \[cette liste](https://github.com/red/red/blob/master/system/compiler.r#L139), toutes les entrées de type `op` sont infix. `-**` est utilisé à la place de `>>>` car le lexer Rebol ne supporte pas ce mot.

ldci

[12:11](#msg59de0a7301110b7231a18646)@dockimbel Merci infiniment

## Friday 13th October, 2017

lepinekong\_twitter

[11:35](#msg59e0a4e901110b7231af248c)@dockimbel en Aout 2016 tu disais "De ce que je constate, le web est loin d'avoir gagné la partie" un an après le stack web est en train de gagner la partie y compris auprès des développeurs qui étaient avant pro-natifs exemple de github https://githubengineering.com/how-four-native-developers-wrote-an-electron-app/ slack, gitkrachen, visual studio code,... avec des IHM super léchés on croirait même pas que ça puisse être du web

[11:39](#msg59e0a5e1f7299e8f53e16988)Je suis pas geek c'est une tare par rapport à ceux qui le sont mais l'avantage c'est que je suis du coup agnostique par rapport aux technos. Red a beaucoup de potentiel la vision c'est pas si dure de l'avoir mais quand on est trop le nez dans sa tech on la perd facilement de vue.

dockimbel

[11:53](#msg59e0a93701110b7231af3c1b)@lepinekong\_twitter Merci de l'honneur qui tu me fais de partager ta connaissance éclairée et avancée du marché des outils de developpements logiciels. :clap: Quelle chance d'avoir une telle sommité dans notre communauté pour nous éclairer, pauvre codeurs ignorants que nous sommes, le nez dans notre tech ! ;-)

DideC

[12:47](#msg59e0b5d4e44c43700a2afc00)OUF! y'a un smiley ! Sinon c'est une ironie acerbe, pas ton genre.  
(maintenant je ne fais que passer et la dernière fois, j'avais raté des épisodes importants , donc motus)

GerardSontag

[13:01](#msg59e0b931b20c642429f9db6d)@ldci Super le test camera! ... par contre l'ajout d'un bouton pour retourner l'image haut&lt;-&gt;bas et c'est parfait. C'est ce qui m'arrive avec une camera intégrée à l'ecran sur W10

## Monday 16th October, 2017

ldci

[10:39](#msg59e48c71210ac26920f08123)@GerardSontag : pas de pb d'image retournée chez moi sur une machine win10

## Tuesday 17th October, 2017

sylvievathoux

[11:44](#msg59e5ed325c40c1ba79af8e7e)@ldci ça marche nickel sur win10 chez moi aussi.

GerardSontag

[13:09](#msg59e6010a5c40c1ba79b00778)@ldci @sylvievathoux Bonjour. Arrrh C'est Monsieur Microsoft qui a installé à l’insu de mon plein gré un driver de m* lors de la MàJ de septembre....Je réinstalle le bon driver. Donc tout va bien. Amicalement

## Thursday 19th October, 2017

lepinekong\_twitter

[12:15](#msg59e89766210ac26920065bf9)@dockimbel zut je suis tombée de mon pied d'estale, heureusement pas de très haut :)

## Friday 27th October, 2017

ldci

[12:05](#msg59f320f55a1758ed0f573328)@dockimbel . Salut Néant: problèmes de calcul avec les floats!  
exemple: a: 1.955928285978498e-9 b: 6.472296969134931e-8 et a * b: 0.0  
Très ennuyeux pour moi pour le calcul des moments spatiaux et centraux des images binaires.Tu as une idée?

[12:05](#msg59f32120d6c36fca31a2ee0d)Bon bien sûr Nénad et pas Néant :)

## Monday 30th October, 2017

lepinekong\_twitter

[07:03](#msg59f6ceaaf7299e8f534bd09e)Bug avec call/show "powershell.exe"

[07:03](#msg59f6cec38808bed73d453f28) call/show "powershell.exe" marche avec rebol mais pas avec red

[07:03](#msg59f6ced2d6c36fca31b2c69f)sur Windows 10 tout du moins

dockimbel

[11:47](#msg59f7114432e080696e41ede1)@ldci Tu peux ouvrir un ticket à ce sujet, le résultat devrait être différent de 0. Qingtian va s'en occuper en urgence. En attendant, tu peux faire un `max 1e-16 a * b` pour contourner le pb.

ldci

[17:31](#msg59f761e2976e63937e06d737)Merci Doc

## Wednesday 1st November, 2017

ldci

[11:43](#msg59f9b36db20c64242973b656)@dockimbel Ticket ouvert . A quoi correspond le-16?

dockimbel

[11:45](#msg59f9b3bef7299e8f535b11ed)@ldci Merci. L'ordre de grandeur du résultat de l'opération.

[11:50](#msg59f9b50e32e080696e4f8ca6)Je viens de voir avec Qingtian et j'ai une réponse pour ton ticket.

ldci

[11:55](#msg59f9b62f614889d475281e2d)Cool

[11:55](#msg59f9b6475a1758ed0f762627)Au fait: je suis en Chine du 3 au 15 novembre :)

dockimbel

[11:56](#msg59f9b65d32e080696e4f935f)@ldci Super ! Dans quelle(s) ville(s) ?

ldci

[13:19](#msg59f9c9f72a69af844b355b89)Pekin et Shanghai et un passage à Taiwan

dockimbel

[15:02](#msg59f9e2015a1758ed0f771dd3)@ldci Je dois voyager aussi dans les prochaines semaines à Shanghai et peut-être Pékin. Je te ferai signe une fois sur place.

ldci

[15:42](#msg59f9eb6fe44c43700aa4e114)@dockimbel OK et si on peut trouver un moment ce sera génial:)

## Saturday 25th November, 2017

ldci

[10:24](#msg5a1944d2e606d60e340819d3)@tous. De retour de Chine :)  
Pour les utilistaeurs macOS, un bout de code pour lire des fichiers audio.

```
Red [
	Title:   "macOS MP Player"
	Author:  "Francois Jouen"
	File: 	 %mp3.red
	Needs:	 'View
]

fileName: ""
fileInfo: ""
prog: "" 
vol: 1
isFile: false

loadFile: does [
	isFile: false
	clear info/text
	fileInfo: copy ""
	tmp: request-file
	if not none? tmp [
		fileName: to string! to-file tmp
		win/text: fileName
		isFile: true
		prog: copy "afinfo '" 
		append append prog FileName "'" 
		call/output prog fileInfo
		info/text: fileInfo
	]
]

playFile: does [
	if isFile [
		prog: copy "afplay '" 
		append append  prog FileName "'" 
		call prog
	]
]

setVolume: does [
	vol: to-integer sl/data * 10 
	fvol/text: to-string vol
	volProg: copy "osascript -e 'set volume "
	append append volProg to-string vol "'"
	call volProg
]


stopFile: does [if isFile [prog: "killall afplay" call prog]]

view win: layout [
	title "macOS mp3"
	origin 10x10 space 10x10
	button "Load" [loadFile]
	button "Play" [playFile]
	button "Stop" [stopFile]
	text 60 "Volume"
	sl: slider 100 [setVolume]
	fvol: field 25			
	button "Quit" [stopFile Quit]
	return
	info: area 500x250
	do [sl/data: 10% fvol/text: to-string vol]
]
```

[10:25](#msg5a194520e606d60e34081b07)et on peut même gérer le volume. J'ai écrit ça pour éviter d'avoir à utiliser iTunes pour lire un simple fichier audio:)

[13:21](#msg5a196e43ffa3e37919ba7367)@dic

[13:24](#msg5a196f08541a6f03371129ee)@dockimbel : une question. 2018 va être une année difficile avec l'abandon par Apple du support des applications 32 bits. Serait-il possible de compiler Red dans un format universel? Si oui on peut utiliser la commande lipo pour passer du format FAT à un format 64 bits, ce qui permettrait de résoudre (temporairement) le problème du 64 bits. Suis preneur de toutes les informations.Amitiés à tous.

## Sunday 26th November, 2017

dockimbel

[12:22](#msg5a1ab20adf09362e67549716)@ldci Je n'ai pas connaissance de date officielle pour un abandon des applications 32 bits complet sur macOS. Je me souviens juste avoir vu des rumeurs sur un possible déclassement des applications 32-bit dans le Mac Store, voire un blocage complet dans le store.

[12:25](#msg5a1ab2be6b5080350f30afdb)Peux-tu me donner un lien qui décrit ce "format universel" ?

ldci

[14:30](#msg5a1ad01dba39a53f1ae79700)@dockimbel : à l'origine ce format universel a été créé pour le passage de l'architecture Power PC vers l’architecture Intel et gcc faisiat tès bien le travail  
\`  
gcc -O2 -Wall -force\_cpusubtype\_ALL -mmacosx-version-min=10.4 -arch i386 -arch ppc \*.c -o \[outputfile]

[14:42](#msg5a1ad2dccc1d527f6bb89d59)Quant tu utilises XCode, tu peux choisir dans le build settings un format universel 32/64 bits mais uniquement pour l’architecture Intel.  
Pas beaucoup de doc: http://chandra.berkeley.edu/~colby/howto/macosx/universal\_binary.pdf ou encore ici https://developer.apple.com/library/content/documentation/Darwin/Conceptual/64bitPorting/intro/intro.html  
De toute façon, Red dépend de Rebol pour la compilation, il me semble et Rebol est 32 bits. (J'avais réussi à compiler une version 64 bits pour Rebol R3). A plus :)

## Wednesday 29th November, 2017

sylvievathoux

[16:48](#msg5a1ee4da3a80a84b5b97ae11)@ldci  
Bonne idée le lecteur, merci !  
Vite fait en passant, j'ai rajouté ça à la fin :

```
if empty? system/view/screens/1/pane [stopFile Quit]
```

Sinon ça lit le fichier jusqu'au bout si on ferme autrement que part `Quit`.  
Mais il y a peut-être plus élégant ?  
À+

ldci

[17:53](#msg5a1ef40ccc1d527f6bce3771)@sylvievathoux : Merci pour la suggestion que je vais intégrer :)

[17:56](#msg5a1ef4b13a80a84b5b98168c)@dockimbel : un petit problème avec les dernières versions master branch de Red avec OpenCV. On obtient un erreur de pointeur quand on veut afficher les images. La dernière version qui était OK était celle du 10/11/2017. Bon j'attendrai la 0.6.4 pour mettre à jour, car pour OpenCV j'ai décidé de ne mettre à jour que pour les versions stables :)

[18:09](#msg5a1ef7eb8b3a9e2c0c31f5c1)@sylvievathoux : dans le même ordre d'idée http://redlcv.blogspot.fr/2017/11/reading-video-files-with-red.html

## Thursday 30th November, 2017

ldci

[09:54](#msg5a1fd5663a80a84b5b9c5649)@dockimbel : opencv erreur: \*\** Runtime Error 1: access violation  
\*\** at: 001E28CEh

## Monday 4th December, 2017

dockimbel

[09:16](#msg5a25127d540c78242d7fdcc9)@ldci Tu peux tester avec la 0.6.4 (branche `v0.6.4`), sinon attends le merge dans master.

## Saturday 16th December, 2017

ldci

[16:31](#msg5a354a73540c78242dd1862a)@dockimbel : le suis en train de jouer avec le type vector! pour implémenter les fonctions qui sont dans Matlab . un truc curieux. La fonction suivante fonctionne parfaitement quand le code est compilé mais est refusée lorsqu'on utilise l'interpréter.  
`vectRandomC: function [v [vector!] value [number!] ][ ; for compiled forall v [v/1: random value] ]`

[16:32](#msg5a354aaf232e79134d5956fa)J'ai du écrire une autre fonction pour du code red non compilé  
`vectRandomI: function [v [vector!] value [number!] ][ ; for interpreted n: length? v i: 1 while [i <= n] [v/(i): random value i: i + 1] ]`

[16:33](#msg5a354ac3540c78242dd187b0)Une idée?

## Monday 18th December, 2017

ldci

[08:31](#msg5a377cd65355812e57eb4306)Une façon élégante de résoudre le problème  
`vectRandom: function [v [vector!] value [number!] ][ n: length? v collect [i: 0 until [keep i: i + 1 v/:i: random value i = n]] ]`

dockimbel

[09:04](#msg5a3784820163b028104d96a0)@ldci Ton problème c'est `forall` qui ne supporte pas le type `vector!`? Tu peux ouvrir un ticket pour çà.

## Wednesday 20th December, 2017

rcqls

[14:54](#msg5a3a79c25355812e57fae7d4)@dockimbel Puisqu’avec ton annonce très excitante tout le monde se met à parier… je vais moi-aussi jouer mais uniquement ici en français. Je vois bien un rapprochement avec la compagnie qui fait le navigateur « Brave » avec le créateur de javascript qui avait l’air vraiment intéressé par Red…. Je ne sais pas pourquoi mais pour le backend Android cela ne me surprendrait pas que tu aies pris contact avec lui…. bonne continuation pour l’écriture du fameux article que tout le monde attend avec impatience!

## Thursday 21st December, 2017

dockimbel

[05:10](#msg5a3b423a540c78242ded5701)@rcqls Bien tenté, mais ce n'est pas çà. Quoique ton hypothèse n'est pas complètement à côté, je dirais que c'est "tiède-froid" du coup et non "glacial". ;-)

rcqls

[07:07](#msg5a3b5d99232e79134d761aef)@dockimbel Cool Nenad d’avoir pris le temps de répondre! Comme je ne suis pas un impatient ou presque, je vais calmement attendre le Scoooopppp! Bonne fin de semaine!

DideC

[08:44](#msg5a3b745c03838b2f2a1ea600)C'est clair que dans le genre suspense, ça vaut le dernier épisode d'un Game of Trone (il parait) ;-)

## Friday 22nd December, 2017

ldci

[09:07](#msg5a3ccb4fffa3e3791969ec5b)@ tous: une question stupide. J'ai 68 widgets check (numérotés de m0 à m68) dont je voudrais connaitre l'état à l'intérieur d'une boucle. Je pensais que ce serait possible avec to-word, mais je dois mal l'utiliser. Qui aurait une idée. Voici l'exemple

```
processImage: does [
	points: copy []
	clear list/data
	plot: copy [pen green fill-pen green]
	if count = 1 [call/wait prog]
	result: read/lines resultFile
	i: 1 
	while [i <= nbPMax] [
		str: copy "m" 
		append append str form i - 1  
		m: to-word str
		if (m/data)  [
			print [m lf]
			append list/data result/:i
			b: to-block result/:i
			p: as-pair second b third b
			append points p
			append plot 'circle 
			;'
			append plot p
			append plot radius
		]
		i: i + 1
	]
	draw srcImg plot
	sb2/text: "Traitement terminé "
]
```

[09:08](#msg5a3ccb771a4e6c82233c5aa5)Merci d'avance :)

dockimbel

[09:11](#msg5a3ccc5effa3e3791969f363)@ldci Au lieu de:

```
str: copy "m" 
append append str form i - 1  
m: to-word str
if (m/data)  [
```

essaye plutôt:

```
m: to-word rejoin ["m" i - 1]
if select get m 'data [
```

[09:15](#msg5a3ccd30ffa3e3791969f8a5)Plutôt que d'utiliser des noms lorsque les widgets sont nombreux, le mieux serait d'accéder à la liste des widgets depuis le `parent/pane`, et calculer la position du check dans la liste des faces. Si tu places tous tes "check" dans un panel, le calcul devient trivial.

ldci

[11:30](#msg5a3cecc9e43a7a150c94bdaa)Merci Doc

[12:59](#msg5a3d019e232e79134d7e55e4)j'avais oublié le get :) Ca fonctionne parfaitrement

## Sunday 24th December, 2017

ldci

[17:50](#msg5a3fe8fd232e79134d89de2c)@dockimbel : On a l'inverse de get pour mettre à jour un /path du widget?

## Monday 25th December, 2017

dockimbel

[16:49](#msg5a412c07ffa3e379197b82bc)@ldci `put m 'data` devrait marcher.

## Tuesday 26th December, 2017

ghost~5585eedf15522ed4b3e236ae

[14:03](#msg5a42569be43a7a150ca94c60)Joyeux Noël aux redeurs

[14:20](#msg5a425ab9e43a7a150ca96190)Je suis partagé sur le tournant annoncé. C'est vraiment très risqué. Même si cela réussie ce n'est pas une garanti que Red s'engage sur la voie espérée. Si la communauté grandissait d'un coup par le biais de blockchain est-ce que Red serait encore perçu comme un langage généraliste et propre à redonner la joie de coder en dehors du cercle initiale des reboleurs ? Il faut assurément un grande vision, de la persévérance et d'excellentes qualités de communication pour arriver à conserver le cap. Y'a du boulot ! Bon courage à tous pour l'année à venir.

sylvievathoux

[22:01](#msg5a42c6a1a2a87ea021741532)@lkppo je me disais un peu la même chose, gros risque, et grosse dispersion... Question de génération peut-être ? En tous cas je suis bien emmerdé, j'avais décidé de ne pas trop m'investir dans ces technos, et voilà qu'il va falloir que je m'y intéresse sérieusement !  
Bon courage effectivement, et avant tout bonnes fêtes !

## Wednesday 27th December, 2017

ghost~5585eedf15522ed4b3e236ae

[10:02](#msg5a436fa8edd2230811e1a568)Je n'y investirai que si elles passent dans la vie ordinaire et sont stables (pas rongés par la spéculation).

## Saturday 30th December, 2017

ldci

[16:12](#msg5a47bae303838b2f2a517f15)@tous: j'ai mis à jour RedCV pour une utilisation parfaite des caméras avec Red (https://github.com/ldci/redCV). Joyeuses fêtes à tous.
