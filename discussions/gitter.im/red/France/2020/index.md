# Archived messages from: [gitter.im/red/red/France](/gitter.im/red/red/France/) from year: 2020

## Tuesday 7th January, 2020

Palaing

[09:02](#msg5e144939e52f6353789a6792)@fvanzeveren Bonjour François, j'ai mis en place il y a longtemps Rebol 2 comme moteur CGI sur Bluehost; elle fonctionne encore, comme on peut le vérifier ici: https://thavy.org/rtools/amoicomtedeuxmots.html ...  
Je n'ai pas testé avec Red.

## Thursday 9th January, 2020

ldci

[13:05](#msg5e17251dbdcaea18912290da)https://github.com/ldci/redCV Importante mise à jour de redCV avec une organisation modulaire de la bibliothèque :)

rcqls

[15:17](#msg5e1744020ba7b60f204dc255)Salut François, j’irai testé cette nouvelle organisation sur macOS et Linux. Mais qui est donc ce Regis qui a oeuvré sur linux/GTK (😂 humour bien sûr!)? D’ailleurs si jamais tu laisses ce type d’info sur la page de redCV tu peux rajouter la conséquente contrib de @bitbegin qui a repris ce que j’avais fait en apportant entre autres choses de la stabilité au développement ….

## Wednesday 15th January, 2020

ldci

[18:31](#msg5e1f5a6484894f56b665e2ff)@rcqls j'ai testé redCV avec GTK: ça marche à 95% :). Je pense qu'il n'y aura plus de problèmes avec la version définitive de GTK

## Saturday 18th January, 2020

tmpbci

[23:50](#msg5e2399e2ea55e3623e7a477f)@fvanzeveren Tu cherches quel genre d'hebergement ?

[23:51](#msg5e239a183ea53f0f66496beb)On a une VM avec Cheyenne je crois bien

[23:53](#msg5e239a794c1f9679ec0d4849)Sinon des nouvelles quelqu'un a des nouvelles dIO ? port tcp udp serial ?

## Sunday 19th January, 2020

ldci

[10:47](#msg5e2433bca1dfaa3ba145e9dc)redCV and GTK: 99% compatible :)

rcqls

[11:08](#msg5e2438ad5cd7964660781787):clap:

## Monday 27th January, 2020

ldci

[12:09](#msg5e2ed2dc44c076313cf4e585)Bonne nouvelle: redCV est 100% compatible avec Linux-GTK maintenant. Je mettrai à jour demain je pense.

rcqls

[15:54](#msg5e2f07c801914e3e045a0888)Excellent!

## Tuesday 28th January, 2020

ldci

[12:09](#msg5e30246d40da694c5ede0ec0)Le gitHub est à jour: https://github.com/ldci/redCV

## Tuesday 4th February, 2020

ldci

[11:00](#msg5e394ec9f6945f41ef5a1f19)Bonjour à tous: j'ai testé tous les exemples (sauf la vidéo) avec LinuxGTK et Windows 10. Tout fonctionne correctement comme pour MacOS. 2 points concernant GTK. 1°) le request-file/save ne fonctionne pas correctement: on ne peut pas saisir le nom du fichier destination. 2°) Je pense que la fonction os-image/resize n'est pas implémentée complètement, ce qui cause quelques petits problèmes d'affichage. Pour avoir une compatibilité parfaite entre les 3 OS, j'ai du modifier quelques routines et exemples. Je mettrai à jour le gitHub en fin de journée.

[14:53](#msg5e39854ddc52c34ace45cd8f)Le gitHub est à jour: https://github.com/ldci/redCV

## Sunday 26th April, 2020

ldci

[16:50](#msg5ea5bbdb3ea9b172a48fb10f)Bonjour tout le monde. Je vous espère en forme malgré le confinement. J'ai besoin d'aide. Qui pourrait m'aider à porter ce code C++ en Red/Red/System https://sites.google.com/site/5kk73gpu2012/assignment/viola-jones-face-detection ? J'ai écrit l'essentiel du code avec des routines , mais je bloque sur la fonction runCascadeClassifier: le return -i pose problème. Merci à tous :)

## Monday 27th April, 2020

PierreChTux\_twitter

[14:28](#msg5ea6ec0f2bf9ef1269a95f8b)Coucou,  
Souhaits réciproques de bonnes formes confinées.

[14:28](#msg5ea6ec26f6a6e539797d736a)Intéressant problème (comme tout problème, d'ailleurs). Je regarde de quoi il en retourne.

ldci

[15:43](#msg5ea6fda8501f8f72a50a4542)@PierreChTux\_twitter : Génial:)

## Thursday 28th May, 2020

PierreChTux\_twitter

[09:07](#msg5ecf7f4e778fad0b132fe419)Bon, ce fut loin d'être aussi génial... Désolé...

[09:08](#msg5ecf7f9e778fad0b132fe4a9)J'aborde une question un peu franco-française: je suis en phase de reconversion professionnelle, je m'oriente vers l'informatique, et Pôle Emploi veut bien me payer des formations allant dans ce sens.

[09:10](#msg5ecf8009225dc25f54af0349)Envisageant, naturellement, d'utiliser Red (au lieu de tânonner, ce que je fais en ce moment), je serais à la recherche d'un organisme de formation qui puisse tenter la lourde tâche d'élever mes compétences depuis un Rebolleur moyen jusqu'à un Reddeur d'excellence (pourquoi se fixer des objctifs mièvres, je vous le demande un peu).

[09:12](#msg5ecf808f549761730b6211f0)Nous en avions déjà discuté avec @ldci , l'EPHE pouvait faire quelque chose, mais Pôle Emploi a jugé la formation en question bien trop longue, et pas assez régionale (oui, il semblerait presque qu'on s'oriente vers un système fédéral en France). L'argument du régionalisme était assez léger, et contournable.

[09:13](#msg5ecf80b189941d051a2a4eac)D'où ma question: quelqu'un dans la salle saurait-il si un organisme de formation pourrait fournir ce genre de prestation?

## Friday 5th June, 2020

PierreChTux\_twitter

[15:07](#msg5eda5fc37da67d06faf3c8ec)Une idée folle, que j'avais eue il y a quelques temps: reconstruire une de mes distributions GNU/Linux préférées, la LFS, en réécrivant tout en Red/System et en Red. Oui, idée folle, j'avais prévenu.

[15:12](#msg5eda60cadaf4cf366ee33fa6)En lisant cette dépêche à propos de Guix:  
https://linuxfr.org/news/guix-un-outil-pour-les-remplacer-tous  
, m'est venue une autre idée, un petit peu moins folle peut-être, à la lecture de ce passage:

&gt; Cela peut paraître un choix anodin d’utiliser un langage de programmation à la place de fichiers de configuration « statiques » pour une distribution (et même un gestionnaire de paquets), mais en réalité ça change tout.  
&gt; Eh oui, là où avec des langages dédiés à un domaine (DSL en anglais), on est toujours limité dans nos possibilités de configuration et par l’apprentissage nécessaire d’une nouvelle syntaxe. Guile devient une sorte de langage universel, extrêmement flexible et permettant des niveaux d’abstraction infinis propres à la programmation.  
&gt;De plus, grâce à des liaisons (bindings) avec les différents logiciels, il est possible de configurer sa machine entièrement en Guile, sans passer directement par les fichiers de configuration de tel ou tel service.

[15:14](#msg5eda61663ffa6106f1f8320d)Évidemment, j'ai immédiatement pensé à la syntaxe clairissime de Rebol et Red, et dans ma tête, j'ai :%s/guile/red/g

## Monday 8th June, 2020

ldci

[18:34](#msg5ede84bb9da05a060a5cd319)OK tu nous diras :)

PierreChTux\_twitter

[18:37](#msg5ede8579a91f120a6cef8cb7)J'avais déjà fait une LFS (http://www.linuxfromscratch.org/lfs/), il y a une vingtaine d'années: c'est rigolo comme tout et très formateur, ça prend pas mal de temps.  
Mais là, réécrire tout le bouzin en Red, je crois que je m'attelle à un sacré morceau!

[18:38](#msg5ede85c2225dc25f54d43138)Je crois que je vais commencer doucettement, par déjà me refaire une LFS "normale" (à savoir tout écrit en C) dans sa version courante (les choses ont dû évoluer, en un peu moins d'une paire de décennies) et ensuite, refaire la manip' en traduisant tout en Red.

[18:43](#msg5ede86d63ffa6106f1020ef4)Allez, je vais faire part de tout ça en langue de Shakespeare, manière.

[19:00](#msg5ede8acb2c49c45f5ace9a4b)&gt; OK tu nous diras :)

Dans vingt ans à peu près (ETA)...

À moins que je n'arrive, dans le cadre de mes études, à mobiliser quelques autres fadas qui le soient suffisamment pour s'atteler à pareille tâche: une Red-LFS, ou une Red-Guix...

## Thursday 18th June, 2020

Palaing

[11:35](#msg5eeb51716c06cd1bf43d7069)@fvanzeveren au cas où la question de l'hébergement serait toujours d'actualité 5 mois plus tard... Il y a évidemment la solution du VPS, on en trouve chez OVH (https://www.ovhcloud.com/fr/vps/) à partir de 3€HT/mois. Plus de boulot pour tout configurer mais aussi plus de liberté...

sylvievathoux

[14:36](#msg5eeb7c0047fdfd21edcf5775)Bonjour tout le monde !  
Je cherche à ajuster dynamiquement un container (base face) aux dessins générés par un bloc de commandes Draw. Je ne trouve pas, et je me demande si c'est possible...  
Des idées ?

## Saturday 20th June, 2020

ldci

[14:22](#msg5eee1b90405be935cdb13d82)Tu as essayé `base//image: draw image drawBlock`?

[14:22](#msg5eee1bc26c06cd1bf4441a4e)oups un / de trop

## Sunday 21st June, 2020

sylvievathoux

[20:20](#msg5eefc0f9fa0c9221fc50f6a7)Oui, bien sûr. On peut broder autour de ça, mais dès lors que l'on fait :

```
img: make image! reduce [size color]
```

il faut que `size` soit défini. Ce que je voudrais éviter...

## Tuesday 14th July, 2020

ldci

[15:53](#msg5f0dd4dd0d37916fda74d17d)Bonjour tout le monde. redCV sera mis à jour demain sur Github. En attendant vous pouvez regarder les nouveautés ici: https://redlcv.blogspot.com/

## Wednesday 15th July, 2020

ldci

[07:41](#msg5f0eb32726b22649721fea64)redCV est mis à jour: https://github.com/ldci/redCV. Bel été à toutes et tous.

## Monday 30th November, 2020

ldci

[09:11](#msg5fc4b75a9cdc3e0d754d84f2)Bonjour à tous. redCV est mis à jour: https://github.com/ldci/redCV. Compatible avec la nouvelle version du compilateur Red. Un nouveau type de matrice développé avec Toomas Vooglaid durant l'été.

## Tuesday 1st December, 2020

Boum69

[19:59](#msg5fc6a0ba09947966057d4401)Bravo pour cette mise à jour et félicitations pour le travail accompli. J'ai testé l'intégralité des mises à jour de cet été. Quel travail colossal.👍 Hate d'essayer cette dernière mise à jour.

## Wednesday 2nd December, 2020

ldci

[12:23](#msg5fc78759f995f946273efc03)@Boum69 Merci et n'hésite pas si tu trouves des bugs à me le faire savoir

## Saturday 12nd December, 2020

ldci

[13:41](#msg5fd4c88e03da931ac249cf63)Bonjour les amis. Un question simple sur laquelle je bloque. Je dois générer dynamiquement des faces en red, comme dans ce code:

```
n: 3
repeat i n [
	mp: to-word rejoin ["mp" i]
	print [mp type? mp]
	mp: make face! [type: 'base size: 20x20 offset: as-pair i i] ;'basic face
	print [mp/type mp/offset]
]
```

les faces sont bien créées et on peut les ajouter sans problème dans le pane de la fenêtre principale. Mais elles apparaissent ensuite comme unset.

Numeross\_\_twitter

[14:49](#msg5fd4d8852a954a51a9c88488)@ldci Est-ce que tu utilises `show` ? https://github.com/red/docs/blob/master/fr/view.adoc#7-cycle-de-vie-dune-figure

ldci

[15:57](#msg5fd4e8550697c1210db92cff)@lop. La solution fournie par Nénad

```
repeat i 3 [
    mp: to-word rejoin ["mp" i]
    print [mp type? mp]
    set mp make face! [type: 'base offset: as-pair i i];'basic face
    mp: get mp
    print [mp/type mp/offset]
]

print [mp1/offset mp2/offset mp3/offset]
```
