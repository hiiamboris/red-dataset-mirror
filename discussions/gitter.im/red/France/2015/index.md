# Archived messages from: [gitter.im/red/red/France](/gitter.im/red/red/France/) from year: 2015

## Friday 18th December, 2015

dockimbel

[06:17](#msg5673a4f1a95dea5d4215423e)Bienvenue aux francophones qui sont intéressés par Red. :sparkles:

aagahi

[07:18](#msg5673b355f99ceb846ae68c04)hello

dockimbel

[07:19](#msg5673b38df99ceb846ae68c0b)@aagahi Salut !

aagahi

[07:21](#msg5673b411f99ceb846ae68c17)vous avez fait des benchmark de red comparé au C ? qq chose comme http://benchmarksgame.alioth.debian.org/

dockimbel

[07:24](#msg5673b4bb37169e856a756b34)Pas encore, mais si quelqu'un veut s'y mettre, il est le bienvenu. :)

aagahi

[07:25](#msg5673b4f0a95dea5d4215434a)d'ailleurs j'imagine qu'il faudrait bencher red/system et et red du coup...

dockimbel

[07:28](#msg5673b589a95dea5d42154363)Exactement. Chaque bench devrait être écris en Red pure et en Red + Red/System pour avoir une bonne idée des perfs.

hamdouni

[07:29](#msg5673b5f75155bfb75b172e7f)Salut, est ce qu'il existe une moulinette ou une doc pour migrer facilement ses applis de rebol vers red ?

dockimbel

[07:37](#msg5673b7b4cc068a5e42f1e7b2)Une documentation complète pour migrer son code Rebol vers Red est prévue. Pour l'automatisation du processus, ça devrait être possible pour certaines applications, mais c'est non-trivial. Le language lui-même est suffisament proche de Rebol pour pouvoir faire ce genre de moulinette, mais certaines parties, comme le support Unicode (inexistant en Rebol2) ou bien l'API pour les I/O async (plus proche de celle de Rebol3 que Rebol2) ne me paraissent pas automatisables.

hamdouni

[07:42](#msg5673b8dca95dea5d421543c7)Si un portage de cheyenne est prévue ça devrait faciliter la migration des webapps... C'est dans les tuyaux ?

dockimbel

[07:50](#msg5673babaf31bbe91555b1f60)Pour Cheyenne, le plan est le suivant:  
1\. Fabriquer une framework async bas-niveau type Uniserve, mais intégré à Red.  
2\. Ecrire une serveur web minimal par-dessus, capable d'executer des requêtes dynamiques via le futur support des Acteurs.  
3\. Fournir une couche de compatibilité pour le moteur RSP de Cheyenne (supportant 100% de l'API).  
4\. Fournir un framework web client/server moderne, avec haut niveau d'abstraction (si possible à la GWT ou Opalang).  
5\. Releaser Cheyenne 2.0. ;-)

aagahi

[07:50](#msg5673bac15155bfb75b172f0a)+1 pour cheyenne

hamdouni

[07:53](#msg5673bb8c37169e856a756bd8)J'attend le 3. avec impatience alors !

ldci

[11:18](#msg5673eb8cb5777fb85ba494ae)Bonjour à tous. J'avance à grands pas dans le portage d'OPenCV pour Red (https://github.com/ldci/OpenCV3-red).

[11:19](#msg5673ebac5155bfb75b173665)Vous pouvez déjà jouer avec les images. J'améliore le support des matrices.

dockimbel

[11:19](#msg5673ebc6cc068a5e42f1eec6)@ldci Bienvenu !

SteeveGit

[11:28](#msg5673edc669a89a8f552f246c)Salut à tous.

dockimbel

[11:52](#msg5673f36d5155bfb75b173756)Salut Steeve.

[11:52](#msg5673f398f31bbe91555b2782)J'espère que ce nouveau canal sera plus pratique pour discuter de Red et répondre plus rapidement aux questions en Français.

SteeveGit

[11:54](#msg5673f40637169e856a757413)En fait, t'as eu pitié de mon franglish, c'est ça ? (mode parano /on) ;-)

dockimbel

[14:16](#msg5674153ef240f5a004172d4f)Non, non, ton anglais est tout a fait correct. :-) C'est surtout pour les codeurs francais qui ne sont pas a l'aise avec l'anglais. (\*clavier anglais, desole pour les accents\*).

gregit

[20:00](#msg567465d0b5777fb85ba4a8d7)Perso, je pense que l'ouverture de ce channel est utile a Nenad afin qu'entre l'anglais et le chinois il ne perde pas son francais! ;-)

[20:00](#msg567465ee69a89a8f552f3852)Merci Nenad, bonne initiative!

## Saturday 19th December, 2015

dockimbel

[03:37](#msg5674d0e4091b6f9e0439ca33)@gregit Salut, oui, c'est effectivement une bonne raison. :-)

## Sunday 20th December, 2015

dockimbel

[04:58](#msg56763589f99ceb846ae6ca4f)@gregit Je devrais passer a Paris en fevrier ou mars prochain, j'espere qu'on pourra organizer un pot ou meme une presentation chez @ldci.

ghost~5585eedf15522ed4b3e236ae

[11:52](#msg5676967df240f5a0041762a8)C’est bonne idée.

pchg

[19:00](#msg5676fab4f31bbe91555b69f5)Bonsoir!

[19:02](#msg5676fb4937169e856a75b74c)Bonne idée, le coup de la présentation Reddeuse en Hexagone; c'est où, chez @ldci ? En région parigaude, si ma mémoire est bonne?

[19:10](#msg5676fd1569a89a8f552f67cb)Je viens de git-puller Red, et de compiler la console. Ça a pris pas mal de temps; je trouve le message à l'issue de la compilation un peu optimiste, pour ne pas dire qu'il friserait la publicité mensongère:

[19:11](#msg5676fd4eb5777fb85ba4d812) &gt;&gt; do/args %red.r %environment/console/console.red

-=== Red Compiler 0.5.4 ===-

Compiling /home/pierre/heaume\_pierre/developpt/rebol/sources/Red/environment/console/console.red ...  
...compilation time : 5294 ms

Compiling to native code...  
...compilation time : 177981 ms  
...linking time : 1492 ms  
...output file size : 407596 bytes  
...output file : /home/pierre/heaume\_pierre/developpt/rebol/sources/Red/console

[19:12](#msg5676fd8ef240f5a004176b62)Or on est très largement au-delà de la seconde et demi. J'aurais dû chronométrer la compilation, mais je dirais, à vue de nez, qu'elle a dû prendre dans les 2 à 3 minutes?

ghost~5585eedf15522ed4b3e236ae

[19:29](#msg567701815155bfb75b177ad6)5294 + 177981 + 1492 = 184767 ms

[19:29](#msg567701a137169e856a75b7e8)184767 / 1000 = 184,767 s

[19:30](#msg567701b937169e856a75b7e9)184,767 / 60 = 3 min

SteeveGit

[19:30](#msg567701bbf99ceb846ae6d7c5)

ghost~5585eedf15522ed4b3e236ae

[19:30](#msg567701d55155bfb75b177adf)Je vois pas de problème avec l’affichage.

SteeveGit

[19:30](#msg567701ec69a89a8f552f6847)j'ai rien dit :-)

ghost~5585eedf15522ed4b3e236ae

[19:31](#msg5677020837169e856a75b7f0)He He !

pchg

[19:31](#msg5677020ff31bbe91555b6ab3)Ah, pardon! J'avais lu trop vite. Il y a 2 compilation time, j'avais bêtement zappé le second.

SteeveGit

[19:32](#msg56770244091b6f9e0439f088)t'as quoi comme conf ? @pchg

pchg

[19:32](#msg5677025a69a89a8f552f6852)GNU/Linux Debian stable (Jessie en ce moment) sur un MSI Wind U100x

SteeveGit

[19:33](#msg56770273b5777fb85ba4d898)niveau puissance proc ?

pchg

[19:33](#msg5677028637169e856a75b7f7)Pas bézef. Un vieux atom.

SteeveGit

[19:33](#msg567702905155bfb75b177ae9)ah ben vala ;-)

pchg

[19:33](#msg5677029e5155bfb75b177aeb)Ah, mais attention, je me plaignais pas du temps de compilation!

[19:34](#msg567702aff99ceb846ae6d7dc)J'ai farpaitement conscience de la (relative) lenteur de mon proc'.

ghost~5585eedf15522ed4b3e236ae

[19:34](#msg567702cff99ceb846ae6d7e1)Pas de sushi

pchg

[19:36](#msg56770322b5777fb85ba4d8a8)Je suis en train de me re-immerger dans Red. Je lis bêtement le README.md

[19:37](#msg5677036f69a89a8f552f686a)Et je me pose la question: en ligne 17, il y a d'inscrit:  
1\. Put the downloaded \*\*red\** binary in a folder that's in the PATH, or just in the working folder.  
Or donc, je ne trouve pas trace d'un binaire nommé red dans ce que j'ai gitt-pullé: quid?

ghost~5585eedf15522ed4b3e236ae

[19:41](#msg567704805155bfb75b177b28)La ligne au dessus dit : « The Red toolchain comes as a single half-megabyte executable file that you can download from here for the big-3 platforms. »

pchg

[19:42](#msg567704a669a89a8f552f687d)Ah purée, faut vraiment que j'apprenne à lire...

[19:42](#msg567704b5f240f5a004176bfc)Nâvré...

ghost~5585eedf15522ed4b3e236ae

[19:43](#msg567704db37169e856a75b833)Seriez pas plutôt un peu fatigué ?

pchg

[19:43](#msg567704e7f240f5a004176c04);o) Bien vu...

ghost~5585eedf15522ed4b3e236ae

[19:44](#msg56770538f240f5a004176c0c)Ah je me disais..

pchg

[19:46](#msg567705a1b5777fb85ba4d8e8)Oh, mais! @lkppo , serions-nous voisins?? Je suis Gersois, ma famille est d'origine Lot-et-Garonnaise.

ghost~5585eedf15522ed4b3e236ae

[19:48](#msg567706105155bfb75b177b5b)Oui, je suis un expatrié des Pyrénées-Orientales en Lot-et-Garonne, pour le travail.

pchg

[19:49](#msg5677063a091b6f9e0439f0e8)Un copain Catalan me disait jadis qu'il y avait 2 sortes de gens sur Terre:

[19:49](#msg5677064069a89a8f552f68ac)- les Catalans

[19:49](#msg5677064c5155bfb75b177b61)- et ceux qui rêvent d'être Catalans...

ghost~5585eedf15522ed4b3e236ae

[19:49](#msg5677065ab5777fb85ba4d8f8)... ou Gabatchs.

[19:50](#msg5677069af31bbe91555b6b2e)Il avait de l’humour, mais ça résume bien le flot continue de population vers la Catalogne.

[19:52](#msg5677070469a89a8f552f68bd)Et les basques que disent-ils ?

pchg

[19:58](#msg5677086769a89a8f552f68e2)On dit (je suis Basque, en bonne partie) des tas de choses sur les voisins... ;)

[19:58](#msg56770878f31bbe91555b6b55)Les Béarnais ont la primeur...

SteeveGit

[20:04](#msg567709ba091b6f9e0439f143)&gt; On dit (je suis Basque, en bonne partie) des tas de choses sur les voisins... ;)

T'as plus l'air d'un Indien sur ta photo ;-)

[20:07](#msg56770a8ff240f5a004176ca8)En même temps, le Basque, c'est une langue qui vient d'on ne sait où

ghost~5585eedf15522ed4b3e236ae

[20:08](#msg56770ac6f240f5a004176caf)T’es bernais, SteeveGit ?

SteeveGit

[20:08](#msg56770ad85155bfb75b177bd3)keuwa ?

ghost~5585eedf15522ed4b3e236ae

[20:09](#msg56770b0169a89a8f552f693b)béarnais

SteeveGit

[20:11](#msg56770b7137169e856a75b8d6)Rémois d'origine mais là, je vis en Aveyron

ghost~5585eedf15522ed4b3e236ae

[20:13](#msg56770bfff99ceb846ae6d8d3)Reims donc, c’est plus sympah poun le climat non ?

[20:14](#msg56770c0f091b6f9e0439f188)@pchg Et où dans le Gers ?

SteeveGit

[20:16](#msg56770ca6f240f5a004176cd4)Oui c'est clair, niveau climat y'a pas photo.

ghost~5585eedf15522ed4b3e236ae

[20:17](#msg56770ce8091b6f9e0439f19e)J’étais l’an dernier quelques mois à Villefranche-de-rouergue pour le boulot aussi, j’ai bien aimé.

SteeveGit

[20:19](#msg56770d4ff31bbe91555b6bcd)Je connais pratiquement pas, çà ne fait que 8 mois que j'y suis.

[20:20](#msg56770d92f240f5a004176ce3)Et puis je suis du genre casanier, le tourisme c'est pas mon truc.

ghost~5585eedf15522ed4b3e236ae

[20:25](#msg56770ed7f31bbe91555b6bfc)Moi je fait environ 1 visite par mois pour prendre l’air, mais sinon je suis aussi assez casanier. Allez voir Najac, une pure merveille !

[20:27](#msg56770f2a37169e856a75b91e)C’est un village médiéval accroché au rocher avec son château et son église, très très beau spectacle.

[20:27](#msg56770f4af240f5a004176d08)Il y a un LUG à Rodez mais ça fait un peu loin.

SteeveGit

[20:28](#msg56770f63f240f5a004176d0c)Oui je connais, c'est très beau. Je suis certes casanier mais j'aime la campagne et la nature à ma porte, donc j'y vis. Paris et autres grandes villes, plus jamais.

ghost~5585eedf15522ed4b3e236ae

[20:28](#msg56770f88f31bbe91555b6c13)voilà un homme sensé

SteeveGit

[20:30](#msg56770fceb5777fb85ba4d9c4)Je pense qu'en vieillissant, on fait tous plus ou moins le même constat.

ghost~5585eedf15522ed4b3e236ae

[20:38](#msg567711ac5155bfb75b177c81)Il y en a aussi qui ne peuvent vraiment pas vivre à la campagne.

SteeveGit

[20:39](#msg56771219b5777fb85ba4da0c)qui ne peuvent pas ou qui ne veulent pas ?

ghost~5585eedf15522ed4b3e236ae

[20:41](#msg56771274f240f5a004176d51)Qui ne veulent pas. J’avais une arrière grand-mère comme çà.

[20:42](#msg5677129ef31bbe91555b6c5c)Ceux qui ne peuvent pas, be, ils peuvent pas.

SteeveGit

[20:44](#msg56771313b5777fb85ba4da17)C'est plus une question de génération je trouve. Le jeune est attiré par les lumières de la ville et le vieux par son côté pratique et son confort.

[20:44](#msg5677133669a89a8f552f69f8)après, y'a des exceptions

[20:47](#msg567713cab5777fb85ba4da33)La je parle pour l'homme primaire (que je suis). Les femmes c'est différent, des relations sociales riches sont très importantes pour elles. Donc elles préfèrent généralement la ville pour cette raison.

[20:47](#msg567713f737169e856a75b98d)Ah ah, j'aime faire des généralités.

ghost~5585eedf15522ed4b3e236ae

[20:47](#msg567713fd69a89a8f552f6a08)Je ne pense pas que la ville m’ait jamais attiré, sauf pour les bibliothèques et les musées, mais je comprends les autres.

[20:49](#msg5677144c091b6f9e0439f24e)C’est pas interdit de faire des généralités.

SteeveGit

[20:50](#msg56771494b5777fb85ba4da48)En tant que survivaliste inassumé, la ville est un no go ;-)

ghost~5585eedf15522ed4b3e236ae

[20:52](#msg56771521f31bbe91555b6c96)Effectivement

pchg

[22:12](#msg567727e15155bfb75b177ead)@SteeveGit Ah si, on sait d'où vient le Basque! La langue est tout simplement originaire d'Euskadi.

[22:13](#msg5677280ef99ceb846ae6dbbb)@lkppo à Condom.

ghost~5585eedf15522ed4b3e236ae

[23:15](#msg5677369069a89a8f552f6d95)C’est par loin et j’étais à Nérac cette semaine, dommage.

## Monday 21st December, 2015

pchg

[09:11](#msg5677c238f31bbe91555b7aaf)Je suis en pleine phase de re-immersion dans Red après pas mal d'absence, donc j'aurais pas mal de questions aussi stupides que hier...

[09:11](#msg5677c2405155bfb75b178aff)Je viens de voir cette page, qui me titille:  
https://github.com/red/red/wiki/%5BProposal%5D-Ways-to-promote-youth-to-learn-Red

[09:12](#msg5677c286f99ceb846ae6e81a)Ça va toutafé dans le sens de ce que j'avais commencé à faire pour mon fiston: faire un Frebol, à savoir un Rebol en français, de manière à ce que le fiston (non encore anglophone mais suffisamment éclairé pour piger la logique de programmation) puisse commencer à coder.

[09:14](#msg5677c2f0f99ceb846ae6e827)C'est trivial à implémenter, j'ai fait ça par là: https://github.com/pierrechtux/frebol

[09:14](#msg5677c30ef31bbe91555b7ad5)Faire ça en Red, ça ferait un jeu de mots facile pour le Hello World, en plus... ;o)

red&gt;&gt; affiche: :print  
\== make native! [["Outputs a value followed by a newline" value [any-...  
red&gt;&gt; affiche "Salut, Fred!"  
Salut, Fred!  
red&gt;&gt;

(contrepèterie)

dockimbel

[09:22](#msg5677c4f35155bfb75b178b50)@pchg Bien vu. ;-)

pchg

[09:23](#msg5677c4fff240f5a004177c01)Je me permets d'ajouter l'idée dans le wiki.

[09:23](#msg5677c51df240f5a004177c0b)@dockimbel C'est un copain dénommé Frédéric qui me l'avait faite, celle-là!...

dockimbel

[10:04](#msg5677cec137169e856a75c9eb)@pchg :+1:

ghost~5585eedf15522ed4b3e236ae

[11:31](#msg5677e31bb5777fb85ba4ed17)J’ai lu des articles et du code et j’apprécie Rebol comme Red, mais je reste débutant par manque de temps en ce moment.

pchg

[12:52](#msg5677f62769a89a8f552f7f02)@lkppo Je suis un peu dans le même cas. Là, je viens de DÉCIDER de réserver du temps à Rebol et Red.

ghost~5585eedf15522ed4b3e236ae

[13:15](#msg5677fb7337169e856a75cfc3)Je devrais faire de même. J'attends de récupérer le livre sur Rebol que j'ai laissé chez mes parents.

pchg

[14:21](#msg56780ae169a89a8f552f8229)J'ai le "Rebol - Guide du programmeur" d'Olivier Auverlot à portée de main, et j'en re-imprègne. Impossible de me rappeler à qui j'ai prêté l'autre livre du même auteur...

ghost~5585eedf15522ed4b3e236ae

[15:09](#msg56781630f31bbe91555b865a)J'ai aussi un de ces livres (couverture verte et blanche).

SteeveGit

[15:46](#msg56781ed7f240f5a0041788b3)@pchg , marrant,mon cerveau a compris  
&gt; Ras-le-bol - Guide du programmeur

[15:49](#msg56781f80f31bbe91555b87e3)Sinon, pour se mettre à la page sans bouquin. Le site www.rebol.org reste un must avec ses centaines de scripts.

Goldevil

[17:10](#msg5678329bf99ceb846ae6f7d6)Salut à tous. C'est une bonne idée cette room francophone :-)

pchg

[17:31](#msg56783789f240f5a004178c8c)@Goldevil Oui, en effet.

[17:36](#msg5678389af99ceb846ae6f8d0)@SteeveGit J'aime beaucoup aussi, dans un genre moins francophone mais très didactique (je trouve), les tutos de Nick, et notamment son gros: http://business-programming.com/business\_programming.html

[17:37](#msg567838e4091b6f9e043a11d2)Oh, d'ailleurs, je vois à l'instant qu'il a mis à jour son tuto, et qu'il y est fait mention de Red: http://business-programming.com/business\_programming.html#section-17.9

[17:40](#msg56783972f240f5a004178cdc)@SteeveGit Oh mince: moi, j'avais jamais jamais remarqué que Ras-le-Bol &lt;~&gt; Rebol... Flûte...

[17:40](#msg567839845155bfb75b179c10)Mais ça me revient maintenant: je crois qu'il y avait des rimes comme ça dans la chanson à la gloire de Rebol.

## Tuesday 22nd December, 2015

dockimbel

[06:59](#msg5678f4ec091b6f9e043a24f5)@Goldevil Bienvenu !

[08:21](#msg5679080e37169e856a75ee8f)@pchg http://redprogramming.com

pchg

[23:14](#msg5679d94b4f069158055b824d)@dockimbel Ah, cela me semble être de la plume de Nick, non?

## Wednesday 23th December, 2015

dockimbel

[03:26](#msg567a1476653b30761d75cb91)@pchg Oui, tout à fait, il m'a dit qu'il souhaitait écrire de nombreux tutoriaux pour Red, notamment dès que la version 0.6.0 avec le support du GUI sera sortie officiellement.

ldci

[10:02](#msg567a71494f069158055b8ed5)bonjour à tous, j'ai pas mal de documentation Rebol accumulée au cours de toutes ces années que je peux mettre à la disposition de tous

[10:12](#msg567a738a3acb611716ff8491)un pb spécifique à window

[10:12](#msg567a73930171d1791d01dfe9)Compiling to native code...  
\*\** Compilation Error: undefined string index variable  
\*\** in file: %environment/codecs/png.red  
\*\** in function: exec/ctx136~encode  
\*\** at line: 1  
\*\** near: \[exec/image/encode img IMAGE\_PNG]

[10:13](#msg567a73b80171d1791d01dfec)Cela ne posait pas de pb avec la version 0.5.4. Je vais regarder asap

dockimbel

[11:24](#msg567a845b9606b15a055d60e6)@ldci Comment reproduire l'erreur ?

ldci

[15:58](#msg567ac49e653b30761d75de16)Bon j'ai trouvé: ne pas utiliser dans son code une variable nommée "image". En replaçant par "picture" c'est OK. Tu as donc un effet de bord pour le type image.

## Thursday 24th December, 2015

dockimbel

[07:09](#msg567b9a23653b30761d75f387)@ldci Hmm...bizarre, je pense que ça mérite une ticket dans le tracker.

## Friday 25th December, 2015

gregit

[13:31](#msg567d453b3c6894026924c640)@dockimbel Passage a Paris: oui, tiens nous au courant :) Bonnes fêtes de fin d'annee!

SteeveGit

[13:49](#msg567d497b35e1a316162e2d8d)noyeux jöel à tous

pchg

[18:51](#msg567d904c9606b15a055da154)Joyeux Noël!

## Saturday 26th December, 2015

ldci

[12:52](#msg567e8d7a0199d70069dfbe37)Joyeux Noël à tous :) Une question pour Doc: red sera-t-il compilable en 64 bits?

SteeveGit

[19:24](#msg567ee974653b30761d762a84)Dans quel but ? Le code 32 bits s'exécute correctement sur les os 64 bits.

[19:26](#msg567ee9f1653b30761d762a90)Enfin, pour l'architecture ia32, les autres je sais pas.

## Sunday 27th December, 2015

ldci

[15:15](#msg568000844f069158055bf6c2)En fait de plus en plus de lib dynamiques sont en 64-bit et on ne peut pas les appeler avec un code 32-bit. A +

## Tuesday 29th December, 2015

dockimbel

[04:49](#msg568210c5653b30761d766dad)@ldci Le support 64-bit est prévu, mais pas de date pour l'instant, sans doute après la 1.0. Il y a plusieurs changements importants à faire:  
1\. Modifier le linker pour générer des fichiers exécutables 64-bit pour chaque plateforme cible.  
2\. Ajouter le support des entiers et pointeurs 64-bit à Red/System.  
3\. Ecrire un emetteur de code natif 64-bit pour processeur Intel et ARM.  
4\. Modifier le runtime de Red pour supporter des pointeurs 64-bit, notamment dans les cellules des blocks qui n'ont que 128-bit d'espace (dont 32-bit pour l'entête). Il faudra les étendre à 192 ou 256-bit et changer pas mal de code dans le runtime pour pouvoir compiler en 32 ou 64-bit.

[04:52](#msg568211993c6894026925237c)

ldci

[11:22](#msg56826ce60171d1791d0282db)Merci Doc: du travail en perspective, mais ce sera nécessaire étant donnée l'évolution des machines :)

## Wednesday 30th December, 2015

dockimbel

[08:14](#msg5683927d653b30761d76987e)@ldci Oui, c'est une étape indispensable.

[11:16](#msg5683bd073acb611716003bcd)@ldci On a un problème avec OpenCV 3.0 et plusieurs caméras (une logithèque et une caméra embarquée sur tablette Windows 8), on a une image totalement noire à chaque fois. Le code source est \[ici](https://gist.github.com/dockimbel/05e45219b92935ba4695). Les mêmes caméras produisent une image correcte si on utilise OpenCV 2.4. As-tu une idée d'où peut venir le problème ?

ldci

[12:49](#msg5683d2e50199d70069e0395f)@dockimbel : Oui ça fait une semaine que je me prends la tête avec ce problème sous windows. Depuis la version 2.4.9 jusqu'à la version 3.0, les fonctions C classiques permettant d'accéder aux caméras ne fonctionnent plus sous Windows et fonctionnent sous OSX. J'ai même eu le problème en utilisant du code C++ avec QT. En fait, le code opencv pour la vidéo a été réécrit en C++ via une classe VideoCapture qui fonctionne parfaitement bien. D'après les docs que j'ai pu lire sur le site OpenCV.org, les fonctions C étaient des fonctions de test, appelées à devenir obsolètes. Je n'ai malheureusement pas trouvé la solution: les caméras sont reconnues, sont activées, mais les fonctions de capture de l'image renvoient une image vide. C'est surprenant car ces fonctions marchent quand on lit un fichier vidéo! J'avais suspecté un problème de codecs vidéo, mais cela ne semble pas être la cause. Comme je développe principalement sous OSX, je n'avais pas eu le temps de me pencher sur le problème sous windows qui a l'air insoluble. Je continue à regarder. A+

## Thursday 31st December, 2015

dockimbel

[03:53](#msg5684a6cc0171d1791d02c81e)@ldci Merci pour ces infos. Penses-tu que faire une DLL pour encapsuler les appels à la classe VideoCapture et exposer ses fonctionnalités via de simple fonctions en C seraient une bonne solution?

ldci

[09:03](#msg5684ef629606b15a055e4683)@dockimbel Je vais regarder cette idée que j'avais commencé à tester avec Rebol. Ce ne sera pas simple, car la classe VideoCapture fait appel à pas mal de choses et notamment les implémentations pour chaque type de caméra. En fait, le code détermine le type de caméra, vraisemblablement par la fonction cvGetCaptureDomain et charge ensuite le code spécifique. J'ai testé hier et pour windows cette fonction renvoie soit CV\_CAP\_VFW ou CV\_CAP\_DSHOW (ce qui est correct pour windows). J'ai réussi avec opencv2.4.11 à utiliser une caméra usb Microsoft, mais cela ne fonctionne pas avec la version 3.0. Affaire à suivre. Une autre solution (pour windows) serait d'utiliser directement les API multimedia de Windows et de passer ensuite les images recueillies à OpenCV. J'avais fait quelques essais prometteurs avec Rebol R2. A +

dockimbel

[09:07](#msg5684f05035e1a316162ecda7)@ldci Tu peux supprimer un message posté en cliquant sur les 3 points ... (tu as un menu qui apparait).

[09:08](#msg5684f0aa3acb611716005dc7)@ldci Pour l'API multimedia Windows, Red/View l'utilise déjà pour la widget `camera`, mais on ne supporte que DirectShow pour le moment.
