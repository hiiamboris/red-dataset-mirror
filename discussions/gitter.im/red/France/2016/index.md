# Archived messages from: [gitter.im/red/red/France](/gitter.im/red/red/France/) from year: 2016

## Monday 4th January, 2016

ldci

[11:46](#msg568a5b7e3acb61171600d333)Suite des tests avec Python c'est le même problème. On peut utiliser les cameras avec la version 2.4.11 mais pas la 3.0. Seul du code en C++ fonctionne pour cette version. J'ai regardé le code source et pour les caméras c'est pas simple. Je crois que si on veut utiliser les caméras avec windows, il faut se rabattre sur des versions antérieures.

## Tuesday 5th January, 2016

rcqls

[18:34](#msg568c0cc35dd644c75b6e0ea9)Salut @doc, en tant qu’amateur (pas un pro) de nombreux languages R, ruby, … , je suis juste impressionné par ce projet. J’avais été impressionné par Rebol mais pas convaincu par le côté non libre. Je me rappelle aussi des premières versions du R en tant que clone du language S (et Splus). Le projet red me rappelle d’ailleurs un peu les débuts du R. Même si le chemin reste long, j’apprécie la clarté des objectifs visés. Je pense que l’architecture x64 devrait être malheureusement plus prioritaire compte tenu des évolutions des ordinateurs et outils tels docker. J’ai essayé d’appeler le R dans red (comme je l’ai déjà fait avec ruby) mais je me suis trouvé limité par l’architecture x64 sur MacOSX. Je retenterais avec le R-i386 pour jouer. A l’état d’avancement actuel de red, je pense qu’une utilisation du type remplacement de bash serait appréciable (et juste magique) en proposant des livrables sur plusieurs plate-formes grâce à la cross-compilation. A ma connaissance, seul go sait le faire mais ce n’est pas aussi facile que pourrait le faire red. Du coup, j’ai vu ta remarque à @pekr sur console-call qui avec l’introduction du IO simplifié permettrait de pouvoir aller dans cette direction. Après avoir modifié les erreurs évidentes sur help.r et tmp non déclaré, je ne suis pas arrivé à le faire fonctionner et ce n’est pas grâve du tout… Merci pour faire exister ce projet!

## Wednesday 6th January, 2016

dockimbel

[04:37](#msg568c99fa17dc78be33870bd7)@rcqls Bienvenu et merci pour ton message ! Concernant la lib CALL, je vais y jetter un oeil...

[06:05](#msg568cae9c881538d260ace331)J'ai poussé un fix pour CALL, la console compile correctement maintenant si tu inclus la lib via:

```
#include %../../system/library/call/call.red
```

rcqls

[07:12](#msg568cbe56262659750bce7ddf)Merci! Cela marche bien en plaçant l’`include` ci-dessus directement dans `environment/call/console.red`.  
En revanche, `tests/console-call.red` une fois changé le chemin de %help.r renvoie (même si ce n’est pas grave) toujours:

```
red>> call "ls"
*** Syntax error: invalid value at 

*** Where: do
*** Stack: do-console while unless switch do code load either transcode unless cause-error do
```

[07:22](#msg568cc0bce8598dd060155899)Oups! Compte tenu du code de `console-call.red`, je pense qu’il n’aura bientôt plus aucun intérêt. Donc, dernière partie de mon message précédent à ne pas relever.

dockimbel

[07:35](#msg568cc3b9881538d260ace4b5)Je pense que `tests/console-call.red` est obsolète et il sera retiré une fois que la lib CALL sera transformée en module, importable via le champ `Needs:` dans l'entète.

rcqls

[07:52](#msg568cc7b1d9a9d7ea39cf9a78)Ce sera en effet plus adapté. Pour info, le lien de l’autobuild pour MacOSX est cassé. Je me demandais comment il était généré via rebol…  
En fait, par curiosité, j’aurais voulu tester la cross-compilation du nouveau console-call.red (i.e. console.red avec le dernière `include` que j’ai placé dans `environment/console` en attendant le `Needs:`) vers linux et windows à partir de MacOSX.

[07:53](#msg568cc816262659750bce7e9c)

dockimbel

[07:55](#msg568cc8759a5f8fe83921663e)Notre serveur de build MacOSX est fourni à titre gracieux par un membre de la communaute, et il est fréquent que ce serveur soit surchargé et ne génère pas à temps le binaire Mac. Je vais tenter de relancer la génération manuellement.

[08:04](#msg568cca73881538d260ace54b)Toujours pas de build malgré une relance du batch manuellement, j'ai contacté l'admin du serveur pour voir ce qui bloque.

rcqls

[08:30](#msg568cd0ac262659750bce7f80)Merci pour ta réponse mais rien de pressé! C’était plutôt pour t’informer…

[09:30](#msg568cdeb1262659750bce811d)@doc, la cross-compilation c’est juste magnifique! J’ai en effet fait un mini-test en cross-compilant sous MacOSX vers msdos et linux:

```
Red []
#include %Red/system/library/call/call.red
call/wait/console "ls"
```

et cela s’execute (grâce à mes VirtualBox) même sous MSys2 (via conemu) !  
Félictations! Jamais vu cet OVNI avant…  
J’ai plein d’espoir pour red en remplacement d’un outil du type bash (gestion d’installation, ou autre gestion système, …) et tout cela sans installation d’un ruby, python, ou autre….  
J’avais été bluffé par ce que red faisait en voyant le `build.r` de Kaj De Vos avec un simple script pour la création de binaires pour toutes ces plateformes.  
Je souhaite une longue vie à red qui est vraiment multi-faces à la différence de beaucoup d’autre langages.

dockimbel

[09:37](#msg568ce04ec5bdc5ba338e209d)@rcqls Haha, merci, content que tu apprécies Red ! ;-)

pchg

[10:10](#msg568ce81d84fa46770b24d7c4)Bonjour à tous, et tous mes voeux à la communauté des Redeux francophones pour que cette année 2016 soit bien meilleure que la précédente!

[10:12](#msg568ce89d262659750bce8220)@rcqls Toutafé d'accord pour le coup du remplacement de bash: c'est exactement ainsi que j'utilisais la console Rebol, dans le début des années 200, sur toutes mes plate-formes: GNU/Linux à la maison, windows au boulot et MacOS X sur l'ordi de mon épouse.

rcqls

[10:18](#msg568cea0ad9a9d7ea39cf9e19)@pchg mais à la différence de Rebol tu n’as plus besoin d’installer Rebol sur tous tes ordis pour executer tes scripts. Ruby, python,… pouvaient jouer aussi ce rôle. En revanche, Red et sa cross-compilation permet de faire sous un même système et tu n’as plus qu’à utiliser les binaires à la place des scripts sans aucune installation. C’est là le côté magique proposé par @doc. Je pensais que `lua`le faisait mais j’ai pas réussi à le faire car en fait cela passe par une compilation en C. En Red, c’est direct car c’était clairement l’objectif. Bravo!

pchg

[10:28](#msg568cec5c881538d260ace8aa)&gt; @pchg mais à la différence de Rebol tu n’as plus besoin d’installer Rebol sur tous tes ordis pour executer tes scripts.  
\=&gt; pardon pour ma bêtise et/ou mon incompréhension, mais j'ai peur de ne pas saisir. On a bien besoin d'un Red sur la machine, non? Ou alors j'ai loupé quelque chose de majeur dans l'évolution récente de Red (je suis toujours en phase de voir comment tout ça a évolué, après une longue absence déconnectée).

dockimbel

[10:30](#msg568cecc8262659750bce829b)@pchg Mes meilleurs voeux pour 2016 également. Je préfère Reders ou Redders (à prononcer comme dans "Raiders of the Lost Ark") ;-)

pchg

[10:31](#msg568cecfa17dc78be33871357)@dockimbel Je sens comme une force dans le Redder...

dockimbel

[10:31](#msg568ced19e8598dd060155cfe)@pchg Attention, ça devient limite...:)

pchg

[10:32](#msg568ced4bd9a9d7ea39cf9e82)@dockimbel Voilà, c'est mieux?... ;o)

rcqls

[10:33](#msg568ced5f881538d260ace8c9)@pchg Quand tu veux executer un même script Rebol sur plusieurs machines avec des OS différents, tu as besoin de Rebol sur tes machines. Avec Red, tu n’as plus nécessairement un script mais des binaires que tu peux compiler sur une seule machine pour servir toutes tes machines et ce indépendamment des OS grâce à la cross-compilation. Est-ce plus clair?  
J’ai eu du mal à comprendre à part un jour où j’en ai eu vraiment besoin pour faciliter les installations.

[10:34](#msg568cedbcc5bdc5ba338e2235)Tu peux toujours aussi utiliser Red avec des scripts...

pchg

[10:35](#msg568cedd89a5f8fe839216a3c)@rcqls Au quai, pigé. Mais là, on tombe dans le domaine du compilé, et non plus du remplacement du bash par le REPL Red.

[10:36](#msg568cee18881538d260ace8db)@dockimbel En parlant de ça: j'ai récemment re-parcouru un des tutoriels inimitables de Nick, et un de ses arguments "marketing" qu'il exposait pour Rebol me parle pas mal: il dit que comme Rebol n'est pas un nom commun ni rien de connu (à part quelques familles portant ce nom), la première recherche par un moteur quelconque pointe forcément sur des résultats pertinents.

rcqls

[10:37](#msg568cee64262659750bce82d8)C’est du compilé et donc plus rapide pour lancer des tâches et c’est ce que fait le bash en moins rapide...

pchg

[10:37](#msg568cee69881538d260ace8e7)Et c'est vrai que mon agrégateur de nouvelles à qui je fais chercher quotidiennement les nouvelles concernant "Python", "PostgreSQL", "Rebol", "Variscan", etc. me renvoie pas mal de choses complètement hors-propos concernant Python.

[10:39](#msg568ceec9c5bdc5ba338e224d)Du coup, je me demandais (je crois que je radote) si, au point où en est le projet Red (c'est-à-dire encore assez confidentiel) s'il ne serait pas idoine de choisir un nom plus neutre, moins commun, plus gouglable.

[10:39](#msg568ceef5c5bdc5ba338e2252)Ce n'est en aucun cas une critique, juste une pensée, une idée se voulant constructive.

dockimbel

[10:40](#msg568cef2184fa46770b24d8a9)@pchg L'unicité du nom d'un langage de prog n'a jamais été un facteur pertinent pour sa diffusion et succès, ex: C, R, Ruby, Python, Go...

[10:41](#msg568cef46262659750bce8302)Bash est effectivement extrèmement lent à l'éxecution...

rcqls

[10:43](#msg568cefcb262659750bce831d)Tout à fait d’accord sur le nom! Et Red commence par R ce qui est bizarrement une caractéristique de mes langages favoris R, ruby et maintenant Red. Red c’est aussi la couleur du couteau-suisse qui illustre bien le concept multifacettes de Red.

pchg

[10:44](#msg568ceff99a5f8fe839216a7e)@dockimbel Oui, je suis d'accord; mais pour rechercher des choses, avec python, on est obligé de rajouter des choses, sinon on donne dans l'herpétologie. Alors que le mot Rebol est assez magique pour cela.

dockimbel

[10:44](#msg568cf00317dc78be338713aa)Red =&gt; couteau-suisse, bien vu !! Il faut que je réutilise çà dans mes slides de présentation. ;-)

pchg

[10:44](#msg568cf01f881538d260ace915)@rcqls Red\_swiss\_armi\_knife!

[10:44](#msg568cf0279a5f8fe839216a86)Oui, toutafé!

dockimbel

[10:45](#msg568cf04784fa46770b24d8ce)@pchg Ajoute juste "programming" derrière "python" et çà devrait te retourner des résultats tout à fait pertinents. ;-)

rcqls

[10:46](#msg568cf077e8598dd060155d62)@pchg, ou des fois « lang » suffit pour beaucoup d’autres langages moins connus!

pchg

[10:46](#msg568cf09f262659750bce8339)Oui, c'est ce que je fais, bien sûr. Je rajoute plutôt des trucs du genre numpy ou scipy, et j'ai tout de suite des choses pertinentes. Mais avec Rebol, point besoin de ça, tellement le nom est unique.

dockimbel

[10:47](#msg568cf0a917dc78be338713b8)"&lt;language&gt; programming" est la requête utilisé par Tiobe pour fabriquer ses classements mensuels.

pchg

[10:47](#msg568cf0b484fa46770b24d8e2)C'est qui; @pkg?

[10:47](#msg568cf0d317dc78be338713ba)Non, mais bon, j'arrête d'argumenter; c'était le troll du matin (dans mon fuseau horaire).

dockimbel

[10:48](#msg568cf0e384fa46770b24d8ea):)

pchg

[10:48](#msg568cf0ebe8598dd060155d74)Une question moins trolleuse:

[10:50](#msg568cf16684fa46770b24d903)J'utilise avec grand'joie le pilote Rebol 2 pour PostgreSQL (grand merci à son développeur! ;-)). Je suis tombé sur un petit os: j'ai voulu faire passer des requêtes du genre ALTER ROLE, et j'ai eu une fin de non-retour. Il me semble aussi que les requêtes du genre CREATE ou trucs du genre ne sont pas supportées. J'avoue que ça me serait assez utile.

[10:50](#msg568cf18dd9a9d7ea39cf9f1c)J'ai commencé à regarder le code du pilote. Je me suis paumé assez rapidement...

[10:51](#msg568cf1a3d9a9d7ea39cf9f21)2 questions, donc:

[10:52](#msg568cf207881538d260ace950)1: (pour rester dans le sujet Red) le pilote pour PostgreSQL pourra-t-il être porté/migré/adapté aisément dans Red, et à quel terme environ? Quel degré de technicité/connaissance est-il nécessaire pour mener cette tâche à bien (comprendre: serait-ce à ma portée?)

dockimbel

[10:54](#msg568cf25c9a5f8fe839216ac3)Je n'ai pas mis à jour le pilote depuis la version 7.3 ou 7.4...

pchg

[10:54](#msg568cf269d9a9d7ea39cf9f30)2: le support des requêtes SQL type DDL serait-il aisé à implémenter dans le pilote? J'ose supposer que oui, bêtement, dans la mesure ou d'une part le SQL de postgres est remarquablement stable et standard, et d'autre part, il ne s'agirait, somme toute, que d'envoyer du texte au serveur.

[10:55](#msg568cf2a684fa46770b24d92d)@dockimbel Ce qui ne fait pas mentir l'adage américain "if it ain't broken, don't fix it" =&gt; j'utilise avec bonheur ce pilote avec mon serveur en 9.4. Et je peux le tester aussi sur mon 9.5 bêta, au besoin.

dockimbel

[10:56](#msg568cf2cb17dc78be33871401)De mémoire le protocole de communication Postgres est relativement simple et bien documenté (contrairement à MySQL), donc écrire un nouveau pilote pour Red devrait être assez simple. Pour ce faire, il faut juste attendre le support TCP, c'est la dernière partie manquante pour écrire ce genre de pilote.

pchg

[10:56](#msg568cf2e29a5f8fe839216ad9)Je peux certifier que le pilote tourne nickel avec toutes mes versions de postgres.

[10:57](#msg568cf2fd9a5f8fe839216ade)@dockimbel Super!

dockimbel

[10:57](#msg568cf3019a5f8fe839216ae1)L'équipe de Postgresql fait vraiment du bon boulot.

pchg

[10:57](#msg568cf3099a5f8fe839216ae3)Oh que oui!

dockimbel

[10:57](#msg568cf31d17dc78be33871414)DDL: tu peux préciser ?

pchg

[11:03](#msg568cf49f262659750bce83ba)Data Definition Language: tout ce qui est CREATE TABLE toto (id integer); par exemple.

[11:04](#msg568cf4ae84fa46770b24d97e)Ou encore CREATE VIEW saleté AS SELECT id FROM toto;

[11:04](#msg568cf4c084fa46770b24d982)C'est un sous-ensemble du SQL.

[11:05](#msg568cf4e89a5f8fe839216b30)https://fr.wikipedia.org/wiki/Langage\_de\_d%C3%A9finition\_de\_donn%C3%A9es

dockimbel

[11:09](#msg568cf5d6d9a9d7ea39cf9fbb)La doc du protocole de communication pour le pilote: http://www.postgresql.org/docs/9.4/static/protocol.html

pchg

[11:24](#msg568cf968e8598dd060155eae)Protocole qui n'a pas évolué depuis bien longtemps: "This document describes version 3.0 of the protocol, implemented in PostgreSQL 7.4 and later" dans la doc 9.4. J'ADORE la stabilité!

[11:29](#msg568cfa8a84fa46770b24da51)Red est implanté aux États-Unis d'Amérique du Nord?  
https://ff0000.com/contact/careers/56  
;)

## Thursday 7th January, 2016

pchg

[09:05](#msg568e2a52bd765f6604eb38fa)Une idée me trotte derrière la tête depuis un moment: je suis à l'ABUL (association bordelaise de libristes), je leur cause depuis un moment de Red et/ou de Rebol. Vu qu'on est au moins deux Redboleurs dans le Sud-Ouest, je me demandais s'il ne pourrait pas être possible d'organiser un genre de conf-atelier dans le coin.

[09:05](#msg568e2a700cdaaa62045a7534)Je pense que ça pourrait être fructueux en terme de communication. Il y a dans les rangs de l'ABUL un certain nombre de furieux.

dockimbel

[09:10](#msg568e2b68349c385404026391)@pchg Si tu peux trouver une conf intéressée par une présentation de Red ou organiser une conf avec suffisament de personnes, je pourrais peut-être faire un saut à Bordeaux.

pchg

[09:10](#msg568e2b80bd765f6604eb3925)Ah!

[09:10](#msg568e2b8e349c385404026396)Je vais passer le mot sur la liste abul-tech.

[09:24](#msg568e2ed627149e5804f1bbca)Plutôt une conf avec plein de monde, donc? Ou un atelier pratique avec moins de gens, mais des passionnés-accros?

dockimbel

[09:30](#msg568e3049e0cedc53047f244d)Conf avec plein de monde. Si je me déplace, ça sera pour convaincre un maximum de developpeurs d'essayer Red.

pchg

[09:32](#msg568e30a7e0cedc53047f2464)Au quai. Dans le public visé (les abonnés à Abul-tech), il y a des dev, des sysadmins, des devops, des libristes acharnés de tout poil.

## Friday 8th January, 2016

ldci

[15:43](#msg568fd90d7668d00a4ab46dab)@pchg : je suis partant pour venir à Bordeaux et présenter Red/OpenCV

[15:46](#msg568fd9f287cb99b53b87f493)@dockimbel : pour VideoCapture, je pense pouvoir créer un dll avec Rebol3 qui supporte le C++ maintenant. J'ai fait un test hier et Red est capable d'accéder sans problème à une dll écrite en R3. Affaire à suivre, mais la semaine prochaine est très chargée pour moi.;)

pchg

[15:56](#msg568fdc1587cb99b53b87f528)@ldci Super! Merci! Je suis en train de rédiger un petit émail, je tente de peser mes mots.

[17:38](#msg568ff40287cb99b53b87fa83)(pour ne pas faire trop lourd, ni trop timidou, mais quand même un peu vendeur)

[18:12](#msg568ffc00ee13050b38a26d9b)Voilà, j'ai fait passer ça sur la liste technique de l'ABUL:  
http://listes.abul.org/arc/tech/2016-01/msg00023.html

ghost~5585eedf15522ed4b3e236ae

[18:57](#msg569006a1d739f50a3602801b)@pchg : Chouette présentation au ton décontraqueté.

[18:58](#msg569006eb8fdd3c0c382d8b98)@pchg : Est-ce que tu as des contacts pour proposer la même chose sur Toulouse. C’et pas loin et encore plus dynamique.

## Saturday 9th January, 2016

pchg

[14:56](#msg56911f98766922073602c12a)@lkppo J'ai des contacts à Condom, qui est encore moins loin (...).

[14:56](#msg56911fb80712a5b63b4c74fb)Du côté de Toulouse, j'ai possibilité d'avoir des contacts, mais pour le moment, pas de trop.

[14:57](#msg56911fc3ee13050b38a28dc8)Je vais y creuser.

## Sunday 10th January, 2016

ghost~5585eedf15522ed4b3e236ae

[00:21](#msg5691a3f287cb99b53b882abd)De mon coté j’ai participé aux QJelt il y a une douzaine d’années quand j’étais à Toulouse pour les études, pas de contact depuis. Tu peux peut-être écrire à celle liste : http://www.toulibre.org/mailman/listinfo/toulibre-orga

[00:29](#msg5691a5eb766922073602d029)@pchg : En passant, je viens d’apprendre cette semaine que l’entreprise où je travaille va fermer le site de Miramont-de-Guyenne d’ici l’été, donc je me permets de lancer un petit appel (mon CV est ici : http://saulery.free.fr/cv\_saulery.pdf).

## Monday 11st January, 2016

pchg

[09:19](#msg569373a9ee13050b38a2cb8e)@lkppo Oui, je pensais à Toulibre, en effet. J'ai des gens qu'il faut que je contacte, par ailleurs.

[09:21](#msg5693742c5fd2ae3c32b4d356)@lkppo Hm. Décidément, c'est la galère partout, en ce moment. Je suis aussi en train de me recycler et de changer de métier, impératifs (et non pas "réalités") économiques obligent...

ghost~5585eedf15522ed4b3e236ae

[09:51](#msg56937b155fd2ae3c32b4d4cc)Et bien.

## Wednesday 13th January, 2016

pchg

[09:33](#msg569619dfd739f50a36034291)@lkppo Ce CV doit pouvoir aisément être amélioré en ajoutant une paire de mot-clés: Rebol et Red ;-)

dockimbel

[09:43](#msg56961c39ee13050b38a33cb1)@pchg Suggestion: créer ton CV en utilisant le dialect PDF de Rebol et intègre le lien vers le code source de ton script dans le CV lui-même. ;-)

ghost~5585eedf15522ed4b3e236ae

[09:50](#msg56961dfeee13050b38a33cf9)Que d'idées. Mon CV n'est pas génial au point de remuer les foules et les amener à Rebol / Red.

dockimbel

[09:55](#msg56961f117669220736036696)Tout ce qui sort de l'ordinaire dans un CV est un bon moyen d'attirer l'attention d'un recruteur.

pchg

[10:22](#msg569625700712a5b63b4d1f9f)@dockimbel Oh, c'est pas couillon, ça! J'avais fait ça naguère, mais c'était en... python, je crois? Je ne me rappelle plus. Je faisais du .html en détaillant plus ou moins les détails de mon parcours sur cette Terre.

[10:24](#msg569625e676692207360367af)@lkppo Cela peut être l'inverse: ce peuvent être les foules (discrètes) qui soient amenées à apporter de l'atention au dit CV, de par la présence de Rebol/Red... Ces outils sont des monstres d'efficacité pour les sysadmins, notamment, et certaines personnes le savent. Maintenant, le tout est de savoir si elles sont décideuses, c'est une autre histoire...

ghost~5585eedf15522ed4b3e236ae

[11:43](#msg56963856a03e28ad1ade6d99)@pchg : Déjà que Debian, Ruby, Perl dépayse les décideurs, alors Red, c’est un véritable voyage oriental.

pchg

[12:40](#msg569645b0da358920486e6bb9)@lkppo ;-D

dockimbel

[12:42](#msg56964618c391361d48ead216)@lkppo Bien vu. ;-)

ghost~5585eedf15522ed4b3e236ae

[12:47](#msg5696475b59e3d04215bb7aae)Si seulement il n'y avait pas déjà WinDev... ha WinDev. Je peux vous dire que doter Red d'une bonne abstraction GUI avec de l'événementiel et tous les anciens de VB 6 vont lui manger dans la main.

[12:48](#msg5696479b28b4586d1c8c659d)@dockimbel : Je m'occupe de la page wiki sur la coloration syntaxique ce soir.

dockimbel

[12:49](#msg569647c52bc35f6c1c19d3ef)@lkppo C'est une des strategies auxquelles je pense depuis le debut de Red. Les devs VB 6 sont une excellente cible pour Red.

[12:50](#msg5696480a2bc35f6c1c19d400)Je pensais meme coder un compilateur VB vers Red (incluant la conversion des .frm vers du code VID/View).

[12:51](#msg5696484cc391361d48ead29a)@lkppo Ok, super, des que c'est pret, je tweet le lien.

pchg

[12:52](#msg56964884da358920486e6c64)VB2Red? Oh purée... Oui, ça, ce serait de l'idée... Mais il y a quand même pas mal de choses qui éloignent ces langages.

[12:53](#msg569648e62bc35f6c1c19d430)@dockimbel Et les devs VB3, alors? (ceux qui n'ont pas suivi la surenchère assez inutile, et qui sont toujours contents de leur VB3?)

[12:54](#msg569648f62bc35f6c1c19d432)Mais bon pareil, il ne doit pas en rester beaucoup, ça ne fait pas un public bien abondant.

dockimbel

[12:55](#msg56964925c391361d48ead2ce)VB est un langage tres bas niveau compare a Red, donc la conversion vers Red serait simple.

pchg

[12:55](#msg569649492bc35f6c1c19d43e)Bas niveau n'étant pas à prendre au sens "près du métal", I suppose...

ghost~5585eedf15522ed4b3e236ae

[12:55](#msg5696494d2bc35f6c1c19d440)@pchg : Pour la programmation de logiciel de gestion VB6 était "idéale". C'est vrai que Red est très différent. Il faudrait surtout avoir un dialect VID stable qui permet d'écrire un IDE comme celui de VB6 (GUI / événementiel / BDD).

dockimbel

[12:56](#msg5696496a2bc35f6c1c19d449)@pchg "Bas niveau d'abstraction"

pchg

[12:57](#msg569649c83165a6af1a3b8046)Je n'ai jamais goûté à la version 6, mais c'est sûr que la gestion du GUI/évènementiel était doigts dans le nez, dès le départ. À l'époque où je codais en VB, je n'avais pas (encore) de penchant pour les BDD.

[12:58](#msg569649eac391361d48ead2fb)Pour ce qui concerne Bordeaux, j'avais annoncé sur la liste abul\_tech, mais ce n'est apparemment pas la meilleure place. Faut que je m'inscrive sur la liste asso (et encore une liste...), pour réitérer.

ghost~5585eedf15522ed4b3e236ae

[12:58](#msg56964a03a03e28ad1ade70a6)@pchg : VB3 ? Il en reste ? Sérieusement il y a beaucoup de déçus par les évolution de .Net. VB3 avait le même type d'éditeur, je ne savais pas.

pchg

[12:58](#msg56964a1228b4586d1c8c6608)@lkppo Si tu as des contacts à Toulouse, vas-y; de mon côté, ça prendrait trop de temps, je pense.

[12:59](#msg56964a3fda358920486e6ca7)@lkppo Il en reste... Disons que bon, le seul VB que je fasse encore tourner (TRÈS rarement, en moyenne une fois tous les ... 3 ans?) est la version 3.

[13:00](#msg56964a7e5de13b3f15e2cd20)Quant à .NET, j'en ai entendu le plus grand mal de partout, notamment par le fournisseur de mon seul logiciel métier, à qui Crimo$oft a fait réécrire tout son code, parce qu'il ne supporterait plus les MFC...

ghost~5585eedf15522ed4b3e236ae

[13:00](#msg56964a8728b4586d1c8c662b)@pchg : j'ai participé plusieurs fois au Qjelt il y a 10/12 ans, mais entre les deux, gros blanc.

pchg

[13:02](#msg56964ad43165a6af1a3b8072)Résultat, ils ont migré en .NET, ils ont répercuté le coût sur le prix de la licence. Et ils sont passé d'un produit sympa, abordable, très professionnel, qui se téléchargeait assez aisément, en un espèce de bloatouaire qui ne fait rien de plus, mais qui pèse des Giga, sans compter les .NET à télécharger de partout, et un prix nettement moins compétitif...

[13:02](#msg56964aec5de13b3f15e2cd41)@lkppo C'est l'occasion de remplir le blanc! ;)

ghost~5585eedf15522ed4b3e236ae

[13:03](#msg56964b2ca03e28ad1ade70e5)@pchg : bon je vais faire un sondage alors sur leur liste de diffusion.

[13:05](#msg56964ba7a03e28ad1ade70fe)@dockimbel : A quelle période dois-tu passer en France Nenad ? Je suppose que tu voudrais faire une présentation.

ldci

[13:07](#msg56964c0528b4586d1c8c6681)@dockimbel : c'est réglé pour les caméras sous windows via une lib C++ que j'ai écrite et qui utilise une structure C++ VideoCapture et exporte ensuite 5 méthodes en extern "C". Il faudrait que quelqu'un fasse un test car mon compilateur est 64-bit. Je vais inclure le code dans un répertoire expérimental dans la distribution sur GitHub. Toute le monde pourra adapter à ses besoins. A plus.

ghost~5585eedf15522ed4b3e236ae

[13:08](#msg56964c5e28b4586d1c8c6691)@dockimbel : La conversion des opérations de GUI en elles-mêmes serait peut-être simple mais pour le reste du code et l'événementiel ça passerait ?

[13:11](#msg56964d172bc35f6c1c19d4fa)Tk est sympa mais on est vite bloqué. Gtk, wxWidget et Qt sont multiplateformes mais très lourds.

ldci

[14:58](#msg56966600a03e28ad1ade769f)Caméras testées sous windows en 32 bits: parfait. je n'ai plus qu'à faire le lien avec Red!

## Thursday 14th January, 2016

dockimbel

[07:22](#msg56974c9da03e28ad1ade9d8b)@lkppo Pas de dates précises encore, entre Mars et Août prochain.

[07:23](#msg56974ce72bc35f6c1c19fda8)@ldci Super, dis-moi quand ce sera dispo sur Github.

[07:24](#msg56974d35a03e28ad1ade9d94)@lkppo Sans problème, les fonctionnalités VB sont un petit sous-ensemble de ce que Red peut faire.

## Sunday 24th January, 2016

SteeveGit

[11:08](#msg56a4b0a9586242210adf3492)

[11:08](#msg56a4b0af6b6468374a09300e)

[11:08](#msg56a4b0bbc54bc2bf180bb4e8)

## Monday 25th January, 2016

ldci

[16:43](#msg56a650a4dc33b33c7547c20d)Mise à jour d'OpenCV 3 pour Red sur GitHub. Amusez vous bien :)

dockimbel

[17:06](#msg56a656308fbaf4220af937dd)@ldci Merci, on est en train de tenter de faire un binding pour ta lib C, je te tiens au courant.

## Wednesday 3th February, 2016

ldci

[11:09](#msg56b1dfd1c54bc2bf180db7b4)Tout fonctionne avec Windows 10. C'est ici https://github.com/ldci/OpenCV3-red

[11:09](#msg56b1dffa80ad69394a7c206d)@dockimbel : merci de mettre à jour le lien sur la page de Red :)

dockimbel

[17:10](#msg56b234795245f2e110e710e9)@ldci C'est fait. ;-)

## Thursday 4th February, 2016

ldci

[06:44](#msg56b2f359093185ca35a77b71)Merci Doc

## Saturday 6th February, 2016

ldci

[09:59](#msg56b5c40e1c80c61f4d0aab23)Aide demandée! Manifestement il y a des spécificités Pour Linux. J'ai fait une installation propre d'un linux mint en 32 bits et commencé à tester le code opencv: tout fonctionne parfaitement sous OSX et Windows, mais pas sous Linux. Par exemple CvMerge demande une image 4 canaux sous Linux alors que 3 canaux suffisent pour les autres OS. De la même façon, certaines fonctions entraînent des segmentation faults incompréhensible. Vite un Linuxien à l"aide!

## Tuesday 16th February, 2016

ldci

[10:27](#msg56c2f98838f56aa31f3a407d)Pas très actif en ce moment: trop de dossiers à gérer. J'ai mis à jour sur GitHub une version qui modifie CVarr! en int-ptr! C'est plus simple pour l'accès aux structures. A +

## Monday 22nd February, 2016

pchg

[09:24](#msg56cad3ce1aea4f306752d270)Bonjour, trop de dossiers à gérer pour moi aussi, hélas!

[09:26](#msg56cad45ee1786831677c6ecf)@ldci je vais essayer de voir ça, en tant que Linuxien.

[09:32](#msg56cad5bbe1786831677c6f07)@lkppo Je vais demain à Toulouse à ce meetup: http://www.meetup.com/fr-FR/PostgreSQL-User-Group-Toulouse/events/228604600/?eventId=228604600&amp;read=1&amp;\_af=event&amp;\_af\_eid=228604600  
La formule meetup est sympa, j'ai découvert ça la semaine dernière avec neo4j. Je vais demander comment faire pour organiser un meetup consacré à Red.

[09:34](#msg56cad61c568360a24892bd4c)(Je tiens à préciser que, contrairement à ce que semble penser mon épouse, ceci n'est pas un site de rencontres. Enfin, si. Mais entre informaticiens.)

SteeveGit

[09:49](#msg56cad993631af87d5c44e587)Tant qu'il n'y a pas d'effet de bord... :neutral\_face:

ldci

[13:22](#msg56cb0baf1aea4f306752dcb1)@tous: quelques améliorations pour OpenCV3/Red sur GitHub

## Thursday 25th February, 2016

lxc4s

[10:59](#msg56cede7ccefdb7b850f3bc1c)bonjour a toutes et a tous je suis nouveau et j'aimerai apprendre les bases du codage si quelqu'un peu m'aider

## Friday 26th February, 2016

dockimbel

[09:15](#msg56d017999b88648d7a082088)@lxc4s Bonjour. Ce groupe est consacré à l'usage du langage Red, pas vraiment à l'apprentissage des bases de la programmation (quoique Red est un bon choix pour commencer). Je serai curieux de savoir par quel chemin tu es arrivé ici ?

## Sunday 28th February, 2016

StephaneVeneri

[14:00](#msg56d2fd65b79fb81f187aa6b6)@dockimbel J'ai analysé le problème du GetGestureInfo, il y a deux problèmes:  
\- la fonction GetGestureInfo n'est disponible qu'à partir de Windows 7 (V6.1) et de Windows Server 2008 R2 (V6.1), d'après le site de Microsoft (https://msdn.microsoft.com/fr-fr/library/windows/desktop/dd353235(v=vs.85).aspx). Or, je l'ai testé sur un Windows Server 2008 (V6.0).  
\- ma version d'XP est une "version modifiée" donc le texte donnée par la commande cmd /c ver n'est pas identique à la version officielle (voir ci-dessous) ce qui explique pourquoi il intègre le support de la gesture.  
Microsoft Windows XP \[version 5.1.2600]  
Windows XP Sweet 5.1 \[SP3 v5.1.2600]  
Microsoft Windows \[version 6.0.6002]

Je peux corriger le premier problème en mettant la version 6.1 comme version minimum pour l'intégration de la gesture. Pour le second, accepte tu un fix pour cette version non officielle ?

dockimbel

[14:23](#msg56d302cad7513d907aa5e3d3)@StephaneVeneri Il n'est pas clair si Vista supporte l'API Touch ou pas: https://msdn.microsoft.com/en-us/library/windows/desktop/ms699430(v=vs.85).aspx

[14:24](#msg56d30307d2637aec24d537a1)Si Vista ne le supporte pas, alors on peut élever la version require à 6.1.

[14:30](#msg56d30481649ae49a694b065f)Le code modifié suivant parse correctement les différentes versions (Chinoise incluse):

```
parse/all buf [[thru "[" | thru "Version" | thru "ver" | thru "v"] to #"." pos:]
	win-version: any [
		attempt [load copy/part back remove pos 2]
		0
	]
```

[14:31](#msg56d304a49a059be9245ed9f8)Sinon, oui, tu peux envoyer un fix sous forme de Pull Request (eventuellement en utilisant mon code ci-dessus).

StephaneVeneri

[16:20](#msg56d31e3ab79fb81f187aace9)@dockimbel Il nous reste un PC sous Vista dans ma boite, il sera librement disponible mardi, j’en profiterai pour faire un test ainsi on sera fixé.  
Ton code modifié est clairement plus élégant que ce que j’aurais proposé (je manque cruellement d’xp en Rebol et le parse est encore un monde à découvrir pour moi), je l’intégrerai mardi dans un fix si tu ne l’as pas déjà fait.

## Monday 29th February, 2016

dockimbel

[06:13](#msg56d3e17b9a059be9245f07fc)@StephaneVeneri Non intégré, je te laisse le soin de le faire. La règle `thru "ver"` n'est peut-être pas nécessaire, je l'ai ajouté juste "au cas où" une version custom de Windows l'utiliserait.

## Tuesday 1st March, 2016

StephaneVeneri

[22:37](#msg56d619ad0bdb886502f6854b)@dockimbel J’ai pu faire le test sur le Vista (V6.0.6002) et effectivement le message d’erreur concernant GetGestureInfo se déclenche. J’en ai profité pour ajouter une règle `thru "indows"` pour ceux qui utilisent wine qui se permet quelques libertés dans l’affichage de la version, du genre "Microsoft Windows 6.1.7601 (1.9.3) ".  
Je m’attelle à la génération d’une Pull Request (j’espère ne pas trop galérer ne maitrisant pas git).

[23:48](#msg56d62a33f760676329bac5f0)Pull Request envoyée, désolé j’ai « merdoyé » avec les tabulations. Le rendu entre Atom et Github est différent chez moi. C’est bien toujours 4 espaces pour une tabulation ?

## Wednesday 2nd March, 2016

dockimbel

[03:48](#msg56d6627d048f9e65291b42c0)Oui, 1 tab = 4 spaces.

[03:49](#msg56d662e750b462292adf4e9c)Pour la règle "Windows", le matching par défaut est insensible à la casse:

```
>> parse "Windows" [thru "Windows"]
== true
>> parse "Windows" [thru "windows"]
== true
>> parse/case "Windows" [thru "windows"]
== false
```

StephaneVeneri

[22:09](#msg56d764a344ba0664026a9a05)@dockimbel Merci, c’est noté.

## Saturday 26th March, 2016

rcqls

[04:59](#msg56f6171aaaf8f1a914e666bb)@dockimbel Merci à toi et ton équipe pour ce travail juste fantastique! Je suis votre travail régulièrement. La surprise du chef est l’annonce du MacOSX backend (Merci à @qtxie) introduite via un tweet mais (sauf erreur de ma part) jamais annoncé dans Trello. Bravo!

dockimbel

[05:33](#msg56f61f1472bf52bd58e74835)@rcqls Merci ! Oui, il faut bien qu'on garde quelques éléments de surprises, il y aura d'autres surprises à venir. ;-)

rcqls

[07:23](#msg56f63901aaf8f1a914e666e7)@dockimbel Je croyais que c’était le temps du repos bien mérité! Je comprends cependant ton excitation. Je comprends aussi que tu sois un expert en surprise puisque tu as eu l’idée de Red qui est une SURPRISE à lui tout seul avec son cahier des charges très ambitieux déjà défini jusqu’au red 2.0. Penses tout de même à te reposer car red a plus qu’un bel avenir!

dockimbel

[07:28](#msg56f63a13aaf8f1a914e666f1)@rcqls Je vais recharger mes batteries ce weekend, j'ai commencé déjà par une écoute intensive de Philippe Katherine... tout en fixant quelques nouveaux bugs. ;-))

rcqls

[07:33](#msg56f63b4872bf52bd58e74849)@dockimbel Intéressant comme référence musicale! C’est en effet revigorant!

[09:46](#msg56f65a626d20f28b42f2456d)@dockimbel pour le « Getting Started » je rajouterais `chmod u+x` pour les MacOSX et Linux utilisateurs après le « download ». Ca y est c’est parti! Beaucoup de monde sont excités maintenant!

dockimbel

[09:47](#msg56f65a996d20f28b42f2456f)Oui, ça manque...Fait ! Merci ! ;)

## Wednesday 30th March, 2016

fvanzeveren

[11:41](#msg56fbbb7ad39de41b495eeeef)Bonjour, je suis l'auteur des scripts rebol simetrics.r (au coeur du moteur de recherche de scripts du site rebol.org) et de parse-expression.r (un dialect de parsing d'expressions mathématiques) disponible sur rebol.org. Je souhaite les porter sur RED et j'ai déjà fait les adaptations suivantes: 1) remplacement des expressions a: make block! \[] par a: \[] , 2) replacement de forskip qui n'est pas supporté par RED, 3) remplacement de parse/all par parse, puisque le raffinement /all n'existe pas dans RED, mais que le comportement par défaut de RED est celui induit par le raffinement /all sous REBOL. Par contre, je sèche sur le mot 'change qui n'existe pas sous RED. Je pensais pouvoir utiliser poke, mais ce mot ne semble pas fonctionner, en tout cas pas comme la documentation REBOL le décrit. Merci pour votre aide. Cordialement

SteeveGit

[11:53](#msg56fbbe23e4a8384a1bbd36ec)poke semble fonctionner chez moi. Peux-tu fournir un exemple ? REBOL et RED sont encore dissemblables sur pas mal de fonctions de base. La jonction des 2 devrait s'améliorer avec le temps

fvanzeveren

[11:56](#msg56fbbf04e4a8384a1bbd372b)Sous RED

```
poke "AXB" 2 #"/"
== #"/"
```

Sous rebol

```
poke "AXB" 2 #"/"
== "A/B"
```

SteeveGit

[11:58](#msg56fbbf6911ea211749c31f0b)oui la valeur retournée n'est pas la même mais les 2 chaines ont été modifiées.

fvanzeveren

[12:00](#msg56fbbfe8d9b73e635f679731)Ah, oui :) Mais je trouve que renvoyer la valeur modifiée est plus intéressante, car permet de chainer des instructions...

SteeveGit

[12:00](#msg56fbbfeee4a8384a1bbd3772)

```
red>> poke s: "AXB" 2 #"/"
== #"/"
red>> s
== "A/B"
```

[12:01](#msg56fbc01ce4a8384a1bbd377b)oui c'est vrai. Ce sera pr1obalement corrigé. Tu peux soumettre un ticket en attendant

fvanzeveren

[12:03](#msg56fbc08011ea211749c31f63)OUps, tiens, je me suis trompé, rebol retourne la même chose que RED... J'étais fatigué hier soir quand... Pourtant, je maintiens que ce serait bien de retourner la chaine modifiée...

[12:05](#msg56fbc1158f5147e119f1bd6e)En fait, la fonction 'change retourne la valeur modifiée, et je m'attendais à un comportement similaire...

SteeveGit

[12:08](#msg56fbc1ba76b6f9de194c7774)Le mieux pour le moment, c'est d'écrire ta propre fonction qui simule \*\*change\*\*. Car c'est certain qu'elle sera intégrée à RED un jour ou l'autre.

dockimbel

[12:10](#msg56fbc237d39de41b495ef0e4)@fvanzeveren Bienvenue !  
1\) `a: make block! []` n'est pas équivalent à `a: []` (autant en Red qu'en Rebol). Je te suggère d'utiliser `a: make block! 1` si tu veux réallouer un nouveau block à chaque passage (encore mieux: fournir une valeur maximum approximative pour éviter les réallocations mémoires quand le block est étendu).

2\) Porter la fonction `forskip` de Rebol2 vers Red est trivial (je te fournis une version dans qq minutes).

3\) `change` sera ajouté très bientôt, en attendant, il suffit de faire un `remove` puis `insert` pour le simuler.

[12:19](#msg56fbc446e4a8384a1bbd38d2)@fvanzeveren \[forskip](https://gist.github.com/dockimbel/db32d45ca7fd722c8e92f63b31626234) porté sur Red.

SteeveGit

[12:21](#msg56fbc4ba8f5147e119f1beaa)C'est du rapide !

fvanzeveren

[12:21](#msg56fbc4bd76b6f9de194c7884)Bonjour Nenad... Tu ne dois certainement pas te rapeller de moi, mais j'ai participé au RUG à Lille en mai 2011 où tu avais présenté, à une poignée de passionné, dont Olivier Auverlot si ma mémoire est bonne, les prémisses de RED...

dockimbel

[12:22](#msg56fbc501bbffcc665faa84df)@fvanzeveren Oui, je me souviens du RUG et du déjeuner avec les rebolers locaux. ;-)

fvanzeveren

[12:22](#msg56fbc50676b6f9de194c78a1)@dockimbel  
Merci pour la réponse, je vais suivre tes conseils pour le portage...

[12:25](#msg56fbc5b3bbffcc665faa851d)Dans un resto Au vieux de la vieille, ou qqch comme cela...  
En tout cas, que de chemin parcouru.... Je me souviens avoir été fort impressionné par les ambitions présentées... et être quelque peu dubitatif sur la faisabilité... Mais aujourd'hui, chapeau pour le travail accompli! Cela m'a redonné envie de programmer à nouveau en REBOL/RED. J'entrevois sérieusement un avenir à ce langage.

SteeveGit

[12:26](#msg56fbc5df8d2a72471b7b690f)On croise tous les doigts

fvanzeveren

[12:28](#msg56fbc673d39de41b495ef25b)J'ai même ressorti hier le livre d'Olivier Auverlot "Programmation Rebol" dans la collection "Coming Next" (le nom de la collection va peut-être finalement se réaliser... mais avec RED :) ). Il est dans un état de délabrement tellement je l'ai feuilleté

[12:31](#msg56fbc72a8d2a72471b7b6964)Au fait, existe-t-il un site similaire à rebol.org pour poster des scripts RED?

dockimbel

[12:32](#msg56fbc74d8d2a72471b7b696e)@fvanzeveren Je ne me serais jamais lancé si j'avais pensé que ce n'était pas faisable. ;-) Concernant le potentiel de Red en terme d'utilisateurs, il est énorme ! Le facteur clé pour réussir est la vitesse d'éxecution, si on avance suffisament vite, on peut arriver à atteindre une masse critique d'utilisateurs et rendre aussi bien le langage Red que la boite qu'on a monté pour le soutenir, viable. L'apport et les contributions de la communauté Red pour le faire avancer sont aussi cruciaux, nos moyens sont limités, mais avec des dizaines de volontaires pour aider, ca peut changer la donne. ;-)

SteeveGit

[12:33](#msg56fbc7a4e4a8384a1bbd39e7)&gt; Au fait, existe-t-il un site similaire à rebol.org pour poster des scripts RED?

Un truc avec GIST en attendant serait suffisant il me semble.

dockimbel

[12:34](#msg56fbc7c276b6f9de194c798a)On a ouvert \[red/code](https://github.com/red/code) recemment, mais on filtre les contributions (la soummision se fait par Pull Request sur github, avec discussion préalable dans \[red/red/code](https://gitter.im/red/red/code).

[12:35](#msg56fbc81fe4a8384a1bbd3a0c)Je vous recommande de tester \[livecode.red](https://github.com/red/code/blob/master/Showcase/livecode.red). ;-)

SteeveGit

[12:38](#msg56fbc8c8e4a8384a1bbd3a3e)Marrant et tellement simple.

[12:54](#msg56fbcc92d39de41b495ef441)\*\*change\** est vraiment straitforward avec l'astuce de Doc.

```
change: func [
	series  [series! bitset! map!]
    value  [any-type!]
][
	insert remove/part series either series? :value [length? value][1] :value
]
```

dockimbel

[13:12](#msg56fbd0c3d39de41b495ef5d9)@SteeveGit Exactement. ;-)

fvanzeveren

[13:26](#msg56fbd3ea76b6f9de194c7d95)Cela fait 5 ans que je n'ai plus programmé en rebol.. Les automatismes doivent revenir :)

SteeveGit

[13:27](#msg56fbd444d39de41b495ef706)Je ne vous jete pas la pierre, Pierre ! ;-)

ldci

[13:35](#msg56fbd62b8d2a72471b7b6ea4)Excellent! De belles perspectives pour un IDE

fvanzeveren

[14:49](#msg56fbe76ed39de41b495efeac)Petite question... si je veux allouer un block! de 10 char, je dois bien faire

```
make block! (10 * 8)
```

SteeveGit

[14:50](#msg56fbe7d2bbffcc665faa9141)ben non

[14:51](#msg56fbe7e8d9b73e635f67a55b)c'est pas des pixels

[14:52](#msg56fbe84ae4a8384a1bbd45e1)un block contient des values de n'importe quel type , peut importe l'espce mémoire requis en interne

[14:55](#msg56fbe8ce8d2a72471b7b7623)Tu peux voir un block comme un tableau de pointeurs

[14:56](#msg56fbe92876b6f9de194c85d0)En fait je comprends pas vraiment d'ou vient ton 10 * 8

fvanzeveren

[15:05](#msg56fbeb24d39de41b495f0010)Ok... 1 char = 8 bits = 1 byte. Si on doit exprimer la taille en byte alors, on utilise

```
make block! 10
```

sinon

```
make block! 10 * 8
```

SteeveGit

[15:05](#msg56fbeb5576b6f9de194c869b)oui, c'est ce j'avais cru comprendre.

fvanzeveren

[15:05](#msg56fbeb568f5147e119f1ccd4)Ma réaction, c'est par rapport au commentaire de Nenad, qui conseille pour des raisons de performances de pré-allouer le bonne taille à u block!

SteeveGit

[15:06](#msg56fbeb768f5147e119f1ccdf)Mais encore une fois un block n'est pas une image/tableau de pixels

[15:07](#msg56fbeba0d39de41b495f003f)un block est un tableau contenant n'importe quel type de valeur

fvanzeveren

[15:08](#msg56fbebd1d39de41b495f0055)Non, mais si je veux remplir mon block! avec 10 chars, je dois m'assurer que red alloue suffisamment d'espace mémoire, sinon il devra faire des réallocation, ce qui est consommateur de temps.

SteeveGit

[15:08](#msg56fbebd68d2a72471b7b7729)donc pour un bloc, 10 chars = 10 entiers = 10 strings = 10 ce que tu veux

fvanzeveren

[15:08](#msg56fbec03e4a8384a1bbd475d)integer = 4 octets --&gt; make block! 10 * 4 ou make block! 10 * 4 * 8

SteeveGit

[15:09](#msg56fbec13bbffcc665faa92c5)make block! 10

fvanzeveren

[15:09](#msg56fbec3ad9b73e635f67a70e)J'ai un sérieux doute... En rebol, on est bien sur de l'espace mémoire...

[15:10](#msg56fbec56bbffcc665faa92e2)Enfin, il me semble...

SteeveGit

[15:10](#msg56fbec6011ea211749c32f18)la taille mémoire allouée est constante quel que soit le type. Je te dis de le considérer comme un tableau de pointeurs (un tableau d'adresses)

fvanzeveren

[15:10](#msg56fbec81d39de41b495f008b)Ok, si tableau de pointeurs:) Cela fait du sens... En effet!

[15:11](#msg56fbec8b11ea211749c32f21)Je viens de lire ta dernière ligne :)

[15:11](#msg56fbec9a11ea211749c32f26)Super, c'est bien plus simple!

[15:11](#msg56fbec9dbbffcc665faa92fa)merci

SteeveGit

[15:12](#msg56fbecced9b73e635f67a73e)même si dans les faits, il n'y pas que des pointeurs. Mais c'est pas grave, on fait comme si. Tous ont la même taille.

fvanzeveren

[15:13](#msg56fbed24bbffcc665faa9332)En interne, je ne serais en effet pas étonné que cela soit implémenté comme un tableau de pointeurs. Quesitons de performances...

SteeveGit

[15:14](#msg56fbed4dbbffcc665faa9342)

[15:15](#msg56fbed8411ea211749c32f73)zut

[15:15](#msg56fbedaf8d2a72471b7b77cd)en interne, la taille réelle allouée pour un block de 10 est  
&gt;10x4 entiers = 10x4x4 = 160 octets'

[15:18](#msg56fbee54d9b73e635f67a7bc)j'ai du mal avec les maths aujourd'hui

fvanzeveren

[15:20](#msg56fbeecc11ea211749c32fed)Mais alors,

```
make block! 10
```

réserve combien d'espace? Un char ou un entier ou un float, c'est pas du tout le même taille...

SteeveGit

[15:22](#msg56fbef1cd9b73e635f67a800)Il réserve 10 cells (l'unité de compte pour REBOL ou RED). Un cell fait 128 bits, ou 4 entiers de 32 bits.

[15:23](#msg56fbef658f5147e119f1ce43)Un cell contient une valeur immédiate (un float ou un entier par exemple) ou alors un pointeur vers des types plus compliqués.

fvanzeveren

[15:25](#msg56fbefe676b6f9de194c8818)Bon sang, cela bouffe de la mémoire :/

SteeveGit

[15:26](#msg56fbf02fd9b73e635f67a855)oui c'est le défaut principal de REBOL ce qui lui est reproché le plus souvent. Mais au jour d'aujourd'hui c'est plus vraiment un problème avec tes gigabytes de mémoire.

fvanzeveren

[15:27](#msg56fbf04b8f5147e119f1ce8b)Pas sur mon Toshiba CS220, pentium 133Mhz :)

SteeveGit

[15:27](#msg56fbf05cd9b73e635f67a85e)Ah c'est sûr

[15:39](#msg56fbf33976b6f9de194c8955)

dockimbel

[16:40](#msg56fc0179df3f9a7373c5e9b5)@fvanzeveren Rebol et Red sont des languages haut niveaux, la manière dont les données manipulées sont représentées en mémoire est transparente pour les utilisateurs. Du coup, les unités d'allocations pour les différentes types de "tableaux" de données, se comptent en éléments de bases du type de tableaux: block! =&gt; une valeur, string! =&gt; un caractère, binary! =&gt; un octet, etc...

[16:41](#msg56fc01b94d518ead3ebab7d1)Si un block doit contenir au maximum 10 éléments, l'allocation se fait par un: `make block! 10`, il n'y a aucun autre calcul à faire.

[16:45](#msg56fc02a14d518ead3ebab7d8)Les block consomment plus de mémoire, car ils nécessitent de stocker plus d'informations pour chaque type de donnée. 128-bit est le minimum viable, si on veut garder toute sa flexibilité du langage. Si un grand nombre de donnée doit être stockés, comme indiqué par @SteeveGit, il y a des types spécialisés pour réduire la consommation mémoire et accroitre les performances, comparé à un stockage générique.

[16:46](#msg56fc02ed6d1e75a2079d7f80)De plus, Red est en 32-bit actuellement, le support 64-bit nécessitera une augmentation de la taille des cellules (au minimum à 192 bits, voire 256).

SteeveGit

[16:51](#msg56fc041f8f5147e119f1d680)Pour éviter de réecrire certaines parties du code (hormis la compilation du binary code) , j'imagine que le plus simple est de passer en 256.

[16:53](#msg56fc04a08d2a72471b7b809d)probablement le plus rapide en terme d'exécution aussi, minus les dépassements de tampon plus fréquents. A voir...

dockimbel

[16:57](#msg56fc056e4d518ead3ebab7f2)256-bit est plus confortable effectivement, mais ça implique des (re-)copies mémoires plus longues, donc sur certains algos appliqués aux blocks ou aux types dérivés, ça va avoir un impact sur les perfs.

SteeveGit

[17:01](#msg56fc068276b6f9de194c9163)ouais mais si je suis dans le cas de problèmes de perfs à cause d'une sur utilisation de gros blocks, j'imagine que je switcherais vers un autre type de conteneur bien avant que le problème ne se pose...

[17:02](#msg56fc06a0d9b73e635f67b115)Après, c'est toi le mieux à même de juger Doc.

[17:03](#msg56fc06dc8d2a72471b7b8185)Et pis... On a la compilation pour les traitements intensifs. Grosse différence avec REBOL

[17:06](#msg56fc07a7d39de41b495f0ad5)mais je sous estime peut-être les pertes dûes au dépassements de tampon dans le code lui même.

dockimbel

[17:29](#msg56fc0d0ff17795ad326d0398)La compilation ne fait pas de miracle quand le langage n'est pas analysable statiquement. De plus, on a aucune couche d'optimisation implémentée pour le moment, donc les performances sont encore loins de celles une fois Red achevé. En moyenne, le code compilé est 3-6 fois plus rapide que l'interprété actuellement, pour Red 1.0, ca devrait être dans les 5-20, avec toutes les optimisations possibles en 2.0 et le JIT, on devrait pouvoir faire du 10-100 (à la très grosse louche). Certains motifs de code Red s'optimisent très bien en AOT, d'autres pas du tout (ex: `do append [print] "hello"`).

[17:31](#msg56fc0d83f17795ad326d039f)D'un autre côté, il est toujours possible d'optimiser une algo critique en utilisant Red/System, qui permet également d'accéder à l'API interne de Red et donc de manipuler des types haut niveaux comme les blocks (c'est néanmoins un peu plus ardu, mais toujours mieux que de devoir écrire une lib en C). ;-)

[17:33](#msg56fc0ddfdf3f9a7373c5ea18)Red/System compilé (sans optimisations) a des performances similaires à du Java/Go/D. D'ici la 1.0, on compte encore améliorer çà.

[17:35](#msg56fc0e50df3f9a7373c5ea1e)Pour comparaison, un fibonacci en Red/System est ~70 fois plus rapide qu'en Red. ;-)

fvanzeveren

[19:44](#msg56fc2c948d2a72471b7b8e71)Bonsoir  
Je me demandais s'il existait en red un méchanisme de requêtes et d'exécutions asynchrone à la façon des promesses en javascript. Je trouve ce paradigme particulièrement efficace et facile à maitriser et utiliser.  
Merci

## Thursday 31st March, 2016

dockimbel

[03:28](#msg56fc994654b9c4023d23dacf)@fvanzeveren Non, pas encore, mais on va tenter d'intégrer un mécanisme similaire dans une des version 0.7.x (0.7.0 va amener les ports et E/S asynchrones).

nodrygo

[06:18](#msg56fcc12ad39de41b495f36fc)bonjour  
je me demandais si il était possible d'utiliser des libraires écrites en Red/System dans du code Red ou faut il attendre la présence des futurs modules ?  
peut on mettre du code Red dans un code Red/System  
désolé ceci n'est pas encore bien clair dans mon esprit :worried:

fvanzeveren

[06:28](#msg56fcc38ad39de41b495f3774)@dockimbel

[06:30](#msg56fcc41a76b6f9de194cbf07)Un mechanisme équivalent aux promesses javascript seraient vraiment un plus. J'ai hâte de voir le résultat dans une prochaine release 👍

dockimbel

[06:41](#msg56fcc6b41a1ccc164832a0b6)@nodrygo Bien sûr il est possible d'utiliser les librairies en Red/System dans du code Red, elle sont là pour çà.

nodrygo

[06:45](#msg56fcc77676b6f9de194cbfc1)@dockimbel ok merci .. alors je dois encore encore tenter de comprendre. Je commence tout juste l'apprentissage de Red et probablement trop habitué aux autres toolchains plus classique :-)

dockimbel

[06:46](#msg56fcc7b51720648112da3a45)"peut on mettre du code Red dans un code Red/System ?"

Non, Red/System est un dialect de Red pour la programmation bas-niveau, toute la librairie standard Red (incluant tous les types de données, l'interpréteur, Parse,...) est écrite en majeure partie en Red/System. Le compilateur Red génère en sortie du code Red/System (qui est ensuite compilé en natif par le compilateur Red/System). Au mieux, tu peux appeler des fonctions Red depuis Red/System en utilisant la directive \[#call](http://static.red-lang.org/red-system-specs.html#section-16.8), mais c'est à toi de pousser les arguments proprement sur la pile interne.

nodrygo

[06:49](#msg56fcc85f11ea211749c3679b)Le fait que Red génère du Red/system est que ça veux dire que je peux faire l'inverse ? mettre du code Red/system dans du Red alors ?

dockimbel

[06:52](#msg56fcc93fd087756f7c0420bf)@nodrygo Oui, via les directives `#system` et `#system-global` (voir la doc Red/System).

[06:53](#msg56fcc97754b9c4023d23db83)Un autre moyen est d'utiliser des "routines" qui sont des fonctions Red, mais dont le corps est écrit en Red/System (pas de docs officielles encore, mais tu peux trouver des exemples dans les libraries existantes, ou bien dans le \[code source](https://github.com/red/red/blob/master/environment/routines.red) de Red).

nodrygo

[06:56](#msg56fcca348d2a72471b7bb016)@dockimbel ok je vais regarder ça merci  
NB: je regardais l'achat d'un sdk Rebol pour recompiler chez moi .. mais manifestement ce n'est plus trop possible .. erreur 500 sur leur page  
ceci étant ce n'est pas important c'était plus pour le fun n'étant pas un dev system ni compilo

ldci

[08:18](#msg56fcdd6a8f5147e119f20bb0)Doc a super bien travaillé pour l'intégration Red et Red System

[08:19](#msg56fcdd81bbffcc665faacfed); import required OpenCV libraries  
#system [  
; OpenCV functions we need  
#include %../../libs/red/types\_r.reds ; some specific structures for Red/S  
#include %../../libs/core/types\_c.reds ; basic OpenCV types and structures\`  
#include %../../libs/highgui/highgui.reds ; highgui functions  
; variables  
windowsName: "OpenCV Window \[Any Key to close Window]"  
]

; red routines are interface between red/system and red code. Great!  
makeWindow: routine \[] [  
cvNamedWindow windowsName CV\_WND\_PROP\_AUTOSIZE OR CV\_WND\_PROP\_ASPECTRATIO  
cvResizeWindow windowsName 640 480  
cvMoveWindow windowsName 200 200  
cvWaitKey 0  
cvDestroyAllWindows  
]  
; just a simple red code :)  
makeWindow

[08:21](#msg56fcddec11ea211749c36d64)J'utilise à fond pour l'interface entre Red et OpenCV: leslibs sont écrites en Rec/system et importées dans le code Red par les routines. Simple et efficace

nodrygo

[08:24](#msg56fcded1d39de41b495f3e98)super  
Je trouve Red de plus en plus intéressant, mais encore beaucoup de choses à intégrer et apprendre n'ayant jamais joué avec (ni avec Rebol).  
si je comprend bien on ne peut qu'intégrer que du code source et pas de mode pré compilé (sauf probablement à faire des .dll / .so)

ldci

[08:25](#msg56fcdf06bbffcc665faad06d)autre point #call permet à Red/System d'appeler du code écrit en Red: c'est intéressant car on peut rajouter des fonctions non présentes dans Red/System

[08:26](#msg56fcdf4dbbffcc665faad07d)On trouve les infos dans la documentation Red/System sur le site

nodrygo

[12:28](#msg56fd18028d2a72471b7bc686)Hello  
si je met dans `console/console.red`  
une ligne comme

```
system/console/init-console  "unless error? try [exists? %config.red] [do %config.red]"
system/console/launch
```

est ce que c'est correct ?  
est ce bien le bon endroit ?  
y a t-il un moyen dans red de retrouver le HOME directory ou le répertoire de lancement du code ?  
merci

[12:54](#msg56fd1df976b6f9de194cd93b)en fait j'ai mis ceci qui à l'air plus correct

```
system/console/try-do [if [exists? %config.red] [do  %config.red]]
system/console/launch
```

dockimbel

[13:43](#msg56fd29861a1ccc164832a2df)@nodrygo Non, l'expression après `if` n'est pas bonne, elle renverra toujours TRUE. Juste:

```
if exists? file: %config.red [do  file]
system/console/launch
```

[13:44](#msg56fd29d3d087756f7c042304)IF: toute les valeurs sont considérées comme TRUE, excepté FALSE et NONE. Donc quand tu écris: `if [...]`, l'expression que tu passes à IF est un block, donc toujours TRUE.

[13:49](#msg56fd2b001a1ccc164832a2e5)`system/console/try-do` est une fonction interne de la console, si tu as besoin d'évaluer une expression qui potentiellement peut générer une erreur que tu veux ignorer, tu peux utiliser la fonction ATTEMPT directement. ATTEMPT renverra le resultat de l'évaluation du block ou une valeur `none`:

```
lisp
red>> 1 / 0
*** Math error: attempt to divide by zero
*** Where: /
red>> attempt [1 / 0]
== none
red>> attempt [10 / 2]
== 5
```

[13:51](#msg56fd2b491720648112da3c7a)`exists? file: %config.red` renvoit TRUE si le fichier spécifié existe dans le répertoire courant ou FALSE dans le cas contraire.

nodrygo

[14:41](#msg56fd3707d39de41b495f5c0e)@dockimbel ok merci  
concernant le répertoire HOME y a t il une solution pour le retrouver ?  
A tu envisagé de charger un script par défaut dans Red en mode console comme c'est souvent le cas dans les REPL ?

dockimbel

[16:16](#msg56fd4d5bd087756f7c0424a4)HOME: il faut lire la variable d'environement "HOME" et pour çà, il faut un bout de code Red/System pour importer la fonction de l'API Windows correspondante (on fournira bientôt des fonctions Red pour çà).

[16:18](#msg56fd4dbe1720648112da3de2)Script par défaut: oui, peut-être, ce genre de fonctionnalité a été retiré de la version Rebol3, car elle causait un trou de sécurité, donc, je ne suis pas sûr qu'on le propose par défaut. Néanmoins, comme tu as pu le tester, il est trivial de recompiler une console personalisée avec chargement auto d'un script.

ldci

[16:31](#msg56fd50e08d2a72471b7bdc88)@dockimbel : le code Red compilé pour windows s'exécute parfaitement avec Wine sous OSX! Génial pour tester !

dockimbel

[16:39](#msg56fd52d254b9c4023d23dfdb)@ldci Cool!

RenaudG

[16:44](#msg56fd53f0d39de41b495f6799)Wow ! Super... bien content que @dockimbel m'ai aiguillé ici ! Salut à tou(te)s :)  
J'avais même pô pensé à regarder s'il y avait un canal FR, et en plus ça a l'air d'être super actif ici !

StephaneVeneri

[21:09](#msg56fd921211ea211749c3ac8e)@RenaudG Bienvenue ! Depuis la sortie de la 0.6 ça bouge pas mal sur tous les canaux, c’est vraiment impressionnant.

RenaudG

[21:12](#msg56fd92c2d478c81e2cbbf8a7)Oui, la preuve, c'est la version qui m'a ramené ici ;-) Red commence à ressembler à qqc pour le commun des utilisateurs potentiels, je pense.

StephaneVeneri

[21:22](#msg56fd950ad9b73e635f682221)Effectivement l’arrivée des accès fichiers et de view permettent de réaliser des petits projets et de voir le potentiel du langage.

[21:27](#msg56fd96318d2a72471b7bf533)J’ai une interrogation concernant les logic!

```
red>> blk: [false]
== [false]
red>> append blk false
== [false false]
red>> print [type? blk/1 type? blk/2]
word logic
```

Est-il normal que les types soient différents ?

RenaudG

[21:29](#msg56fd96bc11ea211749c3ae24)Oui c'est normal. Déconcertant mais normal.

[21:30](#msg56fd96e4d39de41b495f7f3b)Pour ta première affectation, le bloc n'est pas réduit, donc en fait il contient le word 'false

[21:31](#msg56fd9733bbffcc665fab10e5)

```
red>> blk: reduce [false]
== [false]
red>> append blk false
== [false false]
red>> print [type? blk/1 type? blk/2]
logic logic
```

SteeveGit

[21:32](#msg56fd977076b6f9de194d0806) le mot \*\*false\** contient la valeur logique #\[false], 2 types différents

StephaneVeneri

[21:33](#msg56fd97b88d2a72471b7bf5b6)Ok merci à vous deux, c’est plus clair

SteeveGit

[21:34](#msg56fd97e4bbffcc665fab111c)c'est perturbant surtout que Red ne les distingue pas syntaxiquement quand les 2 types sont affichés dans la console.

RenaudG

[21:35](#msg56fd9837d39de41b495f7fae)Oui, rien ne les distingue à l'affichage, il faut "savoir". Red fait la différence, mais elle n'est pas rendue visuellement.

[21:38](#msg56fd98e48d2a72471b7bf61d)`blk: [je suis red] append blk false` devrait peut-être s'afficher `['je 'suis 'red false]` plutôt que `[je suis red false]`  
Mais c'est bien surtout l'affichage en console qui induit la confusion.

[21:39](#msg56fd9916d478c81e2cbbfafb)Ou `[je suis red #[false]]`

SteeveGit

[21:39](#msg56fd991fe4a8384a1bbdc698)ben le tilde \*\*'\** est déjà utilisé pour le type lit-word!

[21:40](#msg56fd993cbbffcc665fab1183)oui, le second choix est meilleur

StephaneVeneri

[21:40](#msg56fd994d11ea211749c3aeed)Je l’aurais cherché un bon moment celle là, j’ai le livre sur Rebol il va falloir que je le regarde de plus près pour ce genre de «  détails » mais assez chronophage en fait.

SteeveGit

[21:40](#msg56fd994ed39de41b495f8004)et c'est le même que dans REBOL

[21:42](#msg56fd99c011ea211749c3af10)avec REBOL tu peux utiliser mold/all avant un print pour voir la différence dans la console

RenaudG

[21:45](#msg56fd9a81d478c81e2cbbfb7a)Oui, d'ailleurs le problème se répercute sur SAVE du coup... y'a un vrai soucis là, pour le moment

StephaneVeneri

[21:47](#msg56fd9ad5d9b73e635f682402)Je viens de tester le mold/all et le comportement n’est effectivement pas le même entre Red et Rebol

RenaudG

[21:48](#msg56fd9b1811ea211749c3af7e)Dans Red mold/all est "TBD"... "reste à faire", ça va venir...

SteeveGit

[21:48](#msg56fd9b2576b6f9de194d0944)j'allais le dire ;-)

[21:48](#msg56fd9b3ed478c81e2cbbfbc4)save/all aussi, c'est prévu

StephaneVeneri

[21:49](#msg56fd9b4f76b6f9de194d0951)Et je viens de comprendre ce que veux dire TBD ;-)

SteeveGit

[21:49](#msg56fd9b60d9b73e635f682428)je cherche encore...

[21:50](#msg56fd9b8de4a8384a1bbdc763)TO BE DONE, aaaah

RenaudG

[21:52](#msg56fd9c3ae4a8384a1bbdc79b)@StephaneVeneri ans le genre des trucs à apprivoiser rapidement, il y a aussi ce mystère. Fait :

```
bidule: func [arg] [
    machin: []
    append machin arg
]
```

Puis fait `bidule 1` `bidule "toto"` etc... est-ce que ça donne ce à quoi tu t'attends ?

StephaneVeneri

[21:54](#msg56fd9c9fd39de41b495f8108)Je teste de suite

[21:58](#msg56fd9d8e11ea211749c3b02f)`machin` n’est pas une variable locale donc les valeurs vont s’accumuler.

RenaudG

[21:59](#msg56fd9db676b6f9de194d0a04)C'est pourtant ce qui se passe, et ce n'est pas un bug.

[22:00](#msg56fd9df0e4a8384a1bbdc81d)ça se comporte comme "static" dans d'autres langages. Le programmeur "normal" s'attends à ce que ça renvoie \[1] puis \["toto"] mais non.

SteeveGit

[22:01](#msg56fd9e2d76b6f9de194d0a1f)Tous les blocs sont persistants, ils sont créés une seule fois et peuvent être modifiés à loisir. Dans l'exemple de la fonction, le block vide est créé par l'évaluateur syntaxique bien avant la création de la fonction elle même. à chaque exécution de la fonction, machin: \[] réaffecte à la variable machin la référence au même block \[] (même veut dire que c'est physiquement le même en mémoire)

RenaudG

[22:01](#msg56fd9e30d9b73e635f682501)pour avoir le comportement standard, il faut mettre `machin: copy []` (par exemple, y'a d'autres façons de faire)

[22:02](#msg56fd9e61d478c81e2cbbfcc2)Voila, Steeve t'a donné le pourquoi du comment. Faut le savoir, sinon forcément on finit par se faire mordre.

SteeveGit

[22:02](#msg56fd9e8611ea211749c3b067)oui je me souviens comment j'ai galéré pour piger ça au début

StephaneVeneri

[22:03](#msg56fd9e96d9b73e635f682525)Oui c’est perturbant. Merci pour ces explications.

[22:03](#msg56fd9ec7d9b73e635f68252f)Je vais profiter de ses explications pour corriger mon viewer.

RenaudG

[22:04](#msg56fd9eead478c81e2cbbfcf1)Padkwa. Il faut le savoir pour pas se faire avoir, mais en fait c'est parfois vraiment utile. Comme là où tu peux construire une fonction avec accumulateur pour "pas cher".

SteeveGit

[22:29](#msg56fda4c8bbffcc665fab14c9)A savoir, y'a pas que les block! qui sont persistants, tous les sous-types series! le sont et pas seulement.En fait à, à part les valeurs de type immediates, je crois que tous le sont.

RenaudG

[22:32](#msg56fda5708d2a72471b7bf9c2)Oui je cois bien que tu as raison. De mémoire (floue) tous les mots pour des valeurs non immédiates sont juste des bindings vers des cells pré-allouées et persistantes.

SteeveGit

[22:38](#msg56fda6e58d2a72471b7bfa2c)oui on parle aussi parfois en Rebol de type simple vs type composé

[22:41](#msg56fda781d39de41b495f83f9)pour checker si 2 valeurs partagent la même référence en mémoire, on utillise la fonction \*\*same?\**

## Friday 1st April, 2016

dockimbel

[04:13](#msg56fdf57b54b9c4023d23e386)Ah, c'est cool de voir ce groupe actif avec des discussions intéressantes tout en sirotant son café de bon matin ! ;-)

[04:15](#msg56fdf5eed087756f7c0428e4)Les series litérales incluses dans les fonctions (ou boucles) sont un piège dans lequel tous les nouveaux arrivant tombent (moi y compris à mes débuts en Rebol), il y a un défaut de documentation sur ce genre d'aspect (la nature réelle du langage) que l'on compte couvrir proprement dans la doc Red à venir.

fvanzeveren

[05:36](#msg56fe08c78d2a72471b7c09b7)Une idée saugrenue me passe par la tete... Serait-il envisageable de porter red sur RiscOS, le système historique de la platerforme arm, en ce compris raspberry pi et beagleboard?

nodrygo

[07:49](#msg56fe280ae4a8384a1bbddf85)ayant fait beaucoup de langage comme lisp/erlang/elixir/python/javascript (entre autre)  
je trouve ceci très perturbant

```
> if  [false] [print "this false is true"]
this false is true
>  if  reduce [false] [print "this false is true"]
this false is true
> if  do [false] [print "this false is true"]
none
```

RenaudG

[07:57](#msg56fe29f176b6f9de194d21c4)En fait c'est tout a fait normal.

[07:58](#msg56fe2a08d39de41b495f991a)En rebol tout est `true` sauf `false` et `none`

nodrygo

[07:58](#msg56fe2a328d2a72471b7c0fee)c'est le coté non évalué qui me perturbe .. en lisp tout est toujours évalué

RenaudG

[07:58](#msg56fe2a3a11ea211749c3c852)Dans tes deux premiers cas la'gument du if est `[false]` c'est à dire un block!, ce qui est équivalent à `true` (même vide).

nodrygo

[07:59](#msg56fe2a79d39de41b495f9935)oui ça j'ai bien compris .. du coup rien avoir avec lisp ;-)

RenaudG

[07:59](#msg56fe2a79bbffcc665fab2ab5)En rebol un block! n'est évalué que si tu le demande, ou si la fonction qui l'utilise le fait explicitement

nodrygo

[08:00](#msg56fe2a92bbffcc665fab2ab9)et seul do peut l'évaluer ?

RenaudG

[08:00](#msg56fe2a9b76b6f9de194d21ee)Il y a beaucoup de similitudes, mais c'est pas juste un changement de syntaxe, la sémantique est un peu différente.

nodrygo

[08:01](#msg56fe2ac3bbffcc665fab2ac7)je dirais que les paradigmes sont assez différents donc je dois me reformater ;-)

RenaudG

[08:01](#msg56fe2ad376b6f9de194d21fc)Autant que je sache seul `do` se contente de l'évaluer.

[08:02](#msg56fe2afcd9b73e635f683c51)Mais en fait `if` attend un booléen et un bloc, qu'il évalue ou non en fonction du booléen.

nodrygo

[08:03](#msg56fe2b3cd9b73e635f683c5f)et il n'évalue pas le test si c'est un bloc  
en fait c'est comme si je mettait un quote sur toutes mes liste en lisp

```
Welcome to Racket v6.4.0.7.
-> (if (eq? 'true true)  true false)
#f
-> (if  '(eq? 'true true)  true false)
#t
->
```

RenaudG

[08:05](#msg56fe2bdbd39de41b495f998b)Vaguement oui.

[08:06](#msg56fe2c1e11ea211749c3c8c7)mais parce que (f ...) est un appel de fonction en lisp alors que \[...] non en rebol

nodrygo

[08:07](#msg56fe2c43d39de41b495f99ac)oui comme je disais paradigmes différents .. faut que je m'habitue c'est pas grave

RenaudG

[08:08](#msg56fe2c65bbffcc665fab2b30)C'est vrai que ça m'a perturbé au début, mais en fait c'est très cohérent, et c'est ce qui compte.

nodrygo

[08:09](#msg56fe2cbdd478c81e2cbc159c)cohérent je sais pas .. pas habituel je dirais .. on est pas dans le principe du moindre étonnement :-)

RenaudG

[08:11](#msg56fe2d31e4a8384a1bbde0df)La cohérence est à considérer au sein du langage. C'est effectivement très différent de la plupart des autres (qq similarités avec Tcl) mais "ça se tient".

nodrygo

[08:12](#msg56fe2d72d39de41b495f99ee)question subsidiaire car pas encore trouvé sur Google .. existe il une fonction de formatage style printf ?

RenaudG

[08:15](#msg56fe2e0fd9b73e635f683d1d)Pas directement équivalent non, pour autant que je me souvienne (je reviens juste à Red/Rebol après une décennie)

[08:16](#msg56fe2e79d39de41b495f9a39)On utilise plutôt des blocs justement, qu'on "assemble". Fonction typiquement utilisée : \[reform](http://www.rebol.com/docs/words/wreform.html) pas encore dans Red.

nodrygo

[08:18](#msg56fe2ecc76b6f9de194d2305)ok merci

RenaudG

[08:18](#msg56fe2edf8d2a72471b7c1103)Mais c'est pas bien compliqué à mettre en place. Session Rebol:

```
>> source reform
reform: func [
    "Forms a reduced block and returns a string."
    value "Value to reduce and form"
][
    form reduce :value
]
>>
```

[08:35](#msg56fe32c7d39de41b495f9b60)Un bloc est réellement un simple conteneur "passif", qui n'est jamais automatiquement exécuté ni réduit.

dockimbel

[09:43](#msg56fe42dee4a8384a1bbde753)@nodrygo Oui, block! -&gt; liste quoté, paren! -&gt; liste:

```
red>> [false]
== [false]
red>> (false)
== false
```

[09:46](#msg56fe436f76b6f9de194d295b)Printf: non, mais Red va fournir un dialect pour couvrir çà. Pour l'instant, tu peux utiliser la fonction PAD (`help pad`) pour aligner les textes en colonnes, c'est à peu près tout.

fvanzeveren

[09:47](#msg56fe439bd9b73e635f68436a)Bonjour  
Comment puis-je convertir un tuple! en string! ?  
En rebol

```
>> to string! 123.3.2
== "123.3.2"
```

En Red, j'ai une erreur ...

RenaudG

[09:48](#msg56fe43e7e4a8384a1bbde7a5)

```
red>> mold 2.3.4
== "2.3.4"
red>> form 2.3.4
== "2.3.4"
```

dockimbel

[09:48](#msg56fe43e8bbffcc665fab31b7)TO n'est que partiellement implémenté, la prochaine release devrait combler çà. En attendant pour du `any-type!` =&gt; `string!`, utilise simplement FORM (ou MOLD suivant les besoins).

fvanzeveren

[10:04](#msg56fe47a3e4a8384a1bbde8be)Merci :)

nodrygo

[10:29](#msg56fe4d998d2a72471b7c1971)NB sur la dernière version linux (01 avril red-01apr16-4aefa26 ) la console a un petit bug sauf si c'est poisson :-)  
la flèche vers le haut rappelle bien la dernière ligne dans l'historique mais le curseur se positionne sur la ligne d'après .. marchait bien sur la version précédente

[14:41](#msg56fe8897e4a8384a1bbdfc12)ouch .. pas bien compris pourquoi ce code probablement complètement stupide marchait  
mais ça m'a permis de récupérer une doc basique de tous les mots essentiels dans un fichier . A partir de ça je vais au moins voir les mots qui sont à ma disposition ;-)

```
;  call with red demos/makesystemdoc.red >stupidDoc.txt
Red[]
foreach w words-of system/words   [do [ print ["^/--------" uppercase mold  w "----------"]
                                      help (mold w ) ]]
foreach w words-of system/console [do [ print ["^/--------" uppercase mold  w "----------"]
                                    help (mold w ) ]]
```

RenaudG

[14:44](#msg56fe894711ea211749c3e485)Tu peux aussi essayer de taper `what` dans la console, puis user et abuser de `help`

nodrygo

[15:19](#msg56fe9197d9b73e635f685b16)oui mais je veux pas de l'aide de la console mais un fichier avec une vision globale de ce qui existe  
ceci étant je peux peut ^etre le construire à partir de what effectivement

RenaudG

[15:20](#msg56fe91c8d39de41b495fb89c)Je comprends.... c'était juste au cas où tu aurais ignoré l'existence de WHAT.

nodrygo

[15:22](#msg56fe9250d9b73e635f685b50)en fait le problème de ce type de fonction c'est d'en récupérer la sortie  
mais il existe peut être un moyen ?  
l'idée serait d'appliquer un help sur chaque fonction et d'en sortie de contenu dans un fichier  
ceci étant je ne connaissait pas what .. donc merci ;-)

RenaudG

[15:25](#msg56fe92ff8d2a72471b7c2fe5)Voici le source de `what` "au propre" (vite fait), que tu va pouvoir adapter:

```
what: does [
    foreach w sort words-of system/words [
        if all [word? w any-function? get/any :w] [
            prin pad form w 15
            spec: spec-of get w
            either any [string? desc: spec/1 string? desc: spec/2]
                [print [#":" desc]]
                [prin lf]
        ]
    ]
]
```

Obtenu en tapant `source what`

[15:26](#msg56fe9333bbffcc665fab49c0)Ouep, j'étais moins ambitieux que toi... j'ai fait un `what` puis copicollé dans mon éditeur de texte :(

nodrygo

[15:27](#msg56fe936011ea211749c3e839)ok j'aurais pu y penser aussi mais j'ai pas encore les réflexes  
merci

dockimbel

[15:29](#msg56fe93df54b9c4023d23e753)Sinon, une alternative pour connaitre l'API disponible, c'est de jeter un oeil au code source de l'\[environnement](https://github.com/red/red/tree/master/environment). On y trouve par exemple: \[what](https://github.com/red/red/blob/master/environment/console/help.red#L223). ;-)

nodrygo

[15:31](#msg56fe945ad39de41b495fb95b)oui c'est sur mais pour un démarrage c'est un peu copieux ;-)

RenaudG

[15:32](#msg56fe94a18d2a72471b7c3083)Sinon @nodrygo , quelle est ton impression sur rebol/red jusque là ?

nodrygo

[15:34](#msg56fe951ae4a8384a1bbe00be)mitigé

[15:35](#msg56fe95318d2a72471b7c30b3)le coté var globale .. j'aime pas trop .. je suis très Erlang/Elixir /Racket ;-)  
et encore trop modelé par le fonctionnel

SteeveGit

[15:37](#msg56fe95a6d9b73e635f685c65)si tu encapsules tout ton code dans un \*\*context\*\*, tout est local

RenaudG

[15:38](#msg56fe95ea8d2a72471b7c30ec)vivi je connais Erlang/Elixir /Racket, et j'apprécie. C'est vrai que c'est pas la même philosophie.

nodrygo

[15:38](#msg56fe95f711ea211749c3e8f1)oui j'ai vu ça mais les données restent mutables par défaut .. dans des langages comme Erlang ou Lisp en règle générale il n'y a pas de données mutables

[15:41](#msg56fe968cd478c81e2cbc3667)il y a aussi le coté vu précédemment qui ressemblerait à une fermeture sans en être vraiment une si je comprend bien

```
bidule: func [arg] [
    machin: []
    append machin arg
]
```

SteeveGit

[15:41](#msg56fe9698d478c81e2cbc366a)ben, c'est plus une qualité qu'un défaut à mon avis. Question d'habitude

RenaudG

[15:41](#msg56fe96b3bbffcc665fab4ac1)question d'habitude oui, et aussi de goût et de type de projet traité.

nodrygo

[15:41](#msg56fe96b7d9b73e635f685cc2)je ne dit pas que c'est un défaut mais des habitudes à changer

SteeveGit

[15:41](#msg56fe96b7bbffcc665fab4ac4)plus de possibilitées

nodrygo

[15:41](#msg56fe96c5d9b73e635f685cc8)ça ça reste à démonter ;-)

RenaudG

[15:42](#msg56fe96c976b6f9de194d439a)Oui, c'est pas une fermeture, ce qui du reste n'existe pas en rebol

[15:42](#msg56fe96ebd39de41b495fba14)pas de TCO non plus (sauf erreur)

nodrygo

[15:42](#msg56fe96f8d39de41b495fba17)ah ça c'est moins cool

RenaudG

[15:43](#msg56fe973211ea211749c3e950)ben oui et non, si tu dois tout faire en récursif c'est embêtant, mais le langage est très bien équipé pour l'iterratif

[15:44](#msg56fe97718d2a72471b7c3167)tu peux tout de même faire \[des trucs rigolos](https://gist.github.com/RenaudG/af8931b8353454f3a9c4277e73b83c6a)

nodrygo

[15:44](#msg56fe977a11ea211749c3e963)je ne sais pas encore si on peut faire de la composition de fonction type f°g avec curryfication au pssage .. mais c'est pas hyper important  
me manque aussi pattern-matching et list comprehension ;-)

RenaudG

[15:46](#msg56fe97dc8d2a72471b7c318e)Ah le pattern matching... c'est vrai que ça manque quand on y a gouté !

nodrygo

[15:47](#msg56fe9811d39de41b495fba79)bon je vais continuer de jouer avec .. on verra bien ou ça me mène

RenaudG

[15:47](#msg56fe98288d2a72471b7c31a5)En même temps dans Erlang/Elixir si t'as pas ça tu peux pas faire grand chose, alors que là ce n'est pas strictement nécessaire

[15:48](#msg56fe9845d39de41b495fba92)OK, d'ailleurs je dois m'absenter un moment... donc à plus tard. Bonne exploration !

nodrygo

[15:48](#msg56fe985576b6f9de194d441e)oui effectivement pour le pattern matching

dockimbel

[15:56](#msg56fe9a3654b9c4023d23e779)Fermetures: elles sont prévues au programme (elles existent dans Rebol3 sous forme du type closure!).

[15:58](#msg56fe9a8d54b9c4023d23e77c)TCO: non supporté, peut-être dans le futur si faisable.

SteeveGit

[15:59](#msg56fe9ae4d478c81e2cbc37d7)closure, curryfication, etc... Tout ça est simulable avec Rebol/Red c'est juste du jargon inutilement abscond IMHO. Alors évidemment ce ne seront peut-être pas des objets ou fonctions first-class. Mais tout est simulable dans des constructeurs de quelque lignes de code. le type fonction! lui est first-class et son code inspectable. A partir de là, tous les paradigmes chers au pure-functionnel programmeurs sont utilisables.

dockimbel

[15:59](#msg56fe9af4d087756f7c042c68)Pour les fonctions d'ordre supérieures: c'est prévu avant la v1.0, mais je ne suis pas sûr du périmètre encore.

[16:03](#msg56fe9bb9d087756f7c042c6c)Pattern-matching: le langage de base est suffisament flexible pour çà dans les cas simples, pour les cas plus complexe, on a le dialect Parse (qui est listé dans la page Wikipedia sur le \[Pattern Matching](https://en.wikipedia.org/wiki/Pattern\_matching)). A voir mon article d'\[introduction à Parse](http://www.red-lang.org/2013/11/041-introducing-parse.html).

nodrygo

[16:03](#msg56fe9be3bbffcc665fab4c84)@dockimbel prévisions vraiment intéressantes .. en tout cas c'est un super job que tu as fait et je reste impressionné

j'ai lu parse mais globalement pour l'instant encore trop de points à appréhender mais ça va se faire dans le temps et avec l'aide des passionnés ;-)

dockimbel

[16:04](#msg56fe9c191a1ccc164832ac5f)List-comprehension: les générateurs sont triviaux à implémenter (voir le lien de RenaudG au-dessus) et le sucre syntaxique peut être ajouté via un DSL adequat (c'est prévu d'avoir çà dans un futur pas trop distant).

SteeveGit

[16:07](#msg56fe9ca676b6f9de194d4593)@nodrygo PARSE est un must. Tu vas découvrir la lumière. C'est en général l'effet qu'il fait sur les gens.

nodrygo

[16:07](#msg56fe9cc476b6f9de194d45a8)encore très imprégné de regex LoL mais la désintox est prévue

dockimbel

[16:10](#msg56fe9d741a1ccc164832ac67)@nodrygo Ton expérience de "fonctionnel" est bienvenue et intéressante.

[16:11](#msg56fe9db854b9c4023d23e792)@nodrygo Tu as déjà utilisé des \[PEG](https://en.wikipedia.org/wiki/Parsing\_expression\_grammar) à la place des regexs ?

nodrygo

[16:15](#msg56fe9e8bd478c81e2cbc3906)@dockimbel pour le PEG pas trop juste de très loin

dockimbel

[16:17](#msg56fe9efd1a1ccc164832ac70)A propos d'Elixir, pour l'anecdote, j'ai eu le plaisir de croiser José Valim, le créateur du langage à une conférence à Pékin il y a quelques mois, on a diné ensemble après nos speechs et passé près de 5h à discuter de nos expériences respectives. C'est un gars vraiment super, à la fois très calé et très amical, j'ai vraiment eu un grand plaisir à discuter à batons rompus avec lui.

nodrygo

[16:23](#msg56fea0678d2a72471b7c3460)@dockimbel je ne l'ai jamais rencontré autrement que via les mailing list ;-)  
mais effectivement très compétent lui aussi (par contre lui ne parle pas français ) et répond facilement  
ça devait être vraiment sympa et j'aurais bien aimé entendre 2 pointures échanger ;-)

[16:24](#msg56fea0aed39de41b495fbd63)le coté qui me plaît bien dans Red c'est le full stack ;-)

dockimbel

[16:25](#msg56fea0f1d087756f7c042c92)Ecriture d'un filtre (en mode pattern matching) en utilisant Parse:

```
red>> list: [a b 5 hello [d e 8] m z x]
== [a b 5 hello [d e 8] m z x]
red>> parse list r: [collect [some [keep [word! word! integer!] | into r | skip]]]
== [[a b 5] [[d e 8]]]
```

SteeveGit

[16:29](#msg56fea1d511ea211749c3ecaa)je m'attendais pas à ça comme résultat. Manque des \*\*skip\** et des \*\*into\** par rapport à du Rebol. Je devrais probablement regarder comment ce \*\*collect\** bizarre fonctionne.

nodrygo

[16:30](#msg56fea23dd9b73e635f68607c)bon je vais tenter de comprendre comment ça marche ça va me faire avancer

dockimbel

[16:33](#msg56fea2c31720648112da453b)Suite de mon exemple du dessus (on paramétrise le filtre):

```
red>> match: function [data spec][parse data r: [collect [some [keep spec | into r | skip]]]]
== func [data spec /local r][parse data r: [collect [some [keep spec | into r | skip]...
red>> list: [a b 5 hello [d e 8] m z x]
== [a b 5 hello [d e 8] m z x]
red>> match list [word! word! integer!]
== [[a b 5] [[d e 8]]]
red>> match list [word! word!]
== [[a b] [[d e]] [m z]]
red>> match list [word!]
== [a b hello [d e] m z x]
red>> match list [integer!]
== [5 [8]]
```

Sympa, non? ;-)

SteeveGit

[16:33](#msg56fea2db8d2a72471b7c351a)suis ~~con~~, j'ai pas vu le code à la fin de la ligne

[16:35](#msg56fea3588d2a72471b7c3543)me fait encore avoir par ces balises de code fenêtré dans le chat

nodrygo

[16:35](#msg56fea36be4a8384a1bbe0537)en fait c'est plus du filtrage mais sympa oui

dockimbel

[16:37](#msg56fea3c3d087756f7c042ca5)C'est du filtrage d'arbre en fait, tu passes un arbre en entrée, et tu récupères un arbre filtré en sortie. ;-)

nodrygo

[16:40](#msg56fea463bbffcc665fab4f59)oki

RenaudG

[17:32](#msg56feb0a4d478c81e2cbc3e89)@nodrygo L'aspect fullstack me plaît bcp aussi, de même que l’extrême compacité du tout, et la cross-compilation sans égale... par dessus l'expressivité et les qualités propres à Rebol.

[17:33](#msg56feb10611ea211749c3f137)Je hais les situations où je fais un innocent `npm install` pour un petit \*toy project* et me retrouve avec 150Mo de dépendances installées.

[17:34](#msg56feb13d8d2a72471b7c394b)Red c'est vraiment l'halu totale lorsque tu considères ce que ça fait pour 1Mo.

[17:35](#msg56feb1758d2a72471b7c395b)D'ailleurs j'ai un vrai problème avec ça. On peu développer des applis complètes qui tiennent sur un floppy, certes, mais on trouve plus de floppy ni de lecteurs ;)

[17:49](#msg56feb493bbffcc665fab5428)J'avais jamais plongé dans PARSE, et je m'y suis mis hier... c'est vrai que c'est sympa. J'ai fait \[un petit truc](https://gist.github.com/RenaudG/dda8bc6c62ab151e6c7a2653b55a8b91), sans doute perfectible, pour splitter des lignes de données de ce genre :  
~304~^~mg~^~MG~^~Magnesium, Mg~^~0~^~5500~  
C'est le truc, dans un style assez déclaratif, similaire à une grammaire :

```
parser: context [
    seps:   charset "^^~"
    chars:  charset [not "^^~"]
    word:   [some chars]
    spacer: [some seps]
    rx:     [ collect 4 [spacer keep word] ]
    split:  func [line limit] [ rx/2: limit parse line rx ]
]
```

nodrygo

[17:51](#msg56feb50ee4a8384a1bbe0aa6)@RenaudG LOL  
et je suis d'accord pour le petit machin qui pèse une tonne  
je regardais aussi juste avant Red le langage Nim qui permet aussi de faire de la cross compil simplement  
mais Red m'amuse bien plus .. maintenant je ne sais pas encore trop quoi en faire et je ne crois pas avoir les compétences nécessaire pour aider dans le projet dans son état actuel.

de plus il manque encore beaucoup de choses (Gui sur Linux / 64bits / IO / Acteurs etc)  
Je sais que tout ça est prévu et je comprend parfaitement que vu le travail que çà représente ça prend nécessairement du temps.  
Faudra aussi que je vois si je peux faire tourner ça sur mon Raspberry ;-)

Enfin pour l'instant je lis et m'attaque à PARSE ;-)

RenaudG

[17:52](#msg56feb54fd478c81e2cbc3ffb)J'aime bien Nim aussi :sparkles:

nodrygo

[18:00](#msg56feb72cd39de41b495fc46d)@RenaudG au passage cool ton code sur USDA Analyser  
tu es bien plus avancé que moi sur Red ;-)

RenaudG

[18:01](#msg56feb77fd478c81e2cbc4096)Merci :) J'ai un passé sur Rebol, alors même après 10 ans ça revient vite. Mais PARSE c'est nouveau pour moi aussi.

[18:07](#msg56feb8fbd9b73e635f68674c)En fait je trouve bien plus sympa le \[bidouillage de générateurs](https://gist.github.com/RenaudG/af8931b8353454f3a9c4277e73b83c6a), davantage dans la veine Rebol.

[18:09](#msg56feb95ad9b73e635f686771)Ça donne des possibilités sympa d'avoir `forgen` `giveme` et `more` dans son arsenal (même si le code est a peaufiner).

nodrygo

[18:11](#msg56feb9ce11ea211749c3f403)je met ça sous le coude pour plus tard .. trop d'infos nuisent à mes pauvres neurones vieillissants ;-)

RenaudG

[19:44](#msg56fecfaed39de41b495fcbbf)@nodrygo Il y a quelque temps pour m'essayer à Elixir j'avais codé l'analyseur USDA... c'est mon mini projet d'évaluation des langages. Je te l'ai mis dans \[un gist](https://gist.github.com/RenaudG/83d05d47812518d4b08186640c57b943) si ça te dis de jeter un œil. Ce fut davantage sportif, du fait de l'immutabilité à laquelle je ne suis pas très habitué... j'avais des petits cas d'école, mais j'avais jamais eu à peupler une DB immutable ! Je suis preneur de toute critique ou suggestion d'amélioration. Pour le code Rebol aussi d'ailleurs.

[19:46](#msg56fed01876b6f9de194d54fa)Hors @dockimbel (qui a fort intérêt à se consacrer au dev, sans quoi on va se fâcher tout rouge), y'aurait pas des vrais gourous du Red/Rebol dans le coin pour nous coacher et nous aider a optimiser/idiomatiser notre code ? :clap:

SteeveGit

[20:07](#msg56fed5098d2a72471b7c43f5)tu parles de quel code? (celui à optimiser)

RenaudG

[20:09](#msg56fed569d39de41b495fcd6e)Mes deux gists du moment, essentiellement... jusque là.

SteeveGit

[20:13](#msg56fed6828d2a72471b7c4471)Je les vois pas, tu les as mis en privé probablement.

RenaudG

[20:14](#msg56fed6b811ea211749c3fcc4)Oui, les liens sont dans le coin, mais ils sont privés. Une minute, et je te donne les liens.

[20:15](#msg56fed6f4e4a8384a1bbe1460)\[USDA Analyser](https://gist.github.com/RenaudG/dda8bc6c62ab151e6c7a2653b55a8b91) et \[pseudo générateurs](https://gist.github.com/RenaudG/af8931b8353454f3a9c4277e73b83c6a)

SteeveGit

[20:17](#msg56fed744bbffcc665fab5e01)ok, j'ai forqué les 2, pour que ça reste dans ma liste

RenaudG

[20:17](#msg56fed769d478c81e2cbc4a74)Merci d'avance pour ton regard averti.

SteeveGit

[20:18](#msg56fed782d478c81e2cbc4a79)ahah, ne rêve pas trop non plus

RenaudG

[20:41](#msg56fedce9d478c81e2cbc4bd5)Tout frais : \[seconde approche pour l'analyseur USDA](https://gist.github.com/RenaudG/d1da1795f05870b5d008cc2f3ef1828c) avec une autre version de la fonction `process` qui permet de rendre le code des processeurs bien plus clair/explicite. Temps d'exécution (compilé) identique. Le nouveau `process` fait l'équivalent d'un `apply` du processeur au bloc de donné.

[20:41](#msg56fedd06d478c81e2cbc4be0)

[20:42](#msg56fedd35bbffcc665fab5f89)\[!\[blob](https://files.gitter.im/red/red/France/oVm8/thumb/blob.png)](https://files.gitter.im/red/red/France/oVm8/blob)

[20:43](#msg56fedd8211ea211749c3fe86)Essai d'envoi d'image... wow ! ça marche pas mal leur système. C'est la comparaison des deux codes, le nouveau à gauche. J'aurai fait plus grand si j'avais su...

SteeveGit

[22:35](#msg56fef7b7bbffcc665fab65cb)@RenaudG Bon j'ai refait USDA à ma sauce. J'ai viré le découpage en plein de petites fonctions. Je trouve le code plus lisible comme ça. J'ai aussi viré le découpage en read/lines qui n'apporte rien puisque le read n'est pas asynchrone. sinon y'a quelques ptites optimisations (le if error? try était ugly). Ca tourne en 5s chez moi.  
https://gist.github.com/SteeveGit/6e60af740019da8bf758b11ea6c3e389

[22:37](#msg56fef820e4a8384a1bbe1bb2)c'est quoi ce code gist qui remplit le chat ? Je voulais juste coller le lien moi, argh!

RenaudG

[22:37](#msg56fef83c76b6f9de194d5efe)Oh ! Super ! J'en attendais pas tant... merci. Je vais étudier ça avec intérêt.

[22:38](#msg56fef84bd478c81e2cbc5258)Me suis fait avoir aussi la 1ère vois avec le coller de gist ;-)

[22:39](#msg56fef8a5e4a8384a1bbe1bcf)l'ulglitude du "if error? try", voilà qui m'apprend des choses.

[22:40](#msg56fef8d6d39de41b495fd5f9)Bon, je dois raccrocher pour ce soir, mais je potasse ton code un moment à la bougie, ou au lever demain. Encore un grand merci, et bonne nuit.

SteeveGit

[22:40](#msg56fef8f28d2a72471b7c4c70)bye

[23:00](#msg56fefd91d478c81e2cbc538b)@RenaudG Attention, j'ai corrigé 2 petites erreurs.

## Saturday 2nd April, 2016

nodrygo

[06:30](#msg56ff671be4a8384a1bbe2929)ça y est j'ai enfin générer le fichier de doc que je voulais ;-)  
peut être pas tip/top mais c'est un début

```
;  call with red makesystemdoc.red >simpleDoc.txt
Red[]
foreach w sort words-of system/words [
    if all [word? w any-function? get/any :w] [
        ;prin pad form w 15
        spec: spec-of get w
        either any [string? desc: spec/1 string? desc: spec/2]
            [print ["^/***********************************************^/"  
                    (uppercase mold  w ) #":" desc ] 
                     "^/" (help  :w) ]
            [print [lf]]
     ]
]
```

RenaudG

[07:13](#msg56ff7117d39de41b495fe486)Merci @SteeveGit pour les corrections. Ton parsing de %NUTR\_DEF.txt est incorrect aussi, il me semble qu'on doit plus avoir :

```
seps copy id to seps
        some seps copy unit to seps
        some seps copy _ to seps
        some seps copy name to seps
        (nutrients/:id: reduce [name unit])
```

[07:13](#msg56ff712c8d2a72471b7c5a70)Bon, je suis pas très chaud en général pour ton approche "tout à plat". J'aime modulariser, paramétriser, abstraire... dans les limites du raisonnable et du "assez performant". C'est d'ailleurs en partie ce que cet exercice me permet de juger des divers langages testés. Donc dans le cas général je préfère mon approche conceptuelle, même si la tienne marche très bien pour un petit script one shot comme ici. Voilà, ça c'est dit ;-)

[07:13](#msg56ff71378d2a72471b7c5a71)Par contre, ton script m'aide beaucoup sur le plan du langage, et de l'usage de PARSE. \*\*Merci !* Ce qui me semblait super ésotérique commence a vraiment prendre du sens (et de la beauté... c'est con mais j'aime le beau). Je crois que je vais engraisser Red au logs de mes serveurs, tiens, ça va pas tarder !

[07:14](#msg56ff713fbbffcc665fab7417)Ta version a aussi un gain de vitesse de 25 à 30%. J'aimerai bien \*\*savoir\** ce qui au juste produit ça. Je penche principalement pour les appels de fonction process/do/processor économisés, et moins d'allocs mémoires à faire (la consommation de RAM est divisée par deux). Par contre la préalloc des map ne fait gagner que des miettes à peine perceptibles.

[07:14](#msg56ff715576b6f9de194d6d18)Instructif, utile... merci pour ça ! Mais aussi merci pour le temps et l'effort d'avoir repris tout le script.

[07:20](#msg56ff72b8d478c81e2cbc60cb)Pour info, ma toute première version avec SPLIT tournait dans le même temps que ma version Elixir (poke @nodrygo) soit ~28s. Mes versions avec PARSE sont autour de 9s, et la version "plate" de @SteeveGit à un peu plus de 6s chez moi.

[07:26](#msg56ff7440e4a8384a1bbe2a7f)@nodrygo cool :) Ton "^/" est hors `print`, donc perdu, et `print [lf]` peut se passer des crochets.

```
Red []
foreach w sort words-of system/words [
    if all [
        word? w
        any-function? get/any :w
    ] [
        spec: spec-of get w
        either any [
            string? desc: spec/1
            string? desc: spec/2
        ] [
            print [ "^/***********************************************^/"
                   (uppercase mold  w ) #":" desc ]
            help :w
        ] [
            print lf
        ]
     ]
]
```

dockimbel

[07:27](#msg56ff746a1a1ccc164832af59)@RenaudG J'ai un patch pour LOAD pour améliorer les perfs sur ton fichier de 15Mo (qui contient ~1.5M de strings), ca divise par 4 ou 5 les temps précédents. Ca reste encore "lent", le lexer utilisé par LOAD est haut-niveau (via PARSE) et contient un paquet de règles qui, au final, ne donnent pas un scanner optimal pour un LOAD ultra-performant. Je pense qu'on va faire une version bas-niveau et optimisée de LOAD, pour avoir une vitesse maximale. Rebol implemente un algo très performant pour çà mais le code est très difficilement maintenable et pas extensible. Je réfléchis à une solution plus propre pour Red, avec des perfs proches de Rebol.

RenaudG

[07:29](#msg56ff74ede4a8384a1bbe2a94)Super Doc! Merci bien. Je vais tester ça. Ca me semble un super point d'avoir un load rapide... plus rapide que le parsing manuel en tout cas, dans l'optique d'utilier Red comme un format de data (à la Lua)

[07:30](#msg56ff750b11ea211749c41386)Du super-JSON on steroids

dockimbel

[07:30](#msg56ff7515d087756f7c042f72)@RenaudG Exactement ! Je vais pousser le patch un peu plus tard dans la journée.

RenaudG

[07:30](#msg56ff751cd9b73e635f688628)Tct est fabuleux pour ça

[07:30](#msg56ff752576b6f9de194d6d73)Tcl, pardon

dockimbel

[07:30](#msg56ff753254b9c4023d23ea5c)@RenaudG Tu as un lien pour çà en Tcl ? (Pour info, tu peux éditer tes derniers messages dans Gitter).

RenaudG

[07:31](#msg56ff7554d478c81e2cbc6112)Je vais te chercher ça... tu connais Tcl ou pas ? Tu veux quoi comme info au juste ?

dockimbel

[07:32](#msg56ff75941720648112da479c)Je connais Tcl un peu, mais jamais utilisé. "Tcl est fabuleux pour ça" &lt;== Je voudrais un lien pour voir comment Tcl s'en tire. ;-)

RenaudG

[07:33](#msg56ff75b6d478c81e2cbc611b)OK, j'ai un truc à faire mais après je te file des refs pertinentes pour ça.

dockimbel

[07:34](#msg56ff76221a1ccc164832af62)Juste pour info, c'est pas urgent, je suis juste curieux. ;-)

nodrygo

[07:42](#msg56ff78028d2a72471b7c5b1d)@RenaudG merci pour les corrections

fvanzeveren

[09:38](#msg56ff9315d9b73e635f688988)Bonjour, pour info voici une implémentation de la fonction 'change qui mimique exactement le comportement de rebol. Seul le raffinement /dup n'est pas (encore) implémenter:

```
RED [
	Title: "CHANGE function"
	Author: "François Vanzeveren" 
	Purpose: "Direct port of the REBOL2 change function"
]

change: func [
	"Changes a value in a series and returns the series after the change."
	series [series!] "Series at point to change"
	value [any-type!] "The new value"
	/part {Limits the amount to change to a given length or position.}
		range [number! series! pair!]
    /only "Changes a series as a series."
;    /dup "Duplicates the change a specified number of times."
;		count [number! pair!]
] [
	either not string? series [
		either all [series? value not string? value] [
			return do select reduce [
				all [only part] [insert/only remove/part series range value]
				only [insert/only remove series value]
				part [insert remove/part series range value]
				true [insert remove/part series length? value value]
			] true
		] [
		; value is a string! or anything else but a series
			return do select reduce [
				part [insert remove/part series range value]
				true [insert remove series value]
			] true
		]
	] [
		value: copy head insert "" value
		; series is a string!
		return do select reduce [
				part [insert remove/part series range value]
				true [insert remove/part series length? value value]
			] true
	]
]
```

RenaudG

[09:47](#msg56ff953911ea211749c4171a)

[09:48](#msg56ff9565d39de41b495fe831)Merci @fvanzeveren

[09:51](#msg56ff9619bbffcc665fab77e1)@dockimbel je retrouve pas l'article intéressant sur le sujet, et je suis OQP à dépanner le PC en détresse d'un voisin... mais bon en gros ça se résume aux qualités qu'a Red/Rebol (homoiconicité, (dé)sérialisation triviale, save/load/do...) moins la praticité des nombreux types de donnée de Red/Rebol. Lua est top pour ça aussi, sauf que \*out of the box* Lua sait pas faire grand chose. Tcl a aussi des algos de manipulation de chaîne (tont regex) ultra méga fabuleusement efficaces.

[09:55](#msg56ff96fad39de41b495fe863)Regarde le code C de \[ce benchmark](http://benchmarksgame.alioth.debian.org/u64q/performance.php?test=regexdna) pour voir comment C est si bien classé ;-)  
Y'a pas si longtemps il était même premier, mais là PHP a bien optimisé son schmillblick aussi.

SteeveGit

[10:46](#msg56ffa30476b6f9de194d7262)@RenaudG Ok, j'avais pas vu le skip sur la 3ième donnée mais tu peux économiser une allocation inutile du coup.  
Remplace:

```
some seps copy _ to seps
```

par:

```
some seps  to seps
```

[11:16](#msg56ffaa28d9b73e635f688c2b) Au sujet de l'organisation du code source, je suis tout à fait d'accord que l'approche modulaire et code factorisé est à privilégier. Mais point trop n'en faut car tu risques assez vite de noyer la lisibilité.  
Etant donné que ta version factorisée du code source est similaire en taille à ma version plate, je penche pour la lisibilité.  
Si ce script dévait s'allonger avec d'autres cas d'utilisation, ce serait une autre histoire.

RenaudG

[11:39](#msg56ffaf72e4a8384a1bbe30d7)Rhôooo oui, suicon mwa ! C'est sur que le copy sert pas des masse !

dockimbel

[11:46](#msg56ffb12154b9c4023d23ead9)"Tcl a aussi des algos de manipulation de chaîne (tont regex) ultra méga fabuleusement efficaces." C'est cette partie là qui m'intéresse particulièrement. ;-)

RenaudG

[11:50](#msg56ffb20b76b6f9de194d7421)Ouep, ben pour ça je peux guère t'aider. Faut voir le code, et c'est au delà de mes compétences. J'ai ouïe dire que leur source est très robuste et propre, exemplaire, mais j'ai jamais regardé.

[11:51](#msg56ffb25876b6f9de194d742b)J'aime ce principe, même si je le suis péniblement : "Il faut coder comme si le mec qui va maintenir ton code ensuite est un vrai psychopathe dangereux qui sais où tu vis".

SteeveGit

[11:53](#msg56ffb2a976b6f9de194d7430)pas sûr de comprendre :worried:

RenaudG

[11:55](#msg56ffb314d9b73e635f688d5a)C'est pour éviter la menace des psychopathes que je veux qu'on m'aide à améliorer mon code ;)

SteeveGit

[11:55](#msg56ffb33dbbffcc665fab7b4e):ok\_hand:

RenaudG

[11:55](#msg56ffb341bbffcc665fab7b4f)Et puis à l'avenir j'aimerai bien partager du code, des créations, mais je doute encore trop de la qualité de ce que je fais.

SteeveGit

[11:57](#msg56ffb3b011ea211749c41af3)Bah ,le code de n'importe qui peut toujours être amélioré par quelqu'un d'autre

dockimbel

[11:59](#msg56ffb41854b9c4023d23eae2)@fvanzeveren Tu devrais poster ce genre de code sur https://gist.github.com de manière à ce que d'autres puissent le bookmarker et le modifier (pour corriger les bugs par ex. ;-)).

SteeveGit

[11:59](#msg56ffb41bd39de41b495febcc)sur rebol.org y'a plein de scripts qui ne sont pas spécialement à mon goût mais ils sont utiles, ils existent.

RenaudG

[12:00](#msg56ffb44b76b6f9de194d746f)Ouep, c'est vrai. A un moment faut plonger.

[12:00](#msg56ffb461d478c81e2cbc67ec)Et considérer que le mieux est souvent l'ennemi du bien.

SteeveGit

[12:00](#msg56ffb47ad39de41b495febd8)toutafé

fvanzeveren

[20:20](#msg570029a811ea211749c42eb5)@dockimbel  
Voilà, c'est fait... Je découvre seulement Git. Merci pour l'info.  
https://gist.github.com/fvanzeveren/e92993cb83e96db6b837b110b3d10b14

[20:27](#msg57002b1dd9b73e635f68a12a)Bon sang, comment, comment on empêche l'affichage du code source?

RenaudG

[20:28](#msg57002b5911ea211749c42f08)Difficilement.

[20:28](#msg57002b6ed39de41b495fffbf)Faut faire des liens : texte entre crochet suivi d'url entre parenthèses.

SteeveGit

[20:28](#msg57002b718d2a72471b7c75c5)@fvanzeveren tu reiventes le fil à couper le beurre là ;-)  
~~do select reduce \[...] true~~~  
\~~~  
case \[...]  
\~~~

[20:30](#msg57002bf8d478c81e2cbc7c62)et pis... j'ai comme l'impression que ça devrait s'écrire en 3 fois moins de code

fvanzeveren

[20:50](#msg570030a4e4a8384a1bbe46f7)Le case ne va pas diminuer bcp le code... Quand à le coder en trois fois moins de code... Je suis preneur... Mais faut reproduire exactement le comportement original, avec toutes les combinaison de rafinements

SteeveGit

[20:54](#msg570031a1d478c81e2cbc7d6c)le \*\*case\** tout seul non mais tu vois bien que tu utilises un peu partout les même portions de code.

[20:57](#msg5700324be4a8384a1bbe475e)Je veux bien le faire mais c'est pas un très grand challenge ni te rendre service.

fvanzeveren

[20:58](#msg57003288bbffcc665fab90a7)Le case n'existe pas en rebol 2... Je ne le connaissais pas.. Je vais réécrire la fonction en l'utilisant, ce sera certainement plus rapide. Merci pour l'info. Par contre, je ne vois pas comment être plus concis...

SteeveGit

[21:00](#msg570032e8bbffcc665fab90b5)REBOL2

```
USAGE:
    CASE block /all

DESCRIPTION:
     Evaluates each condition, and when true, evaluates what f
ollows it.
     CASE is a native value.

ARGUMENTS:
     block -- Block of cases (conditions followed by values) (
Type: block)

REFINEMENTS:
     /all -- Evaluate all cases (do not stop at first true cas
e)
```

fvanzeveren

[21:03](#msg5700338f76b6f9de194d89fd)Sauf a construire dynamiquement l'expression sous forme de string et de l'evaluer... Mais quel impact sur la performance et la lisibilité...

[21:07](#msg570034a18d2a72471b7c77a4)Et puis, j'ai créé cette fonction pour faciliter le portage d'autres de mes scripts (simetrics, parse-expression et log4reb... Disponibles sur rebol.org)

SteeveGit

[21:11](#msg5700357ee4a8384a1bbe47e2)Première remarque: tu n'as pas à gérer le cas des string! à part juste pour éviter l'emploi du raffinement /only. insert/only est transparent sur les strings.

fvanzeveren

[21:21](#msg570037c211ea211749c43169)A l'origine, je n'avais pas distingué le cas des strings... Sauf que dans ce cas, les résultats de mon implémentation divergeaient de la version rebol.

SteeveGit

[21:25](#msg570038d4d478c81e2cbc7ee8)Moi tout ce que je vois, c'est que ça fait la même chose sauf traiter le cas du /only

[21:25](#msg570038e4e4a8384a1bbe48a9)donc inutile

[21:25](#msg570038e7d9b73e635f68a3fb);-)

fvanzeveren

[21:29](#msg570039a68d2a72471b7c78a3)Le comportement sans rafinnement est différent

SteeveGit

[21:30](#msg57003a0e8d2a72471b7c78bc)Seconde remarque: tout le code peut être réduit à une seul séquence

```
insert/dup change/part ...
```

A condition d'initialiser les variables \*\*range\** \*\*count\** \*\*values\** différemment en fontion des paramètres en entrée.

[21:31](#msg57003a31bbffcc665fab923d)@fvanzeveren  
&gt; Le comportement sans rafinnement est différent

poste un exemple, je vois pas en quoi.

fvanzeveren

[21:32](#msg57003a6fd478c81e2cbc7f3e)Difficile depuis mon smartphone... 😁

[21:37](#msg57003babbbffcc665fab928d)Effectivement, la remarque 2 est une Bonn piste... Je me souvients maintenant de l'avoir utilisée il y bien longtemps avec rebol...

[21:39](#msg57003c2d8d2a72471b7c7927)Je vois bien comment diminuer le code drasriquement avec cette astuce...

[21:41](#msg57003c85e4a8384a1bbe496b)Merci 😊

SteeveGit

[21:42](#msg57003cd1d39de41b4960037a)Pour info, tu m'as fait craquer: ma fonction fait 4 courtes lignes de code.  
On va voir ce que tu peux faire petit scarabée :-)

fvanzeveren

[21:52](#msg57003f3a8d2a72471b7c79b6)As-tu vérifié toutes le combinaisons contre la version rebol?

SteeveGit

[21:53](#msg57003f6076b6f9de194d8c77)y'a pas vraiment besoin, je m'en souviens suffisemment

fvanzeveren

[21:54](#msg57003faa76b6f9de194d8c8b)Bon, ok, je descends rallumet mon pc...

[21:55](#msg57003fe111ea211749c4331a) 😆

SteeveGit

[21:57](#msg5700403cbbffcc665fab9366)un oublie ou une erreur peuvent subsister mais je vois mal 4 lignes se transformer en 30 pour cette seule raison ;-)

fvanzeveren

[21:58](#msg57004095d39de41b49600431)Voilà, je suis devant mon PC. Clair, c'est la remarque 2 qui va drastiquement réduire la longueur du code. Par contre, laisse-moi refaire quelques tests sous REBOL pour la distinction series vs string

[22:03](#msg5700419b76b6f9de194d8ccd)Petite question... que fait ton script avec

```
change "xyz" #"A"
```

SteeveGit

[22:07](#msg570042aee4a8384a1bbe4a95)ben la même chose que REBOL

[22:12](#msg570043b411ea211749c433c2)Je peux poster le code, ce sera plus simple, et tu pourras le tester pour trouver des bugs, OK ?

fvanzeveren

[22:12](#msg570043cabbffcc665fab9414)non merci, je suis occupé à adapter mon code :)

SteeveGit

[22:12](#msg570043cfe4a8384a1bbe4ac9)

[22:12](#msg570043d611ea211749c433ca)

fvanzeveren

[23:23](#msg5700545911ea211749c43654)Voilà j'ai mis à jour le code... Mais impossible de faire en 4 lignes réelles.  
Si avec tes quatre lignes réelles, ton code produit le résultat suivant:

```
red>> head change "abcdefgyijklmn" 123.3.1.2
== "123.3.1.2jklmn"
red>> head change "abcdefgyijklmn" 1234
== "1234efgyijklmn"
red>> head change [a b c d e f g] #"P"
== [#"P" b c d e f g]
red>> head change "abcdefgyijklmn" 1234
== "1234efgyijklmn"
red>> head change "abcdefgyijklmn" 123.3.1.2
== "123.3.1.2jklmn"
red>> head change "abcdefgyijklmn" #"P"
== "Pbcdefgyijklmn"
red>> head change [a b c d e f g] [1 2 3 4]
== [1 2 3 4 e f g]
red>> head change "abcdefgyijklmn" [1 [2 3 4] 5]
== "12 3 45yijklmn"
```

comme REBOL... Alors, je m'avoue vaincu :)  
Quoiqu'il en soit, merci pour le challenge et les indices, j'ai quand même réussi à passer de 48 lignes à 28 lignes de script?

[23:26](#msg57005539e4a8384a1bbe4d5a)Et les lignes sont bcp moins chargées, sauf une seule.

SteeveGit

[23:30](#msg57005604e4a8384a1bbe4d81)Disons que pour une ligne, j'ai compacté une série de tests. C'est de la triche ? :smile:

fvanzeveren

[23:31](#msg57005650bbffcc665fab96e8)Je remonte au lit... Si ma femme se réveille, je serai prive de programmation pour un mois😌

SteeveGit

[23:32](#msg57005673e4a8384a1bbe4d9e)Ok, tu veux mon code ou tu as l'intention de chercher encore ?

## Sunday 3th April, 2016

dockimbel

[04:41](#msg57009efe1a1ccc164832b2bc)@SteeveGit Avec la fonction`apply` (pour bientôt) qui va permettre de passer les raffinements en arguments, sa fonction pourra effectivement se réduire à 2 lignes je pense. ;-)

fvanzeveren

[06:18](#msg5700b5c011ea211749c43ff2)@SteeveGit

[06:21](#msg5700b660d478c81e2cbc8f51)Je veux bien voir ton code... J'aimerais savoir comment tu traites la différence de comportement quant series est une series! ou un string!...

[06:26](#msg5700b7a8d9b73e635f68b49d)Le test c'est lorsque series est un string! et value autre chose qu'un string (un tuple par exemple)

dockimbel

[06:46](#msg5700bc4e1720648112da4aeb)@fvanzeveren Une expression de ce type devrait t'aider:

```
either string? value [value][form value]
```

nodrygo

[06:59](#msg5700bf44d39de41b496011b3)j'avais crue comprendre que contexte et objet était différent mais sur Red semble être la même chose, vrai ?

[07:00](#msg5700bf81d39de41b496011bc)autre question si je fais a: :b  
est ce que c'est une copie ou un pointeur ?

dockimbel

[07:00](#msg5700bfa01720648112da4aee)@nodrygo Oui, context == objet.

[07:01](#msg5700bfc61720648112da4af0)`a: :b` bonne question, pas simple à expliquer. Un mot référence une valeur dans un contexte (que tu peux imaginer comme un tableau à 2 entrées, une pour les mots, une pour leur valeur respective). Assigner une valeur à un mot signifie copier la valeur dans le table de contexte auquel le mot est actuellement lié (ce lien peut être dynamiquement changé via la fonction `bind`). Si la valeur en question est une série (block, string, ...) ou un type object, seul leur pointeur est copié (et index courant pour les séries).

nodrygo

[07:02](#msg5700c01cd478c81e2cbc9029)@dockimbel ok merci

[07:05](#msg5700c0d1d39de41b496011d6)si je fais a: :b et qu'ensuite je re définis a: &lt;autrechose&gt;  
est ce que b référence toujours l'ancien a ?

fvanzeveren

[07:07](#msg5700c12e76b6f9de194d9ce3)@dockimbel

[07:07](#msg5700c14ce4a8384a1bbe5815)Form... Ou je me souviens maintenant :) je vais regarder cela merxi

dockimbel

[07:10](#msg5700c1cb54b9c4023d23edeb)\*si je fais a: :b et qu'ensuite je re définis a: &lt;autrechose&gt;, est ce que b référence toujours l'ancien a ?*  
`b` n'est à aucun moment affecté par ces expressions, seule la référence de `a` est changée.

[07:12](#msg5700c241d087756f7c0432b3)Il n'y a pas de \*variable* à proprement parler en Red/Rebol, les mots sont des valeurs de premier ordre comme les autres. \*Assigner* un mot à une valeur correspond simplement à lier ce mot avec une valeur dans un contexte (cf. mon explication à propos du tableau au-dessus) donné.

[07:12](#msg5700c2751a1ccc164832b2d9)Il y a un degré de liberté supplémentaire dans les mots en Red/Rebol comparé aux variables dans les autres langages.

nodrygo

[07:13](#msg5700c2afd478c81e2cbc906a)donc b référence toujours l'ancienne entrée de a: ce qui voudrait dire que je peux redéfinir un mot (fonction? j'ai l'impression que ça ressemble un peu à dur Forth mais avec une autre syntaxe plus simpa ;-) )  
ex:  
oldprint: :print  
print: fucn &lt;autrechose &gt;  
et oldprint correspond toujours l'ancienne fct (on fait ça parfois en Lisp)

[07:15](#msg5700c30776b6f9de194d9d27)casse pied ce truc à transformer tout en smileys

dockimbel

[07:15](#msg5700c3241a1ccc164832b2da)Oui, exactement, il y a une infuence Forth dans la conception de Rebol/Red.

[07:17](#msg5700c37e1a1ccc164832b2dc)Comprendre que les mots sont des valeurs aussi est clé dans la maitrise profonde de Red. Par exemple: `a a a` sont trois valeurs de type word!, elles peuvent être liées au même contexte...\*ou pas\*. Exemple:

```
red>> a: 123
== 123
red>> reduce [a]
== [123]
red>> code: [a]
== [a]
red>> reduce code
== [123]
red>> obj: context [a: 0]
== make object! [
    a: 0
]
red>> bind code obj
== [a]
red>> reduce code
== [0]
red>> append code 'a
== [a a]
red>> code
== [a a]
red>> reduce code
== [0 123]
```

Note: tous les mots sont par défaut liés au "contexte global" qui est référencé par `system/words`.

nodrygo

[07:19](#msg5700c3f1e4a8384a1bbe5852)tous les mots y compris ceux dans des context ?  
ok ça va m'aider à mieux appréhender merci

dockimbel

[07:21](#msg5700c49654b9c4023d23edf2)Ce degré de liberté offert par les mots, permet de fabriquer du "code" à la volée avec une flexibilité totalement nouvelle par rapport aux autres langages. C'est également un puissant levier pour écrire des DSL et dialectes de Red.

nodrygo

[07:22](#msg5700c4bfbbffcc665faba5c4)oui je comprend et ça me plait bien même si je sais pas encore trop quoi en faire pour l'instant ;-)

[07:30](#msg5700c6a3e4a8384a1bbe5892)dernière question  
si je fais a: 123 puis a: 456 et b: \[1 2 3] puis b: b: \[ 4 5 6 ]  
est ce que l'ancienne valeur est libérée ou reste empilée ?  
il n'y a pas de garbage dans Red si ?

dockimbel

[07:31](#msg5700c6d11720648112da4afc)Libérée, le GC n'est pas encore intégré dans la version stable de Red.

nodrygo

[07:32](#msg5700c6f2d478c81e2cbc90ea)ok

dockimbel

[07:33](#msg5700c73954b9c4023d23edf5)@nodrygo Tu peux créer tes propres itérateurs ou fonctions de contrôle du flot:

```
for-int: func ['w blk [block!] body [block!]][
	bind body 'w
	while [not tail? blk][
		if integer? blk/1 [
			set w blk/1
			do body
		]
		blk: next blk
	]
]

red>> for-int n [a 3 "hello" 4][print n]
3
4
```

Ou encore:

```
either-fuzzy: func [cond t-body [block!] f-body [block!]][
	either random true t-body f-body
]

red>> print either-fuzzy 1 < 2 ["vrai"]["faux"]
vrai
red>> print either-fuzzy 1 < 2 ["vrai"]["faux"]
faux
red>> print either-fuzzy 1 < 2 ["vrai"]["faux"]
vrai
red>> print either-fuzzy 1 < 2 ["vrai"]["faux"]
faux
red>> print either-fuzzy 1 < 2 ["vrai"]["faux"]
faux
```

nodrygo

[07:34](#msg5700c79bd9b73e635f68b659)ah oui c'est cool ça .. je comprends maintenant pourquoi on pourrait faire des comprehension list (très anciènne question)

ah et au fait pour quoi le quote devant le w ? mot non évalué ?  
en fait je crois comprendre, le mot sera lié au mot passé en param

[07:47](#msg5700ca7dbbffcc665faba660)en fait c'est quasi la définition du foreach

RenaudG

[08:16](#msg5700d16ad478c81e2cbc9242)&gt; @SteeveGit Avec la fonction`apply` (pour bientôt) qui va permettre de passer les raffinements en arguments, sa fonction pourra effectivement se réduire à 2 lignes je pense. ;-)

Je veux ça :)

[08:41](#msg5700d726d478c81e2cbc930a)@dockimbel Ta modif pour accélérer LOAD est dispo, ou pas encore ?

dockimbel

[09:13](#msg5700dec41a1ccc164832b30f)J'avais oublié de pousser le commit hier, c'est fait maintenant. Il y a encore du boulot pour accélérer çà, mais à l'avenir, on va recoder (dans l'année) un LOADer beaucoup plus rapide en Red/System directement, l'actuel a fait son temps. ;-)

RenaudG

[09:16](#msg5700df6bd478c81e2cbc9408)Super, Merci :) Je voyais pas ta modif, et là je l'ai vue "apparaître" dans Github... je commence à trouver mes marques avec Git(hub|ter|...)

[09:39](#msg5700e4cc11ea211749c44534)@dockimbel J'ai testé. Le gain est déjà bien appréciable: je passe de plusieurs minutes à 45 secondes pour le load complet.  
Ça reste plus lent que les 8 secondes de parsing, mais il y a un vrai progrès. Merci encore.

dockimbel

[10:13](#msg5700ece0d087756f7c04331b)En attendant un LOAD très rapide, je pense que dans ton cas, tu as tout intérêt à faire un parseur "custom" pour recharger la base en mémoire.

[10:14](#msg5700ed0b54b9c4023d23ee61)Vu que ta base ne contient que des maps, blocks, strings et chars, ça ne devrait pas être long à faire.

SteeveGit

[10:37](#msg5700f24e11ea211749c44726)Bonjour tout le monde, alors voilà la fmeuse fonction tant attendue:  
https://gist.github.com/SteeveGit/1072d7d56310eb87b3160d154f1b0ca8

[10:59](#msg5700f776d478c81e2cbc9772)A noter que pour le moment, les combinaisons de raffinements dans Red doivent suivre l'ordre du proto de la fonction (\*\*change/part/only/dup\** mais pas \*\*change/dup/only/part\*\*) contrairement à Rebol.

nodrygo

[11:47](#msg570102bfe4a8384a1bbe5fe7)

dockimbel

[11:49](#msg57010339d087756f7c043335)@nodrygo `"z" == "Z"`, Red est insensible à la casse par défaut.

SteeveGit

[11:51](#msg570103c3d478c81e2cbc990f) curieusement je viens de tester #"z" = #"Z" avec Red-060 et j'ai du \*\*false\**

nodrygo

[11:52](#msg5701040ebbffcc665fabad9d)en fait je viens tester sur Windows "a" == "A" donne bien false

SteeveGit

[11:52](#msg57010414d39de41b49601a08)ah zut, c'est pas du string

nodrygo

[11:53](#msg5701042ad478c81e2cbc9920)mais == ne semble pas exister sur Linx  
@ygo oops au temps pour moi .. ça existe

[12:03](#msg5701068111ea211749c449aa)@dockimbel je chechais une demo qui gère les events souris tu en aurais pas une toute faite par hasard ? (style un simpledraw) mais sinon prend pas de temps c'est pas important

dockimbel

[12:24](#msg57010b611a1ccc164832b379)@nodrygo Tu peux regarder dans le dossier \[tests](https://github.com/red/red/tree/master/tests) et dans \[red/code](https://github.com/red/code). Tu peux également consulter la doc VID et View sur le \[wiki](https://github.com/red/code/wiki).

nodrygo

[12:29](#msg57010c988d2a72471b7c9106)@dockimbel ok merci je fais ça .. je ne me souviens pas vraiment d'avoir vu une démo ou on suit le mouvement d'une souris dans un draw mais peut etre pas assez regardé

dockimbel

[12:36](#msg57010e3ad087756f7c04334e)@nodrygo

```
view [
	base 300x300 all-over 
		draw [pen red fill-pen red b: box 10x10 40x40]
		on-over [b/3: (b/2: event/offset) + 30x30]
]
```

nodrygo

[12:37](#msg57010e6ebbffcc665fabaefd)@dockimbel genial merci exactement ce que je cherchais

fvanzeveren

[15:27](#msg5701365111ea211749c450d6)@SteeveGit  
Et comme je l'avais anticipé, ton implémentation est erronée :). Et en plus, j'avais fourni les exemples à tester... Trop confiant peut-être ;)  
Il y a une très bonne raison pour distinguer les string! et les series!.

SteeveGit

[15:27](#msg57013673d9b73e635f68c58b)euh... tu peux être plus précis ?

fvanzeveren

[15:28](#msg5701368dd478c81e2cbca090)Non, ce ne serait pas te rendre service ;)

SteeveGit

[15:28](#msg5701368ed39de41b496021ae)les exempls que tu as donné marchent bien chez moi

fvanzeveren

[15:28](#msg570136a3e4a8384a1bbe6790)réessaye... compare la sortie rebol et ta sortie sous red

SteeveGit

[15:28](#msg570136b48d2a72471b7c97a8)donc jusqu'à preuve du contraire... :-1:

fvanzeveren

[15:30](#msg57013707bbffcc665fabb58f)

```
red>> head change "abcdefghi" 123.2.3
== "123.2.3bcdefghi"
```

```
>> head change "abcdefghi" 123.2.3
== "123.2.3hi"
```

Preuve du contraire

[15:33](#msg570137cde4a8384a1bbe67ca)Par contre, pourrais-tu m'expliquer la raison de ta première ligne de code. Elle m'intrigue....

SteeveGit

[15:44](#msg57013a77d39de41b4960225a)ok, je vois le prob avec les trucs qui sont pas des strings insérés dans des strings, désolé.  
y'a un \*\*form\** à rajouter, donc ça devrait rajouter une ligne de code, je vais voir ça

[15:46](#msg57013adbd39de41b49602269)la première ligne évite de coder le cas \** insert/only\**

[15:47](#msg57013b24e4a8384a1bbe6862)&gt;insert/only \[]\[a b] == insert \[] \[\[a b]]

dockimbel

[15:59](#msg57013dd41720648112da4c06)@SteeveGit Bravo pour l'implem de `change` :+1:, si tu peux l'envoyer sous forme d'un Pull Request, en l'ajoutant au fichier %environment/functions.red, je serai content de l'intégrer (en attendant d'avoir une implémentation native).

[16:00](#msg57013e251720648112da4c08)@fvanzeveren @SteeveGit Si vous avez des tests unitaires à proposer pour `change`, ils sont également très bienvenue. ;-)

fvanzeveren

[16:16](#msg570141dbd39de41b49602397)@dockimbel  
J'ai testé l'ensemble des cas possibles dans la version que j'ai mise en ligne.

[16:16](#msg570141e88d2a72471b7c9980)Et ils fonctionnent tous comme le change de rebol

[16:20](#msg570142ead478c81e2cbca281)@SteeveGit  
Autre problème avec ton implémentation...  
Sous rebol:

```
>> head change "abcdefghijkl" [1 2 [3 4 5] 6]
== "123 4 56ijkl"
>> head change/only "abcdefghijkl" [1 2 [3 4 5] 6]
== "123 4 56ijkl"
```

Avec ton script:

```
red>> head change "abcdefghijkl" [1 2 [3 4 5] 6]
== "123 4 56efghijkl"
red>> head change/only "abcdefghijkl" [1 2 [3 4 5] 6]
== "1 2 3 4 5 6bcdefghijkl"
```

Je crains que le deuxième cas soit la faute de ta première ligne... d'où l'usage de ma première ligne dans mon script.

SteeveGit

[16:21](#msg5701430cbbffcc665fabb764)voilà, modifié: \[change.red](https://gist.github.com/SteeveGit/1072d7d56310eb87b3160d154f1b0ca8)  
En fait on pourrait avoir d'autres différences avec REBOL à cause du formatage en string! dans Red qui peut être différent. Mais je suis pas certain qu'il faille corriger Red pour que à colle pile poil à chaque fois.

fvanzeveren

[16:23](#msg57014372d478c81e2cbca29c)@SteeveGit  
Désolé, toujours pas comme rebol...

```
red>> head change/only "abcdefghijkl" [1 2 [3 4 5] 6]
== "123 4 56bcdefghijkl"
```

[16:23](#msg5701438376b6f9de194daf6f)Voir ci-dessus comment rebol et ma implémentation fonctionne...

SteeveGit

[16:28](#msg5701449dd478c81e2cbca2cd)Désolé mais là je crois que Rebol est en tort. Il ne fait pas de distinction entre \*\*change\** et \*\*change/only\** sur des strings. Ca n'a pas de sense.Ca mérite réflexion. On va pas non plus sucharger le code de Red partout à cause de bugs qui trainent depuis des années dans Rebol.

fvanzeveren

[16:29](#msg570144d8e4a8384a1bbe69f2)Le point pour moi est de d'assurer le portage d'application rebol. Si un script utilise cette bizarrerie, alors cela ne fonctionnera pas... Question de point et de vue et d'objectif...

[16:30](#msg5701453ed478c81e2cbca2e1)J'ai un soucis de portage avec parse/all ou le raffinement all n'existe pas. Si je le supprime pour red, mon script ne fonctionne plus sur rebol. Je suis donc obligé de maintenir deux versions de mon script.

[16:32](#msg570145b6d39de41b4960242c)Mais je suis d'accord que cette bizarrerie m'a vraiment fait "chier" et qu'il m'a fallu tester toutes les possibilités pour vérifier que mon script fonctionnait comme prévu

[16:35](#msg5701465ad478c81e2cbca318)Tu as cassé qqche avec ta nouvelle version.  
Sous rebol:

```
>> head change [a b c d e f g] "123"
== ["123" b c d e f g]
```

Avec ton script

```
red>> head change [a b c d e f g] "123"
== ["123" d e f g]
```

[16:36](#msg57014683d39de41b49602463)Mon unique test complexe est là pour une bonne raison donc....

SteeveGit

[16:37](#msg570146b1d9b73e635f68c82f)oui ben faut pas non plus rêver, y'aura un gros boulot de portage à plein d'endroits. Je ne crois pas que Doc ait jamais dit qu'il visait 100% de portage avec Rebol2, ça n'a jamais été son objectif. D'autant plus qu'il reprend certaines évoluitions de R3 incompatibles avec R2. Et le VID c'est compatible peut-être?  
Je crois que c'est une erreur de vouloir porter ce qui est manifestement un bug ou un oubli dans Rebol.

[16:39](#msg5701473676b6f9de194dafe7)Ah, encore un truc de cassé ? On en finit jamais :smile:

[16:53](#msg57014aa3d9b73e635f68c8ec)Le dernier cas que tu soumets est encore un bon exemple de non sens:  
\*\*change \[a b c d e]\["123"]\** est plus cohérent avec le résultat attendu. mais bon... je te le répête je pense que l'implémentation de change dans Rebol est légèrement what the fuck :smile:

[17:13](#msg57014f29e4a8384a1bbe6bbd)voilà le portage de bugs de R2 est fait ;-) \[change.red](https://gist.github.com/SteeveGit/1072d7d56310eb87b3160d154f1b0ca8)

[17:20](#msg570150d876b6f9de194db195)Si t'es ok @fvanzeveren , je peux poster un submit comme Doc le demande? Ou tu as d'autres remarques ?

nodrygo

[18:11](#msg57015ccebbffcc665fabbb9a)Désolé mais encore un truc que j'ai pas compris ou mal fait  
sur le code suivant dès que le click sur le bouton clear je perd la boucle d'évènements sur mon block dessin

```
Red [title: "simpleDraw" needs: 'view]

entities: object [
    elist:          [pen red fill-pen red circle 1x1 1]
    add: function [ pos size ][
        append   elist  compose  [circle (pos) (size) ]
    ]
]
setsize: func [x /local l] [
               l: to integer! 100 * x
               either l > 0 [l][1]]
view 
    sld: slider 5% t: text "5" 
    react [t/text:  mold setsize sld/data] return
    b: base 300x300 black
    all-over on-over [ 
       if event/down? 
           [ r: setsize sld/data
             entities/add event/offset r
             b/draw:  entities/elist]
        ] return
    button "CLEAR" [clear entities/elist  b/draw: [] ]
]
```

en attendant pour me changer les idée je vais me regarder un film .. ensuite la nuit portant conseil ;-)

SteeveGit

[18:24](#msg57015fe1bbffcc665fabbc01)Ce serait pas plutôt parce que tu as perdu le préformatage de ton block draw `pen red fill-pen red` et donc tu dessines des cercles transparents ?

RenaudG

[18:57](#msg570167a3d478c81e2cbca8bd)b'soir @nodrygo &amp; @SteeveGit . J'ai pris la question comme une occasion de me remettre à VID (autant il me retait du Rebol, autant là il restait pas grand chose). J'ai donc une solution qui marche, grace à la suggestion \*fort pertinente* de Steeve.

[19:16](#msg57016bf211ea211749c45946)J'ai aussi déplacé une grosse partie de la logique dans \*entities\*, et enlevé le \*react* pour mettre ça comme "action" du slider. Je préfère quand le sens du couplage est bien visible, lorsque c'est possible : je bouge le slider, je vois ce que j'impacte.

SteeveGit

[19:21](#msg57016d35d478c81e2cbca9c8)@RenaudG tu publies pas ? :smile:

RenaudG

[19:22](#msg57016d7f76b6f9de194db620)Si \[c'est là](https://gist.github.com/RenaudG/a2b41e8165db475a69005db35ec3125c) mais je veux pas spoiler @nodrygo . Par contre j'ai deux questions pour toi sur ça.

[19:23](#msg57016dcbe4a8384a1bbe70cf)Ligne 17, j'ai du mettre draw `el` parce que la directement ça marchait pô.... warum ?

[19:25](#msg57016e12d39de41b49602b39)question 2 : l'idée derrière ça était d'ajouter directement les circle a la suite de la liste plutôt que de ré-affecter b/draw: complètement à chaque fois.

[19:25](#msg57016e1e11ea211749c459b1)mais est-ce que ça change vraiment qqc au final ?

fvanzeveren

[19:28](#msg57016eee8d2a72471b7ca0e0)Bonjour, comment peut-on récupérer la date et le timestamp en red? La commande now n'existe pas...

RenaudG

[19:29](#msg57016f23d478c81e2cbcaa28)Hello @fvanzeveren . Pour l'instant à ma connaissance on peut pas, il faut attendre.

fvanzeveren

[19:31](#msg57016f8276b6f9de194db686)Ca c'est embêtant :/

SteeveGit

[19:32](#msg57016fe08d2a72471b7ca116)1: ben nul part ailleurs dans le code tu ne spécifies `draw` sur une facette. Faut bien le mettre au moins une fois sinon comment le gui le sait qu'il faut dessiner un bloc ?  
2: Je pige pas la question. Je vois pas où tu ré-affecte b/draw dans ton code ?

RenaudG

[19:34](#msg5701704b76b6f9de194db6ab)1: j'essaie de comprendre. 2: moi non, mais nodrygo oui.

[19:37](#msg570170ead9b73e635f68cf49)1: j'ai p'tetre pas été clair. J'ai `b: base 300x300 black draw el` mais j'aurai aimé `b: base 300x300 black draw entities/elist` (qui ne marche pas).

SteeveGit

[19:41](#msg570171fd8d2a72471b7ca183)Ah ok, ben c'est sans doute une limite du dialecte qui n'accepte pas les path! comme argument pour le moment.

RenaudG

[19:43](#msg5701727fbbffcc665fabbf30)dac, merci pour ça.

SteeveGit

[19:48](#msg57017370d39de41b49602c41)Au sujet de la présence nécessaire ou pas de b/draw dans les blocs action. Je me pose aussi des questions. Les raffraichissements (show) des facettes ne sont pas automatiques, ça dépend justement d'un inspecteur de code qui analyse la présence ou pas des identifiants des facettes dans le code action. C'est pas encore très clair pour moi.

RenaudG

[19:48](#msg570173aad478c81e2cbcab33)oki. Bienvenue dans le brouillard :)

nodrygo

[20:44](#msg570180c3bbffcc665fabc1ce)hello je viens de voir vos réponses merci  
mais en fait ça marchait bien tant que je ne touchais pas au bouton clear je regarderais ça demain

fvanzeveren

[21:30](#msg57018b7b8d2a72471b7ca607)@SteeveGit ton script ou le mien? 9 ou 10 lignes? A ce niveau de différence, l'idéal serait de tester la performance et de soumettre le plus performant... On est loin des 4 lignes de code non testées et buggées qui ont fait l'objet de la proposition de doc ;)

SteeveGit

[21:57](#msg570191af8d2a72471b7ca6ff) "non testées et buggées" ouch! Outre le fait que je n'ai pas regardé ta version finale (pense à poster des liens publiques sinon on peut pas suivre), je me doute qu'elles sont très similaires puisqu'il s'agissait pour toi d'intégrer mes suggestions d'améliorations et moi les tiennes. Tu as ma version, donc tiens nous au courant des tests de perfs ou bugs résiduels. Sinon, j'ai déjà posté un submit à Doc de la dernière version mais libre à toi de la modifier, c'est fait pour. Sur ce, je retourne à mon film Batman vs Superman (et pas fvanzeveren vs SteeveGit :smile: )

## Monday 4th April, 2016

nodrygo

[06:22](#msg5702080c11ea211749c46ece)

[06:24](#msg57020888d39de41b496040fb)@SteeveGit effectivement j'avais raté le couleur noire pas defaut sur le fond nois .. si j'avais un fond blanc ça aurait été plus évident de suite mais le soir je suis pas très bon :-)

en écrivant ce code j'ai eu pas mal d'erreur au début avec des messages d'erreurs que je n'ai pas toujours trouvé pertinents

[06:28](#msg5702099b8d2a72471b7cb5b9)@RenaudG bon j'ai effacé mon précédent message par accident  
ton code reffactoré est bien (ceci étant ce n'était pas ma priorité)  
par contre je suis d'accord pour dire que le fait que le `draw entities/elist` ne marche pas est domage ça m'a perturbé aussi au début

pour les performances elles semblent acceptables même en ré-affectant le bloc comme je l'avais fait. ça ne semble rien changer point de vue user. Il faudrait voir sur un gros dessins avec plusieurs millier d'entitées et une grande surface

mon étape suivante dessiner un rectangle en mode drag&amp;drop pour selectionner une zone sur le dessin ;-)

[10:04](#msg57023c13d478c81e2cbccce6)pas certain que ce soit le meilleur des codes mais au moins ça fonctionne  
@RenaudG j'ai repris tes modifs j'espère que tu m'en veux pas  
\[c'est ici](https://github.com/nodrygo/DemosRed)

RenaudG

[10:08](#msg57023d2b76b6f9de194dd872)Oh ben non, pas de soucis. Je vais regarder ça.

nodrygo

[10:13](#msg57023e55d39de41b49604e8c)maintenant faut que je regarde comment on ouvre un dialog  
par exemple pour mettre un selecteur de couleur

[12:08](#msg57025953bbffcc665fabe6a8)hum les message d'erreurs ne sont pas encore très au point  
style `red>> do load %simpleDraw3.red *** Script error: get does not allow integer! for its word argument *** Where: get`  
pas facile avec ça de trouver l'origine

bon heure pause dej .. on verra ça plus tard :-)

dockimbel

[12:19](#msg57025bee54b9c4023d23f3d2)@nodrygo Pourrais-tu partager dans un gist le contenu de ton fichier ? J'aimerai bien reproduire ici ce problème. Je crois que c'est une régression récente, j'aimerai bien la corriger au plus vite.

RenaudG

[12:32](#msg57025ec0d9b73e635f68f943)@dockimbel Est-ce qu'il y a une différence entre ces deux formes, en Red ?

```
func  [ :a ] [print :a]
func  [ 'a ] [print :a]
```

[12:33](#msg57025f10d9b73e635f68f962)Je n'en vois pas, contrairement à Rebol.

dockimbel

[12:38](#msg5702604c1a1ccc164832b894)@RenaudG La 2ième forme, allié à un type `[any-type!]` permet de palier à un argument manquant en le remplaçant par un `unset`. Tu peux considérer cette seconde forme comme une version plus large de la première. Mais étant donné la faible différence, il est possible qu'on les fusionne. A voir dans Rebol2/3 s'il y a des combinaisons intéressantes qu'on a pas encore implémenté dans Red.

[12:39](#msg5702606e1a1ccc164832b896)

```
lisp
red>> foo: func ['a [any-type!]] [print :a]
== func ['a [any-type!]][print :a]
red>> foo
unset
```

RenaudG

[12:39](#msg57026090d39de41b49605723)OK, merci.

nodrygo

[12:43](#msg57026156d39de41b49605754)@dockimbel c'est surtout du code pourri en cours d'écriture et pas fini  
\[ici](https://gist.github.com/nodrygo/ba8eb43a3df81a0808ff1353ba5e5308)  
je pense que le mauvais message est à cause d'un ] de trop a la fin

je tente l'ajout de popup selectio nde couleur dans le code precédent  
\[simpleDraw2](https://github.com/nodrygo/DemosRed/blob/master/simpleDraw/simpleDraw2.red)

dockimbel

[12:44](#msg570261be54b9c4023d23f3ed)@nodrygo Merci, erreur reproduite.

RenaudG

[13:01](#msg570265c6d9b73e635f68fb6e)@dockimbel Il me semble que cette différence de sémantique est importante et utile :

```
; Rebol
>> g: func  [ :a ] [reduce [a 5 6]]
>> h: func  [ 'a ] [reduce [:a 5 6]]

>> g add
== [11]
>> h add
== [add 5 6]

; Red
red>> g: func  [ :a ] [reduce [a 5 6]]
red>> h: func  [ 'a ] [reduce [:a 5 6]]

red>> g add
== [add 5 6]
red>> h add
== [add 5 6]
```

SteeveGit

[13:02](#msg570265f0e4a8384a1bbe9dbb)@RenaudG , @nodrygo , @dockimbel , j'ai pushé une modif. #1786 pour régler le prob des `e1: entities/elist` inutiles dans le code de nodrygo. Y'a plus qu'à attendre...

RenaudG

[13:03](#msg5702661dbbffcc665fabea5b)Cool @SteeveGit, Merci !

[13:05](#msg57026683d478c81e2cbcd8ab)@nodrygo Ligne 14, addline est pas fermée.

[13:05](#msg570266b5bbffcc665fabea9a)Oups, pardon, elle l'est

[13:31](#msg57026cc8d9b73e635f68fdb9)

```
(f|g|h|i) add pour :  Rebol           Red

f: func  [ :a ] [reduce [a 5 6]]      =>  [11]            [add 5 6]
g: func  [ 'a ] [reduce [a 5 6]]      =>  [add 5 6]       [add 5 6]
h: func  [ 'a ] [reduce [:a 5 6]]     =>  [add 5 6]       [add 5 6]
i: func  [ 'a ] [reduce [get a 5 6]]  =>  [action 5 6]    [make action! ...]
```

f: C'est la différence qui me chagrine, le résultat de Rebol me semble plus cohérent.  
g et i : c'est bien ce que j'attends dans les deux cas  
h: là c'est sans doute moi qui ai du mal a intégrer un truc, mais je m'attendrais à avoir la même chose qu'en i.

[13:43](#msg57026f95d39de41b49605c13)@nodrygo Un truc rigolo et pratique, c'est que tu peux exécuter directement du code choppé online.  
Par exemple pour ton simpleDraw1 :

```
do read https://raw.githubusercontent.com/nodrygo/DemosRed/master/simpleDraw/simpleDraw1.red
```

Ce qui fait que tu peux travailler directement l'édition de ton code en cours sur le gist et le tester par :

```
do read https://gist.githubusercontent.com/nodrygo/ba8eb43a3df81a0808ff1353ba5e5308/raw/f4de9b5342e06ddfda85319e24f4c488b1419fa4/gistfile1.txt
```

nodrygo

[13:44](#msg57026fda8d2a72471b7cd08f)@RenaudG oui cool je vais ajouter ça dans le README ;-)

[14:34](#msg57027b8276b6f9de194deb91)@dockimbel  
je reconnais que le code est totalement incorrect  
mais le crach est violent ;-)

```
Red [ needs: 'view]

mainwin: make face! [
    type: 'window text: "RED SimpleDraw 3 " size: 800x600
    pane: [] 
]

mainlay:   [
        t: text "1" text " Nb entities:" nb: text "0" 
    ]

append mainwin/pane  mainlay
view mainwin
```

RenaudG

[14:38](#msg57027c71d478c81e2cbce12b)Tiens @nodrygo pour le point d'accès a tes démos, mets plutôt un do read vers un truc dans cet esprit (dans un gist à part), pour un accès plus fun.

```
Red []

samples: [
    1  "Simple drawing with circles"  https://raw.githubusercontent.com/nodrygo/DemosRed/master/simpleDraw/simpleDraw1.red
    2  "Simple line drawing"          https://raw.githubusercontent.com/nodrygo/DemosRed/master/simpleDraw/simpleDraw2.red
]

forever [
    foreach [n title url] samples [ print ["- " n ": " title] ]
    unless attempt [
        r: to integer! ask "> Que voulez-vous tester ? "
        set [a b c] find samples r
        do read c
    ] [ break ]
]
```

[14:39](#msg57027c8fbbffcc665fabf266)Bon, je vais faire quelques courses, et je reviens jouer un peu plus tard ...

nodrygo

[14:39](#msg57027cac8d2a72471b7cd536)@RenaudG bonne idée je l'ajouterais

dockimbel

[14:51](#msg57027f731720648112da517d)@RenaudG Bien vu. Cependant, Rebol3 n'évalue pas un argument en get-word!, comme Red:

```
>> g: func  [ :a ] [reduce [a 5 6]]
>> g add
== [add 5 6]
```

Red a suivi Rebol3 dans ce cas là, mais je pense que ça vaut le coup de rééxaminer çà plus en détail.

nodrygo

[15:02](#msg5702820011ea211749c4914d)@RenaudG voila qui est fait avec le \[readme](https://github.com/nodrygo/DemosRed) qui va bien

RenaudG

[16:28](#msg570296338d2a72471b7cdf97)Si j'update la taille d'un AREA ou d'un TEXT (par exemple), comment je fais pour que la fenêtre s'adapte au nouveau contenu ?

[16:48](#msg57029ad6d478c81e2cbced5a)Bon, j'ai trouvé une solution manuelle :)

[16:50](#msg57029b4ee4a8384a1bbeb244)@nodrygo 'essaie de faire une version GUI de l'outil. C'est pas encore très propre, mais ça marche à peu près. Ca \[se trouve ici](https://gist.github.com/RenaudG/bb9b9e3049dc8a0bd84b5e51b0d59768). Pour le momen j'utilise un champ texte non éditable car le AREA ne rend pas les retours à la ligne. Tu peux piquer le code sans cérémonie... mais pense à ajouter le code de la démo dans le listing des démos ;-)

nodrygo

[16:53](#msg57029bec76b6f9de194df883)@RenaudG super je te mettrais comme auteur dans l'entete de toute façon ;-)  
mais je vais attendre que tu ai tout fini

RenaudG

[16:55](#msg57029c6fd478c81e2cbcede2)Ben pour le moment je suis sur 15 trucs à la fois, donc ne t'attends pas à ce que je finalise ça proprement tout de suite.

nodrygo

[16:59](#msg57029d8a8d2a72471b7ce237)@RenaudG lol je ne pense pas qu'il y ai d'urgence  
moi je me bagarre avec ma tentative de mettre un popup  
je suis en train de modifier le code en utilisant des `make face`

```
append mainwin/pane reduce [
    sld: make face! [
        type: 'slider 
         data: 1%
        offset: 5x5   size: 120x40
```

mais pas évident je ne sais pas encore comment les positionner sans mettre en dur

De plus à partir de Vendredi je vais être très indisponible .. alors ça va attendre ;-)

RenaudG

[17:15](#msg5702a138d39de41b49606f61)bon courage... pas e,core essayé ce que tu fais. Au final, tu dirais plutôt que Red te déçoit, ou que tu deviens accro ?

nodrygo

[17:29](#msg5702a4648d2a72471b7ce49e)pour l'instant je ne trouve pas très intuitif ;-) et les messages d'erreurs pas toujours d'une grande aide  
mais c'est vrai que la doc est encore minimale d'ou l'intérêt d'écrire des bout de code de test

RenaudG

[17:30](#msg5702a4af8d2a72471b7ce4b7)Oui, le manque de doc est regrettable (mais compréhensible). La doc Rebol comble beaucoup de trous, mais n(est pas 100% applicable.

[17:31](#msg5702a4f4bbffcc665fac01f2)Je te recommande une bonne lecture linéaire du \[Rebol user guide](http://www.rebol.com/docs/core23/rebolcore.html)... je suis en train de m'y astreindre et ça aide.

SteeveGit

[17:31](#msg5702a4fae4a8384a1bbeb598)On essuie les plâtres mais quand les premiers commenceront à produire des widgets fonctionnels, les suivants les remercierons. Brace yourself ;-)

RenaudG

[17:32](#msg5702a54511ea211749c49e79)En parlant de widget, un WEBVIEW serait fabuleux... mais ça risque d'être délicat. Si sur windows et mac y'a un browser standard par défaut c'est pas nécessairment le cas ailleurs (comme linux).

SteeveGit

[17:34](#msg5702a5ac8d2a72471b7ce50a)là je dirais, faut pas trop rêver non plus :smile:

nodrygo

[17:35](#msg5702a5f3d9b73e635f6913d3)@RenaudG @SteeveGit en fait pour l'instant ce n'est pas trop Red mon problème mais plutôt de bien comprendre la mécanique du VID et là je fonctionne beaucoup en copier coller sur des portions de code  
concernant Webview sur Linux il y a un widget je crois dans GTK et sur Windows un appel COM sur IE ça doit faire non ?

RenaudG

[17:35](#msg5702a5f9d39de41b49607109)Petit up' @dockimbel &amp; @SteeveGit :

```
(f|g|h|i) add pour :  Rebol           Red

f: func  [ :a ] [reduce [a 5 6]]      =>  [11]            [add 5 6]
g: func  [ 'a ] [reduce [a 5 6]]      =>  [add 5 6]       [add 5 6]
h: func  [ 'a ] [reduce [:a 5 6]]     =>  [add 5 6]       [add 5 6]
i: func  [ 'a ] [reduce [get a 5 6]]  =>  [action 5 6]    [make action! ...]
```

f: C'est \*\*LA\** différence qui me chagrine, le résultat de Rebol me semble plus cohérent.  
g et i : c'est bien ce que j'attends dans les deux cas  
h: là c'est sans doute moi qui ai du mal a intégrer un truc, mais je m'attendrais à avoir la même chose qu'en i.

Des idées/opinions/éclairages ?

SteeveGit

[17:37](#msg5702a6568d2a72471b7ce547)f a un problème, je suis d'acc

[19:08](#msg5702bbc8bbffcc665fac09e8)@RenaudG, @dockimbel Bon j'ai ptet trouvé le prob. Il semble que le comportement de 'arg et :arg dans le proto d'une fonction soient intervertis dans Red par rapport à R2. C'est là \[ptite correction](https://github.com/SteeveGit/red/commit/8ea04e00084c9acb28a95282e136b47b2628452a). Pas eu le courage de recompiler et tester (je sais c'est mal). c'est juste une petite correction mais j'ai un peu peur des régressions par rapport à la base installée.

RenaudG

[19:13](#msg5702bcc676b6f9de194e0493)Là ça dépasse de très loin mon domaine de compétence, mais c'est super si t'as trouvé la soluce :)

SteeveGit

[19:14](#msg5702bd19bbffcc665fac0a4a)Il faut encore que Doc inspecte le bouzin ;-)

RenaudG

[19:42](#msg5702c395e4a8384a1bbec043)@SteeveGit Un nouveau truc qui coince un poil, probablement dans la même veine que la correction que t'as fait (le cas de "el"). Pour \[ce code](https://gist.github.com/RenaudG/bb9b9e3049dc8a0bd84b5e51b0d59768) je suis obligé de faire les lignes 26-28 car la ligne 29 ne marche pas. Ça te parle ?

SteeveGit

[19:46](#msg5702c4b311ea211749c4a96b)Bizarre, mais est-ce que la modif est quand même faite et c'est le refresh qui ne suit pas ?

RenaudG

[19:48](#msg5702c4ffd478c81e2cbcfc55)J'en doute fort... il me crie dessus ! J'ai peur !

[19:48](#msg5702c50211ea211749c4a988);-)

[19:49](#msg5702c52cd478c81e2cbcfc64)

```
*** Script error: invalid argument: ed/text
*** Where: set
```

SteeveGit

[19:50](#msg5702c5708d2a72471b7ceffa)ah ok, mais même dans Rebol, tu peux pas utiliser des path! avec set, non ?

RenaudG

[19:50](#msg5702c590bbffcc665fac0d0c)Ah peut-être, j'avoue que je sais pô

[19:51](#msg5702c5cdd9b73e635f691e8b)essai rapide, et oui ça semble être le cas :(

SteeveGit

[19:51](#msg5702c5d8bbffcc665fac0d28)en même temps, je trouve que ce serait un ajout sympa

RenaudG

[19:52](#msg5702c5f2d478c81e2cbcfca5)ben carrément oui... je me suis pas posé la question au départ, ça me semblait naturel de faire comme ça !

SteeveGit

[19:52](#msg5702c5f4d478c81e2cbcfca6)y'a pas de raison de l'empécher

RenaudG

[19:52](#msg5702c5fbbbffcc665fac0d32)Ebénon !

ldci

[19:57](#msg5702c721d478c81e2cbcfcff)@dockimbel : j'ai commencé à interfacer OpenCV et View :) Juste une question : quelle est l'organisation du type image en Red?

## Tuesday 5th April, 2016

dockimbel

[02:11](#msg57031edd1720648112da55aa)@RenaudG L'équivalent à `h` n'est pas `i`, mais un cas que tu n'as pas listé:

```
j: func  [ 'a ] [reduce [get 'a 5 6]]     =>  [add 5 6]       [add 5 6]
```

[02:14](#msg57031f841a1ccc164832bdd9)@ldci L'API d'image! est la même qu'en R2, mais tout n'est pas implémenté (par exemble les conversions binary! &lt;=&gt; image!). Le buffer de l'image est géré par l'OS pour l'instant, dans le cas de Windows, c'est un objet GDI `Bitmap`.

[02:15](#msg57031fba1720648112da55ad)@SteeveGit Comme je l'ai dit précédemment, on a choisi la compatibilité Rebol3 pour le traitement des arguments en `:a` et `'a`.

SteeveGit

[02:16](#msg57031ff311ea211749c4c19c)euh... c'est pas comme ça dans R3, c'est pasreil que R2

[02:16](#msg57032003bbffcc665fac23c3)ou alors R3 a bien changé

dockimbel

[02:16](#msg570320191a1ccc164832bddb)Je reteste sous R3...C'est identique à Red, en prenant les cas de test de @RenaudG.

SteeveGit

[02:18](#msg5703208c8d2a72471b7d0793)surprenant

[02:19](#msg570320b576b6f9de194e1fca)bon ben tant pis

dockimbel

[02:19](#msg570320bb1a1ccc164832bdde)Mon build de R3 date un peu (4-Mar-2014/4:53:51), je vais voir s'il y a une version plus récente. Non, c'est bien la dernière dispo sur http://rebolsource.net.

[02:20](#msg570320e31a1ccc164832bde1)@SteeveGit Je ne comprends pas ta remarque `Rebol n'évalue pas les paren!` dans le Pull Request?

SteeveGit

[02:21](#msg57032136bbffcc665fac23f9)dans R2: `f: func [:a][:a]`  `f (1 + 1) ==> (1 + 1)`

dockimbel

[02:23](#msg570321a61a1ccc164832bde7)Dans Red:

```
red>> f: func [:a][:a] f (1 + 1)
== (1 + 1)
```

SteeveGit

[02:24](#msg570321c6d39de41b49609370)oui parce que 'a et :a sont intervertis par rapport à Rebol*

[02:24](#msg570321f7d9b73e635f6935c8)

```
red>> f: func ['a][:a] f (1 + 1)
== 2
```

bizarre non ?

dockimbel

[02:25](#msg570322041a1ccc164832bde8)Comme en R3:

```
>> f: func ['a][:a] f (1 + 1)
== 2
```

SteeveGit

[02:26](#msg57032259e4a8384a1bbed895)Ok, si c'est comme R3 je conteste pas, j'ai juste complètement oublié ce truc

dockimbel

[02:29](#msg570322f4d087756f7c043e36)Je ne suis pas complètement satisfait des changements dans R3 concernant ce genre de traitement, il est également possible que ce soit un bug dans R3.

SteeveGit

[02:33](#msg570323eed478c81e2cbd143e)surtout que 'a implique un literal, et :a implique un get dans la therminologie Rebolienne

[02:33](#msg570323fbd39de41b496093c0)et là c'est le contraire

[02:34](#msg5703244911ea211749c4c25d)ça perturbera un peut les Reboleurs old school

dockimbel

[02:35](#msg5703247154b9c4023d23f8fa)@SteeveGit GET ne s'applique qu'aux words et paths. Et pareil pour la notation `'` qui ne suspend l'évaluation des words et paths uniquement. Mais je suis d'accord que c'est confus, on va devoir revoir çà à l'avenir je pense, mais je vais me renseigner d'abord sur les raisons précises de ces changements dans R3.

SteeveGit

[02:38](#msg5703253576b6f9de194e2094)en même temps, je m'inquiète de la régression possible. Tu vois ça comment dans le code existant de Red?

dockimbel

[02:39](#msg57032575d087756f7c043e3b)Tu veux dire le code existant Rebol ?

SteeveGit

[02:39](#msg5703257e76b6f9de194e20a2)le code Red

[02:40](#msg5703258b76b6f9de194e20a3)le REPL

dockimbel

[02:41](#msg570325bd54b9c4023d23f900)Lance les tests unitaires et tu verras ce que çà donne. ;-) D'autre part, tu ne peux pas changer les règles d'évaluation de l'interpréteur sans faire des changements équivalents dans le compilateur (Red a deux moteurs d'éxecution, il faut modifier les deux à chaque changement sémantique).

SteeveGit

[02:41](#msg570325c676b6f9de194e20ad)arf ;-)

[02:41](#msg570325da11ea211749c4c295)je vais attendre que tu prennes une décision

[02:41](#msg570325ead478c81e2cbd149c)ensuite pourquoi pas

[02:42](#msg5703262bd478c81e2cbd14aa)ouais bon j'avais pas pensé au compilo

dockimbel

[02:42](#msg570326301a1ccc164832bdef)On ne change rien pour le moment concernant ces règles d'évaluation en attendant d'avoir plus d'info sur les raisons sous-jacentes à ces changement en R3.

[02:44](#msg570326811a1ccc164832bdf0)Sinon, je pense que tes modifs vont crasher l'interpréteur dans certains cas de figure où `func ['a]` est utilisé.

SteeveGit

[02:44](#msg5703269dd39de41b49609431)c'est clair, y'a une étude d'impact à faire

[02:45](#msg570326b1d9b73e635f693692)Il est urgent d'attendre

RenaudG

[06:18](#msg570358b1d9b73e635f693eaf):)

[06:19](#msg570358df8d2a72471b7d1127)Rhôoooo.... désolé les gars., hein ! Cassez pas tout pour moi, j'en demande pas tant ;)

[06:21](#msg5703597be4a8384a1bbee19f)Merci Doc pur le cas oublié.  
Bon, maintenant faut que je saisisse le fond du truc.

nodrygo

[09:04](#msg57037fa0e4a8384a1bbeeb16)flûte GITHUB semble en carafe  
j'espère que mon dernier push est passé

[09:17](#msg5703828dd39de41b4960a6ce) GIT de retour et mon dernier \[push](https://github.com/nodrygo/DemosRed) ok  
si ça peut aider des nouveaux venu tant mieux

RenaudG

[09:31](#msg5703860ad478c81e2cbd28f0)Cool, mais pour le moment les URL pour les "demo player" sont pas bonnes.

nodrygo

[09:33](#msg57038675e4a8384a1bbeed4a)ah oui ? j'avais pourtant testé :-(  
ah mais en fait j'ai un pb sur le push

RenaudG

[09:33](#msg57038677bbffcc665fac37d5)Une idée si t'as le temps, serait de mettre un catalogue des démos au format "sample", et de charger sample (dans les deux players) via cette URL : une seule maintenance pour les mises à jour ensuite ;-)

nodrygo

[09:34](#msg570386c111ea211749c4d6f7)oui j'y avais pensé mais mais je suis en train de me battre avec la demoDraw 4 :-)

RenaudG

[09:42](#msg5703888ad9b73e635f694aa2)Voilà pour la liste des samples à jour :smile:

```
[
    "Basic Red GUI Widgets"     https://raw.githubusercontent.com/nodrygo/DemosRed/master/demosBasic/basicWidgets.reds
    "Draw with list of points"  https://github.com/nodrygo/DemosRed/raw/master/simpleDraw/simpleDraw1.red
    "Draw with connected lines" https://github.com/nodrygo/DemosRed/raw/master/simpleDraw/simpleDraw2.red
    "Same + color selector"     https://github.com/nodrygo/DemosRed/raw/master/simpleDraw/simpleDraw3.red
]
```

Et t'as plus qu'à faire un `samples: load http://the-URL-qui-va-bien`

nodrygo

[09:43](#msg570388bad39de41b4960a8c6)oui j'était ne train de le préparer en fait ;-)

RenaudG

[09:44](#msg570388e4bbffcc665fac3867)Ouep, j'aurai du te dire que je te le préparais, ça t'aurai évité de perdre du temps, sorry.

nodrygo

[09:44](#msg57038905d478c81e2cbd29f0)pas de soucis

dockimbel

[09:46](#msg57038958d9b73e635f694ada)@nodrygo Il y a une erreur de frappe sur l'extension de \[ce fichier](https://github.com/nodrygo/DemosRed/tree/master/demosBasic), ça devrait être .red et non .reds.

RenaudG

[10:05](#msg57038dec5386a91525336e7a)@nodrygo tes demo runners ont % devant les URLs, ça coince.

nodrygo

[10:07](#msg57038e6ddc7a737756975bbb)oui j'ai corrigé en local ;-)  
par contre je cherche une fonction type `map` comme en elixir  
ou encore `range` pour injecter un nombre dans la collection  
la version cli en a besoin  
dans d'autres lang. j'auris fait un ZIP sur un RANGE ;-)  
mais là je crois qu'il va falloir être plus basique

RenaudG

[10:21](#msg570391c18eec5313252e2cdf)@nodrygo

```
n: 0
sample: foreach [ttl url] load https://github.com/nodrygo/DemosRed/raw/master/demopath.red [
    append [] reduce [n: n + 1 ttl url]    
]
```

nodrygo

[10:22](#msg570391e58e22137808cc1817)@RenaudG thanks  
Red pas aussi puissant que Elixir , Racket ou ou Ocaml ;-)

ouch ton code crach Red  
il faut faire le load avant

[10:44](#msg57039711dc7a737756975dfe)@RenaudG voila cette fois ça devrait être OK

[10:48](#msg570397f2f504b375561b4709)@dockimbel ah oui pour l'extension j'avais pas vu je vais le changer

dockimbel

[10:49](#msg5703982bf7d63d897f2361ca)@nodrygo J'ignorais que Elixir, Racket et Ocaml étaient aussi en version 0.6.0 alpha. ;-)

nodrygo

[10:51](#msg570398c0f7d63d897f2361f5)@dockimbel hahaha bien vu  
je commence à m'habituer à Red mais encore du chemin à faire  
voila extension changée

dockimbel

[10:52](#msg570399055386a91525337167)@nodrygo De plus, comme RenaudG vient de le démontrer implementer un ZIP ou même un RANGE est triviale en Red, c'est 1-2 lignes de code.

nodrygo

[10:53](#msg5703994615b4d27b083eca82)@dockimbel probablement .. mais ma maîtrise semble encore très insuffisante ;-)

[12:39](#msg5703b1eef504b375561b4f21)@dockimbel  
au fait comme je disais à RenaudG la portion de code qu'il m'a donné

```
n: 0
sample: foreach [ttl url] load https://github.com/nodrygo/DemosRed/raw/master/demopath.red [
    append [] reduce [n: n + 1 ttl url]    
]
```

marche bien sur Linux (version 02 Avril) mais crache violemment la REPL Windows du 05 Avril

RenaudG

[12:41](#msg5703b26df7d63d897f236959)@nodrygo J'avais zappé ça. Suis sur une build du 4. vais prendre la dernière.

nodrygo

[12:42](#msg5703b29bf7d63d897f23696c)@RenaudG oui dis moi si tu reproduit ou si c'est chez moi  
a noter que je suis sur XP dans une virtualBox

RenaudG

[12:51](#msg5703b4b58e22137808cc220e)Non @nodrygo pas de crash avec la dernière build. Sans doute un pb du a ton contexte spécial.

[12:51](#msg5703b4c7f504b375561b4fff)le load seul marche ?

nodrygo

[12:51](#msg5703b4ebad40c3877fa965b3)oui d'ailleur j'ai séparé le load du reste dans le code à cause de ça et du coup marche nickel

RenaudG

[12:53](#msg5703b52e5386a915253379ab)Curieux !

nodrygo

[12:54](#msg5703b5948eec5313252e3742)@RenaudG bah si c'est pas un bug reproductible c'est que c'est pas grave  
quand j'aurais un version native GTK je ne me poserais plus de questions ;-)

RenaudG

[12:55](#msg5703b5b15386a915253379e8)ben toi t'arrive bien à le reproduire.

nodrygo

[12:56](#msg5703b5ecf504b375561b5069)systématique. mais comme c'est un environnement particulier ça ne me semble pas une priorité

RenaudG

[14:12](#msg5703c7c5f504b375561b5775)

```
Red []

items: [1 2 3 4] 
code:  [print item] 

;; RED ne crée pas de bindings locaux, donc ceci marche, contrairement
;; à Rebol qui nécessite :     foreach item items [do bind code 'item]
;; Mais en contrepartie ITEM fuit dans l'espace global 
item: 100
print ["item = " item]
foreach item items [do code] 
print ["item = " item]

print "-----------------"

;; En Red si je veux protéger ITEM, je suis obligé de mettre le tout
;; Dans une fonction et de l'appeler...       à ce qu'il me semble !
dummy: has [item] [
    foreach item items [do bind code 'item]
]
item: 100
print ["item = " item]
dummy
print ["item = " item]
```

Est-ce qu'il y a un moyen plus simple, sans passer par la création d'une fonction ?

SteeveGit

[14:30](#msg5703cc0d5386a915253382a9)ben, c'est à ça que sert `context`

RenaudG

[14:31](#msg5703cc4dad40c3877fa96e9b)Ah oui, pas con ! Je me creusais tellement la tête dans la mauvaise direction que j'y ai même pas pensé dans ce contexte !

nodrygo

[14:34](#msg5703cce48e22137808cc2b6f)si j'ai bien compris un context n'est qu'un objet déguisé .. donc ça revient un peu à mettre dans une fonction non ?

SteeveGit

[14:35](#msg5703cd498e22137808cc2b98)Effectivement

```
red>> source context
context: func [spec [block!]][make object! spec]
```

[14:37](#msg5703cda115b4d27b083edc68)mais t'es pas obligé de nommer le context, ça en fait du code anonyme

RenaudG

[14:37](#msg5703cda28e22137808cc2bbe)OK, ça marche, donc pour ceux que ça peut aider il faut faire :

```
item: 100
print ["item = " item]
context [
    item: 0
    foreach item items [do bind code 'item]
]
print ["item = " item]
```

SteeveGit

[14:38](#msg5703cde915b4d27b083edc96)et une fois que le GC sera en marche, les données, variables, seront clearées

RenaudG

[15:35](#msg5703db27ad40c3877fa97523)Bon, je me prends sans doute la tête plus qu'il ne faudrait, mais j'ai réussi à obtenir ce que je cherchais :smile:

```
item:  100
items: [1 2 3 4] 
code:  [print item] 


local: func [vars code] [
    spec: append copy [/local seed] vars
    f: func spec [do bind code 'seed]
    f
]

print ["OUT: item = " item]
local [item] [
    foreach item items [
        print ["IN: item" item]
        do code
    ] 
]
print ["OUT: item = " item]

print "-----------------"

print ["OUT: item = " item]
local [item] [
    foreach item items [
        print ["IN: item" item]
        do bind code 'item
    ] 
]
print ["OUT: item = " item]
```

Peut-on améliorer `local` ?

dockimbel

[15:56](#msg5703e049ab6502a50341b145)@RenaudG Ton `local` est un port de la fonction `use` en \[Rebol](http://www.rebol.com/docs/words/wuse.html). ;-)

[15:57](#msg5703e086a249048b2a0b5c52)

RenaudG

[15:58](#msg5703e0a25386a91525338b25)Argh ! :)

[15:59](#msg5703e0ed15b4d27b083ee403)c'est déjà pas si mal comme ça, mais c'est vrai que `f: .. f`me chagrine un poil... mais bon, faut bien l'évaluer.

dockimbel

[15:59](#msg5703e0f33a2aa3ca5a831542)J'ai supprimé mon commentaire, j'avais mal lu ton code.

RenaudG

[16:00](#msg5703e11b8eec5313252e4853)Je viens d'ouvrir rebol... hélas `use` est native, du coup j'ai rien appri.

dockimbel

[16:01](#msg5703e14d3a2aa3ca5a831545)@RenaudG

```
local: func [vars code] [do has vars code]
```

RenaudG

[16:02](#msg5703e18c5386a91525338b88)Ah oui, voilà qui est beaucoup plus joli ! Des fois je suis idiot, mais idiomatique... pas encore assez !

dockimbel

[16:02](#msg5703e19c3a2aa3ca5a831549)`use` n'est plus natif en Rebol3:

```
>> source use
use: make function! [[
    "Defines words local to a block."
    vars [block! word!] "Local word(s) to the block"
    body [block!] "Block to evaluate"
][
    apply make closure! reduce [to block! vars copy/deep body] []
]]
```

SteeveGit

[16:02](#msg5703e1a515b4d27b083ee439)In Rebol, there is no need for such trick since foreach declares item local to the block code. Should not Red follows the same behavior @dockimbel ?  
\*\*pourke je parle bad english ici moi !?\**

dockimbel

[16:03](#msg5703e1b7ab6502a50341b155)`apply` et `closure!` seront ajouté bientôt dans Red.

RenaudG

[16:04](#msg5703e1f55386a91525338bb5)vivement bientôt !

[16:07](#msg5703e2a9dc7a737756977871)Bon, au départ j'avais un problème concret a résoudre, et maintenant je sais plus quel problème c'était !

dockimbel

[16:10](#msg5703e3923a2aa3ca5a831554)@RenaudG Ok, j'ai edité ma version de `local`, je crois que c'est l'implémentation la plus simple possible. ;-)

RenaudG

[16:11](#msg5703e3c1f504b375561b630c)Oputaing' ! Oui, elle a maigri la bougresse !

nodrygo

[16:38](#msg5703ea13f7d63d897f237f8a)plus je lis des doc Red et plus j'aime ... je crois que je devient accro ;-)

RenaudG

[16:42](#msg5703ead88e22137808cc37a0)Yep @nodrygo je vois ce que tu veux dire... je le suis déjà ! Les choses sont différentes des autres langages, mais pour une raison. Lorsqu'on saisi la \*big picture\*, ça paraît évident... et tellement génial ! Tellement expressif, puissant et simple !

dockimbel

[16:45](#msg5703ebbe3a2aa3ca5a831579)@nodrygo @RenaudG Je crains que les prochaines versions de Red ne renforcent votre addiction naissante. ;-)

nodrygo

[16:46](#msg5703ec00ad40c3877fa97bc0)@dockimbel mais on ne demande que ça .. toujours plus impatient que jamais ;-)  
NB: je suis entrain de relire toutes tes publications depuis les origines. J' apprends beaucoup, super intéressant

RenaudG

[18:13](#msg5704005e8eec5313252e5387)Tiens @nodrygo si t'as pas \[vu ça](https://gist.github.com/dockimbel/17547f19e7f4454d51a4e4640a2ba25c), je viens de tomber dessus et je me suis dit que ça te plairait.

nodrygo

[18:16](#msg570401088e22137808cc3f0a)@RenaudG oui amusant mais pas réussi à le faire marcher  
ceci étant ça reste du code intéressant à lire

RenaudG

[18:17](#msg570401575386a9152533973a)Ca marche pas ça ?  
`do read https://gist.githubusercontent.com/dockimbel/17547f19e7f4454d51a4e4640a2ba25c/raw/d6172fb62661533dbfb3694e8f522ad04fd4535d/particle.red`

nodrygo

[18:19](#msg570401b9f504b375561b6d30)@RenaudG ah si chargé comme ça ça marche moi j'avais fait un copié collé dans la repl .. il manquait certainement quelque chose :-)  
très fun en effet

il faudrait peut ^etre voir avec Dockimkel si on peut pas mettre des liens de demos externes dans le `demopath` ;-)  
de plus j'ai repiqué mal de code démo incluant le clock de doc mais je les ai pas mis car pas auteur

au tu veux que je t'ajoute comme collaborateur dans le repo des demos ?

RenaudG

[18:45](#msg570407e65386a915253399a6)Why not :) (faut que j’apprenne un peu à utiliser Git(hub) et ses outils)

nodrygo

[18:47](#msg5704085dad40c3877fa985e0)tu sais je ne suis pas un super pro non plus .. je l'utilisait à minima dans mon dernier job ;-)

RenaudG

[18:48](#msg57040889ad40c3877fa985f3)Ben on va en apprendre des trucs ! C'est stimulant.

nodrygo

[18:50](#msg57040906f7d63d897f238adc)voila je pense que c'est fait ... on verra dans la suite  
maintenant pause Red (je vais peut être commiter une capture d'écran avant )  
c'est l'heure de se faire quelques épisodes d'Arrow :-)

RenaudG

[18:52](#msg5704097e5386a91525339a36)Bon ben moi je vais apprendre le béabat de Git. Quelle saison d'Arrow ?

nodrygo

[18:58](#msg57040ad6dc7a737756978692)2  
bon courage avec Git  
je vais `comiter` une version exe de demosGui et une capture d'ecran  
a +

RenaudG

[18:59](#msg57040b098eec5313252e574e)Ah, ben j'ai de l'avance alors :) Allez... bonne soirée et a+

nodrygo

[19:04](#msg57040c208eec5313252e5791)GIT à de nouveau des problèmes ... ça rame grave

RenaudG

[19:04](#msg57040c455386a91525339b04)Je croyais que c'était ma "promotion" récente qui rendait le truc si lent... tu me rassure.

nodrygo

[19:05](#msg57040c7b5386a91525339b1e)nan et en plus mon dernier push est pas passé je sais pas pourquoi .. on verra ça demain

StephaneVeneri

[22:15](#msg570438e5dc7a7377569794c4)@dockimbel Depuis au moins les versions du 3 avril (Automated builds), mon script 3dviewer.red déclenche une erreur alors qu’il fonctionne parfaitement avec la version stable 0.6.0. En recherchant le problème, j’ai identifié la source mais je ne sais pas si c’est une régression de Red ou une mauvaise utilisation de ma part à la base, j’ai créé un petit script pour le reproduire:

```
Red []
buffer: { Ambient light color: Red=0.3 Green=0.3 Blue=0.3
Named object: "Cube"
Tri-mesh, Vertices: 8     Faces: 12
Vertex list:
}
ws: charset reduce [space tab cr lf newline]
dstring: charset {"}
parse buffer [	some [	thru ["Named object:" ws dstring]
						copy nameelt to dstring (print nameelt) ]]
```

[22:17](#msg5704396315b4d27b083f0183)Le mot \*\*Cube\** n’est jamais affiché avec les nouvelles versions.

SteeveGit

[22:21](#msg57043a7415b4d27b083f01c6)Surpris que `thru` ait jamais marché avec des blocs

RenaudG

[22:21](#msg57043a828eec5313252e6715)Chez moi avec la dernière build Windows le parse renvoie false mais le mot \*\*Cube\** est affiché.

SteeveGit

[22:24](#msg57043b07dc7a73775697954c)Remplace

```
thru ["Named object:" ws dstring]
```

par

```
thru "Named object:" ws dstring
```

StephaneVeneri

[22:40](#msg57043ed08eec5313252e684d)Effectivement mon script marche mieux sans les blocs. J’étais persuadé qu’il fallait mettre `thru` suivi d’un bloc :worried: . Je testerai demain (là il se fait tard) sur toutes les règles de mon parse. Merci.

RenaudG

[22:51](#msg570441568eec5313252e68cc)@SteeveGit Marrant chez moi ça passe bien avec les blocs. Même sa version affiche bien "Cube", en fait.

## Wednesday 6th April, 2016

nodrygo

[09:59](#msg5704dde58eec5313252e86e3)@dockimbel je voudrais savoir si il y a un moyen de créer un slider avec une vleur par défaut  
si je fais slider 20% il me crée un slider de taille max 20% j'ai l'impression

dockimbel

[10:00](#msg5704de2540bf27e54a0ea4f8)@nodrygo La taille max est toujours de 100%.

nodrygo

[10:01](#msg5704de8cdc7a73775697b4c8)alors comportement curieux

```
to-color: function [r g b][
    color: 0.0.0
    if r [color/1: to integer! 256 * r]
    if g [color/2: to integer! 256 * g]
    if b [color/3: to integer! 256 * b]
    color
]
colorpopup: function [
    "show color box popup"
     lcolor [tuple!]
     return: [tuple!]
][
     lcr: to percent! lcolor/1
     lcb: lcolor/2
     lcg: lcolor/3
    view/flags [
      LCL: base 100x100 red react [color]
      group-box "color select"  [ 
      return  across
      text "R:"  LSR: slider lcr [LCL/color: to-color LSR/data LSG/data LSB/data ] return
      text "G:"  LSG: slider lcg [LCL/color: to-color LSR/data LSG/data LSB/data ] return
      text "B:"  LSB: slider lcb [LCL/color: to-color LSR/data LSG/data LSB/data ]
    ]return 
      button "OK" 100     [ unview color: to-color LSR/data LSG/data LSB/data ]
      button "Cancel" 100 [ unview]
    ][modal popup]
    LSR/data: 20%
    lcolor
]
;; colorpopup to-color 50% 20% 20%
```

[10:13](#msg5704e14a8e22137808cc73f6)@dockimbel chez moi les slider on chacun une taille max au % mis  
mais c'est peut être mon environnement  
je regarderais plus tard j'ai travaux à faire

[10:15](#msg5704e1bd8eec5313252e87f2)@dockimbel @RenaudG m'a trouvé la soluce merci

[10:18](#msg5704e270f7d63d897f23bc5d)tout ça parce que j'avais pas été assez attentif  
Cool simpleDraw avec popup colorSelector marche nickel  
je posterais çà plus tard

ldci

[16:13](#msg5705358eb17e698d5ef15fc6)L'interface Red/View et OpenCV fonctionne ! Voici une première illustration https://drive.google.com/file/d/0BzN\_niDInGT4cWVtS0NIUWNOeW8/view?usp=sharing

[16:20](#msg57053734d6cbe1fd27fdde67)Le code est un peu complexe car on mixte du code Red et Red/system, mais cela fonctionne assez bien  
‘‘‘

RenaudG

[16:20](#msg57053768799f8c895eb4fa70)J'y connais rien @ldci mais ça semble un sacré boulot. Chapeau.

[16:22](#msg570537d0f5db499c02182ae1)Une sacrée toolbox a portée de main des Red... heu... programmeurs Red.

ldci

[16:24](#msg57053838f5db499c02182b07)@RenaudG : environ 600 fonctions qui permettent de faire du traitement d'image avec Red. Je vais mettre à jour sur GitHub demain :)

RenaudG

[16:25](#msg5705388fb12cb51618d296ac)Oui, je voyais plusieurs repos "OpenCV" chez toi mais sans update récente... je suis très curieux de regarder ça. Merci pour la contrib' en tout cas !

ldci

[16:28](#msg5705393bb17e698d5ef16138)@dockimbel : j'ai été obligé de renommer pas mal des fichiers Red/System car ils étaient en conflit avec View (notamment pour la video). Pour éviter les problèmes, tous les fichiers sont préfixés avec cv, e.g. cvCore, cvVideo ... Bon encore du travail à faire, mais sur le fond ça marche:)

SteeveGit

[16:39](#msg57053bdb799f8c895eb4fbd9)super @ldci

ldci

[17:45](#msg57054b3182aae5fc2799f8cf)@ tous: j'ai mis à jour le repo sur GitHub: https://github.com/ldci/OpenCV3-red avec le début des exemples pour View. A +

SteeveGit

[19:14](#msg5705602c9ef9b99902ae9a58)@ldci, As far as I can see the source of red routines are distributed among samples. The next step would be to make libraries of routines by theme.

RenaudG

[19:15](#msg57056062d6cbe1fd27fdec3f)V'la qu'ça l'reprend... :worried:

SteeveGit

[19:16](#msg57056080d6cbe1fd27fdec47)merde pourquoi je cause english ici moi

StephaneVeneri

[20:28](#msg5705716bf5db499c02183f16)Un petit retour sur mon problème de parse d’hier. Donc rien à voir avec les crochets après le `thru`puisque c’est une règle qui suit donc un block! (si je ne dis pas de bêtise) par contre en contrôlant avec un éditeur hexadécimal, un petit caractère est apparu au beau milieu (après le some)

```
parse buffer [ someÂ [ thru ["Named object:" ws dstring]
```

Après nettoyage tout fonctionne comme il le faut avec les versions Automated builds.

RenaudG

[20:30](#msg570571e8f5db499c02183f4f)merci pour le retour. Bonne soirée.

SteeveGit

[20:34](#msg570572dd799f8c895eb50df3)Le thru s'applique uniquement au premier terme du bloc. dans ton cas, le block est donc complètement optionnel (et même le ralentit un pouillème).

StephaneVeneri

[20:56](#msg570577f8d6cbe1fd27fdf467)@SteeveGit Pourtant si je regarde la doc sur le parse \[http://www.red-lang.org/2013/11/041-introducing-parse.html], j’ai l’impression que l’on peut mettre les règles dans un block! comme pour le `some` par exemple.

SteeveGit

[20:57](#msg57057855d62e7a1918de56ec)tu peux mais dans ton cas y'a pas de valeur ajoutée. Si tu avais une règle alternative dans le bloc `|` ce serait différent.

StephaneVeneri

[21:01](#msg57057942b17e698d5ef17661)Ok je pense voir ce que tu veux dire, je vais tester ça.

## Thursday 7th April, 2016

dockimbel

[02:29](#msg5705c61d3bc1aed55b5b65c7)@StephaneVeneri Tu peux spécifier une règle complexe dans le block qui suit un `to/thru`.

ldci

[10:05](#msg57063105f5db499c0218676c)@SteeveGit je pense que je vais attendre une version stable de Red avant d'envisager de faire des libs de routines. Actuellement, il faut faire pas mal de gymnastique pour passer de Red/S à Red: par exemple les variables globales ne sont pas partagées entre Red/S et Red, à la différence de Rebol 2.

dockimbel

[10:07](#msg5706315582aae5fc279a2e0f)@ldci Qu'est-ce que tu entends par "à la différence de Rebol 2" ?

ldci

[11:01](#msg57063e13f5db499c02186ad5)@dockimbel simplement que des variables définies globalement peuvent être utilisée par du code Rebol comme par les fonctions de la dll. En d'autres termes les variables Rebol peuvent être alimentées par le résultat des fonctions de la dll. Actuellement dans Red, les variables globales peuvent être passées en argument aux routines Red/S mais pas directement . Pas exemple je ne peux pas documenter un objet en récupérant le contenu d'une structure Red/S. Je dois passer par une étape intermédiaire pour récupérer le contenu de chaque membre de la structure  
\`

[11:02](#msg57063e47d62e7a1918de7fb3)

```
getValue: routine [index [integer!] return: [integer!] /local v s] [
	imgStruct: getImageValues img ; IplImage structure
	case [
		index = 1 [v: imgStruct/nSize]
		index = 2 [v: imgStruct/ID]
		index = 3 [v: imgStruct/nChannels]
		index = 4 [v: imgStruct/alphaChannel]
		index = 5 [v: imgStruct/depth]
		index = 6 [s: imgStruct/colorModel 
			if s/1 = #"R" [v: 1] ; RGB 
			if s/1 = #"G" [v: 3] ; GRAY
		] 
		index = 7 [s: imgStruct/channelSeq  
			if s/1 = #"R" [v: 1] ; RGBA 
			if s/1 = #"B" [v: 2] ; BGRA 
			if s/1 = #"G" [v: 3] ; GRAY
		
		] 
		index = 8  [v: imgStruct/dataOrder]
		index = 9  [v: imgStruct/origin]
		index = 10 [v: imgStruct/align]
		index = 11 [v: imgStruct/width]
		index = 12 [v: imgStruct/height]
		index = 13 [v: as integer! imgStruct/*roi]
		index = 14 [v: as integer! imgStruct/*maskROI]
		index = 15 [v: as integer! imgStruct/*imageId]
		index = 16 [v: as integer! imgStruct/*tileInfo]
		index = 17 [v: imgStruct/imageSize]
		index = 18 [v: imgStruct/*imageData]
		index = 19 [v: imgStruct/widthStep]
		index = 20 [v: imgStruct/bm0]
		index = 21 [v: imgStruct/bm1]
		index = 22 [v: imgStruct/bm2]
		index = 23 [v: imgStruct/bm3]
		index = 24 [v: imgStruct/bc0]
		index = 25 [v: imgStruct/bc1]
		index = 26 [v: imgStruct/bc2]
		index = 27 [v: imgStruct/bc3]
		index = 28 [v: as integer! imgStruct/*imageDataOrigin]
	]
	v
]
```

[11:05](#msg57063f00d62e7a1918de7fd9)Ce n'est pas trop gênant si la structure ne contient que des entiers, mais cela se complique si la structure est composite :)

[12:39](#msg57065512799f8c895eb5404a)@dockimbel : Peut-on créer une image comme en Rebol. img: make image!\[640x480 rgb]?

SteeveGit

[12:41](#msg57065590d62e7a1918de87b9)make image! reduce \[10x10 blue ]

ldci

[13:53](#msg57066655d62e7a1918de8d99)Le make image! fonctionne sans problème. La question ici est de passer en argument à Make image! les valeurs binaires qui sont récupérées à l'adresse du pointeur imgStruct/\*imageData. On connait l'adresse du pointeur ainsi que la taille de la zone mémoire qu'on veut récupérer. Qui aurait une idée pour écrire une fonction en Red pour faire ça (et pas en Red/s) comme dans cette fonction Rebol

```
cvtoRebolByPtr: func [img dest /local src] [
"Transforms OpenCV image to REBOL image"
    src: getIPLImage img 							; get values of IplImage
	data: src/imageData								; address of image data
	rgb: reverse get-memory data src/imageSize		;get the data in rgb order
	; mow makes a REBOL image
    dest/image: make image! reduce [as-pair (src/width) (src/height) rgb]
	show dest
]
```

[13:59](#msg570667b3b17e698d5ef1ac1d)Bien évidemment c'est le get-memory qu'il faut programmer:)

## Friday 8th April, 2016

RenaudG

[08:33](#msg57076cd68b7b2f457634c7b6)Je comprends pas bien pourquoi Red ne marche pas sur un VPS x86\_64 sous Ubuntu (après install du support 32 bits comme indiqué sur la page download de Red), alors que sur d'autres VPS ou serveurs similaires ça ronronne sans soucis, là il me dit :

```
root@renaud1:~# ./red-07apr16-05a7c4f
-bash: ./red-07apr16-05a7c4f: cannot execute binary file: Exec format error
root@renaud1:~# ldd red-07apr16-05a7c4f
        not a dynamic executable
root@renaud1:~#
```

dockimbel

[08:36](#msg57076da2f55f5c717feb3fa9)@RenaudG Ca ressemble à une corruption durant le download. Efface le fichier et télécharge le à nouveau.

RenaudG

[08:39](#msg57076e2fc65c9a6f7f27d2ce)Déjà essayé plusieurs fois. Ça coince avec le binaire red récupéré via wget aussi bien qu'un scipt compilé ici (-t linux) transféré via sftp.

[08:40](#msg57076e89ddb5a2cf3bba837e)Là où ça marche c'est un "vrai" système ou du VMware. Là c'est du KVM.. mais peut-être que je rate une autre différence évidente qui expliquerait le truc...

SteeveGit

[08:41](#msg57076ea78b17927458e28c2b)un truc serait d'essayer de la compiler sur le vps

RenaudG

[08:41](#msg57076eb7f55f5c717feb3ffb)

```
root@renaud1:~# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                2
On-line CPU(s) list:   0,1
Thread(s) per core:    1
Core(s) per socket:    1
Socket(s):             2
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 77
Model name:            Intel(R) Atom(TM) CPU  C2750  @ 2.40GHz
Stepping:              8
CPU MHz:               2393.902
BogoMIPS:              4787.80
Hypervisor vendor:     KVM
Virtualization type:   full
```

SteeveGit

[08:45](#msg57076fb7ddb5a2cf3bba83d3)Trouvé une info  
&gt;You need to install libgcc1:i386 to make ldd happy for 32-bit binaries.

Essaye  
&gt; apt-get install gcc-multilib

RenaudG

[08:47](#msg5707701f8b17927458e28ca6)Bonne prise Steeve ! Effectivement ça résoud le soucis.

[08:47](#msg5707703c74d45a71586e7d05)Ceci a suffit: apt-get install libgcc1:i386

SteeveGit

[08:48](#msg57077058ddb5a2cf3bba83fc)à rajouter sur la page d'install alors

RenaudG

[08:49](#msg5707708c74d45a71586e7d20)Mais effectivement ce serveur (un tet de l'offre Scaleway) est vrai moulu, dons j'y avais pas encore installé les build-essentials.... qui incluent probablement ça par défaut. D'où la différence.

[08:50](#msg570770dbf55f5c717feb4084)Voulais dire : Mais effectivement ce serveur (un tset de l'offre Scaleway) est frai moulu, donc j'y avais pas encore installé les build-essentials.... qui incluent probablement ça par défaut. D'où la différence.

[08:51](#msg570770f9c65c9a6f7f27d39b)J'ai pas encore une caféinémie suffisante pour fonctionner correctement

SteeveGit

[08:51](#msg5707711fc65c9a6f7f27d3a4)c'est quand même bon à spécifier sur la doc, car si la lib est pas là on peut même pas trouver ce qui manque car ldd marche pas non plus.

RenaudG

[08:53](#msg5707719bc65c9a6f7f27d3c0)Tout à fait... plus que bon, c'est important !

[08:57](#msg5707727c1ee04bd23b767884)oups... faut que je vérifie un truc avant

[08:59](#msg570772fa8b7b2f457634c954)Non, en fait ça marche toujours pas

SteeveGit

[09:00](#msg57077311ddb5a2cf3bba84a4)et ldd ?

RenaudG

[09:00](#msg570773218b17927458e28d76)ldd pas mieux

[09:01](#msg5707734f2a2f4d427612aa97)Par contre ld me dit ça :

```
root@renaud1:~# ld red-07apr16-05a7c4f
ld: i386 architecture of input file `red-07apr16-05a7c4f' is incompatible with i386:x86-64 output
ld: warning: cannot find entry symbol _start; defaulting to 0000000000401f80
```

[09:02](#msg570773a5ddb5a2cf3bba84d3)J'ai confusionné entre plusieurs consoles SSH ouvertes sous Windows, qu'il faut regarder de près pour les distinguer

SteeveGit

[09:06](#msg570774798b7b2f457634c9a8)&gt;Note that in Fedora 21, to get ldd to identify 32bit .so files, I had to install the following:  
sudo yum install glibc.i686 libgcc.i686 libstdc++.i686 glibc-devel.i686  
I'm not sure which one of those fixed the "not a dynamic executable" error I was seeing in ldd.  
Here (on CentOS7) only yum install glibc.i686 was needed to make this work for the vxworks 6.9 deflate executable. – Jens Feb 10 at 16:14  
add a comment

[09:07](#msg570774e074d45a71586e7e30)google search "ldd not a dynamic executable"

RenaudG

[09:34](#msg57077b0f1ee04bd23b767aee)Bon toujours pas résolu, je poursuis les recherches plus tard

fvanzeveren

[12:05](#msg57079e8074d45a71586e8967)@dockimbel  
Bonjour Doc.  
Désolé pour cette bête question, mais comment remonte-t-on un bug ?

RenaudG

[12:08](#msg57079f398b17927458e2984e)https://github.com/red/red/issues/new

ldci

[12:21](#msg5707a23eddb5a2cf3bba91bd)@dockimbel : Red/S permet d'utiliser les pointeurs de façon efficace:) Qu'en est il pour Red?

fvanzeveren

[13:08](#msg5707ad3b74d45a71586e8e9d)Merci renaud :)

[15:09](#msg5707c9bcc65c9a6f7f27eefa)@SteeveGit  
Désolé pour cette longue absence... Vacances.  
Je voulais te signaler que ton implémentation de change n'est toujours pas OK.  
Hint: https://gist.github.com/fvanzeveren/2a23d0af2b443d87dbe28ca15e74c72c.js

[15:29](#msg5707ce4f74d45a71586e9b41)Bonjour à tous,  
Je souhaites simplement faire savoir que j'ai mis en ligne un script qui est un \[framework](https://gist.github.com/fvanzeveren/379b92ef9ec9e3d553e8a6646996d2b0) basique pour mettre en place des tests systématiques et/ou de régression de scripts red.

[15:30](#msg5707ce918b17927458e2aa17)Un \[exemple](https://gist.github.com/fvanzeveren/2a23d0af2b443d87dbe28ca15e74c72c) d'utilisation

RenaudG

[18:38](#msg5707fa918b7b2f457634f44a)Bon, j'ai résolu mon problème de lancement sur VPS 64 bit... ça venait de la version du kernel qu'ils fournissent :

```
zcat /proc/config.gz | grep IA32
# CONFIG_IA32_EMULATION is not set
```

Avec le bon kernel, ça marche :)

[18:41](#msg5707fb4f8b7b2f457634f491)(Ou comment perdre un temps monstre pour... pas grand chose !)

## Sunday 10th April, 2016

nodrygo

[18:06](#msg570a963774d45a71586f064b)C'est juste moi ou il y a un comportement bizarre entre

```
view layout [
    base 300x200 white
        draw [ [pen red    Line-width 2 ]
              [pen red   Fill-pen off Line-width 2 line 10x10 100x100] 
              [pen green Fill-pen green Line-width 2   circle 110x130 50] 
              [pen blue  Fill-pen blue Line-width 4 line 30x30 200x150]
              [pen blue  Fill-pen off Line-width 4 circle 100x150 20] 
            ]
]
```

et

```
base 300x200 white
        draw [
              [pen red   Fill-pen off Line-width 2 line 10x10 100x100] 
              [pen green Fill-pen green Line-width 2   circle 110x130 50] 
              [pen blue  Fill-pen blue Line-width 4 line 30x30 200x150]
              [pen blue  Fill-pen off Line-width 4 circle 100x150 20] 
            ]
]
```

SteeveGit

[18:11](#msg570a975b2a2f4d427613334d)je vois des gens qui sont morts, heu, des cercles

nodrygo

[18:13](#msg570a97bc74d45a71586f069c)dans un cas juste les lignes dans l'autre juste le cercle ;-)

SteeveGit

[18:13](#msg570a97c38b7b2f45763550e9)ouep

[18:19](#msg570a993274d45a71586f0704)je crois que j'ai saisi le problème

[18:20](#msg570a997574d45a71586f0713)Quand un sous bloc est traité, le sous bloc suivant est ignoré

[18:20](#msg570a99842a2f4d42761333ca)ça devrait pas être trop dur à corriger

nodrygo

[18:21](#msg570a99bd1ee04bd23b76feca)cool donc c'est bien un bug et c'est pas moi ;-)

SteeveGit

[18:23](#msg570a9a2c1ee04bd23b76fee7)Dans le code de draw, une ligne à supprimer.

nodrygo

[18:25](#msg570a9ab0c65c9a6f7f285d67)oki merci

SteeveGit

[18:39](#msg570a9df41ee04bd23b76ff91)Voilà c'est pushé, en attente de validation.

nodrygo

[19:33](#msg570aaa878b17927458e319fd)cool pressé de l'avoir pour ma prochaine petite démo ;-)

SteeveGit

[20:34](#msg570ab8f18b7b2f4576355842)En attendant, tu devrais t'en sortir avec un none après chaque sous bloc

nodrygo

[21:58](#msg570acc86c65c9a6f7f286863)@SteeveGit bonne idée merci

## Tuesday 12nd April, 2016

RenaudG

[17:52](#msg570d35e85cd40114649a9f01)Bon, je continue a bien m'amuser, lorsque j'ai un peu de temps...  
Par exemple, je voulais lister mes fichiers par ordre de taille de façon un peu "joueuse". Voilà ce que ça donne :

```
do %funclib.red

pipe read %. [
    |> filter func[f] [ not dir? f ]
    |> map    func [f] [ a: read/binary f reduce [f length? a]]
    |> sort/compare func [x y] [ x/2 < y/2]
    |> map    func [p] [ p/1 ]
]
```

dockimbel

[19:11](#msg570d484ca2a216782eca01c3)@RenaudG Sympa ! Ta lib est dispo en ligne quelquepart ? Tu peux aller plus loin avec:

```
|: make op! :pipe
```

RenaudG

[19:12](#msg570d488b3ddb73ba105b6952)Merci. Oui, j'ai \[mis ça là](https://github.com/RenaudG/red-utilities)

[19:12](#msg570d48b8548df1be102c3e9f)Et dedans y'a déjà :

```
|>: make op! :pipe
```

;-)

[19:14](#msg570d491f5ed5a4fd3fe26176)Bon, c'est surtout du WIP autour d'expérimentations pour apprendre... faut pas hésiter à me pointer des erreurs ou des améliorations possibles.

dockimbel

[19:15](#msg570d49640c632a6d36c6399d)@RenaudG `(type? f) = object!` =&gt; `object? f`

RenaudG

[19:17](#msg570d49b35ed5a4fd3fe261a2)ah oui... corrigé (en local pour le momebnt)

[19:37](#msg570d4e832c97111664314642)Au départ `pipe` créait pas des paren! mais du coup ça coinçait pour des expressions avec opérateurs comme `|> either > 10 [ "machin" ][ "bidule" ]` Et j'ai eu un peu de mal a créer des paren! et à les remplir... et là le code me semble un peu alambiqué, faut que j'y travaille encore je pense.

[20:17](#msg570d57c25ed5a4fd3fe26645)Je trouve ça fort amusant (en même temps, mon sens de l'humour...) :

```
red>> maxi: piper [ fold :max ]
== func [x][fold x :max]
red>> sum:  piper [ fold :add ]
== func [x][fold x :add]
red>> maxi [ 2 4 6 8 7 5 3 ]
== 8
red>> sum  [ 1 2 3 4 ]
== 10
```

## Monday 18th April, 2016

ldci

[10:05](#msg5714b17a4c2125fc3f034b08)@tous OpenCV est compatible avec Red/gui. Cela permet d'utiliser différents formats d'image non supportés en standard par red  
Un exemple d'image tiff https://drive.google.com/open?id=0BzN\_niDInGT4ZjVkMzhXQ3RiWjQ  
Pour récupérer les données par pointeur j'ai du procéder par étape avec une première fonction basique qui permet de récupérer la valeur du byte pointé.  
Ensuite cette fonction Red/System est appelée dans le code Red par une routine qui permettra de construire la chaine binaire contenant les valeurs de l'image

```
getByteValue: func [address [integer!] return: [byte!] /local p][
    p: as [pointer! [byte!]] address
    p/value
]

makeRGB: routine[ address [integer!] return: [integer!]] [
	as integer! getByteValue address 
]

rgb: copy #{}		 
			y: 0
			istep: iWidth * iNchannels  
			until [
				index: iWstep * y
				line: copy #{}
				lineAddress: iData + index
				loop istep  [append line makeRGB lineAddress  lineAddress: lineAddress + 1]
				append tail rgb line
				y: y + 1
				y = iHeight
			]				 
			rimg/image: make image! reduce [as-pair iWidth iHeight  reverse rgb]
```

[10:08](#msg5714b2125cd40114649c3405)Ce sera améliorable dans le futur en fonction des évolutions de Red, mais c'est opérationnel. Je mettrai à jour le repo GitHub avec quelques exemples d'ici quelques jours

dockimbel

[10:41](#msg5714b9f43066f78f385df0e5)@ldci Tu dois pouvoir ecrire dans le buffer de l'image directement plutot que de passer par une serie binaire intermediaire.

ldci

[13:19](#msg5714def8b30cfa0f384c638e)@dockimbel : tu vois ça comment? Merci d'avance

## Tuesday 19th April, 2016

dockimbel

[03:49](#msg5715aad182811d2e18b4d0ee)@ldci Tu peux copier et personaliser la fonction \[image/set-data](https://github.com/red/red/blob/master/runtime/datatypes/image.reds#L197), qui permet de peupler une image! avec des donnees binaires. Pour la construction de la valeur image!, tu peux soit le faire en Red, puis passer une reference via une routine, soit en R/S, en appelant `image/make` et en passant un `null` pour le 1er argument et un pair! pour le 2ieme. Tu peux poster tes questions a propos du type image! @qtxie dans le group red/red, c'est lui l'auteur de cette partie du code.

ldci

[06:48](#msg5715d4a03ddb73ba105d4fd1)Merci Doc, je regarde tout ça dès que possible. Par ailleurs, bravo pour l'implementation de View qui est simple et efficace. J'attends avec impatience la version OSX :)

[06:57](#msg5715d6cc3ddb73ba105d5058)@dockimbel Au fait, le décodage de l'image par ligne est nécessaire avec OpenCV qui aligne ses données en mémoire (pour des raisons d'optimisation) avec le paramètre img/widthStep

## Friday 22nd April, 2016

ldci

[08:47](#msg5719e52d98c544f1396d86e7)@dockimbel : Bon j'ai bien avancé sur le sujet

```
source: as byte-ptr! img/*imageData
p:  allocate img/imageSize
; copy destination source length
copy-memory p source  img/imageSize ; OK copy from address a series of bytes
s: as c-string! p ; OK we get a string with n bytes values
```

le seul problème qui me reste est de transformer la c-string! en string! red. Toute suggestion est la bienvenue :)

dockimbel

[10:09](#msg5719f85afe9f076746b5e093)@ldci :+1: Pour le c-string!, tu peux regarder la fonction \[`string/load`](https://github.com/red/red/blob/master/runtime/datatypes/string.reds#L898). Si `str` est ton -c-string!, `string/load str length? str UTF-8` te renverra un `red-string!`.

ldci

[11:22](#msg571a0964b129b59c56da8960)@dockimbel : Génial et merci!

[14:32](#msg571a360f9689a5440f7a92b1)@dockimbel, encore mieux: binary/load p img/imageSize renvoie directement une chaine de valeurs binaires! Génial pour créer une image à partir de données en mémoire. Une question: peut on rendre visible à Red des variables Red/S qui sont définies dans #system ?

dockimbel

[14:46](#msg571a393101f15fc17a62a26a)@ldci Non pas directement, mais tu peux les "boxer" si necessaire, par exemple, `integer/box` renvoit un red-integer! a partir d'un integer!.

## Saturday 23th April, 2016

nodrygo

[05:56](#msg571b0e9bd47413c07dcc882f)Bonjour  
je voulais savoir si dans le futur il était prévu d'ajouter un `line-pattern` comme dans Rebol ?  
un un bouton avec état stable 'on 'off (comme un check ) ?

dockimbel

[06:22](#msg571b1497f638ed830c7843f6)@nodrygo Oui pour les deux. Red/Draw va supporter toutes les commandes Rebol/Draw.

nodrygo

[06:33](#msg571b17234bbb6abf7d5e5879)@dockimbel cool merci

## Sunday 24th April, 2016

nodrygo

[15:46](#msg571cea384bbb6abf7d5e9585)Hello

Y a t il un moyen de forcer la sortie d'une fonction avec une valeur dans le style

```
f: func [x /return [string!] ] [ 
        if x > 5 [print "TEST OK" return "on sort de func ici" ] 
        print "va jusqu'au bout" 
        "et on sort final"]

f 1 => sortie normale
f 8 => sortie forcée ?
```

RenaudG

[16:22](#msg571cf2d27469496137b8b8cb)Oui, il suffit d'écrire :

```
f: func [ x return: [string!] ] [ 
    if x > 5 [ print "TEST OK" return "on sort de func ici" ]
    print "va jusqu'au bout" 
    "et on sort final"
]
```

[16:23](#msg571cf2fb7469496137b8b8ce)C'est ton raffinement `/return` qui fout le bordel car du coup dans ton `if` la valeur de `return` est pas celle que tu crois ;-)

[16:28](#msg571cf41d4bbb6abf7d5e9731)`return` reçoit `true` ou `false`, et ce n'est plus la valeur de `system/words/return`

nodrygo

[17:29](#msg571d026d47b4c6480ff9cdf7)ok compris merci ça va alléger quelques calculs du simpleCad dans les fonctions snapto ;-)  
bon encore une fois pas hyper intuitif ;-)

## Monday 25th April, 2016

dockimbel

[09:56](#msg571de9d747b4c6480ff9f6d2)@nodrygo "pas hyper intuitif" Que considères-tu comme plus intuitif que `return` ? La déclaration de type retourné dans la spec de la fonction est totalement facultative. Je vois difficilement comment faire plus simple que çà.

SteeveGit

[09:57](#msg571dea2347b4c6480ff9f6e9)

nodrygo

[10:00](#msg571deab16e3ae55e37e9c1bf)@dockimbel c'est la différence dans la déclaration entre `/return` et`return:` qui n'est pas intuitif .. je ne l'avais même pas vu/compris en lisant les doc \*\*Rebol\**

SteeveGit

[10:00](#msg571deaccd47413c07dccf694)Question @dockimbel: On peut pas créer de nouveaux styles avec des actors prédéfinis il me semble. J'essaye de hacker le system/view/vid/styles pour définir un nouveau style général mais il me vire mes actors à chaque fois. Y'a un truc ?

dockimbel

[10:00](#msg571dead6f5b6334a5e709982)@nodrygo Normal, ça n'existe pas en Rebol, c'est une nouveauté dans Red. ;-)

[10:02](#msg571deb356e3ae55e37e9c1ec)@SteeveGit Je me souviens avoir vu des styles créées dans des blocs VID avec acteurs, et il me semblait bien que ça passait.

SteeveGit

[10:02](#msg571deb4b7469496137b8e63c)ouais mais c'est du local

[10:03](#msg571deb87f5b6334a5e7099d4)faut recopier l'intégralité du style à chaque fois que tu fais un nouveau view

[10:05](#msg571debdcd47413c07dccf6d9)Evidemment on peut faire un append sur le block vid mais je vois mal les utilisateur trouver ça cool

[10:06](#msg571dec117469496137b8e676)bon je vais essayer de trouver le clear actor dans view, ça doit bien être quelque part

nodrygo

[11:14](#msg571dfbf97469496137b8eadb)@dockimbel si je ne m'abuse la doc indique que pour `draw ellipse` la première coordonnée est celle du centre alors que \*comme pour le GDI* c'est le point supérieur de la boite dans laquelle elle est inscrite.  
c'est un bug ou ça restera comme ça ?

dockimbel

[11:18](#msg571dfd1d7469496137b8eb3b)@nodrygo Bien vu, effectivement il y a un écart entre la doc et l'implémentation.

[11:38](#msg571e019c47b4c6480ff9fdb0)@nodrygo Ok, la doc a été corrigée. Merci pour le signalement.

nodrygo

[11:40](#msg571e02297469496137b8ecd8)@dockimbel petite erreur aussi sur la doc de `arc` le second paramètre est une coordonnée pas un entier représentant le rayon ;-)

dockimbel

[15:21](#msg571e35f4ad23942c68599637)@nodrygo Corrigé. Merci !

ldci

[16:01](#msg571e3f5d6e3ae55e37e9e024)@tous. Pour le décodage des images OpenCV, c'est résolu maintenant grâce à copy-memory

```
getCVRGBbyPtr: routine [dataAddress [integer!] dataSize [integer!] return: [binary!] /local src p] [
"Get 8-bit RBG values from OpenCV Image"
	src: as byte-ptr! dataAddress
	p:  allocate dataSize
	copy-memory p src dataSize
	binary/load p dataSize
]
```

Il suffit ensuite de passer la chaine binaire renvoyée par la routine et d'utiliser un make image! pour créer une image Red à partir des valeurs binaires. dans certains cas (liés à l'optimisation d'OpenCV pour l'alignement des octets en mémoire) on doit travailler ligne par ligne. La même routine est utilisable en utilisant l'adresse de chaque ligne en mémoire et en stockant les valeurs dans un buffer. Red est drôlement efficace :)

## Tuesday 26th April, 2016

ldci

[17:44](#msg571fa911e8a4670f2b5cb496)une question pour Doc

```
getIColorModel: routine [img [integer!] return: [string!] /local b str tmp] [
	tmp: as int-ptr! img
	b: as byte! tmp/6
	if (b = #"R") [str: "RGBA"]
	if (b = #"G") [str: "GRAY"]
	string/load str length? str UTF-8 ;UTF-16LE
]
```

la valeur renvoyée au programme Red est un integer! J'ai du manquer un épisode :smile:

## Wednesday 27th April, 2016

dockimbel

[04:27](#msg57203fb749d5aaf16db7eb17)@ldci La déclaration `return:` ne peut être utilisé que pour les types scalaires qui sont automatiquement convertibles entre Red et Red/System (ce n'est pas le cas de string!). Pour tous les autres types, il ne faut pas spécifier cette déclaration, et il faut retourner la valeur sur la pile d'éxectution Red. Pour ce faire, une macro `SET_RETURN()` est prévue, mais elle ne prends en entrée qu'une variable, pas d'expression. Une alternative est d'utiliser l'API interne pour empiler la valeur de retour directement dans la pile au bon endroit: `stack/set-last` (prends un `red-value!` en argument).

[04:28](#msg57203fdd8d3a974522a50420)Pour ton exemple, ça donne donc:

```
getIColorModel: routine [img [integer!] /local b str tmp] [
    tmp: as int-ptr! img
    b: as byte! tmp/6
    if (b = #"R") [str: "RGBA"]
    if (b = #"G") [str: "GRAY"]
    stack/set-last as red-value! string/load str length? str UTF-8 ;UTF-16LE
]
```

ldci

[09:24](#msg5720854d9b4160fa760a3d0a)@dockimbel Merci cela fonctionne mais il ne faut pas oublier de renvoyer la valeur de la pile: string/load str length? str UTF-8 marche alors sans problème.

## Saturday 30th April, 2016

nodrygo

[10:58](#msg57248fcee10a59c061075fd0)Il m'est revenu en mémoire un truc avec lequel j'avais joué il y a très longtemps et auquel \*\*Red\** m'a un peu fait pensé \[\*\*pliant\*\*](http://www.fullpliant.org/) ;-)

[15:51](#msg5724d472d407319f67316255)quelqu'un peut il m'expliquer ce que je n'ai pas compris

```
Red [ ]

dot2d: func [a [pair!] b [pair!] return: [float!]][
       (to float! a/x * to float! b/x) + (to float! b/y * to float! b/y)
]

norm:  func [a [pair!] return: [integer!] /local d2 ][
       d2: dot2d a a 
       res: to integer! (square-root d2) 
       return res 
]
distance:  func [a [pair!] b [pair!] return: [integer!] /local res ][
       norm (a - b)
]
```

quand je tente de compiler j'obtiens

```
Z:\devygo\red\win\DemosRed\simpleCAD>..\..\red-29apr16-c32cd7a.exe -d -c calcs.r
ed

-=== Red Compiler 0.6.0 ===-

Compiling /Z/devygo/red/win/DemosRed/simpleCAD/calcs.red ...
...compilation time : 531 ms

Compiling to native code...
*** Compilation Error: argument type mismatch on calling: red/stack/push
*** expected: [struct! [
        header [integer!]
        data1 [integer!]
        data2 [integer!]
        data3 [integer!]
    ]], found: [struct! [
        header [integer!]
        ctx [pointer! [integer!]]
        symbol [integer!]
        index [integer!]
    ]]
*** in file: %/Z/devygo/red/win/DemosRed/simpleCAD/calcs.red
*** in function: exec/f_norm
*** at line: 1
*** near: [
    stack/push ~a223
    f_dot2d
    stack/unwind
    word/set
    stack/unwind
    stack/reset
    stack/mark-native
]
```

manifestement une erreur sur la pile d'appel qui n'est pas celle attendue  
mais je ne comprend pas trop pourquoi

SteeveGit

[16:26](#msg5724dca7de9040f458f2d009)Dans norm, la fonction dot2s attend des pair! comme arguments mais reçoit un word! (le struct! ressemble à ça). Après, je vois pas trop pourquoi non plus...

ldci

[17:04](#msg5724e58c60e2f3e873664b2e)essaye pour la définition de la function norn \[a return: \[integer!] /local de2]

[17:04](#msg5724e5b0e472a3e473bfe0b8)sinon https://twitter.com/fjephe/status/726455195639635968

dockimbel

[17:17](#msg5724e8b6cf0d61086bd26053)@nodrygo C'est un bug du compilateur, tu peux ouvrir un ticket pour qu'on le traite (c'est lié à la redefinition du mot `a`).

[17:18](#msg5724e8dc2624e2150740c5f4)@ldci Sympa ! Ca utilise OpenCV ?

nodrygo

[17:27](#msg5724eb01d407319f6731665d)@dockimbel Bon je viens de tenter de créer un ticket .. j'espère que c'est la bonne façon de faire .. pas trop habitué à ça :-)

## Sunday 1st May, 2016

ldci

[12:45](#msg5725fa5960e2f3e873666b91)@dockimbel Yes Sir! environ 600 fonctions OpenCV qui sont maintenant accessibles à Red/gui :)

## Wednesday 4th May, 2016

ldci

[09:12](#msg5729bd0272798bd77be9d9ab)@dockimbel Plus j'étudie Red en détail plus je suis emballé par 1°) l'élégance de sa programmation et 2°) la puissance potentielle de Red. Juste pour info, à quoi correspond #system-global ? Amicalement

dockimbel

[09:14](#msg5729bd8cd6d0f60219f06472)@ldci C'est pour inclure du code Red/System dans Red, mais en dehors du context `red` qui encapsule la librairie standard et le code compilé. C'est prévu pour l'inclusion de librairies externes en Red/System, mais n'ayant pas de dépendences avec la librairie standard.

ldci

[09:58](#msg5729c7b9944fc7ba04cce83b)@dockimbel Cool. Je peux donc placer ici les appels à OpenCV que j'ai rendu indépendante de toute librairie standard:)

[18:39](#msg572a41ccdf1a01ff18fc803c)un peit bug avec le slider: quand on redimensionne un slider, le data renvoie une valeur fausse. Exemple, j'ai un slider dimensionné à 512 en x et le data va de 0 à 1.0. Si je redimensionne le slider à 1024 en x, le data renvoie une valeur entre 0 et 0.5. Il ya un facet à mettre à jour?

## Thursday 5th May, 2016

dockimbel

[03:37](#msg572ac011682b8fdf3c8c9864)@ldci En effet, c'est un bug, peux-tu ouvrir un ticket stp pour qu'on le traite ?

## Friday 6th May, 2016

nodrygo

[13:58](#msg572ca306b51b0e29484fbcee)je crois que je viens d'écrire le pire et le plus mauvais code (en Red et en général) qui soit pour un jeu de briques :-D LOL  
enfin j'apprend petit à petit et j'avance pas à pas (et en attendant les prochains timers)

## Sunday 8th May, 2016

ldci

[17:07](#msg572f725bb51b0e2948503695)Bonjour à tous: des nouveautés avec les opérateurs sur les images (https://pbs.twimg.com/media/Ch8yFrxWkAE8lZ2.jpg)

## Monday 9th May, 2016

ldci

[06:46](#msg573032553170252648f525fb)@dockimbel Salut Doc avec les drop-down et drop-list, la méthode on-change renvoie correctement l'élément sélectionné, mais avec la méthode on-select, la valeur face/selected est incorrecte. Le nombre d'éléments de la liste est correct, mais l'ordre renvoyé pose pb: 2 à la place du 1 , 1 à la place du 4 ...

dockimbel

[07:44](#msg57303fcbf9a53a60793cee4d)@ldci La différence entre les deux évènements est expliquée dans la \[doc View](https://github.com/red/docs/blob/master/gui/View.md#drop-list).

[07:51](#msg57304164a351d83109521eb1)@ldci Quels sont les opérations sur les images que tu supportes déjà ?

ldci

[08:51](#msg57304f84b51b0e2948505b09)OK doc, je vais regarder ce point. Pour les opérations sur les images : addition, soustraction , multiplication, division entre images ou avec un scalaire R.G.B.A. Opérateurs logiques entre images + plein d'autres choses. Tu as le détail dans /libs/core/cvCore.reds. A plus

[10:17](#msg573063bc12fa465406eb1ad0)@dockimbel BTW la plupart de ces opérateurs peuvent être écrits directement en Red :)

dockimbel

[10:18](#msg57306413a351d83109522795)@ldci Oui, c'est ce que je me dis depuis un bon moment, et je me demande si on ne pourrait pas se passer d'OpenCV pour faire de la reconnaissance de forme, en implémentant simplement les bons operateurs d'images en Red/System directement.

nodrygo

[10:22](#msg573064df3170252648f5321e)+1 pour implémentation en Red pour éviter openCV et les risques de galère d'install

SteeveGit

[10:26](#msg573065e2682b8fdf3c8cb6b3)La reconnaissance de forme ça ne s'arrête pas à une étape de filtrage avec des opérateurs booléens malheureusement. Mais si c'est uniquement ce qu'offre openCV, effectivement on peut s'en passer.

dockimbel

[10:28](#msg5730664ced393f3409b0f53a)@SteeveGit Oui, c'est juste, je pensais surtout à de la détection de mouvements et au tracking d'objets.

SteeveGit

[10:38](#msg573068b3aa92b14772cb7aad)A mon avis, ce qui devient critique, c'est la possibilité d'itérer au travers d'images et de faire des calculs intensifs. En gros, comment s'en sort le compilateur de Red sur les traitements lourds (je dirais, pas super, actuellement)

[10:42](#msg57306988682b8fdf3c8cb6be)Pour faire du traitement d'image, faudra bien un jour se poser la question des perfs du compilo.

dockimbel

[11:10](#msg57307043a351d83109522a47)@SteeveGit Pour les traitements intensifs, tu les écrits en Red/System et tu as alors des performances proches du C.

[11:13](#msg573070c612fa465406eb1dc5)Les performances du code généré par le compilo Red lui-même ne sont pas dans le scope de la 1.0. La 2.0 va apporter les couches d'optimisation ainsi que l'architecture finale du compilateur et du toolchain Red.

[11:15](#msg57307151b51b0e294850635b)De plus, j'ai annoncé il y a quelques semaines qu'on aurait un backend LLVM pour Red/System avant la fin de l'année, ce qui mettra Red/System et C à totale égalité concernant les performances.

SteeveGit

[11:16](#msg5730718aaa92b14772cb7ac6)Ok, cool

ldci

[13:33](#msg573091bbb51b0e2948506d74)@tous: J'ai déjà implémenté la détection du mouvement et le tracking d'objet avec Red et OpenCV et cela fonctionne bien avec Red/System. Les 600 fonctions (sur 6000) OpenCV qui sont accessibles à Red sont des fonctions écrites en C. Pour le C++ (90% d'OpenCV) c'est plus galère. En tout cas les fonctions disponibles sont facilement accessibles via les routines. L'install d'OpenCV n'est pas compliquée. Cette année j'ai fait un cours pour des étudiants SHS qui ne connaissent rien à la programmation, et j'ai simplement copié les dll que j'avais compilées (en 32 bits) sur leur machine. En red on pourrait sans problème faire un module qui soit au niveau d'OpenCV 1.0 (écrite 100% en C), mais cela demande pas mal de boulot. Je regarderai ça quand Red/Gui sera dispo sur Mac, car mes accès à une machine Windows sont limités. En fait je compile tout sous Mac (red -c -t Windows file.red) avant de tester sous Windows en priant pour que ça marche. Je n'ai pas essayé encore d'utiliser les images des caméras fournies par Red, mais cela ne représente pas une grosse difficulté pour alimenter les fonctions OpenCV avec un getData et un setData.

[13:44](#msg5730942fb51b0e2948506e66)

[13:46](#msg573094c7b51b0e2948506ea1)Bon un problème de lien, https://pbs.twimg.com/media/CiBNSqvWUAEZFNx.jpg

## Wednesday 11st May, 2016

ldci

[09:23](#msg5732fa2812fa465406ebe6c5)@dockimbel j'ai commencé à implémenter quelques méthodes CV directement en Red pour le plaisir (https://pbs.twimg.com/media/CiKjew2WMAA-7Sw.jpg). D'après ce que j'ai compris les images Red sont des images 8 bits et à 3 canaux RGB + si besoin le canal alpha pour la transparence. Une première question, pourrait on créer facilement une image à 1, 2, 3 ou 4 canal avec Red? Dans OpenCV les images à 1 canal sont très utilisées accélérer les calculs car on travaille alors sur une simple matrice 2D. De la même façon serait il possible de créer des images 16,32 ou même 64 bits?

dockimbel

[09:26](#msg5732fac4ed393f3409b1c310)@ldci Sympa ! Pour l'instant, non, le format d'image est fixe. Pour les images à 1 canal, tu peux utiliser simplement un type `binary!` ou bien un simple tableau à une dimensions en Red/System.

ldci

[11:11](#msg57331354ed393f3409b1cb14)Merci Doc , je te tiens au courant de l'avancée. A +

GerardSontag

[12:50](#msg57332aa33170252648f609dc)Bonjour à tous. Est ce bien l'endroit pour poser des questions de débutant? Merci en tout cas à dockimbel.

nodrygo

[12:57](#msg57332c42f9a53a60793dd187)@GerardSontag pourquoi pas si tu les pose en français ;-)

GerardSontag

[13:01](#msg57332d1df16c08510662c97f)OK Merci est ce que la compilation vers Android est implémentée en V0.60?

nodrygo

[13:03](#msg57332d8e12fa465406ebf7b3)@GerardSontag là il va falloir demander çà à maître Doc :-) je crois que la partie gui est largement non finie mais je n'en sais guère plus sur Android

GerardSontag

[13:05](#msg57332e353170252648f60b2a)@nodrygo Ah c'est peut-être pour ça qu'avec red -c -t Android j'obtiens le msg Compiling to native Code

[13:07](#msg57332e93b51b0e2948513ba6)@nodrygo DEpuis Win64 ....

nodrygo

[13:08](#msg57332ee5f9a53a60793dd2b0)@GerardSontag désolé mais Android ne fait pas encore partie de mes expériences. J'ai cru lire que la compil générait un APK ... mais rien de certain

GerardSontag

[13:15](#msg5733308012fa465406ebf8f2) @nodrygo Bon Wait and See avec Andoid

[13:19](#msg5733315312fa465406ebf958)@nodrygo Encore une tite question: Sous Win64 en GUI le pointeur n'est pas cantonné à la fenêtre ce qui ne permet pas de déplacer la fenêtre sur l'écran sauf à utiliser le menu "Déplacer " de la fenêtre. Est ce normal/Oubli/bug?

nodrygo

[13:22](#msg57333212f9a53a60793dd438)@GerardSontag je suis sur windowsXP dans une machine virtuelle sur Linux. Quand je click sur le bandeau de la fenêtre je peux la déplacer en drag/drop. ou je n'ai pas bien compris la question ?

GerardSontag

[13:24](#msg5733327e12fa465406ebf9e9)@nodrygo C'est bien la question pas de DragnDrop en Win10/64 chez moi.

dockimbel

[15:28](#msg57334fb4f6f2bcff2b9c434f)@GerardSontag Bienvenue ! Pour le support Android, on a un proto dans la branch Android, mais je crois qu'il ne fonctionne plus tout à fait (c'était juste un proof-of-concept). Le vrai support Android va arriver dans une des versions 0.6.x.

[15:29](#msg57334febc5ff2e7e29fdd27c)Win10/64: on a pas mal d'utiliseurs sur ce système, on a pas eu encore ce genre de problème. Avec quel code as-tu testé ?

asampal

[17:06](#msg573366ac7d20ec9162573493)@dockimbel could it be that @GerardSontag is creating a default size window and so is seeing https://github.com/red/red/issues/1761 ? With the default window size, there is no room left on the title-bar to drag from since the buttons for close, maximize, menu icon, etc. take up the whole dragging area.

## Thursday 12nd May, 2016

dockimbel

[03:14](#msg5733f5137d20ec9162573945)@asampal I was thinking about your ticket too while reading his report, though we need to see the code in order to confirm that the small size is the cause.

GerardSontag

[15:21](#msg57349f8d64dbdadc7deb6d99)@dockimbel Au sujet de Win10/64: Je suis absolument désolé, je suis un gros nul la fenêtre de mon test était si petite que j'avais du mal à cliquer en dehors des boutons de réduction/agrandissement/Fermeture. Encore toutes mes excuses....

dockimbel

[16:24](#msg5734ae47feb8cb327ee1d40c)@GerardSontag Pas de soucis, tu n'es pas le seul à avoir eu ce problème (cf le ticket #1761), mais comme il était formulé différement, je n'étais pas sûr que ce soit le même problème. ;-)

nodrygo

[17:22](#msg5734bbd864dbdadc7deb793d)@dockimbel désoler de t’embêter encore mais une autre question  
Y a t-il un moyen ou une astuce pour récupérer des infos quand Red se `crache` violemment ?

Dans ma tentative d'un (stupide et pas terrible ) \[editeur/ide](https://github.com/nodrygo/DemosRed/blob/master/images/basicide.png)

exécuté en mode purement interprété parfois mais pas systématique quand je change de fichier source et que je lance le `run` j'ai un crache mais je ne trouve pas d'infos ni de moyens d'en récupérer .. d'autres fois ça marche bien même sur plusieurs lancements d'affilés

dockimbel

[17:23](#msg5734bc2d0f07acdc7a041806)Oui, il faut que tu recompiles la console en mode debug `red -c -d environment/console/gui-console.red`. Mais le stack dump que tu auras (sauf crash sévère) sera bas-niveau (Red/System). C'est toujours mieux que rien en attendant d'avoir un stack trace graphique en cas de crash.

nodrygo

[17:25](#msg5734bc6c0cb634927f7e47b1)@dockimbel ok je vais tenter ça merci  
super enfin un indice .. je vais regarder ça de plus près et tenter de comprendre

```
Z:\devygo\red\DemosRed\basicIde>gui-console.exe basicide.red

*** Runtime Error 1: access violation
*** in file: /Z/devygo/red/red/interpreter.reds
*** at line: 407
```

[17:48](#msg5734c2030cb634927f7e49ce)juste pour infos complémentaires  
d'autre fois ça ne crache pas mais `run` ne fonctionne avec sur la sortie debug des

```
Z:\devygo\red\DemosRed\basicIde>gui-console.exe basicide.red
*** Script error: path event/picked is not valid for none! type
*** Where: switch
```

comme si il avait perdu une donnée  
peut être que le GC réglera ce type de problème .. probablement un peu tôt pour ce type de code

## Friday 13th May, 2016

dockimbel

[04:18](#msg573555870f07acdc7a041cf5)@nodrygo Pourrais-tu me montrer la fonction qui contient cet `event/picked`? Okay, j'ai trouvé, c'est dans le handler pour l'évènement `on-menu`. Quelle est la manière la plus simple pour reproduire ce crash ?

nodrygo

[06:34](#msg573575691794136a7d083cf3)@dockimbel le code complet est ici `https://github.com/nodrygo/DemosRed/blob/master/basicIde/basicide.red`

mais comme j'appelle toujours la même entrée il n'y a pas de raison qu'elle passe à none de temps à autre .  
a moins que la fct mise en commentaire pose un problème je vais la virer pour voir si ça change

les fonctions du menu sont

```
mainmenu: [
            "File" [
                    "New file"     fnew
                    "Load file"     fopen
                    "Save file"     fsave
                    "-------"
                    "Exit"        exit
                   ]
            "Font" [
                    "Size"     
                         [
                         "8" setfont8
                         "10" setfont10
                         "12" setfont12
                         "14" setfont14
                         ]
                    "FgColor"     
                         [
                         "Black" setfg-black
                         "White" setfg-white
                         "Blue" setfg-blue
                         "Red" setfg-red
                         ]                         
                    "BgColor"     
                         [
                         "Black" setbg-black
                         "White" setbg-white
                         "Water" setbg-water
                         "Cyan" setbg-cyan
                         "Forest" setbg-forest
                         "Olive" setbg-olive
                         ]
                   ]
            "Tool" [ 
                     "Run"  runsrc
                     "Run external"  runextsrc
                     "Compile" compilesrc
                   ]
            "Help" [ "About"  about]
]
.......
mainwin/actors: context [
    on-menu: func [face [object!] event [event!]][
        switch event/picked [
           'fnew   [clear codesrc/text ] 
           'fopen  [loadfile] 
           'fsave  [savefile] 
           'setfont8  [codesrc/font/size: 8 ]
           'setfont10 [codesrc/font/size: 10 ]
           'setfont12 [codesrc/font/size: 12 ]
           'setfont14 [codesrc/font/size: 14 ]
           'setfg-black [codesrc/font/color: black ]
           'setfg-white [codesrc/font/color: white ]
           'setfg-red [codesrc/font/color: red ]
           'setfg-blue [codesrc/font/color: blue ]
           'setbg-black [codesrc/color: black ]
           'setbg-white [codesrc/color: white ]
           'setbg-cyan [codesrc/color: cyan ]
           'setbg-forest [codesrc/color: forest ]
           'setbg-olive [codesrc/color: olive ]
           'setbg-water [codesrc/color: water ]
           'runsrc [dolocalrun]
           'runextsrc  [doextrun]
           'compilesrc [doextcompil  alertPOPUP "finished"]
           'about [alertPOPUP "RED DEMO: SIMPLE EDITOR "]
           'exit [quit]
         ]
    ]
    on-resize:   func  [face [object!] event [event!]] [ calcresize ]
    ;;;on-close:    func  [face [object!] event [event!]] [quit]
    on-key-down: func [face [object!] event [event!]]['done]
    ]
```

[06:38](#msg57357672e2996a5a42c7f7b0)bon enlever le comment ne change rien .. c'est quand je recharge un fichier que j'ai cette erreur ou un crach

dockimbel

[06:46](#msg5735783f8b845b284193eb94)@nodrygo Peux-tu ajouter un `none` après ton block `switch event/picked [` et voir si ça corrige le problème ?

nodrygo

[06:48](#msg573578cdc61823687d3b7447)en fait je viens de voir que le problème event/picked est depuis que j'ai externalisé la fonction `attempt [do codesrc/text]` quand je la remet directement dans le event/picked je n'ai plus ce comportement .. mais il me reste les crach aléatoires :-(

je te confirme le simple fait de mettre le `none` règle ce problème avec le mot externalisé

quand on crach il survient après plusieurs changement/rechargement .. je pense que c'est un problème de mémoire. Est ce qu'en Red on peux libérer de la mémoire (est ce que le mot `clear`fait ça ? ) ?

```
str: copy "azer"
free str   (ou  clear str)
```

[06:59](#msg57357b43eea93e5742d17d2e)ooops non après 5 ou 6 appel au `run` du même code sans regargement et avec le `none` j'ai reproduit une erreur event/picked :-(

dockimbel

[07:02](#msg57357bfc0f07acdc7a041db7)@nodrygo En utilisant le dernier build de Red ?

nodrygo

[07:03](#msg57357c2cae26c1967f9e0f44)@dockimbel celui d'hier .. je reprends le tout dernier

idem avec build de ce matin  
autre piste  
j'ai tenté de copier le contenu du text area dans une autre chaine et j'ai parfois ce message (entre 2 crach) je pense vraiment à un problème mémoire .. peut être le GC sera la solution

```
src: ""
dolocalrun: does[
                 clear src
                 src: copy codesrc/text
                 attempt [do src]
                  ]
```

[07:17](#msg57357f7c831fd2d97d9e0c57)en fait j'ai perdu le dernier message d'erreur mais c'était style ne peux pas copier none  
comme si le text area était à none  
difficile à reproduire telle c'est aléatoire .. parfois un crach dès le premier run parfois après 5 ou 6 .  
ce matin j'ai utilisé le dernier built  
mais je vais refaire un console en mode debug comme hier

bon même en mode debug de la console parfoir le cratch est direct sans aucun message et parfois ça marche une bonne 10 aine de fois même en changeant le code avant crach violant .. par contre je n'ai pas reproduit de event/picked depuis mais comme ils sontégamement aléatoire difficile à dire

pas certain que ça vaille la peine de te faire perdre du temps avec ça j'imagine que tu as pleins d'autres trucs à faire

[08:11](#msg57358c311794136a7d08428c)de mon coté j'avance  
avec la console en debug et en ajoutant `system/view/debug?: yes`  
je viens de voir que la sortie n'est pas lé à un crach mais à un event on-close qui n'aurait pas du être là  
je continue mes investigations

```
enter ON-MENU
*** Script error: word! type is not allowed here
*** Where: switch

leave ON-MENU
event> type: over offset: -490x-114 key: none flags: [away]
event> type: over offset: 82x2 key: none flags: []
event> type: over offset: 94x30 key: none flags: [away]
event> type: over offset: 104x40 key: none flags: []
event> type: over offset: -474x-111 key: none flags: [away]
event> type: over offset: 98x5 key: none flags: []
event> type: over offset: 118x26 key: none flags: [away]
event> type: over offset: 130x72 key: none flags: []
event> type: over offset: -439x-113 key: none flags: [away]
event> type: over offset: 133x3 key: none flags: []
event> type: over offset: 3x-74 key: none flags: [away]
event> type: over offset: 13x4 key: none flags: []
event> type: over offset: -127x-85 key: none flags: [away]
event> type: over offset: 18x3 key: none flags: []
event> type: over offset: 284x-9 key: none flags: [away]
event> type: over offset: 296x3 key: none flags: []
event> type: over offset: -447x-296 key: none flags: [away]
event> type: over offset: 192x0 key: none flags: []
event> type: over offset: 337x24 key: none flags: [away]
event> type: over offset: 468x34 key: none flags: []
event> type: over offset: -49x-264 key: none flags: [away]
event> type: over offset: 459x22 key: none flags: []
event> type: over offset: 467x-1 key: none flags: [away]
event> type: over offset: 598x9 key: none flags: []
event> type: close offset: none key: none flags: []
calling actor: on-close
```

[08:24](#msg57358f3d0cb634927f7e79ef) ajouté un test

```
unless event/picked = none[
            switch event/picked [
```

limite la casse par contre je cherche toujours à éviter ce on-close intempestif

dockimbel

[08:26](#msg57358fb564dbdadc7debabac)@nodrygo Merci ! Je crois que je vois ce qui cause le problème.

nodrygo

[08:42](#msg5735936a64dbdadc7debacdf)@dockimbel en fait les problèmes ne sont probablement pas directement lié à Red mais à des collisions sur le `view`entre celui du `basicide` et celui des codes avec GUI que j'execute  
il faudrait que j'arrive à isoler le code en l'exécutant sur une boucle locale .. mais je ne sais pas si possible  
en fait c'était pour ça que j'avais prévu un `run` en execution externe mais la fct CALL actuelle semble assez buggé ?

RenaudG

[08:55](#msg5735968264dbdadc7debadab)ça fait un moment que je bidouille pour essayer de comprendre la cause de ton bug. J'arrive bien à le reproduire avec du code non GUI... je continue d'essayer de circonscrire le truc et je vous tien au jus. J'ai rajouté :

```
unless event [
          print "GOT NONE INSTEAD OF EVENT"
          return 'done
]
```

avant to `switch event/picked` et j'ai certains codes qui bousillent la génération d'events. Au premier chargement ils tournent, mais en cas de rechargement les appels suivants à n'importe quel élément de menu renvoient `none` en guise d'event.

nodrygo

[08:57](#msg57359701e2996a5a42c7ffed)@RenaudG alors si tu reproduit avec du code non GUI mon hypothèse sur les collisions s’effondre :-(

RenaudG

[08:58](#msg5735972aae26c1967f9e1694)Yep. Pour ça que j'ai fait ne pause pour signaler ça... histoire de t'éviter de creuser dans la mauvaise direction.

nodrygo

[09:00](#msg5735979b64dbdadc7debae14)@RenaudG cool .. au passage si tu peux m'aider à récupérer les sorties consoles pour les afficher dans la zone text de cooerr çà serait super .. je cherche la bonne idée pour ça ;-)

dockimbel

[09:09](#msg573599dcc61823687d3b7d37)@nodrygo Il suffit de redefinir `print`, `prin` et `probe` pour capturer leur sortie (n'oublies pas de sauver des références vers les fonctions natives pour les rétablir quand tu n'as plus besoin de capturer les sorties).

nodrygo

[09:10](#msg573599f364dbdadc7debaed8)@dockimbel super merci

dockimbel

[09:10](#msg57359a09831fd2d97d9e13cf)@RenaudG `event` qui renvoit `none`, je suis très preneur d'un exemple simple pour le reproduire.

RenaudG

[09:11](#msg57359a33c61823687d3b7d5d)A1.red:

```
Red []

; utility to run/display the demos
demo: func [ code /intro text /noresult] [
    if intro [
        prin [ "^/---[  Info  ]------------------------^/" text]
    ]
    ;print [ "^/---[  code  ]------------------------^/" code]
    ;print "---[ result ]------------------------"
    print mold do code
]


demo {x: 1
print x
use [x] [
    x: 4
    print x
]
x}
```

[09:11](#msg57359a5164dbdadc7debaef4)Si je charge A1.red, l'exécute, le recharge, et l'exécute, l'event des appels menus est systématiquement NONE

[09:13](#msg57359aa11794136a7d0846d9)Mais attention, c'est là que Mulder est requis... le moindre changement à `demo` comme juste enlever les lignes commentées, ou des changements au string donné à l'appel de demo et Red crash directement (à l'appel suite au second chargement)

[09:14](#msg57359ae6eea93e5742d18582)Tout ça en interprété (lancement via console)

dockimbel

[09:14](#msg57359af9ae26c1967f9e17e1)@RenaudG Super, merci! Quid de `use` (non défini dans Red) ?

RenaudG

[09:15](#msg57359b1c1794136a7d0846fa)il est pas coupable... mmais si je le remplace par un if par exemple, j'ai plus la nonification mais le plantage.

[09:15](#msg57359b33eea93e5742d18593)Mégastange, inseuntite ?

dockimbel

[09:16](#msg57359b57e2996a5a42c80134)Je teste çà tout de suite...

RenaudG

[09:16](#msg57359b8264dbdadc7debaf51)J'ai passé plus d'une heure à réduire le code qui produisait ces deux cas de figure, pour arriver a l'exemple ci-dessus. Je suis sur une build d'hier je crois.

dockimbel

[09:17](#msg57359b9264dbdadc7debaf55)La version compilée donne le résultat escompté :

```
*** Script error: use has no value
*** Where: do
*** Stack: demo print mold do
```

RenaudG

[09:17](#msg57359bb7eea93e5742d185b0)ouai, mais j'ai faist des 100aines d'iterrations pour circonscrire, je suis uniquement en interprété (appel console)

[09:19](#msg57359c141794136a7d08473e)ah oui, chez moi ça plante pas car j'ai mis le switch event/picked dans un attempt

[09:32](#msg57359f2164dbdadc7debb079)Alors, avec cette version de A1.red :

```
Red []

; utility to run/display the demos
demo: func [ code ] [
  print mold do code
]


demo {x: 1
print x
use [x] [
    x: 4
    print x
]
x}
```

Volà une session où je lance deux fois %basicide.red, et chaque fois je répère le cycle "clic sur A1.red, menu run..."

```
red>> do %basicide.red
1
*** Script error: act does not allow event! for its event argument
*** Where: act
*** Script error: act does not allow event! for its event argument
*** Where: act
*** Script error: act does not allow event! for its event argument
*** Where: act
red>> do %basicide.red
1
GOT NONE INSTEAD OF EVENT
GOT NONE INSTEAD OF EVENT
red>>
```

[09:33](#msg57359f55eea93e5742d186bc)Comme indiqué, le comportement est EXTREMEMENT sensible au format du code, même à des choses "mortes"

[09:33](#msg57359f87eea93e5742d186c6)si je supprime l'espace au début de la ligne `print mold do code`, la première partie du comportement disparaît, et j'ai que des GOT NONE

[09:34](#msg57359fc20cb634927f7e7eb6)Sachant que j'utilise la version gist du code de @nodrygo avec juste on-menu modifié ainsi :

```
on-menu: func [face [object!] event [event!]][
        unless event [
          print "GOT NONE INSTEAD OF EVENT"
          return 'done
        ]
        attempt [
          switch event/picked [
             'fnew   [clear codesrc/text ] 
             'fopen  [loadfile] 
             'fsave  [savefile] 
             'setfont8  [codesrc/font/size: 8 ]
             'setfont10 [codesrc/font/size: 10 ]
             'setfont12 [codesrc/font/size: 12 ]
             'setfont14 [codesrc/font/size: 14 ]
             'setfg-black [codesrc/font/color: black ]
             'setfg-white [codesrc/font/color: white ]
             'setfg-red [codesrc/font/color: red ]
             'setfg-blue [codesrc/font/color: blue ]
             'setbg-black [codesrc/color: black ]
             'setbg-white [codesrc/color: white ]
             'setbg-cyan [codesrc/color: cyan ]
             'setbg-forest [codesrc/color: forest ]
             'setbg-olive [codesrc/color: olive ]
             'setbg-water [codesrc/color: water ]
             'runsrc [dolocalrun]
             'runextsrc  [doextrun]
             'compilesrc [doextcompil  alertPOPUP "finished"]
             'about [alertPOPUP "RED DEMO: SIMPLE EDITOR "]
             'exit [quit]
          ]
        ]
    ]
```

dockimbel

[09:36](#msg5735a027eea93e5742d186ef)Je n'ai pas réussi à reproduire le pb avec ta 1ère version de %A1.red, depuis la console graphique, j'obtiens:

```
red>> do %a1.red
1
*** Script error: use has no value
*** Where: do
```

RenaudG

[09:37](#msg5735a059e2996a5a42c802b6)tu dois pas avoir la modif de on-menu

dockimbel

[09:37](#msg5735a05aeea93e5742d186fc)Pareil avec la 2ième version que tu as posté.

nodrygo

[09:38](#msg5735a07c1794136a7d0848a2)@RenaudG chez moi j'ai fait quelques modifs que je peux push si besion  
et soit en mode compile soit en mode red basicide.red je ne reproduit pas  
par contre j'ai mis ça en place (remplacé use par if )

```
dolocalrun: does[ 
                  either  codesrc/text <> none [

............

mainwin/actors: context [
    on-menu: func [face [object!] event [event!]][
        print ["enter ON-MENU event/picked:"  event/picked ]
        either event/picked = none
           [print " !!!!!!!!!!! ALERT NONE EVENT" ]
```

dockimbel

[09:38](#msg5735a07ceea93e5742d18708)Ah, faut que je run ce script via l'appli de Nodrygo?... J'avais pas compris...

nodrygo

[09:38](#msg5735a0a9eea93e5742d18713)@dockimbel je n'avais compris non plus de suite :-)

dockimbel

[09:38](#msg5735a0afae26c1967f9e1999)@nodrygo Tu utilses `use` dans ton code ? Red n'a pas cette fonction...

nodrygo

[09:39](#msg5735a0ba831fd2d97d9e15c2) non pas que je sache j'ailleurs remplacé use par if

RenaudG

[09:40](#msg5735a0f8831fd2d97d9e15cf)j'ai pas été très clair sans doute

nodrygo

[09:40](#msg5735a1250cb634927f7e7f2a)@RenaudG maintenant c'est clair mais je ne reproduit pas

RenaudG

[09:40](#msg5735a12b0cb634927f7e7f34)oui, je run via l'appli de @nodrygo mes derniers posts "pleins de code" précisent la démarche

[09:42](#msg5735a184ae26c1967f9e19e5)dans le code de A1.red, si je change USE par IF (USE n'est effectivement défini nulle part), au lie du comportement indiqué j'ai un plantage direct au secon chargement/run

dockimbel

[09:43](#msg5735a1c8eea93e5742d1875e)Ok, je reprends l'analyse depuis le début. En regardant le code de \[%basicide.red](https://github.com/nodrygo/DemosRed/blob/master/basicIde/basicide.red), je vois que tu utilises CALL sous Windows, mais CALL n'est pas officiellement supporté, et il est buggé sous Windows (manque le support Unicode).

nodrygo

[09:43](#msg5735a1d61794136a7d084908)@RenaudG moi je lance par `\red-13may16-9aa20cb.exe basicide.red` puis charge le code et pas de plantage

dockimbel

[09:46](#msg5735a25864dbdadc7debb172)@nodrygo Est-ce que tu peux me fournir une version minimal de ton script qui reproduise le bug stp ?

nodrygo

[09:46](#msg5735a25beea93e5742d18798)@dockimbel oui mais la le problème est avec l'appel en local avec `dolocalrun` pas en utilisant le call

[09:46](#msg5735a2840cb634927f7e7f8e)@dockimbel ouch je vais tenter d'épurer un max et je te donne ça

dockimbel

[09:46](#msg5735a28ce2996a5a42c80370)Merci.

nodrygo

[09:48](#msg5735a2dc831fd2d97d9e1661)@dockimbel mais encore une fois c'est certainement pas prioritaire .. il manque encore beaucoup de choses pour un tel code GC, IO, et CALL

dockimbel

[09:49](#msg5735a322831fd2d97d9e1677)Les crashs sont des bugs prioritaires, du moins tant qu'ils n'utilisent que la lib standard Red.

RenaudG

[09:50](#msg5735a3711794136a7d084979)mes tests n'utilisent pas CALL, les exécutions passent par dolocalrun, tout en console.

nodrygo

[09:51](#msg5735a3a3ae26c1967f9e1a8c)@RenaudG oui moi aussi mais je vais faire une version hyper lite pour voir ce que ça donne

RenaudG

[09:53](#msg5735a409c61823687d3b803c)mais @nodrygo, t'arrive pas à reproduire ce que j'ai, en console ?

[09:54](#msg5735a451eea93e5742d18827)Voici \[mon basicide](https://gist.github.com/RenaudG/fc7a3cfed8dda6aba112765ad6d747c9)

nodrygo

[09:54](#msg5735a458eea93e5742d18829)@RenaudG je pense que c'est la façon de le lancer qui change  
je n'ai pas essayé de faire des `do %basicide.red` comme toi  
mais je vais essayer dès que j'aurais un code lite qui marche

celui que tu utilises n'est pas très different du mien au tests près ;-)

RenaudG

[09:55](#msg5735a4a1e2996a5a42c80415)et voici \[mon script de test](https://gist.github.com/RenaudG/d778bfb66b8e2292eea7dec46d3caae8)

[09:57](#msg5735a4efae26c1967f9e1b02)Je fais `do %basicide.red`, je clique sur A1.red, je fais un menu RUN... ça marche bien. Je REclique sur A1.red, je fais un menu RUN et c'est parti en live.

[09:57](#msg5735a5231794136a7d0849f9)Et le résultat dépend de changement a priori insignifiants, comme d'avoir ou non deux espaces devant la ligne de code qui définit la fonction démo.

[09:58](#msg5735a53cae26c1967f9e1b1a)Comme indiqué dans la session console que j'ai posté plus haut.

nodrygo

[10:03](#msg5735a67a1794136a7d084a66)@RenaudG en utilisant la même technique que toi je ne reproduit pas mais j'ai certainement des modifs que t'as pas  
je re push le dernier code

RenaudG

[10:07](#msg5735a778eea93e5742d1892c)essaie déjà avec les codes précis que j'ai indiqué pour voir si tu peux reproduire avec ces éléments là. C'est tellement sensibles à des pécadilles que si ça se trouve ton code modifié n'exhibera jamais ce comportement.

nodrygo

[10:08](#msg5735a7a70cb634927f7e814e)@RenaudG ok je ferais ça juste après la version épuré

RenaudG

[10:11](#msg5735a85d64dbdadc7debb383)Avoir des espaces ou non dans la def de `demo` change le comportement, et si dans A1.red je change USE par IF au lieu d'avir les messages d'erreur j'ai un crash immédiat lorsque je fais le second run.

nodrygo

[10:35](#msg5735ade1c61823687d3b834c)voila j'ai une\[ version minimale ](https://gist.github.com/nodrygo/9790aa5d03bd35ed32e821cb9683a01a )  
avec CONSOLE MODE DEBUG mais qui marche si ne n'utilise que le menu  
sauf une fois ou j'ai eu l'erreur ci dessous

```
*** Runtime Error 1: access violation
*** in file: /Z/devygo/red/red/interpreter.reds
*** at line: 407
```

par contre @RenaudG si je fais un peu comme toi dans la console l'appel des mots à la main

```
loadfile
dolocalrun
loadfile
```

cette fois j'ai un gros plantage

je vais tenter de trouver un version ou les menus génèrent des none

[11:01](#msg5735b3ee1794136a7d084e78)j'ai fait une mise à jour du code pour pouvoir recharger le fichier dans un on-change sur le nom du fichier  
et j'ai fini par générer après plusieurs loadfile une erreur

```
Z:\devygo\red\DemosRed\basicIde>gui-console.exe basicidelite.red
enter ON-MENU event/picked: runsrc
1
enter ON-MENU event/picked: runsrc
1

*** Runtime Error 1: access violation
*** in file: /Z/devygo/red/red/interpreter.reds
*** at line: 410
```

mais toujours pas reproduit le none du menu

RenaudG

[11:23](#msg5735b91ec61823687d3b8637)Comme je le suspectais, je ne peux reproduire le bug avec cette version simplifiée. Je continue de creuser (Hey @dockimbel, à ce train j'arrive bientôt en chine! See you soon).

nodrygo

[11:23](#msg5735b946eea93e5742d18dce)Un truc que j'ai remarqué .. a force de recharger le fichier avec le menu loadfile (surtout si on a changé le nom au passage) le area/text fini par se retrouver à none sans plus se mettre à jour (sauf à forcer dans la console ) et je ne sait pas pourquoi .. je me demande si on a pas le même type de comportement parfois avec les event/picked

[11:40](#msg5735bd310cb634927f7e8751)en fait il s'agissait d'un problème certainement de collision de nom .. un des codes test que j'utilise avait le même nom `codesrc` pour définir un `area` ce qui explique probablement le passage à none du mien  
pour les menu à none toujours pas reproduit même avec un menu plus consequent  
comme @RenaudG je creuse lol

RenaudG

[11:49](#msg5735bf621794136a7d085134)Je ne pense pas avoir de collision sur `codesrc` ou autre, c'est plu subtil et profond que ça. En m'interrogeant sur les différences de code entre les versions j'ai décidé de tester ce qui se passe entre un chargement via clic sur le fichier (ce que je faisais jusque là) et un chargement via le menu file/loadfile... et bien le bug se produit dans le premier cas et pas dans le second.  
M'est avis que le lieu probable du crime c'est ton panel construit avec compose/deep :

```
panel [ below
           flist: text-list on-change [curfilename/text: current/curdirfiles/(face/selected) loadfile]
           (comptype-bar)
           ]
```

Le bug disparaît si je recode ainsi :

```
panel [ below
           flist: text-list on-change [curfilename/text: pick current/curdirfiles face/selected loadfile]
           (comptype-bar)
           ]
```

nodrygo

[11:52](#msg5735bff6ae26c1967f9e225a)ARRGHHH trouvé c'est encore une collision de nom sur un de mes codes de test  
décidément ce mode global m'agace . C'est une grosse source d'erreur .. voila pourquoi ce n'est plus par défaut sur la plupart des autres langages ;-)

@RenaudG possible ? et là en revenant à la version complete je viens d'avoir un truc bizarre .. après plusieurs appels à LOAD il m'annonce une erreur de script sur le context current/modified me disant

```
entrée de LOADFILE
*** Script error: cannot access modified in path current/modified:
```

[11:56](#msg5735c107ae26c1967f9e22c9)tu veux dire juste le () dans le flist  
ah j'avais pas vu le pick  
ok je change ça merci

RenaudG

[11:57](#msg5735c13c831fd2d97d9e1eeb):)

nodrygo

[12:01](#msg5735c233ae26c1967f9e2325)avec ta correction ;-) et assez rapidement .. il doit me rester un autre bug

```
enter ON-MENU event/picked: none
*** Script error: word! type is not allowed here
*** Where: =
```

RenaudG

[12:03](#msg5735c28bc61823687d3b88bd)ouai, et en plus avec ma version, le run semble ne plus marcher... alors que ça marchait tout à l'heure.

[12:04](#msg5735c2b10cb634927f7e890d)Je m'arrache les cheveux... y'a un truc qui écrase de la mémoire quelque part, mais j'arrive pas à trouver où.

nodrygo

[12:04](#msg5735c2e91794136a7d08526f)@RenaudG chez moi le run fonctionne

RenaudG

[12:11](#msg5735c4751794136a7d085308)Tu ferme ta console et tu la relance à chaque fois ? Car j'ai oublié de préciser que ça aussi ça modifie sauvagement le comportement de ton code. Tous mes essais se font en repartant à chaque fois d'une console neuve

nodrygo

[12:30](#msg5735c8ef0cb634927f7e8b25)@RenaudG en tout on en reviendrait à ma première hypothèse un problème dans une alloc mémoire quelque part ... très difficile à trouver

RenaudG

[12:31](#msg5735c916eea93e5742d19278)ouep

nodrygo

[12:53](#msg5735ce44eea93e5742d1944c)\[!\[erreurbasicide.png](https://files.gitter.im/red/red/France/sMfD/thumb/erreurbasicide.png)](https://files.gitter.im/red/red/France/sMfD/erreurbasicide.png)

[12:53](#msg5735ce47c61823687d3b8cea)bon avec une version une moins minimaliste on peut plus facilement reproduire l'erreur en faisant plusieurs LOAD depuis la boite FLIST suivit de RUN  
possible que le bloc

```
panel [
           flist: text-list on-change [curfilename/text: pick current/curdirfiles face/selected loadfile]
           ]
```

soit en cause en tout cas j'ai eu une erreur interpreteur.reds ligne 410 une fois et plusieurs erreur s mais ça reste très aléatoire :-(

```
enter ON-MENU event/picked: none
*** Script error: word! type is not allowed here
```

[12:58](#msg5735cf920cb634927f7e8db3)@dockimbel sur la dernière version (pas si minimal hélas - même gist mis à jour) je reproduit assez rapidement avec la séquence suivant  
Click sur le nom d'un fichier  
puis run  
puis 2 ou 3 fois le menu file.load  
mais çà reste aléatoire

peut être même plus simple  
charger un fichier avec la boite  
puis faire plusieurs menu/load à suivre

[13:16](#msg5735d3a7e2996a5a42c81260)possible aussi que ce soit un bug sur mon code .. je viens de voir que la selection dans la box déclenchait 2 load consécutifs  
après correction il s'avère que ce n'est pas ça :-(

[13:57](#msg5735dd4fae26c1967f9e2cf2)déprimant parfois ça marche pleins de fois avant de planter  
au passage une autre erreur que j'ai eu

```
enter ON-MENU event/picked: runsrc
*** Error: CreateWindowEx failed!

*** Runtime Error 1: access violation
*** in file: /Z/devygo/red/red/modules/view/backends/windows/gui.reds
*** at line: 68
```

RenaudG

[13:58](#msg5735dd88831fd2d97d9e2874)ouep, ben j'y vois pas plus clair non plus, et j'y ai passé bien trop de temps

[13:58](#msg5735dd910cb634927f7e92dd)je vais pas tarder à aisser tomber !

nodrygo

[13:59](#msg5735ddacae26c1967f9e2d10)@RenaudG je crois que je vais faire une pause aussi ;-)

RenaudG

[14:12](#msg5735e0d8e2996a5a42c81726)j'ai peut-être trouvé un truc : le contenu du fichier chargé semble jouer, mais si on supprime l'appel à dolocalrun dans le 'runsrc j'obtiens quand même toujours les plantages. Le bug semble du au chargement plutôt qu'a l'exécution du code.

nodrygo

[14:13](#msg5735e1251794136a7d085d72)c'est peut être une piste

RenaudG

[14:14](#msg5735e141831fd2d97d9e2a02)ouep. ça plante à l'appel de run, même si run ne fait strictement rien

dockimbel

[14:16](#msg5735e1b70f07acdc7a042091)Un test à faire: appeler `dolocalrun` depuis un bouton, plutôt qu'un menu.

RenaudG

[14:17](#msg5735e1ea0cb634927f7e94b7)sur ma version de test simplifiée, j'ai ça :

```
loadfile: does [
    clear codesrc/text
    fn: to file! curfilename/text
    if  exists? fn [codesrc/text: read fn]
    current/modified: false
    print "loaded"
    'done
]
```

Le print a été ajouté à l'instant. Si je charge (par clic) puis run, et que je recharge par clic ça plate à ce moment là

[14:17](#msg5735e206ae26c1967f9e2eff)sans le print, non. Il faut un run suivant pour avoir le comportement zarbi

[14:17](#msg5735e21764dbdadc7debc666)@dockimbel là dolocalrun n'est JAMAIS appelé

nodrygo

[14:19](#msg5735e25cae26c1967f9e2f29)@RenaudG n fait c'est peut être le loadfile à mettre dans un bouton

RenaudG

[14:22](#msg5735e3300cb634927f7e9555)maybe... là le plantage que je décrit ne se produit que si le loadfile est invoqué via clic sur le fichier, PAS si c'est par le menu load

[14:24](#msg5735e3bb0cb634927f7e95a6)si je charge par clic, puis run, le loadfile suivant (avec le print) plante tout quelle que soit la manière de l'invoquer

[14:26](#msg5735e411eea93e5742d19c56)mon \[basicide simplifié](https://gist.github.com/RenaudG/fc7a3cfed8dda6aba112765ad6d747c9) pour tous mes derniers tests.

[14:27](#msg5735e438e2996a5a42c8188d)mais c'est dépendant du contenu du fichier chargé.

[14:28](#msg5735e47a831fd2d97d9e2b52)Voilà \[le fichier chargé](https://gist.github.com/RenaudG/d778bfb66b8e2292eea7dec46d3caae8) qui crée le soucis à tous les coups

[14:28](#msg5735e4a664dbdadc7debc774)mais pour être certain de provoquer le problème il faut partir d'une console neuve, chargr le fichier par clic, faire un run, et ensuite un rechargement plante tout.

nodrygo

[14:32](#msg5735e58deea93e5742d19ce7)@RenaudG tu lance ton basicide simplifié comment par un do dans la console ou en ligne  
moi je lance comme un script Red dans console-debug que j'ai recompilé ce matin et voila ce que j'obtiens

```
Z:\devygo\red\DemosRed\basicIde>gui-console.exe basicidelite.red
LOAD FILE a3.red
enter ON-MENU event/picked: runsrc
5
unset
enter ON-MENU event/picked: fopen
LOAD FILE a3.red
LOAD FILE a3.red

*** Runtime Error 1: access violation
*** in file: /Z/devygo/red/red/interpreter.reds
*** at line: 407
```

[14:33](#msg5735e5b20cb634927f7e9673)attends je vais refaire avec ta version

OK cette fois même comportement que toi

RenaudG

[14:35](#msg5735e64deea93e5742d19d49)cool ! (si on peut dire)

nodrygo

[14:38](#msg5735e6fbc61823687d3b9690)by the way comment en Red (Rebol) on reassigne un mot en sauvant l'ancien?  
`printorig: :print` ça suffit ?

RenaudG

[14:39](#msg5735e70b0cb634927f7e9721)oui

[14:41](#msg5735e7940cb634927f7e974c)clue: si je commente la ligne `clear codesrc/text` de loadfile, je ne reproduit plus le bug

nodrygo

[14:42](#msg5735e7d1e2996a5a42c819f6)je l'utilise peut être mal à propos

RenaudG

[14:42](#msg5735e7f0831fd2d97d9e2cc7)je pense qu'il y a un bug caché dans clear

[14:44](#msg5735e83ce2996a5a42c81a1e)disons que dans ton cas il ne sert à rien si le fichier existe, mais son emploi ne parait pas si idiot

[14:44](#msg5735e852ae26c1967f9e31b8)par contre c'est un bon candidat (a priori) à un foutage de bordel

[14:44](#msg5735e8611794136a7d086078)reste que ça dépend aussi du code chargé.

[14:45](#msg5735e8a5c61823687d3b9741)essaie, dans tes codes de commenter cette ligne et de voir si tu peux reproduire tes propres situations de bug.

dockimbel

[14:50](#msg5735e9aefeb8cb327ee1dd1a)@RenaudG J'ai réussi à reproduire un crash en utilisant la séquence: click, run, loadfile.

RenaudG

[14:50](#msg5735e9cf1794136a7d08611f)c'est zarbi que ça ne se produise QUE si le tout premier chargement est un chargement de A1.red via click, et ensuite n'importe quel loadfile plante

[14:52](#msg5735ea14ae26c1967f9e3273)ça dépend du coneu du fichier initial chargé, et de la manière d'invoquer ce premier chargement. Et ça ne se produit pas si on évite le clear en début de loadfile.

nodrygo

[14:55](#msg5735ead0c61823687d3b9828)dans le basicide complet j'ai enlever les clear sur les mots loadfile et dolocalrun et ça à l'air d'aller un peu mieux .. je n'ai pas replanter to dernier code démo

RenaudG

[14:57](#msg5735eb6ee2996a5a42c81b93)j'avais supprimé dolocalrun pour voir si je pouvais reproduire le bug sans exécuter le code chargé... c'est le cas. Donc dolocalrun est sans doute innocent.

[14:58](#msg5735eb9e0cb634927f7e98da)je dirais qu'on a sans doute un peu progressé, mais là je suis vraiment à cours d'idée pour circonscrire davantage le bug.

nodrygo

[15:01](#msg5735ec2e64dbdadc7debcaf0)@RenaudG oki  
au fait la reassignation `printorig: :print` ne marche pas comme je veux. En fait il semble que ce soint juste un pointeur vers print. du coup quand je ré affecte print le printorig suit

il doit y avoir une autre astuce

```
panout: context [text: ""]
printerr: function [x] [
    ; add detail in codeerr area
    unless x = none [
       case  [  
                type? x  = string! [append panout/text x ] 
                type? x  = series? [for each y x [adder reduce y]] 
                true  [append panout/text form x ]
            ] 
    ] 
]
printorig: :print 
print: :printerr
print [1 2 3]
probe panout/text
printorig "qsd"
probe panout/text
```

il faudra aussi que je trouve une astuce pour executer le code dans un context séparé pour éviter les collision de nom (en attendant d'appeler call')

RenaudG

[15:04](#msg5735ed02ae26c1967f9e33e1)heu... je dois pas capter un truc, ça m'a l'air de marcher

nodrygo

[15:05](#msg5735ed2d64dbdadc7debcb66)pas si tu charge le code basicide et que tu le lance dans basicide ;-)  
j'avais le problème avec un autre code mais different qui utilisait aussi un `current: context` comme dans basicide et qui me pétait tout d'ou l'idée de lancer ça dans un call externe

RenaudG

[15:05](#msg5735ed480cb634927f7e99b2)ah ben non, forcément

[15:06](#msg5735ed6deea93e5742d1a035)il faut que tu fasse ta réaffectation au début de basicide (ou avant)

nodrygo

[15:14](#msg5735ef400cb634927f7e9a86)pour la reaffectation j'ai trouvé il faut faire

```
set 'printorig :print 
set 'print :printerr
```

par contre je n'arrive pas à me débarasser des ==result je ne sais pas d'ou ils sortent

RenaudG

[15:18](#msg5735f0381794136a7d086408)`(type? x) = string!` pas `type? x = string!`

nodrygo

[15:18](#msg5735f04ee2996a5a42c81d87)arg stupid suit je  
non c'est pas ça j'ai toujours le == result

dockimbel

[15:26](#msg5735f2342867f61b7b26aeb6)@RenaudG @nodrygo `string?`

RenaudG

[15:27](#msg5735f25764dbdadc7debcdb0)encore mieux ! ;)

ldci

[15:27](#msg5735f269831fd2d97d9e317b)Bonjour à tous, je viens de commencer à écrire quelques fonctions pour les images en Red. Ca fonctionne pas mal du tout  
Juste un exemple pour faire un ET logique sur 2 images

```
img: copy source1
	img/rgb: source1/rgb and source2/rgb
	img
]
```

C'est aussi rapide qu'un appel à un code OpenCV avec du Red/System. En revanche dès qu'on doit itérer dans l'image c'est plus lent, comme dans cette fonction qui fait un NOT sur l'image

```
rcvInvert: function [source [image!] return: [image!]] [
"Invert image"
	img: copy source
	forall img [
		pxl: 255.255.255.0 - img/1
		img/1: pxl
	]
	img
]
```

Avec du Red/S ce sera mieux je pense. En tout cas c'est vraiment encourageant

RenaudG

[15:27](#msg5735f277c61823687d3b9bc2)@dockimbel tu as des idées sur le bug qui nous a occupé toute la journée ?

dockimbel

[15:28](#msg5735f281feb8cb327ee1ddc3)@nodrygo `type? x = series? [...]` =&gt; `series? x [...]`

[15:29](#msg5735f2d40f07acdc7a0421d0)@RenaudG Peux-tu confimer une hypothèse: la ligne modifiée suivante dans `loadfile` ne me permet plus de reproduire le crash:

```
if exists? fn [codesrc/text: replace/all read fn "^/" " "]
```

nodrygo

[15:30](#msg5735f320eea93e5742d1a2ae)j'avais tenté le string? x mais j'avais eu l'impression que le case n'aimais pas ça .. mais ça devait être autre chose  
du coup ok c'est bon merci

RenaudG

[15:31](#msg5735f3460cb634927f7e9c7c)@dockimbel au premier abord ça semble marcher, oui.

dockimbel

[15:31](#msg5735f34afeb8cb327ee1ddd1)@nodrygo `unless x = none [` =&gt; `if x [`

RenaudG

[15:31](#msg5735f34be2996a5a42c81ecb)= plus de crash

dockimbel

[15:33](#msg5735f3defeb8cb327ee1dddb)@RenaudG Dans ce cas, je pense que c'est le code qui convertit les LF en CRLF et inversement dans le widget `area` qui corrompt la mémoire (fonctionnalité récemment ajoutée par ce \[commit](https://github.com/red/red/commit/dd4009baaab2ed4933dcc23e7813a4f1a39c3edb)).

RenaudG

[15:34](#msg5735f417eea93e5742d1a30e)OK... un bien vivieux celui là ;)

nodrygo

[15:34](#msg5735f4180cb634927f7e9cd7)je confirme plus de crash

RenaudG

[15:34](#msg5735f4191794136a7d0865bb)vicieux

dockimbel

[15:35](#msg5735f4348b845b284193ef11)@ldci Sympa ! As-tu tenté un `not img/rgb` pour l'inversion d'image ?

[15:35](#msg5735f45f8b845b284193ef1b)@RenaudG Je vais confirmer en recompilant une console avec le code juste avant ce commit...

RenaudG

[15:36](#msg5735f471831fd2d97d9e326c)OK, merci @dockimbel

nodrygo

[15:37](#msg5735f4ae831fd2d97d9e3280)@dockimbel @RenaudG merci à vous 2

RenaudG

[15:38](#msg5735f4deeea93e5742d1a35e)@nodrygo Pas de quoi... on veut tous un Red sans bug ;)

dockimbel

[15:44](#msg5735f6728b845b284193ef3b)Je confirme, sans changer le code de %basicide.red, avant ce commit, ça ne plante pas, après, ça plante.

nodrygo

[15:44](#msg5735f676ae26c1967f9e37e6)par contre il va falloir attendre la correction ... ça me casse complètement la présentation dans le code .. plus de LF

dockimbel

[16:03](#msg5735fab52867f61b7b26af3b)@nodrygo La correction est en cours, ça ne devrait pas trop durer.

nodrygo

[16:03](#msg5735fadbe2996a5a42c821ed)@dockimbel super merci beaucoup pour ton aide

dockimbel

[16:38](#msg573603220f07acdc7a0422ab)@nodrygo @RenaudG J'ai poussé le correctif.

ldci

[16:38](#msg573603230cb634927f7ea248)@dockimbel : oui j'ai essayé le not img/rgb mais ce n'est pas le résultat attendu. Je teste ASAP, mais j'ai déjà une trentaine de fonctions qui fonctionnent comme make image! \[512x512 random 255.255.255] qui crée une belle image aléatoire:)

nodrygo

[16:39](#msg57360347c61823687d3ba25b)@dockimbel super je vais tester çà rapidement

RenaudG

[16:39](#msg57360348eea93e5742d1a885)Un grand merci @dockimbel

dockimbel

[16:39](#msg5736035d2867f61b7b26afbd)@ldci Je pense qu'il faut alors implémenter l'inversion en Red/System pour des perfs acceptables.

[16:41](#msg573603ae8b845b284193effa)@nodrygo @RenaudG Merci à vous deux d'avoir passé des heures à traquer ce problème et avoir prémaché le travail de localisation de l'erreur. C'est un bug très sérieux et je suis bien content qu'on l'ai trouvé et corrigé avant la prochaine release. ;-)

[16:44](#msg5736047e8b845b284193f008)@nodrygo Dans %basicide.red, `'exit [quit]` =&gt; `'exit [unview]`, ça évitera de quitter la console quand on sélectionne ce menu. ;-)

nodrygo

[16:44](#msg5736047f64dbdadc7debd4bb)@dockimbel il faut être clair , moi je prends du plaisir avec Red ..Alors merci à toi d'investir autant dans ce langage (environnement) . c'est vraiment un travail magnifique et je suis très impressionné

pour info j'ai commencé à mettre les sortie print dans le texte area du bas . Il me reste à forcer le scroll sur la dernière ligne .. mais je vais bien trouver

RenaudG

[16:45](#msg573604c564dbdadc7debd4d0)je bisse. Bravo !

dockimbel

[16:47](#msg5736051c8b845b284193f016)@nodrygo @RenaudG Merci ! Moi, je prends du plaisir quand je vois les utilisateurs contents. ;-) Ca fait maintenant 5 ans que j'ai tout investis dans ce projet, c'est pas pour laisser passer des bugs. ;-) Il reste encore pas mal de travail pour une version complète, mais on y est presque ! J'avoue que j'envie un peu les utilisateurs, j'ai un paquet d'idée d'applications que je voudrais coder en Red, mais je dois me retenir en attendant la 1.0. ;-)

[16:50](#msg573605d38b845b284193f02a)@RenaudG Est-ce qu'on ne ce seraient pas croisés lors de ma présentation de Red en 2012 au Paris Open Source Summit ?

nodrygo

[16:52](#msg57360654c61823687d3ba361)@dockimbel dernière version installé et tout semble nickel encore merci pour ta réactivité.  
j'ai hate d'avancer et de mieux maîtriser Red .. mais ça vient petit à petit

RenaudG

[16:52](#msg57360662e2996a5a42c82568)Non @dockimbel. On a juste eu des échanges jadis sur Rebol, et un peu après les débuts de Red sur le logo.

[16:53](#msg5736067764dbdadc7debd552)Jamais rencontrés en live. Un jour peut-être, ce serait avec plaisir.

dockimbel

[16:54](#msg573606c92867f61b7b26b016)@nodrygo Super ! Je peux aller me coucher du sommeil du juste maintenant. ;-) (1h du matin ici)

RenaudG

[16:54](#msg573606e2ae26c1967f9e3df2)Rebol c'était génial. Red ça promet encore bien plus... je déguste ce qu'on a, et j'ai hate de voir arriver la suite ;)

nodrygo

[16:55](#msg573606eb0cb634927f7ea379)@dockimbel ah oui quand même .. c'est ça la passion ;-)

RenaudG

[16:55](#msg573607051794136a7d086c8f)Bon, ben alors bonne nuit Doc, et encore merci pour tout.

dockimbel

[16:55](#msg57360711feb8cb327ee1dece)@RenaudG Si tu es sur Paris, on peut se prendre une bière à mon prochain passage. Sinon, peut-être lors d'une prochaine conférence à Paris.

nodrygo

[16:56](#msg5736072dc61823687d3ba3ab)@dockimbel si tu passes sur Montpellier fait moi signe ;-)

RenaudG

[16:56](#msg57360752e2996a5a42c825a3)Nan, moi pas parisien... sur Mâcon. Mais si c'est possible à l'occase ce serait cool. Comme ce serait cool pour moi de rencontre Nod' et les autres têtes qu'on croise par ici.

dockimbel

[16:57](#msg573607848b845b284193f043)@nodrygo J'y suis passé il y a 20 ans, mission chez un client, j'y ai beaucoup apprécié la qualité de vie (ainsi qu'à Nimes).

nodrygo

[16:58](#msg573607c7c61823687d3ba3e2)@dockimbel ben moi je n'y suis que depuis mi decembre 2015 .. avant j'ai passé 6 ans à Paris .. ça aurait été plus simple :-)

dockimbel

[17:00](#msg573608418b845b284193f052)@nodrygo Pour le contrôle du scrolling, on a pas encore le support, je pense que tu peux t'en tirer avec un bout de code en Red/System (je te fournis çà demain).

nodrygo

[17:01](#msg573608591794136a7d086cea)@dockimbel genial merci en plus comme ça je vais apprendre à mixer red et red/system

## Saturday 14th May, 2016

dockimbel

[09:41](#msg5736f2db0cb634927f7ecfce)@nodrygo Comme promis, le \[code](https://gist.github.com/dockimbel/dbc310cd996790bf5ab665045c05611e) pour scroller le widget area (à étendre en fonction de tes besoins).

nodrygo

[09:42](#msg5736f314831fd2d97d9e6435)@dockimbel super merci je vais voir pour ajouter ça

[11:08](#msg57370721831fd2d97d9e66d2)et j'ai encore un problème cette fois ce sont mes tentatives de re définitions de print  
\[reprint ici](https://gist.github.com/nodrygo/88ac6014c7ae0380e448a4656aa10ee6 )

marche bien en mode interprété mais le compilateur me fait des misères  
j'ai peut être encore fait des âneries

```
Z:\devygo\red\DemosRed\basicIde>..\..\win\red-14may16-f6c0fda.exe -c  reprint.red
-=== Red Compiler 0.6.0 ===-
Compiling Z:\devygo\red\DemosRed\basicIde\reprint.red ...
...compilation time : 891 ms
Compiling to native code...
*** Compilation Error: undefined symbol: f_prin
*** in file: %/Z/devygo/red/DemosRed/basicIde/reprint.red
*** in function: exec/f_??
*** at line: 1
*** near: [
    f_prin
    stack/unwind
    stack/reset
    stack/mark-func ~prin
    string/push as red-string!
]
```

je dois m'absenter je ferais d'autres tests en fin d'après midi

dockimbel

[11:20](#msg573709e2e2996a5a42c853b4)@nodrygo Le compilateur a du mal avec la redefinition des mots référençant des fonctions natives dans le contexte global, ça produit des erreurs dans les fonctions de la lib standard qui dépendent d'eux (je n'ai pas creusé ça encore pour savoir si c'est solutionnable ou pas). Dans tous les cas, si tu places tes redéfinitions dans une fonction, alors le compilateur sera satisfait:

```
init: does [
	set 'prinorig :prin 
	set 'printorig :print 
	set 'print :printerrlf
	set 'prin :printerr
]
```

Testé ici, ça compile et marche comme attendu.

nodrygo

[16:50](#msg5737575a64dbdadc7dec1203)@dockimbel merci .. un peu hard car on ne peux pas mettre çà n'importe ou sinon ça marche pas. mais j'ai trouvé un compromis qui compile

## Tuesday 17th May, 2016

ldci

[19:11](#msg573b6cf1831fd2d97d9f58b6)@dockimbel : pour l'inversion (Not) de l'image j'ai trouvé :

```
rcvNot: function [source [image!] return: [image!]][
	img: copy source
	img/rgb:  complement source/rgb 
	img
]
```

Red est vraiment génial :)

## Wednesday 18th May, 2016

ldci

[20:01](#msg573cca2ac61823687d3d2b76)I

## Wednesday 1st June, 2016

pchg

[14:02](#msg574eeaf36bbc2d1d4df02ee4)Bonjour, je re-apparais, je tente, une fois de plus, de raccrocher les wagons et de piger ce qui se trame du côté de chez Red.

## Thursday 2nd June, 2016

ldci

[16:45](#msg57506294da3f93da6f22cdc5)Salut Pierre, content de te retrouver. Je viens de rendre disponible sur GitHub mes premiers tests en traitement d'image avec Red : https://github.com/ldci/redCV

## Friday 3th June, 2016

nodrygo

[05:27](#msg57511524454cb2be09519954)@ldci excellent

ldci

[06:39](#msg575126046bbc2d1d4df0d226)@nodrygo merci bcp

## Wednesday 15th June, 2016

ldci

[12:09](#msg5761456536c83a880205d6e3)Bojour: nouvelle version de RedCV sur GitHub avec quelques fonctions statistiques sur l'image

dockimbel

[14:29](#msg576166326111a28c047b791c)Salut François, je suis ton travail sur RedCV, c'est très prometteur. Penses-tu qu'on puisse à terme remplacer OpenCV pour les tâches communes de reconnaissance et suivi d'objets?

[14:31](#msg576166d4ea84f717479b9140)La demo opimage.exe est très sympa ! :+1:

[14:35](#msg576167ca6111a28c047b792e)Je pense que je vais te donner un coup de main pour le code d'opimage une fois la nouvelle release sortie, il peut être grandement simplifié grâce à VID. (A moins que @SteeveGit ne veuille s'en occuper ;-))

SteeveGit

[14:43](#msg5761698809a91a8d73d6dbb1)hein euh quoi ? J'ai pas vu opimage et je suis sur un "secret project" dont une première alpha est pas loin de sortir, donc pour le moment, je préfère pas me disperser.

[14:58](#msg57616d2aea84f717479b918b)@ldci j'ai une boite de dialogue avec "bad format" et une petite croix rouge. C'est surement le request-file qui foire. Encore une incompatibilité windows/linux au niveau des paths j'imagine (je teste sous wine+ubuntu).

DideC

[15:01](#msg57616dcbf191398330a0c827)Salut

[15:01](#msg57616de4da1c26b045365887)J'ai déjà porté opimage en VID, le code est sur rebelBB.

SteeveGit

[15:02](#msg57616e1591cdd6673163f589)hum... rebelBB ça fait un bail que j'ai pas zieuté.

[15:04](#msg57616e906111a28c047b7991)mais dis moi tu postes du code Red sur RebolBB et pas ici ? :-)

DideC

[15:10](#msg57616fe1f191398330a0c95e)Ben oui. François y a fait l'annonce et comme je goute pas encore github, je savais pas où poster le code adapté en VID.  
C'est là : http://www.digicamsoft.com/cgi-bin/rebelBB.cgi?thread=2Jun2016185127553996200

dockimbel

[15:58](#msg57617b106111a28c047b7a6d)@DideC Bravo ! Je vois encore quelques possibilités de simplification, comme par exemple la factorisation des `canvas/image:` en dehors des `switch`.

DideC

[16:24](#msg5761812236c83a880205f3be)A ben oui. Je suis en train d'adapter sa dernière version, je vais y inclure ça et quelques autres idées... demain !

ldci

[17:10](#msg57618c1dda1c26b045366636)Bon, j'avoue que je n'ai pas passé bcp de temps sur View d'une part parce que je suis sous OSX et que d'autre part je me concentre sur la lib redcv.  
@DideC : Je suis ravi qu'un reboleur aussi expérimenté que toi fasse le travail avec VID :)  
@SteeveGit : attention avec wine+osx je ne peux visualiser que des fichiers png. Tu dois avoir le même problème je pense.  
@dockimbel : merci pour les commentaires. Oui l'idée est de pouvoir offrir un remplaçant à OpenCV pour les tâches simples. Je suis en train d'écrire les routines de convolution qui vont servir pour les filtres et autres joyeusetés. Bien évidemment ce sera plus facile que le type matrix! sera disponible, mais on s'en sort avec le vector!  
Actuellement je suis obligé de tricher un peu. Par exemple, comme Qingtian m'a confirmé qu'on ne pouvait pas concevoir une image à un seul canal (grayscale), je suis obligé de garder une image 4 canaux et par conséquent on multiplie le traitement. Ce serait génial d'avoir une matrice 2D ne contenant qu'une valeur et non 4 RGBA. Idem ce serait génial de pouvoir gérer de images 16, 32 et 64 bits, notamment pour les conversions d'espace couleur. je vais essayer de me pencher dessus dès que possible.  
Dernier point maintenant qu'on a un timer! je vais pouvoir comparer les vitesses de rendu entre redcv et opencv:)

## Friday 17th June, 2016

ldci

[13:55](#msg576401403881bc405b6e2fa3)Bonjour à tous. Les routines de convolution d'images sont développées. Je mettrais à jour la semaine prochaine sur le site. En attendant https://pbs.twimg.com/media/ClKFEA3WgAENuLv.jpg

[13:55](#msg576401686577f032450bedd0)oups: je mettrai à jour

DideC

[16:46](#msg57642975feaf6cd222ac7d4e)Cool. Moi pendant ce temps, je travaille un peu à l'interface en VID pour me faire un peu la main.  
Faudra que je trouve à mettre ça sur Github...

SteeveGit

[17:01](#msg57642cd091d56ac9155c5048)@DideC Ben tu peux le mettre sur Gist c'est plus simple, pas besoin de créer un projet git juste pour de simples scripts.

ldci

[18:41](#msg5764445b4227fdc92297fa45)@tous: en avance et pour le fun j'ai mis à jour https://github.com/ldci/redCV  
Vous pouvez jouer avec les filtres par convolution. Avec du code sur le modèle de DideC.

SteeveGit

[18:50](#msg5764467e91d56ac9155c5123)@ldci in redCV lib, you misplaced all the doc-strings. Should be in the spec blocks not in the body block. Also when you use `function` you don't need to declare your /locals.

[18:59](#msg5764487aa7b963c04e7c7f60)Also, now that we have time functions, you should measure perfs. I would not be surprised if some of your inner loops are not compiled but evaluated. Would be interesting to check the compiled code.

[19:12](#msg57644bae91d56ac9155c5175)pourquoi je parle anglish ici, moi ?

## Saturday 18th June, 2016

ldci

[20:19](#msg5765acc03881bc405b6e9b37)@SteeveGit : merci pour les remarques. Je vais mettre à jour

## Wednesday 22nd June, 2016

ldci

[15:36](#msg576ab07f80f1c6a5257dddcf)Salut @ tous  
J'ai mis à jour sur https://github.com/ldci/redCV  
Au menu, une amélioration sensible de la vitesse pour les fonctions statistiques réécrites en Red/S ainsi que le calcul du temps nécessaire pour les routines et l'affichage: 4 ms pour charger (avec rcvMeanImage et CvRandom) de 2024x768  
A tester

SteeveGit

[15:48](#msg576ab3343b4cb6687034a87d)@ldci les Exe toujours pas executables sous linux+wine avec une dialogue "Bad format" au lancement. Si les exe ont besoin du repertoire image, faudrait le préciser dans la doc. (Mais même avec, ça marche pas). Sinon j'ai pas bien compris pourquoi ça devrait pas marcher avec les .png sous nunux. Wine est sensé être compatible WinXP pourtant ???

dockimbel

[15:54](#msg576ab4a23b4cb6687034a891)@SteeveGit "Si les exe ont besoin du repertoire image, faudrait le préciser dans la doc" ???

SteeveGit

[15:56](#msg576ab546fac963084de1e0f4)Ben ça foire au lancement (doubel-click), donc j'imagine qu'y manque un truc... sais pas...

[16:02](#msg576ab67ffac963084de1e103)Ok, j'ai zieuté les sources en travers, y'a une interface view lol, donc ouais, rien à voir avec les .png, il manque un truc plus sérieux.

dockimbel

[16:05](#msg576ab767fac963084de1e107)On va retester sous XP dans les jours qui viennent, avant la release 0.6.1.

ldci

[17:01](#msg576ac477c7061d590d52dd3a)Avec Winehouse sous OS X aucun problème. Le répertoire images n est pas appelé par les exe

SteeveGit

[18:56](#msg576adf62fac963084de1e2d2)\[!\[Screenshot from 2016-06-22 20:55:23.png](https://files.gitter.im/red/red/France/ArPH/thumb/Screenshot-from-2016-06-22-20\_55\_23.png)](https://files.gitter.im/red/red/France/ArPH/Screenshot-from-2016-06-22-20\_55\_23.png)

## Thursday 23th June, 2016

dockimbel

[03:27](#msg576b573e2c45709c2d209523)

ldci

[06:19](#msg576b7f780ede04dc490429a9)A mon avis il faut attendre le view pour Linux

DideC

[14:42](#msg576bf55780f1c6a5257e9bf0)Si j'ai bien tout lu, @SteeveGit utilise Linux+Wine, donc c'est du View sous Win32 !

ldci

[16:21](#msg576c0c9380f1c6a5257eb00f)Ok j'ai compilé en win64!

## Friday 24th June, 2016

ldci

[11:56](#msg576d1fddc417e36c69e678b3)@dockimbel : j'ai commencé à jouer avec la camera et RedCV. Ca marche bien! le to-image cam renvoie bien une image qu'on peut passer en paramètre aux fonctions redcv. J'ai écrit une demo de tracking de movement. Le seul point qui manque est d'avoir un timer. Je sais que c'est dans les tuyaux, mais as tu une idée de comment faire sans. J'ai perdu ton exemple Amiga clock qui donnait une piste. A +

dockimbel

[12:00](#msg576d20dc2554bbe049bbcaac)@ldci Si tu utilises la 0.6.0, regarde \[ici](https://github.com/red/code), si tu utilises la dernière version de Red, regarde \[là](https://github.com/red/code/tree/v0.6.1).

[12:01](#msg576d21130ede04dc4904ffd1)Si tu veux bookmarker le repo sur github, il faut cliquer sur le bouton "étoile" (star). Ensuite, tu peux le retrouver facilement dans le menu, entrée "Your stars".

ldci

[12:49](#msg576d2c690ede04dc490504a6)@dockimbel merci pour le lien je teste on-time

[19:07](#msg576d84feb619dbcd711a751b)@dockimbel : &lt;You're the best

[19:08](#msg576d853974f25dd571b92281)

```
Red [
	Title:   "Test image operators and camera Red VID "
	Author:  "Francois Jouen"
	File: 	 %motion.red
	Needs:	 'View
]

; all we need for computer vision with red
#include %../libs/redcv.red ; for red functions
;do %../libs/redcv.red		 ; for red tests


live?: system/view/auto-sync?: no

rimg: make image! reduce [320x240 black]
prevImg: rimg
nextImg: rimg
margins: 10x10



view win: layout [
		title "Motion Detection"
		origin margins space margins
		cam: camera 320x240
		canvas: base 320x240 rimg rate 0:0:1 on-time [
			nextImg: rcv2BW to-image cam
			canvas/image: rcvAbsDiff nextImg prevImg
			prevImg: nextImg	
		]
		return
		cam-list: drop-list 160x32 on-create [
				face/data: cam/data
			]
		onoff: button "Start/Stop" 70x24 on-click [
				either cam/selected [
					cam/selected: none
					canvas/rate: none
					canvas/image: black
				][
					cam/selected: cam-list/selected
					canvas/rate: 0:0:1
				]
			]
		btnQuit: button "Quit" 70x24 on-click [quit]
		do [cam-list/selected: 1 canvas/rate: none]
]
```

[19:10](#msg576d85af165412787f1b6ad2)Le seul problème, le timer est à 1 sec, mais ce sera amélioré sans pb je pense

## Saturday 25th June, 2016

dockimbel

[04:40](#msg576e0b284a1ee37d4ae5b38d)@ldci Pour le timer, tu peux indiquer une fréquence (integer!) ou une durée (time!), c'est comme dans Rebol2.

ldci

[06:47](#msg576e29031ac8bd1a4d485ceb)Génial en ms ?

dockimbel

[07:00](#msg576e2c0ebb1de91c545c33b6)Le type time! accepte les decimals pour les secondes, jusqu'à la nanoseconde (le timer est pour l'instant limité à la milliseconde, mais en pratique 50-60hz est sans doute le maximum que peut soutenir le moteur graphique).

## Sunday 26th June, 2016

SteeveGit

[06:48](#msg576f7acf53cf814d7273cb90)@ldci J'ai finalemnt pris le temps de recompiler `convolution.red` sur ma machine linux+wine, et ça marche ! J'ai utillisé le flag `-t WindowsXP` c'était ptet ça le prob...

[07:06](#msg576f7eeefd5f24f519be08f9)Sinon, j'ai regardé un peu ton code sur la convolution et j'ai des remarques quant aux optimisations possibles:  
\- Appliquer le \[Déplacement des invariants de boucle](https://fr.wikipedia.org/wiki/D%C3%A9placement\_des\_invariants\_de\_boucle)  
\- Remplacer les opérartions arithmétiques avec du type float! par la technique du\[Fixed-point arithmetic](https://en.wikipedia.org/wiki/Fixed-point\_arithmetic) qui ce fait avec des integer!

Je suis pas loin de penser que tu diviserais les temps d'exécution au minimum par 2.

dockimbel

[07:20](#msg576f824369f5258948614d6f)@SteeveGit Les FPU sont \*beaucoup* plus rapides que les CPU pour les calculs mathématiques. ;-)

SteeveGit

[07:23](#msg576f82fefd5f24f519be0928)ok mais si tu ajoutes le conversions int-to-float et float-to-int qui sont faites à chaque fois, en es tu bien certain ?

dockimbel

[07:25](#msg576f837586609e810f5155a6)C'est juste, ces fonctions ralentissent beaucoup les calculs, mais elles sont temporaires, en attendant d'avoir des primitives en R/S qui vont utiliser des instructions FPU pour ces conversions (prévu pour la 0.6.2).

## Monday 27th June, 2016

ldci

[07:44](#msg5770d966a0c12d110f93e437)@SteeveGit merci pour les idées d'optimisation. Tu participes au projet?

[07:44](#msg5770d96f8441a8124d5be07b)amicalement

SteeveGit

[07:47](#msg5770da1b69f525894861aef3)@ldci Ben je bosse en priorité sur mon rich-area widget. Mais je fais aussi des pauses pour me changer les idées.

ldci

[07:53](#msg5770db7d8441a8124d5c0056)Cool you're welcome

SteeveGit

[08:04](#msg5770ddf4fd5f24f519be75ab)\[!\[Screenshot from 2016-06-27 09:55:35.png](https://files.gitter.im/red/red/France/fuI2/thumb/Screenshot-from-2016-06-27-09\_55\_35.png)](https://files.gitter.im/red/red/France/fuI2/Screenshot-from-2016-06-27-09\_55\_35.png)

[08:04](#msg5770ddfe69f525894861af66)En parlant de rich-area widget le dialecte pour faire de la coloration syntaxique commence à me convenir.

[08:04](#msg5770de0886609e810f51c63d)

[08:05](#msg5770de3386609e810f51c64f)Et le widget se configure comme ça (c'est du parse augmenté)

[08:05](#msg5770de5653cf814d7274380c)\[!\[Screenshot from 2016-06-27 10:01:15.png](https://files.gitter.im/red/red/France/xdvd/thumb/Screenshot-from-2016-06-27-10\_01\_15.png)](https://files.gitter.im/red/red/France/xdvd/Screenshot-from-2016-06-27-10\_01\_15.png)

[08:07](#msg5770dead69f525894861af6b)le facet `extra`sert à définir le theme

dockimbel

[08:09](#msg5770df3da0c12d110f942901)@SteeveGit Quel police utilises-tu dans le rich-area?

SteeveGit

[08:10](#msg5770df7369f525894861af77)consolas

[08:12](#msg5770dfe753cf814d7274381c)mais tant que c'est du fixedsys n'importe laquelle convient

dockimbel

[08:13](#msg5770e011265214c13073c831)Le rendu de Consolas semble plus clean que sous Win7...

SteeveGit

[08:15](#msg5770e08a86609e810f51c689)ouais je l'aime bien celle là

DideC

[10:05](#msg5770fa52632b75030f7e4335)Pourquoi que avec du fixedsys ?

dockimbel

[10:05](#msg5770fa65a0c12d110f95c585)@DideC Il voulait dire "monospace". ;-)

[10:09](#msg5770fb5fbb1de91c547cc2ef)@SteeveGit Les captures d'écrans sont \*très* alléchantes. ;-)

DideC

[10:19](#msg5770fdb0265214c13075533b)Je comprends police fixe, où tous les caractères ont la même largeur donc.

[10:20](#msg5770fdfd632b75030f7e748e)Ma question reste : pourquoi pas avec des polices proportionnelles ?  
J'imagine que c'est pour simplifier les calculs de positionnement des éléments colorés, mais je voulais juste une confirmation, n'ayant pas accès au code.

SteeveGit

[10:21](#msg5770fe3e69f525894861c064)@dockimbel Faut que je me bouge pour finir les 2,3 trucs énervants restants sinon le proof of concept est satisfaisant, ça marche. Ensuite y'a pleins d'évolutions possibles à partir cette base (grid, console, etc) et pleins d'autres trucs possibles avec draw, insertion d'images, etc. En fait ça va simplifier l'écriture d'éditeurs pour tout un tas de dialecte textuels (ex: TMD). Plus, tard, j'ai déjà des idées pour transformer ça en IDE Red avec un loader de code et utiliser le parsing pour faire de l'inspection en live du code loadé, y'a pas le limites.

[10:25](#msg5770ff34fd5f24f519be8297)@Didec, je suis parti sur du monospace pou effectivement simplifier (et donc accélérer) la construction des blocks draw. Mais en fait, j'ai pas grand chose à faire pour prendre en compte les fontes proportionnelles. Ca risque juste d'être plus lent mais c'est même pas certain que ce sera détectable, vu que j'ai pas encore testé cette option.

[10:28](#msg5770ffd753cf814d72744576)@DideC Pour l'instant personne n'a le code mais ça va pas durer. Priez seulement que je meure pas d'ici là ;-)

dockimbel

[10:57](#msg57710697a0c12d110f968afd)@SteeveGit Quid des perfs sur un fichier de 10k lignes par exemple ? Le défilement est-il fluide ? Si non, crois-qu'il soit possible d'avoir une fluidité acceptable ?

[10:59](#msg577106f597171715545e7837)@DideC "Police fixe", c'est l'expression que je cherchais...à force de ne plus utiliser le français au quotidien, on perd ses mots... ;-) Y'a une grosse optimisation des performances possible avec des polices fixes vs proportionnelles pour un éditeur de code.

SteeveGit

[10:59](#msg5771072d53cf814d72744631)La taille n'a aucune importance, je construits les blocks draw des lignes affichées seulement. Et en saisie de texte, seule la ligne modifiée est reconstruite/raffraichie.

dockimbel

[11:03](#msg577107ea97171715545e8534)@SteeveGit C'est la bonne méthode. Mais pour le défilement fluide, je suis un peu pessimiste au vu de mes propres expériences sur Rebol2... Mais en retestant mon vieux proto d'éditeur de code sur mon PC de course actuel, c'est tout à fait correct avec des fichiers de 25k lignes. Le seul hic, c'est que le défilement vertical se fait ligne par ligne et non pixel par pixel, comme sur la plupart des éditeurs de code...

SteeveGit

[11:03](#msg5771081969f525894861c66c)Niveau fluidité en scroll, c'est fuide chez moi. Mais là aussi c'est fait intelligement. Lors d'un scroll vertical d'une ligne, une seule ligne est complètement reconstruite, les autres ont juste leur offset qui est modifié.

dockimbel

[11:04](#msg5771085b8441a8124d5e5def)@SteeveGit Scroll pixel par pixel ou lignes ?

SteeveGit

[11:06](#msg5771089d86609e810f51d596)Par ligne mais je vais passer en mode pixel quand je vais intégrer la gestion du wrap.

[11:07](#msg5771090469f525894861c67c)fondamentalement je fais déjà du scroll niveau pixel, c'est juste que les lignes ont toutes la même hauteur, mais ça va changer.

[11:10](#msg577109aa86609e810f51d5c4)mais si tu parles de la possibilité de fuidifier le scroll en faisant des refresh pixel par pixel. C'est possible qu'on ait une mauvaise surprise, on verra.

dockimbel

[11:16](#msg57710b1b1ac8bd1a4d68e46a)Je pense qu'on aura du mal à avoir un résultat fluide en mode pixel, sauf à utiliser un backend DirectX au lieu de GDI pour Draw. (On y travaille ;-)).

[11:23](#msg57710cb21ac8bd1a4d68f542)Sinon, je viens de vérifier sur qq éditeurs de code, le défilement est bien ligne par ligne, donc pas la peine d'aller plus loin. ;-)

SteeveGit

[12:35](#msg57711d7f69f525894861cc6f)ok

## Tuesday 28th June, 2016

ldci

[10:08](#msg57724c948c9263ba3014ca93)@tous: amélioration de RedCV. Les routines rcvFlip sont réécrites en Red/System et sont plus rapides. J'ai ajouté un premier exemple de détection de mouvement avec la webcam (ne fonctionne que sous Windows pour le moment)

SteeveGit

[10:41](#msg5772546e2fd8c5da28530e1a)@ldci Ca donne quoi en terme de consommation mémoire ? Ca doit exploser assez vite non ? Vu que dans le fonctions de transformation bas niveau, tu copies systématiquement les données dans de nouvelles images il me semble (ou alors j'ai mal vu). Je pense que toutes les fonctions de traitement d'image devraient faire les modifs 'in place' et c'est la responsabilité du dev de faire des copies avant si nécessaire. Sinon c'est pas tenable. Prière d'oublier ce com si j'ai vu de travers ;-)

ldci

[11:09](#msg57725b01bb1de91c5490554d)@SteeveGit pas regardé pour la mémoire mais tu as raison et ce sera à améliorer . A mon avis le programme plantera après plusieurs appels

dockimbel

[11:13](#msg57725be0265214c13087ff4a)Pour info, François a ouvert un espace de discussion dédié pour RedCV: https://gitter.im/ldci/redCV

SteeveGit

[11:13](#msg57725bf3959100c762f0e83b)Ha!

ldci

[11:51](#msg577264ae9717171554722b36)@SteeveGit et @DideC : vous êtes ajoutés à ce nouvel espace de discussion

SteeveGit

[11:51](#msg577264d7959100c762f0ed1e)

ldci

[11:52](#msg577265188441a8124d71e43b)et bien évidemment Nenad et Qtxie

[13:41](#msg57727e76bb1de91c5492559f)Version mise à jour sur GitHub

[13:55](#msg577281e59717171554740317)@dockimbel, où est caché le code pour la camera?

dockimbel

[15:07](#msg577292a8959100c762f10763)@ldci https://github.com/red/red/blob/master/modules/view/backends/windows/camera.reds

SteeveGit

[16:46](#msg5772a9f30898e10d23951b40)Ha zut ! Bud spencer est mort. Un pan de ma jeunesse rigolotte qui se barre. Après Bowie, ça s'accumule...

dockimbel

[16:59](#msg5772ace8fd8a28fd3d379781)@SteeveGit Pareil...

SteeveGit

[17:17](#msg5772b142bff9f48f6a754ece)Tu fais nuit blanche pour la livraison, ou tu fais ça reposé demain Nenad ? :-)

## Wednesday 29th June, 2016

dockimbel

[02:29](#msg577332710898e10d2395636b)J'ai fait nuit blanche la dernière fois (couché à 6h30), mais là j'ai craqué à 1h, donc livraison aujourd'hui. ;-)

## Thursday 30th June, 2016

rcqls

[04:11](#msg57749c0897171715549254f8)@dockimbel toujours un énorme plaisir de suivre assidument ton projet red. Félicitations pour cette nouvele version, à toi, @qtxie et tous les contributeurs à ce projet. J ‘espère que je serais capable un jour d’aider moi-même (surement après la version GUI pour MacOSX que je suis sur le repo de @qtxie). Mille mercis!

dockimbel

[04:30](#msg5774a0648a12aa4d563e6388)@rcqls Merci pour le soutien ! Je compte sur les talents de la communauté française Red/Rebol pour aider Red à croitre bien davantage. Carl (le créateur de Rebol) a toujours été fasciné par la France et la communauté Rebol Fr, il m'a confié lors de la conf Rebol à Paris en 2004 (organisé par @ldci) que les rebolers Fr avaient une certaine "élégance intellectuelle", qui correspondait bien au design et principes de Rebol. Ca se confirme avec les Redders Fr, les 2 projets Red les plus prometteurs actuels sont RedCV de @ldci et le rich-text de @SteeveGit. J'ai hâte de voir où tout ça va nous mener. ;-)

RenaudG

[07:39](#msg5774ccc4a0c12d110fce005d)Hello les gens ! Pas beaucoup de temps pour jouer avec Red, depuis qq mois, mais je garde toujours un œil dessus. Bravo pour la nouvelle mouture :clap:

dockimbel

[08:44](#msg5774dbe81ac8bd1a4d9fae40)@RenaudG Merci ! :smiley: Et merci aussi pour le retweet !

## Sunday 3th July, 2016

nodrygo

[08:26](#msg5778cc2401d3c8d879206773)je trouve \*\*Red\** vraiment très sympa et je viens de faire mon petit \*upvote* sur \[r/programming](https://www.reddit.com/r/programming/) ;-)  
toutefois je fais une pause car l'utilisation avec \*wine* me pose trop de problèmes et avec ma \*virtualbox/XP* c'est trop lourd.  
Du coup je vais patienter jusqu'à avoir une version \*Linux/GTK* opérationnelle pour rejouer avec ne voyant pas ou je pourrais aider

Je comprend bien que la somme de travail qu'il reste à faire est lourde avec si peu de ressource aussi je souhaite bon courage et mes félicitations à toute l'équipe \*\*Red\** pour ce super job

dockimbel

[08:45](#msg5778d0a501d3c8d8792097ad)@nodrygo Merci beaucoup pour l'upvote ! :+1: Le support GTK devrait arriver à la rentrée, au plus tard avant la fin de l'année.

nodrygo

[10:56](#msg5778ef4101d3c8d87921afe3)En fait ça fait quelques temps que je me demande si ça vaut vraiment la peine de passer autant de temps à créer des interfaces graphiques natifs.  
Je me demandais si le navigateur ne devrait pas être le GUI universel multiplate-formes  
voir les démos de \[ js-of-ocaml](https://ocsigen.org/js\_of\_ocaml/) par exemple  
\*\*Red\** pourrait être excellent dans ce domaine non ?

[17:32](#msg57794c1ecdab7a1f4fdc5232)En réalité dans l'idée et le concept j'aimais bien \[N2O](http://synrc.com/apps/n2o/). Bien entendu il manque encore une couche réseau minimaliste ;-)

## Sunday 10th July, 2016

ldci

[10:11](#msg57821f533eaf66535e655aa2)@tous: une nouvelle version optimisée de redCV sur github. Merci @SteeveGit pour la remarque sur la consommation mémoire :) Regardez le code de motion: pas de fuite de mémoire et pas de problème d'affichage.Je mettrai à jour le code pour les convolutions demain ainsi qu'un début de documentation sur les différentes fonctions. Cela devient nécessaire. Bon WE

SteeveGit

[21:34](#msg5782bf69279ab12b38b248b8)bon ben on a perdu

## Monday 11st July, 2016

x8x

[08:11](#msg578354c8b79455146f8edcb1)Tanpis pour le foot, il reste tjs les bulots à la mayo ( http://cuisinedisca.blogspot.com/2014/04/bulots-la-mayo.html ) et les bons fromages et le bon vin! :-)

SteeveGit

[08:17](#msg57835636ed6e998924033300)@x8x Ah tiens ! Je n'avais point noté que tu étais/parlais François aussi.

[08:19](#msg5783567ff9cb022a33f06554)ou alors, j'ai la mémoire qui flanche, J'me souviens plus très bien.

## Monday 18th July, 2016

ldci

[09:55](#msg578ca7a13c5129720e51dce5)Mise à jour de RedCV avec les filtres 2D

dockimbel

[10:02](#msg578ca94e196179690e015766)@SteeveGit Tu as une question dans les commentaires de ta video richtext: https://www.youtube.com/watch?v=2Q1NK\_o2lCQ Je ne peux pas y répondre, directement, un pb avec mon compte ytube/G+ me bloque.

SteeveGit

[10:09](#msg578caadfdbf44d911d5c56ae)Ah euh.. ouais j'ai un peu fait le mort en me disant, je vais terminer le boulot avant de poster ma réponse. Mais j'ai un peu été occupé à d'autres trucs mais c'est vrai que ça traine depuis un peu trop longtemps. Faut vraiment que je livre cette version 1 même si y'a encore plein de trucs a revoir/ajouter.

dockimbel

[10:11](#msg578cab51196179690e016a7b)Tu peux simplement lui dire que le textarea existe déjà en Red et que celui sur lequel tu traivailles est un rich-textarea.

SteeveGit

[10:12](#msg578cab74cb81a7d142633943)Ah oui, je peux faire ça aussi ;-)

## Thursday 21st July, 2016

bob-le-bricoleur

[17:13](#msg579102b175045f87671f0943)Bonjour

[17:15](#msg579103169f35137e67fa5c33)@dockimbel : la fonction now (bien utile) est elle complètement implémentée ou partiellement ?

## Friday 22nd July, 2016

dockimbel

[08:38](#msg5791db849d1dc62e491aa78c)@bob-le-bricoleur Partiellement, uniquement `now/time` et `now/time/precise` sont supportés. Lorsque `date!` sera là, on pourra implémenter les autres rafinements.

## Saturday 23th July, 2016

ldci

[17:21](#msg5793a7959d9e974a7f6fb505)Mise à jour de RedCV sur GitHub avec un filtre gaussien très efficace

## Sunday 24th July, 2016

dockimbel

[03:23](#msg579434aeb92e27447fa985a0)@ldci Super ! Qu'est-ce qu'il te manque comme fonctionnalités pour pouvoir remplacer l'usage que tu fais de Rebol au LDCI par Red ?

ldci

[09:40](#msg57948d1e1d2852c8438379cc)@dockimbel lorsque j'aurai terminé RedCV, je passerai mes enseignements de C++ et OpenCV à Red et RedCV:)  
Pour les manips, je vais progressivement réécrire certaines applications de recueil de données via le portage de la lib National Instruments, mais dans ce cas la gestion des ports va devenir cruciale notamment pour les fonctions de type port/awake qui me permettaient avec Rebol de gérer les aspects multi-tâche. A +

dockimbel

[10:42](#msg57949b92b92e27447fac9f08)Les ports vont arriver assez vite, tiens moi au courant de tes besoins, si possible, on changera certaines priorités pour te faciliter la vie. ;-)

## Monday 25th July, 2016

ldci

[08:20](#msg5795cbcf1b9de56c0ee60450)Merci Doc :)

RenaudG

[10:17](#msg5795e753b92e27447fb80ffd)Hello @dockimbel ! En passant, bravo pour la partie reactive programming. Sinon, je seconde @ldci : la raison majeure qui fait qu'actuellement je bosse avec autre chose que Red, dans 80% des cas, c'est le manque des ports (I/O en général) et de l'accès au shell (call) en mode interpréteur.

dockimbel

[10:22](#msg5795e85d9d9e974a7f831e18)@RenaudG CALL est dispo dans la branch master, il devrait fonctionner pleinement maintenant sur toutes les plateformes. Pour les I/O, je ne vois pas ce qu'on pourrait faire pour accélérer les choses. On a besoin d'avoir un bon support Android avant, parce qu'on doit lever à nouveau auprès des investisseurs, du coup, on doit faire passer les I/O après...

RenaudG

[11:31](#msg5795f8a03383eb6221418f67)Merci Doc. Je comprends bien qu'il y a diverses sources et contrainte pour les priorités ;-) Je signale juste mes besoins, au cas où ça aiderait à trier dans les priorités, mais ça n'a rien d'une requête ou d'un reproche. Je ferais davantage de Red en temps utile, et pour le moment je me contente de mes autres outils. Encore merci, et bon courage.

dockimbel

[11:36](#msg5795f9c88fb4820a46622988)@RenaudG Plus précisément dans les I/O, qu'est ce qu'il te manque le plus ?

RenaudG

[11:45](#msg5795fbf537c95e2446b3f063)Des trucs cons comme la lecture bufferisée pour lire/traiter de gros fichiers, renommer, etc. En fait, en attendant la plupart des besoins peuvent être +/- satisfaits avec call en appelant des commandes système. Pas optimum, mais au moins ça donne une alternative acceptable en attendant mieux, et ça évite d'être bloqué.

## Tuesday 26th July, 2016

dockimbel

[08:02](#msg5797190437c95e2446b65a0c)@RenaudG L'option `/seek` pour `read`a été ajoutée, tu peux lire de gros fichiers maintenant par morceaux.

RenaudG

[09:09](#msg579728be3383eb62214413be)Excellent, merci.

## Sunday 31st July, 2016

dockimbel

[08:09](#msg579db24bcdc68c4904b15a31)@SteeveGit @ldci Pour info, les conversions entre flottants et entiers dans Red/System sont maintenant possibles en utilisant `as` (elles utilisent le FPU directement, les fonction `float/to-integer` et `integer/to-float` ont été supprimées).

SteeveGit

[11:51](#msg579de65362166b2d0819280f)reçu

## Tuesday 2nd August, 2016

bob-le-bricoleur

[09:14](#msg57a0645ce2ff9ec76e4f473f)@dockimbel

[09:16](#msg57a064d79e85d3e8267f979c)@dockimbel pour info, la face camera à un problème avec les derniers builds (elle clignote) mais fonctionne sans problème avec la version stable 0.61

dockimbel

[09:16](#msg57a064ff0bd017c16e349793)@bob-le-bricoleur Merci pour l'info. On l'avait pas testé depuis la 0.6.1.

bob-le-bricoleur

[09:20](#msg57a065ec1c2bf6621bb4d009)@dockimbel camera est un vrai + ,très simple à utiliser pour prendre des photos, la partie reactive programming est un vrai plaisir ...

dockimbel

[09:35](#msg57a069569e85d3e8267fa1e2)On vient de constater le pb sur la caméra, probablement causé par un commit du mois dernier concernant le rafraichissement auto des fenêtres.

[09:36](#msg57a0698ce2ff9ec76e4f51de)@bob-le-bricoleur Si tu as des scripts sympas utilisant la caméra + la prog reactive, n'hésite pas à les partager. ;-)

ldci

[21:13](#msg57a10ce20bd017c16e366d59)@tous. J'ai mis à jour le code pour RedCV pour les conversions entre integer et float. Manifestement Red a été optimisé: certaines de mes fonctions (notamment la convolution) sont plus rapides:)  
Je suis hors de France actuellement et sans connexion internet sérieuse. Je mettrai le site GitHub à jour à mon retour:)

## Wednesday 3th August, 2016

dockimbel

[08:44](#msg57a1aee747659bfb108a7c5c)@ldci Oui, les conversions flottants/entiers sont prises en charge par le CPU maintenant, donc gros gain de vitesse à ce niveau.

ldci

[10:46](#msg57a1cb7ae2ff9ec76e529486)@dockimbel Excellent! On va pouvoir encore optimiser. A +

lepinekong\_twitter

[20:08](#msg57a24f2c836d2d021161734d)red c'est juste un autre langage ou l'ambition est de construire un vrai écosystème autour avec connexion aux bases sql/nosql comme mongodb, sqlite, mysql, interfaçage avec nodejs, java, dotnet core ?

DideC

[21:00](#msg57a25b8900663f5b1b489b60)J'espère que tout cela arrivera par la suite, mais il faut bien le langage d'abord.  
Doc ayant lui même écrit les protocoles mysql:// et pgsql:// pour REBOL, je suis bien certains qu'il a en tête d'avoir la même chose pour Red.

## Thursday 4th August, 2016

dockimbel

[08:10](#msg57a2f8611c2bf6621bbae0ab)@lepinekong\_twitter L'ambition est bien de construire un écosystème le plus complet possible, avec l'aide de la communauté. Un driver bas-niveau pour sqlite est \[dispo](http://red.esperconsultancy.nl/Red-SQLite/timeline) (écrit en Red/System, il requiert une interface pour l'utilisation depuis Red). Un bridge Java est aussi déjà \[dispo](https://github.com/red/red/tree/master/bridges/java), parmi d'autres libs: http://www.red-lang.org/p/contributions.html

[08:11](#msg57a2f8c80bd017c16e3ab703)Lorsqu'on aura passé la 0.7.0, on aura un support TCP efficace, et on pourra alors implementer les drivers MySQL et Postgresql. Pour les autres BDD, les contributions sont les bienvenues.

lepinekong\_twitter

[10:37](#msg57a31ad99e85d3e826860bc6)@dockimbel ce que je vois dans la Roadmap http://www.red-lang.org/p/roadmap.html c'est pas une vision mais une liste de tâches techniques. Je sais que c'est un travail titanesque mais côté vision marché ça pêche grandement ;)

dockimbel

[10:40](#msg57a31ba50bd017c16e3b0b13)@lepinekong\_twitter Cette roadmap est volontairement technique, comme celle plus détaillée sur \[Trello](https://trello.com/b/FlQ6pzdB/red-tasks-overview). Pour ce qui est de notre vision "marché", elle est pour le moment réservée à nos investisseurs. Tout ce que je peux en dire, c'est que l'on vise les développeurs individuellement dans un premier temps, les entreprises dans un second temps.

[10:58](#msg57a31fea47659bfb108dd996)Je rappelle également que Red est un projet open source, notre équipe réduite n'a pas vocation à écrire toutes les libs et drivers possibles, la communauté (comme pour tous les autres langages) doit prendre le relais, et produire la majorité des libs.

lepinekong\_twitter

[17:11](#msg57a3772a836d2d021164254a)Oui mais la communauté elle va grossir que s'il y a une Roadmap qui correspond à des besoins du marché. Enfin j'ai quand même trouvé ici http://redprogramming.com/Home.html une info

[17:12](#msg57a3776f1c2bf6621bbc2f2b) Red is meant to target not only the desktop platforms covered by R2 (Windows, Linux, Mac, BSD etc.), but also mobile OSs (Android, iOS, and others), and the web (in browsers, Node.js, etc.). This will allow Red code to run on virtually every common modern platform.

[17:14](#msg57a377fee2ff9ec76e56bc0a)Mais maintenant la tendance est de faire des applications natives multi-plateformes avec javascript https://www.nativescript.org/ https://facebook.github.io/react-native/ mais bon la syntaxe de red est sympa

## Friday 5th August, 2016

dockimbel

[04:01](#msg57a40f9fc915a0e426be02b4)@lepinekong\_twitter Red a pour ambition de fournir (entre autres choses) une productivité bien supérieure à ce qu'une stack web (JS/HTML/CSS) peut fournir, notamment grâce aux DSLs. JS est un langage aux multiples problèmes (Typescript en règle certains, mais il reste très verbeux), et relativement bas-niveau comparé à Red ou Rebol. Le fait que JS se répande partout, même dans le domaine natif, n'est pas un gage de qualité.

lepinekong\_twitter

[07:57](#msg57a446de9e85d3e82688d17e)Je suis d'accord que ce n'est pas un gage de qualité, malheureusement l'histoire en est bourré. C'est l'adhésion de la masse qui entraîne un succès cf Docker. En ce qui concerne la productivité, le langage seul ne fait pas tout car comme le fait remarquer ce papier "introduction to software architecture" http://www.cs.cmu.edu/afs/cs/project/able/ftp/intro\_softarch/intro\_softarch.pdf : As the size of software systems increases, the algorithms and data structures of the computation no longer constitute the major design problems. When systems are constructed from many components, the organization of the overall system — the software architecture — presents a new set of design problems.

[08:05](#msg57a448c147659bfb10909102)Javascript a bien des défauts mais il y a tout un écosystème de frameworks qui essaient de répondre à cette problématique les 2 plus connus étant angularjs et reactjs. Vouloir concurrencer html/js/css au lieu de permettre au contraire de faciliter la construction d'application web (là-dessus les DSLs sont un bon atout) comme react-native ou ,nativescript me paraît illusoire. Non seulement le web ne va pas disparaître mais en plus ça va s'accélérer : demain c'est le navigateur qui remplacera l'OS, celui-ci aura de moins en moins d'importance pas pour des prunes que Microsoft propose maintenant d'intégrer Linux (bash dans Windows 10, Linux sur Azure, dotnet core pour Linux). Tu es bien sur Gitter une appli web non ? Tu crois vraiment que les gens vont utiliser l'équivalent d'une telle appli sur red ? Bien sûr que non sauf une poignée de geeks.

## Saturday 6th August, 2016

rcqls

[06:43](#msg57a58706857442dc0f57cad0)@dockimbel Merci de prendre de ton temps pour nous proposer une intro sur Red. Sur ton conseil donné ici sur Gitter, j’ai lu plus profondément la doc de Rebol et ce fut passionnant de mieux comprendre le Redbol language qui te motive tant. Le texte proposé par @greggirwin sur le wiki est déjà plus qu’intéressant. J’ai hâte de lire cette intro...

## Wednesday 10th August, 2016

ldci

[10:10](#msg57aafda8f7f11a7936b1ec8b)@dockimbel . En attendant le type matrix! qui sera très utile pour redCV, j'ai regardé le vector!. J'apprécie de pouvoir déterminer la taille des données. Un petit problème cependant.  
mSize: 100 v: make vector! size: marche parfaitement, mais  
v: make vector!\[integer! 8 mSize] renvoie une erreur. Est ce un bug?

[10:10](#msg57aafdb316b0696856a8f916)Merci et à plus

DideC

[10:37](#msg57ab03f1d7087a017fa8625f)Y-a-t-il de la doc sur ce type Vector! ?

[10:44](#msg57ab05a6613cc18036766b9d)Il semble bien que le block de spec ne soit pas réduit. Donc il faut utiliser `compose`ou `reduce` :

```
make vector! compose [integer! 8 (mSize)]
```

Quand à savoir si c'est normal, Nenad qu'en penses-tu ?

dockimbel

[13:45](#msg57ab2ffebc688a13390c2615)@DideC Pas de doc pour vector! pour le moment. Il me semblait que Rebol3 avait une doc pour `vector!`, mais je ne la trouve pas...

[15:11](#msg57ab4405d7087a017fa91aa7)`make vector!` n'accepte que des valeurs directe (réduites), il n'évalue pas les mots. Le type `vector!` est de la classe `series!`, donc toutes les actions sur les series s'appliquent. La taille est dynamique, mais le type de donnée scalaire stockée par un vecteur ne peut pas être changé une fois le vecteur construit.

[15:37](#msg57ab4a4e16b0696856a9cd3d)@lepinekong\_twitter De ce que je constate, le web est loin d'avoir gagné la partie, notamment dans le monde mobile ou de nombreuses boites reviennent au natif, les stack webs ayant trop de contraintes et limitations: http://jlongster.com/Radical-Statements-about-the-Mobile-Web http://www.infoworld.com/article/3012146/web-applications/native-apps-have-crushed-web-apps.html

\*celui-ci aura de moins en moins d'importance pas pour des prunes que Microsoft propose maintenant d'intégrer Linux* Ca n'a pas de rapport avec le web, Microsoft souhaite attirer un maximum de devops (devs côté serveur), pour alimenter Azure, sa plateforme cloud. La majorité des serveurs actuels tournant sous Linux, avoir un shell Linux et un environement POSIX permettant de faire tourner les outils d'admin habituels, est un choix cohérent avec la stratégie cloud de MS.

\*Tu es bien sur Gitter une appli web non ?* J'utilise leur client desktop et mobile, comme beaucoup d'autres utilisateurs de Gitter. J'utilise également Telegram, Wechat, Line, et plusieurs autres services en ligne via un client natif (souvent basé sur un webview malheureusement) plutôt que la version pure web. Sur mobile, il n'y a pas photo, on utilise \*tous* les apps natives vs les services web dans un navigateur. Beaucoup utilisent toujours des webviews pour le dev natif, par manque de bons outils cross-platform, il y a un vrai besoin à combler, et Red peut fournir une solution native bien plus productive que la stack web.

Ceci étant dit, je ne renis pas le web, ni ses nombreux usages, Red a vocation a être sur tous les marchés majeurs (web inclus, c'est dans mes slides de présentation et notre roadmap interne). Red fournira en temps et en heure, la possibilité de coder des webapps (client + serveur) via le moteur View, qui fera disparaitre complètement le DOM/JS, voire même le côté client/serveur (à la \[GWT](https://en.wikipedia.org/wiki/Google\_Web\_Toolkit) ou \[Opa](http://opalang.org/)).

x8x

[20:05](#msg57ab8906ae838f6f5695110d)Plus d'info sur la roadmap interne ça cerait pas mal.. ;-)

ldci

[21:53](#msg57aba25bae838f6f569553e3)@tous. Pas de problème pour le type vector  
rcvCreateMat: function \[ type \[word!] bitSize \[integer!] xSize \[integer!] ySize\[integer!] return: \[vector!]  
"Create 1D matrix "  
][  
make vector! reduce \[type bitSize xSize * ySize]  
]  
et l'appel : v: rcvCreateMat 'integer! 8 640 480  
Génial pour les matrices à venir

## Thursday 11st August, 2016

dockimbel

[01:03](#msg57abcef1bc688a13390dc299)@x8x Désolé, mais interne = privée, on est une société commerciale, on ne peut pas exposer toute notre stratégie publiquement, on doit nécessairement garder un certain nombre de projets privées, jusqu'au jour où on décide de les publier.

x8x

[02:38](#msg57abe52f16b0696856ab4c35)Ok, j'ai essayé! ..mais bons bons, je plaisantait evidamment ;-)

## Wednesday 24th August, 2016

ldci

[13:05](#msg57bd9ba1cd00bdff6e76fb10)@tous. Plein de nouveautés pour RedCV sur https://github.com/ldci/redCV  
J'ai joué avec le type vector! qui permet de créer un équivalent de matrice. Génial car on peut travailler sur des images 8 bits à 1 seul canal. Je vais améliorer les fonctions de convolution pour qu'elles fonctionnent avec ce type d'image. On devrait pouvoir diviser le temps de calcul par 3 en ne travaillant qu'avec 1 seul canal. Je vais cependant attendre l'arrivée du type matrix avant de finaliser tout ça:)

## Saturday 27th August, 2016

ldci

[10:09](#msg57c166e55b11de7721579308)@dockimbel à propos du type vector!. Salut Nenad, les type vector est très utile pour les images :) Une question cependant la function get-value-int permet via le paramètre unit de récupérer des integers 8, 16 ou 32 bits. Génial. Mais à l'inverse, la fonction rs-append-int ne travaille qu'avec des integers 32 bits (p/value). Conséquence immédiate la taille d'un vector initialement 8 bits est * par 4 . Serait-il possible de modifier cette fonction pour qu'elle utilise également un paramètre unit ( 1, 2 ou 4) pour éviter ce problème? Amicalement.

## Sunday 28th August, 2016

dockimbel

[08:52](#msg57c2a6625b11de77215a49a1)@ldci Tu peux facilement construire ta propre fonction pour ca, a partir de la fonction `vector/set-value`, il suffit juste d'enlever le code dont tu n'as pas besoin.

ldci

[10:13](#msg57c2b93b8877dae620a1b0ed)Oui c'est effectivement la solution que je suis en train de tester merci Doc

## Wednesday 31st August, 2016

ldci

[11:39](#msg57c6c1f083e209197239af96)@dockimbel : ça fonctionne bien et c'est mis à jour sur GitHub. Une autre question: une idée pour modifier la taille d'une image déjà chargée? En fait, un resize du contenant (de type base) fonctionne très bien pour l'affichage grâce à un fit implicite, mais la taille de l'image originale n'est modifiée même avec un image/resize source w h. Je vais devoir écrire des fonctions pour le downsizing et le upsizing je pense, sauf si tu as implémenté ça quelque part:)

[12:52](#msg57c6d2f3d42df130660f8979)Bon, trouvé : un simple to-image suffit, dst: to image canvas (canvas est un type base de VID et dst une image Red). Merci Doc cela me simplifie grandement la vie. J'adore Red :)

dockimbel

[13:02](#msg57c6d5648f4ad01672d03363):) :+1:

## Monday 12nd September, 2016

ldci

[14:53](#msg57d6c17ea0e8dbb04f2f8397)Pas mal de nouvelles fonctions pour RedCV. Ce n'est pas spectaculaire mais cela permet de travailler avec des matrices 8, 16 ou 32 bits. Je vais ajouter le support des matrices pour le type float! ASAP.

## Friday 23th September, 2016

ldci

[12:48](#msg57e524bb88c556fe5068d3e1)Une question pour Doc: avez vous avancé sur le datatype Matrix! qui devient assez fondamental maintenant pour RedCV. Je ne veux pas trop m'engager avec le type vector! qui ne pose quelques problèmes

```
src			[vector!]
	dst			[vector!]
	srcScale	[float!] ; eg FFh
	dstScale	[float!] ; eg FFFFh	
	/local
	svalue 		[byte-ptr!]
	tail 		[byte-ptr!]
	int 		[integer!]
	v			[float!]

	s	 		[series!]
	unit 		[integer!]
][
	svalue: vector/rs-head src  ; get a pointer address of the source matrix first value
	tail:  vector/rs-tail src	; last
	vector/rs-clear dst 		; clears destination for append calculated value
	s: GET_BUFFER(src)
	unit: GET_UNIT(s)
	while [svalue < tail][
		int: vector/get-value-int as int-ptr! svalue unit
		v: ((as float! int) / srcScale) * dstScale 
		vector/rs-append-int dst as integer! v
		svalue: svalue + unit
	]
]
```

Cette routine fonctionne bien dans le sens 8-&gt;32 bits, mais est erronée pour le 8-&gt;16 bits.  
Dernier point, le type matrix! supportera-t-il les float!? C'est important pour implémenter les transformés de Fourier par exemple.  
Bon j'arrête de me plaindre :smile:

## Wednesday 5th October, 2016

ldci

[18:55](#msg57f54cb93c59573f6f0f5dd3)Bonsoir à tous. Pas mal de nouveautés pour RedCV sur GitHub:)

## Thursday 6th October, 2016

dockimbel

[05:42](#msg57f5e4330ec6f9457da6ac7f)@ldci Salut François, j'ai prévu de jouer un peu avec pour tester ma branche libRed.

## Sunday 9th October, 2016

ldci

[19:35](#msg57fa9bfa68f560d80cef0623)Chapeau Doc pour l'implémentation du Draw. Avec une seule ligne de code on obtient de belles rotations des images.  
drawBlk: compose \[scale 1 1 rotate (rot) (centerXY) image dst]

## Monday 10th October, 2016

dockimbel

[06:05](#msg57fb2fbadfe82a365b109420)@ldci On peut aussi dessiner le long d'un chemin maintenant, grâce au sous-dialecte `shape` (comme en Rebol). L'implémentation de Red/Draw couvre presque toutes les fonctionnalités de Rebol/Draw, je crois qu'il nous manque que `gamma`, `arrow` et `line-pattern` pour être complet.

ldci

[07:27](#msg57fb42d1dfe82a365b10d115)@dockimbel : Oui très complet:) Je pense que je vais pouvoir utiliser Draw + RedCV pour mon cours de cette année.

[09:33](#msg57fb60670aa72e3c5bec0a9d)Site GitHub mis à jour pour les exemples avec Draw.

dockimbel

[10:35](#msg57fb6f0a0aa72e3c5bec4036)@ldci Et tu vas pouvoir faire tes cours depuis ton Mac, sans emulation Windows. Le backend Mac GUI est presque complet. ;-)

ldci

[17:20](#msg57fbcddd0aa72e3c5bedf8a3)Une bonne nouvelle pour Mac Gui :)  
rcvScaleImage, rcvTranslateImage et rcvRotateImage sont maintenant des fonctions à part entière de RedCV. La documentation est mise à jour comme les exemples. Le dialect Draw est vraiment rapide et s'intègre parfaitement dans RedCV. De nouvelles idées dans les tuyaux.

## Friday 14th October, 2016

ldci

[09:20](#msg5800a34b457ae29b71db15e4)@dockimbel Un petit problème avec les gradients: sous Windows 10 changer l'angle du gradient fonctionne parfaitement mais n'est pas pris en charge avec Windows XP. Une idée? Tu peux tester avec movegrad.red dans le repertoire /Samples/Draw\_DSl.

dockimbel

[09:30](#msg5800a5cd30abd7997182e938)@ldci Ok, j'ai passé çà Qingtian, il va regarder si XP supporte cette fonctionnalité. Est-ce XP SP3 avec les derniers patchs ?

ldci

[11:00](#msg5800bab61cc4cda4564d761e)C'est peut être juste un problème d'émulation par Wine:)

dockimbel

[11:44](#msg5800c516891a5301630c519f)@ldci Avec différents angles, le gradient marche bien ici sur XP.

ldci

[12:47](#msg5800d3deb68c1ca566b5dd4f)OK: je vais essayer de retrouver une machine sous XP. Merci pour le retour

[13:35](#msg5800df2a614116a2568294f5)Testé sous Vista: OK. C'est bien un problème avec Wine. Don't act.

[17:33](#msg580116f730abd7997184d69c)Une question pour Doc: comment utilise-t-on la commande draw avec une image  
plot: \[commandes ...] draw ing reduce\[plot] n'affiche pas les tracés. Merci d'avance.

[17:37](#msg580117e530abd7997184d9f7)Trouvé: il suffit d'afficher l'image renvoyée par la fonction. Encore une fonction géniale pour RedCV :)

## Saturday 15th October, 2016

PeterWAWood

[01:49](#msg58018b3eb68c1ca566b8ba4c)V

## Monday 17th October, 2016

Nelson1203

[13:23](#msg5804d0ba891a53016318eb54)Bonjour a tous !

DideC

[14:11](#msg5804dc097972c5734212f11b)Tous n'est pas là, mais bonjour à toi ;-)

ldci

[15:27](#msg5804eddcb827179842cceba6)Salut Nelson1203 :smile:

Nelson1203

[15:38](#msg5804f091b827179842ccfc4d)J'ai une petite question a vous poser même si je ne suis pas dans le bon groupe mais voila on est pas beaucoup de français ici et je ne trouve pas mon bonheur. Quelqu'un peut il me dire ou puis je apprendre a coder en Swift ? (désolé pour la question aucun rapport mais je débute et j'ai vraiment du mal). Merci d'avance et désolé du dérangement.

## Wednesday 2nd November, 2016

ghost~5585eedf15522ed4b3e236ae

[00:11](#msg58192f19806316005de86c7f)@pchg Salut pchg. Ça fait un moment que je n’ai pas mis les pied sur ce canal et je n’ai pas fais attention à ton invitation, désolé.

[00:13](#msg58192f8dc3569a036e478cd5)@pchg Entre temps j’ai été licencié pour motif économique et suis revenu à Perpignan. Il se peut que sous trois semaines à un mois je passe un entretien d’embauche à côté de Mont-de-Marsan, ça peut être une occasion de se rencontrer.

[00:18](#msg581930db806316005de8756b)@dockimbel Salut Nenad. Je voulais laisser un lien pour info sur la compilation modulaire dans Trello. C’est pas possible ? Le lien : https://www.inf.ethz.ch/personal/wirth/CompilerConstruction/index.html Le chapitre 15 parle de compilation modulaire. Les langages de la famille Oberon sont notoirement connus pour leur design modulaire. Une piste à suivre peut-être.

dockimbel

[00:30](#msg581933959411972d60b32f1c)Salut, merci pour le lien, je vais regarder çà à tête reposée.

ghost~5585eedf15522ed4b3e236ae

[00:52](#msg581938c927c3e02625ef5849)Ok, si ça venait à t’interessé il y a il y a plus de matériel sur http://www.projectoberon.com/, notemment les chapitres 6 et 12 de https://www.inf.ethz.ch/personal/wirth/ProjectOberon/PO.System.pdf

[01:07](#msg58193c6e27c3e02625ef654d)@dockimbel Ok, si ça venait à t’interessé il y a il y a plus de matériel sur http://www.projectoberon.com/, notemment les chapitres 6 et 12 de https://www.inf.ethz.ch/personal/wirth/ProjectOberon/PO.System.pdf

[01:11](#msg58193d52c3569a036e47cddd)@dockimbel Il y a aussi ce petit article écrit par un des éléves de Niklaus Wirth qui résume la technique de la compilation séparée et la concepton des compilateurs de cette famille : ftp://ftp.ssw.uni-linz.ac.at/pub/Papers/Moe00b.pdf

[01:13](#msg58193dbfc3569a036e47cec4)@dockimbel C’est ce dernier document que je cherchais au départ à te communiquer.

dockimbel

[01:26](#msg581940c40e25dbfa118a9272)@lkppo Tu sais, il n'y a rien de spécifique à Oberon dans la compilation modulaire, la plupart des compilateurs des autres langages le supporte.

ghost~5585eedf15522ed4b3e236ae

[01:28](#msg58194149806316005de8b85c)@dockimbel C’est dans cette famille que ça me semblait le plus clairement exprimé.

[01:29](#msg5819419183a2008d22fd94e9)@dockimbel Et c’est par ce biais que je l’ai découverte, mais je dois dire que je ne suis pas ingénieur alors li me manque du bagage.

[01:36](#msg58194330806316005de8bf9d)@dockimbel Le readme mentionne compile vers OpenBSD, mais la cible n’exite pas pour Red. Normal ?

dockimbel

[03:58](#msg5819647c83a2008d22fe27d2)@lkppo On a une cible FreeBSD, elle devrait marcher pour OpenBSD aussi (non testé).

ghost~5585eedf15522ed4b3e236ae

[09:26](#msg5819b13983a2008d22ff957b)@dockimbel À l’occasion je le teste

## Friday 4th November, 2016

ldci

[14:37](#msg581c9d2a31c5cbef43b6a066)De retour de mission à Taiwan. J'ai mis à jour sur le site GitHub la dernière version de RedCV avec les opérateurs morphologiques étendus. A +

dockimbel

[16:19](#msg581cb51931c5cbef43b73aa9)@ldci Tu aurais dû faire un arrêt à Xiamen, on est en face de Taiwan, à 45mn en avion de Taipei. ;-) Quelles sont tes impressions sur Taipei ?

## Saturday 5th November, 2016

ldci

[11:58](#msg581dc96b2d4796175f48ec4d)@dockimbel : Ce sera pour la prochaine fois (peut être en Décembre) car je n'avais pas de visa pour la Chine. Taiwan est différente de ce que j'ai l'habitude de voir au Vietnam par exemple. Super séjour sur le plan professionnel et très bon accueil de la part de tous les gens rencontrés dans la rue comme sur les sites universitaires.

dockimbel

[12:29](#msg581dd097e097df7575732b7d)@ldci Tiens-moi au courant si tu repasses à Taiwan, je pourrais peut-être me libérer une journée pour passer.

[12:30](#msg581dd0ca2d4796175f490d84)

## Sunday 6th November, 2016

ldci

[20:50](#msg581f979645c9e3eb430647c4)@dockimbel Avec plaisir !

## Wednesday 9th November, 2016

ldci

[15:39](#msg58234334e462097a302a3a2c)Bon j'ai franchi le Rubicon: premier cours hier sur le traitement d'images avec Red er RedCV pour des étudiants en Humanités Numériques. Gros succès de Red :)

DideC

[15:50](#msg582345a86cb72076305697a0)"Humanité numérique" c'est quoi ça ?  
Mais bravo François !!

dockimbel

[16:38](#msg5823511c31c5cbef43d63d4d)@ldci Wow, bravo ! Si tu peux twitter à ce sujet en anglais, je serai ravi de le retweeter. ;-)

ldci

[16:56](#msg5823554531c5cbef43d65740)@DideC : Les humanités numériques (ou humanités digitales) sont un domaine de recherche, d'enseignement et d’ingénierie au croisement de l'informatique et des arts, lettres, sciences humaines et sciences sociales.Wikipedia :)

[17:08](#msg5823580ae097df75758e4d4a)@dockimbel : Done!

dockimbel

[17:26](#msg58235c39e097df75758e6ba8)@ldci Parfait, merci ! ;)

## Saturday 12nd November, 2016

ldci

[14:19](#msg582724fae462097a303d1bc3)@tous: WARNING: some exe are reported with "TR/Crypt.XPACK.Gen2" infection by Github.  
Puzzling since exe are compiled under MacOS, but to avoid any problems all exe are suppressed.  
You'll need to compile samples with following command:  
red -c -t Windows filename.red  
Very easy to do :)

dockimbel

[15:53](#msg58273b0b88fa21d53c1200b1)@ldci Github a un anti-virus intégré maintenant ?

ldci

[18:15](#msg58275c49c2f2cf727500feea)@dockimbel : d'après le mail que j'ai reçu, ils utilisent Avira Free Antivirus.

## Sunday 13th November, 2016

dockimbel

[01:56](#msg5827c83531c5cbef43eb5fa7)@ldci Pas de pot, c'est un des anti-virus qui systématiquement détecte des faux positifs sur les executables Red...

## Friday 2nd December, 2016

rcqls

[17:48](#msg5841b40ab4ffd59e38d828ab)@dockimbel Puisque Red va aussi parler français à partir de maintenant (ou presque), j’en profite pour te remercier dans la `french room` pour le temps passé à nous faire partager tes avancées en Red à travers ce long texte sur les macros. Allez! Je m’en vais me nourrir de Red… Mille mercis!

dockimbel

[18:03](#msg5841b75a44f3e83528cc6dff)@rcqls Merci pour ton message. ;-)

rcqls

[18:21](#msg5841bb931a501b4769b75994)@dockimbel Petite question sans urgence:  
comme le serveur qui héberge `red-latest` version MacOSX, est, comme tu l’as déjà souvent dit, assez capricieux comme en ce moment (`brew cask reinstall red-latest` devenant non fonctionnel par exemple), n’y-aurait-t’il pas la possibilité de déposer le binaire `red-latest` directement dans github (puisque nom unique `red-latest`) voire directement sur le repo `red/Homebrew-red`?

dockimbel

[18:22](#msg5841bbf91eb3d648694974bc)@rcqls Je ne suis pas sûr comment automatiser celà, mais je vais regarder çà demain (2h30 du matin ici). ;-) Je vais relancer le batch serveur manuellement pour forcer un nouveau build MacOS.

rcqls

[18:23](#msg5841bc3e44f3e83528cc8922)@dockimbel Comme j’avais dit: SANS URGENCE! Reposes-toi bien! Merci!

dockimbel

[18:30](#msg5841bdb0f666c5a138bfed77)Le serveur Mac est dans les choux (il est prété par un ami), apparemment il est en surcharge. Je pense qu'on va investir dans un serveur juste pour Red pour éviter ce genre d'ennui à l'avenir. ;-)

rcqls

[19:20](#msg5841c96df666c5a138c03663)@dockimbel En espérant ne pas te déranger…  
Pour le serveur mac, je crois comprendre le pb: il faut un rebol-SDK pour macosx pour construire `red-latest`. Le déposer ensuite sur github ne résout pas le pb du serveur mac sur lequel est généré le binaire…

[20:03](#msg5841d3820da034021b5e4449)@dockimbel Trop bien! C’est sûr que dans le contexte de Red, les macros ne se résument pas à ce que propose un preprocesseur. J’aime les exemples sur les DSLs où il semble possible de décoder (parser) à peu près ce que l’on veut. Et le tout au service de la dualité du Red en tant que langage compilé/interprété. En gros, beaucoup de points qui m’ont attirés vers Red… :clap: :+1:. Maintenant, il me reste à méditer toutes ces richesses...

## Saturday 3th December, 2016

dockimbel

[04:27](#msg584249a76b32e870497c4ab6)Les macros Red sont vraiment une nouveauté dans le monde Rebol, ca va prendre un peu de temps pour que les "anciens" se les approprient.

[04:28](#msg58424a04f666c5a138c2c366)Pour le Mac, il est tjrs en surcharge et son proprio n'est pas dispo... Je crois qu'on va commander une instance Mac aujourd'hui, il me semble qu'il y a un bon fournisseur français pour des serveurs Mac en cloud.

[09:41](#msg5842936044f3e83528d06f62)J'ai poussé une version de `red-last` pour Mac buildé manuellement.

rcqls

[10:07](#msg5842996a0da034021b61c9db)Nickel, cela remarche! Merci!

ldci

[10:49](#msg5842a33df666c5a138c439f8)@dockimbel super article sur les #macros. J'avais déjà apprécié lors du portage OpenCV l'existence des macros avec Red/System. A +

rcqls

[11:01](#msg5842a5f1b4ffd59e38dc8d1c)@dockimbel En combinant le blog et la doc sur les macros, j’ai l’impression que l’utilisation des macros est plus agréable en mode interprété (dans le REPL) avec `expand-directives [...]` comparativement à `do expand […]` car le contexte où sont définies les macros reste persistant (le temps de la session). Je me trompe? Du coup, si j’ai raison, je me demandais si un alias (plus court) de expand-directives serait intéressant pour tester les macros dans le REPL.

dockimbel

[11:04](#msg5842a6c9f666c5a138c4475c)@ldci Merci François. A propos, la version 0.6.2 va améliorer la gestion des librairies importées, notamment sur MacOSX, plus besoin de spécifier des chemins absolus. ;-)

[11:07](#msg5842a77bb4ffd59e38dc92cd)@rcqls `expand` n'est qu'un raccourci sur `expand-directives/clean`. Tu peux également utiliser `do/expand` qui va evaluer un block avec macros tout en préservant l'environment. Mais attention, lorsqu'on cumule les macros à travers plusieurs appels, il est facile de générer des effets de bord non voulus.

rcqls

[11:12](#msg5842a8b40da034021b620928)@dockimbel Tout s’explique avec le `/clean`! Merci pour `do/expand`, c’est lui que je voulais.

dockimbel

[11:13](#msg5842a8edb4ffd59e38dc975f)Je vais documenter ces nouvelles fonctions dès que possible.

[11:15](#msg5842a94b44f3e83528d0cc81)`do/expand` est là pour "utiliser" les macros, `expand` est une aide au débogage.

rcqls

[11:21](#msg5842aac86b32e870497ddbb5)C’est très clair maintenant! Mais j’ai l’impression que `expand-directives` est aussi bien pour débogage puisque cela n’oblige pas à placer dans le même block la/les macro(s) à tester et le code à parser. Mais, il n’y a rien d’important dans mes commentaires.

## Monday 5th December, 2016

ldci

[08:05](#msg58451fc144f3e83528dc689f)@dockimbel : la version 0.62 sera la bienvenue. Pour l'instant la 0.61 marche bien pour les librairies importées, mais les versions master posent problème:  
Compiling to native code...  
\*\** Loading Error: file access error: %Programmation  
\*\** in file: %/Users/fjouen/Programmation/Programmation%20en%20cours/OpenCV/OpenCV300/Red/samples/channel1/channel1.red  
\*\** at line: 1  
Une idée?

dockimbel

[08:07](#msg584520470da034021b6d25a9)@ldci Non, je ne vois pas. Si tu peux reproduire le pb avec un minimum de code (autant que faire se peut), ouvre un ticket stp pour qu'on puisse le traiter.

## Thursday 8th December, 2016

ldci

[10:34](#msg58493732b4ffd59e38000026)@dockimbel : Problème réglé! Bugs dans mon code. J'ai mis à jour la bibliothèque pour OpenCV (https://github.com/ldci/OpenCV3-red) qui est maintenant entièrement compatible avec les dernières versions de Red :) J'attends avec impatience le view pour Mac OS ! OpenCV3-red donne accès à 600 fonctions de traitement d'image! Mon objectif maintenant est que RedCV soit au même niveau de performance, mais en tout cas on a maintenant de superbes outils pour faire du "computer vision" avec Red!

dockimbel

[13:43](#msg5849639db4ffd59e38010353)@ldci Très bonne nouvelle ! Le View pour Mac est presque fini, il sera intégré à la branche master dès que la nouvelle release 0.6.2 sera prête.

ldci

[15:30](#msg58497c92f666c5a138e8ec16)@dockimbel : super pour le view pour Mac

## Monday 19th December, 2016

ldci

[13:51](#msg5857e5e4e7bdfe4e29721a4b)pas avec la console OSX: killed 9

## Tuesday 20th December, 2016

ldci

[11:33](#msg58591721e7bdfe4e2978837e)Comme promis: https://github.com/ldci/OpenCV3-red pour jouer avec la reconnaissance des visages. Pour RedCV faudra attendre un peu :)

## Thursday 22nd December, 2016

ldci

[13:57](#msg585bdbaeaf6b364a29e441ec)@dockimbel : l'intégration d'OPenCV avec Red View est parfaite! J'espère que le père Noël va m'apporter le view pour Mac OS !

## Saturday 24th December, 2016

ldci

[14:44](#msg585e89c97a3f79ef5d98256d)Mise à jour des exemples avec View ici : https://github.com/ldci/OpenCV3-red. Joyeuses fêtes à tous !
