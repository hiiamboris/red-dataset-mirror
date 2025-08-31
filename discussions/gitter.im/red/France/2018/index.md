# Archived messages from: [gitter.im/red/red/France](/gitter.im/red/red/France/) from year: 2018

## Monday 1st January, 2018

dockimbel

[10:51](#msg5a4a12a90163b028109c9a58)@ldci Super! :+1:

[10:52](#msg5a4a12f529ec6ac311a63ec7)@lkppo  
&gt; Je suis partagé sur le tournant annoncé.

Il n'y a pas de "tournant", mais une extension du projet dans un nouveau domaine. De la même manière que le support du GUI est une extension de Red/Core. Red continue sur la même voie qu'avant, avec une nouvelle branche qui s'ouvre maintenant (du moins si l'ICO réussi). C'est un pari sur l'avenir, mais on a besoin de faire grandir le projet de toute façon, et de le financer. C'est en fait un moyen de réduire, à court ou moyen terme, le risque de se retrouver avec des ressources financières insuffisantes et devoir fermer boutique comme Carl avec Rebol3.

[10:59](#msg5a4a147a0163b028109ca7dd)@sylvievathoux  
&gt; j'avais décidé de ne pas trop m'investir dans ces technos, et voilà qu'il va falloir que je m'y intéresse sérieusement !

Ce n'est pas nécessaire si tu ne souhaites pas les utiliser pour tes besoins. Red continue son development comme prévu. Si les fonctionnalités attachées aux blockchains ne te sont pas utiles, tu peux les ignorer. En revanche, si tu penses que celà te servira dans l'avenir, c'est une bonne opportunité pour mettre à jour tes connaissances dans ce domaine.

sylvievathoux

[20:46](#msg5a4a9e2668d092bb621187b1)@dockimbel Ok, vu comme ça... Merci de prendre le temps de répondre, tu dois être bien débordé ces temps-ci ! Meilleurs voeux à toute l'équipe de FullStack et bonne chance pour l'ICO, à laquelle d'ailleurs j'espère avoir les moyens de participer.

## Tuesday 2nd January, 2018

dockimbel

[01:44](#msg5a4ae3e6b48e8c35668c92b3)Je dors 5-6h par nuit depuis 2 semaines... ;-) On va publier les infos pour l'ICO d'ici la fin de la semaine, dès que le site web sera en place.

ldci

[09:31](#msg5a4b515fedd223081101c490)Bonne Année à tous! Voici quelques nouvelles fonctions pour le type vector! que je suis en train d'intégrer dans RedCV.

```
Red [
    Title:   "Vector"
    Author:  "Francois Jouen"
    File:    %vectors.red
]


makeRange: func [a [number!] b [number!] step [number!]][
    collect [i: a - step until [keep i: i + step i = b]]
]

makeRangeVector: func [a [number!] b [number!] step [number!]] [
    tmp: makeRange a b step
    make vector! tmp
]

makeSameVector: func [type [word!] bitSize [integer!] vSize [integer!] value [number!]][
    tmp: make vector! reduce  [type bitSize vSize]
    tmp + value
]

vectRandom: func [v [vector!] value [number!]
][
    collect [i: 0 until [keep i: i + 1 v/:i: random value i = length? v]]
]


vectSum: func [v [vector!] return: [float!]] [
    sum: 0.0
    collect [i: 0 until [keep i: i + 1 sum: sum + v/:i i = length? v]]
    sum
]

vectLength: func [v [vector!] return: [integer!]] [
    length? v
]

vectMean: func [v [vector!] return: [float!]] [
    (vectSum v) / (vectLength v)
]

vectProd: func [v [vector!] return: [float!]] [
    prod: to-float v/1
    collect [i: 1 until [keep i: i + 1 prod: prod * v/:i i = length? v]]
    prod
]

vectMax: func [v [vector!] return: [number!]] [
    n: length? v
    vMax: v/1
    i: 2
    while [i <= n] [
        either (v/:i > vMax) [vMax: v/:i] [vMax: vMax]
        i: i + 1
    ]
    vMax
]

vectMin: func [v [vector!] return: [number!]] [
    n: length? v
    vMin: v/1
    i: 2
    while [i <= n] [
        either (v/:i < vMin) [vMin: v/:i] [vMin: vMin]
        i: i + 1
    ]
    vMin
]

vectSort: func [v [vector!] return: [vector!]] [
    vv: copy v ; to avoid source modification
    sort vv
]

vectFlip: func [v [vector!] return: [vector!]] [
    vv: copy v ; to avoid source modification
    reverse vv
]



; code sample

print lf
print ["********** Vector tests **************"]

print ["Float Range Vector: " makeRangeVector -5.0 5.0 0.25]
print ["Integer Range Vector: " makeRangeVector 1 10 1]

v: make vector! 10
print ["Integer Zeros Vector: " v]

v: makeSameVector 'Integer! 32 10 1
print ["Integer Same Vector: " v]

v: makeSameVector 'Integer! 32 10 5
print ["Integer Same Vector: " v]

v: make vector! [float! 64 10]
print ["Float Zeros Vector: " v]
v: makeSameVector 'Float! 64 10 1.0
print ["Float Same Vector: " v]

v: makeSameVector 'Float! 64 10 0.25
print ["Float Same Vector: " v]

random/seed now/time
;v: make vector! 5
;vectRandom v 255

;v: make vector! [float! 64 5]
;vectRandom v 5.0

v: make vector! [1 5 2 4 3]

print ["Vector: " v]
print ["Length: " vectLength v]
print ["Sum: " vectSum v]
print ["Mean: " vectMean v]
print ["Product: " vectProd v]
print ["Min: " vectMin v]
print ["Max: " vectMax v]
print ["Sorted: " vectSort v]
print ["Flip: " vectFlip v]
print ["UnSorted: " v]
```

dockimbel

[13:58](#msg5a4b90020163b02810a2f6e7)@ldci Sympa! Ca confirme mon impression que `vector!` est sous-équippé, et nécessite pas mal d'extensions pour pouvoir en tirer le maximum.

ldci

[18:10](#msg5a4bcb285355812e57434d34)@dockimbel merci j’ai implémenté les fonctions de MATLAB pour les vecteurs 😊

## Wednesday 3th January, 2018

ldci

[20:04](#msg5a4d376468d092bb621ddd4f)@dockimbel : red est génial! Voici comment enregistrer les images issues de la caméra dans un fichier binaire

```
Red [
	Title:   "Test camera Red VID "
	Author:  "Francois Jouen"
	File: 	 %reccam.red
	Needs:	 View
]

iSize: 320x240
margins: 10x10
cam: none ; for camera
imgSize: 0
count: 0
cti: 0%
movie: copy []

fn: %video.rvi

processCam: does [
	count: count + 1
	ct/text: form count
	if cb/data [
		img: to-image cam
		append movie reverse img/rgb ; for bgr to rgb
	]
]

saveData: does [
	n: length? movie
	i: 1
	write/binary fn "RVF"
	write/binary/append fn to-binary n
	write/binary/append fn to-binary img/size/x
	write/binary/append fn to-binary img/size/y
	foreach im movie [
		cti: to-percent i / to-float n
		write/binary/append fn movie/:i
		p1/data: cti
	    i: i + 1
	]	
]


view win: layout [
		title "Red Cam"
		origin margins space margins
		cSize: field 100
		cb: check "Record Camera" true
		pad 25x0
		btnQuit: button "Quit" 60x24 on-click [quit]
		return
		ct: field 100
		button "Save" [saveData]
		p1: progress 130 
		return
		cam: camera iSize 
		return
		active: text 55 "Camera" rate 0:0:1 on-time [processCam]
		cam-list: drop-list 160 on-create [
				face/data: cam/data
		]
		onoff: button "Start/Stop" on-click [
				either cam/selected [
					cam/selected: none
					active/rate: none
				][
					cam/selected: cam-list/selected
					active/rate: 0:0:0.04;  max 1/25 fps in ms
					img: to-image cam
					cSize/text: form img/size
					imgSize: (img/size/x * img/size/y) * 3 
					movie: copy []
					count: 0
				]
		]
		do [cam-list/selected: 1 active/rate: none]
]
```

[20:06](#msg5a4d37dcba39a53f1ad18ca5)et bien évidemment la façon de relire le fichier (on a besoin de RedCV pour le flip)

```
Red [
	Title:   "Test camera Red VID "
	Author:  "Francois Jouen"
	File: 	 %movie.red
	Needs:	 View
]



#include %../../libs/redcv.red

margins: 5x5
fn: %video.rvi
iSize: 320x240
imgSize: 0x0
cSize: 0x0
n: 0
nImages: 0
strSize: 0
f: none
isFile: false
rgbSize: 0
img: make image! reduce [iSize black] 
dst: make image! reduce [iSize black]
activeImage: 1


readImage: func [n [integer!]][
	if isFile [
		f3/text: form n
		img/rgb: movie/:n
		rcvFlip/vertical img dst
		canvas/image: dst
	]
]

readAllImages: does [
	if isFile [
		i: 1 
		until  [
			readImage i
			i: i + 1
			i = nImages
		]
	]
]

loadMovie: func [rvf [file!]] [
	f: read/binary rvf
	s: to-string copy/part f 3  ; should be "RVF"
	f: skip f 3					;
	nImages: to-integer copy/part f 4
	f1/text: form nImages
	f: skip f 4
	imgSize/x: to-integer copy/part f 4
	f: skip f 4
	imgSize/y: to-integer copy/part f 4
	f2/text: form imgSize
	rgbSize: (imgSize/x * imgSize/y) * 3
	movie: copy []
	i: 1 
	while [i <= nImages] [
		f: skip f rgbSize
		rgb: copy/part f rgbSize
		append movie rgb
		i: i + 1
	]
	img: make image! reduce [imgSize rgb]
	dst: make image! reduce [imgSize rgb]
	isFile: true 
	activeImage: 1
	readImage activeImage 
	
]

view win: layout [
	title "Reading red movie"
	origin margins space margins
	button "Load" [loadMovie fn]
	f1: field
	f2: field 120
	button "Quit" [quit]
	return
	pad 15x0
	canvas: base iSize img
	return
	button "<<" [activeImage: 1 readImage activeImage]
	button ">>" [activeImage: nImages - 1 readImage activeImage]
	button ">"  [if activeImage < (nImages - 1) [activeImage: activeImage + 1 readImage activeImage]]
	button "<"  [if activeImage > 1 [activeImage: activeImage - 1 readImage activeImage]]
	
	f3: field 60
	return 
	button "Read All" [readAllImages]
]
```

[20:09](#msg5a4d386068d092bb621de1ca)un seul pb avec la fonction readAllImages qui ne rafraîchit pas le canvas (peut être un pb macOS). La suite consiste à utilisez ZLib de Bruno pour réduire la taille du fichier :)

## Thursday 4th January, 2018

ldci

[15:38](#msg5a4e4a730163b02810b0a946)@dockimbel : Tous les problèmes sont résolus. Pas besoin de RedCV: j'avais juste un décalage dans l'offset des valeurs. Pour lire toutes les images, un simple timer suffit. J'ai commencé à documenter le format des fichiers RCAM (RedCAMera).  
`RCAM (RedCAMera) Format RCAM contains rgb values. RCAM files contains a 32-byte header starting at offset 0 within the binary file. Video data are beginning just after the header at offset 32. RgbSize (Image x size * Image y size * 3) is used to calculate the offset of each image contained in the file. Offset Size Desciption 0 4 RCAM Four CC Red signature 4 4 Number of images in the file 8 4 Image x size 12 4 Image y size 16 8 duration in sec (float value) 24 4 Frames by Sec (FPS) 28 4 Compressed data (1) or not (0) 32 x size * y size * 3 Binary values for all images Each image is then stored in a block! Very convenient for a fast access and for all operations that can be performed on blocks with Red.`

[15:39](#msg5a4e4acb232e79134dc68b55)Je vais mettre à jour sur le blog.

[16:34](#msg5a4e577a68d092bb62236e8a)C'est fait : https://redlcv.blogspot.fr/2018/01/writing-and-reading-movies-with-red.html

sylvievathoux

[17:23](#msg5a4e631903838b2f2a6ea984)@ldci Quel boulot sur cette lib, bravo ! Ça ouvre de sacrées perspectives, mais avant de maîtriser la bête...  
Il existe quelque chose d'équivalent pour la reconnaissance des structures squelettiques sur documents radiologiques ?  
Au passage, tous mes voeux aux redaddicts !

ldci

[18:02](#msg5a4e6c24b48e8c35669e072d)RedCV est mis à jour (https://github.com/ldci/redCV). @sylvievathoux : tu dois pouvoir faire ça avec le portage d'OpenCV pour Red. Si ty as une image, ça m'intéresse de regarder :)

sylvievathoux

[20:13](#msg5a4e8af068d092bb62249ae0)@ldci J'ai ça \[profil1](https://github.com/sylvievathoux/red/blob/master/Xhead1.jpg) ou ça \[profil2](https://github.com/sylvievathoux/red/blob/master/Xhead2.jpg). Je ne sais pas trop par quoi commencer... Il y a des pistes sur ton blog ? Ou il faut aller voir directement sur OpenCV ?

ldci

[21:01](#msg5a4e9639bd369bc824874e94)@sylvievathoux : super je vais regarder un plus en détail avec les algorithmes morphologiques. A +

[21:08](#msg5a4e97e7ba39a53f1ad89600)@sylvievathoux : la question est de savoir ce que tu veux récupérer dans ce type d'image ?

## Friday 5th January, 2018

sylvievathoux

[08:47](#msg5a4f3bbf232e79134dcb22db)@ldci Des points précis de certaines structures squelettiques (points de profils, sutures, intersections de contours osseux...) à des fins d'analyse céphalométrique (orthodontie, chirurgie maxillo-faciale). Le problème, comme avec des photos (j'imagine) vient de la disparité dans la qualité des images (exposition, contraste, degré de développement etc). Évidemment c'est un gros morceau, et je sais qu'il existe quelques très très très lourdes suites logicielles spécialisées qui proposent ce type de module à des tarifs prohibitifs, alors je me disais que ça valait peut-être le coup d'y regarder de plus près avec l'oeil de RED :smile:  
Il y a de nombreux liens dans google si tu veux te donner une idée et que tu as 5 mn à perdre ! Merci pour les pistes, si tu en as une à me proposer.

ldci

[12:28](#msg5a4f6f6d0505ad8b45b9bd34)@sylvievathoux : il y a différents algos qui correspondent à tes besoins pour la squeletisation d'objets et qui sont basés sur l'application d'opérateurs morphologiques successifs. Tu peux faire des essais avec la lib pandore qui contient l'opérateur pskeletonization. Tu trouveras sur mon blog le lien sur la lib et un exemple de code Red pour utiliser pandore avec Red (http://redlcv.blogspot.fr/2017/12/red-and-pandore-library.html). A l'occasion on peut discuter plus en détail si tu es sur Paris. A +

[15:22](#msg5a4f9829b48e8c3566a3a551)@sylvievathoux : j'ai trouve une lib interessante (https://itk.org) que je suis en train de compiler pour macOS. C'est du C++ mais OPenSource :)

[17:05](#msg5a4fb0520505ad8b45bb2dab)@sylvievathoux : toujours en OpenSource, ce code développé par le CNES est très intéressant (https://www.orfeo-toolbox.org)

[17:05](#msg5a4fb06a0505ad8b45bb2df8)Ca marche avec mac, linux et windows

sylvievathoux

[17:40](#msg5a4fb88d03838b2f2a754921)@ldci Vus Pandore et Orfeo (ce dernier comme surcouche d'ITK). À mon petit niveau, Pandore me paraît déjà bien suffisant pour faire mumuse ! Je vais rester dans l'esprit "keep it simple" et m'inspirer de ta présentation :smile: Si je cale, je t'en ferai part. Merci de t'intéresser !

## Saturday 6th January, 2018

ldci

[10:11](#msg5a50a0d3290a1f4561565372)@sylvievathoux : pour faire joujou avec pandore installe ariane (http://www.greyc.ensicaen.fr/~regis/Ariane) Cela permet de chaîner les opérateurs facilement :)

## Sunday 7th January, 2018

sylvievathoux

[17:07](#msg5a5253d35a9ebe4f75596a2d)@ldci Ok merci, je vais voir ça...

[17:11](#msg5a5254d85355812e5761f0e9)@ldci Ah oui, bien vu, ça me rappelle mes années MS Access, avec le constructeur de requêtes, c'est vraiment pas jeune ! Bien, il n'y a pas que le Doc qui fait des choses utiles :smile:

## Monday 8th January, 2018

dockimbel

[03:45](#msg5a52e940232e79134ddb0b45)@sylvievathoux J'ai été un grand utilisateur d'Access 1.1 et son requêteur en 1995. A l'époque, c'était vraiment le top. :-)

sylvievathoux

[08:59](#msg5a53330f83152df26d4437a1)@dockimbel C'était en 94-95 pour moi aussi, sur win 3.11 !! Souvenirs, souvenirs...

dockimbel

[09:33](#msg5a533af3ba39a53f1aec4ab9)J'étais sur Win 3.11 et Novell Netware... :-)

## Thursday 11st January, 2018

DideC

[14:55](#msg5a577af3d0514c785b1a0cd8)Je vends des cannes pour les vioks si vous voulez ;-)

x8x

[15:32](#msg5a5783930cef4fed2ebf263d):-) :-) une par jambe ?? le set a combien?

DideC

[15:34](#msg5a578401290a1f456177e88f)Dépend du taux de change du ViokCoin sur la CanneBlockChain

## Saturday 13th January, 2018

ldci

[15:45](#msg5a5a299f1dcb91f1774749b7)@dockimbel : data: as c-string! string/rs-head text fonctionne parfaitement pour transformer une string Red en c-string Red/.System. Quelle est la meilleure façon de faire l'inverse? Par exemple string/rs-make-at as red-value! cdata length? cdata ?

dockimbel

[17:08](#msg5a5a3cf9ae53c15903e31354)@ldci Attention avec `string/rs-head`, ça te retourne un pointeur sur le buffer interne du `string!` qui peut être sous différent formats: UCS-1, UCS-2, UCS-4. Utilise plutôt `unicode/to-utf8` et `unicode/to-utf16` (y'a des tonnes d'exemples d'utilisation dans la lib standard Red).

[17:10](#msg5a5a3d6bb48e8c3566d71fe7)Pour l'opération inverse: `string/load` et `string/load-in`.

[17:10](#msg5a5a3d8696885c834c34cfc1)@DideC Tu acceptes les paiements en jetons RED pour les cannes ? ;-)

ldci

[18:12](#msg5a5a4c14ce68c3bc74b34643)@dockimbel Merci string/rs-head me va bien car les chaines sont en binaire , mais je vais regarder plus en détail. En fait j'essaie d'utliser la zlib pour compresser à la volée les images venant de la caméra. Affaire à suivre

## Sunday 14th January, 2018

dockimbel

[04:03](#msg5a5ad6aaba39a53f1a11df88)@ldci Si c'est du binaire, c'est bon. Si il y a des écritures dans ce buffer, fait juste attention qu'elles ne provoquent pas un overflow.

## Wednesday 17th January, 2018

ldci

[09:39](#msg5a5f19c5517037a212b84be8)Red est très à l'aise pour compresser les images à la volée:) Le code est ici http://redlcv.blogspot.fr/2018/01/image-compression-with-red.html

## Friday 19th January, 2018

DideC

[12:50](#msg5a61e98b290a1f4561ab29b3)@dockimbel Bien sûr, vu que je n'ai pas pu en acheter, ce sera un bon moyen d'en récupérer.  
Ceci dit, bravo pour l'ICO qui s'est apparemment très bien passée. Même si je ne comprends pas encore bien ce que cela veut dire concrètement.

dockimbel

[13:11](#msg5a61ee825ade18be3997777a)@DideC Merci Didier ! Tu vas en recevoir pour tes contributions passées (et future aussi j'espère). ;-)

[13:12](#msg5a61eed5ae53c159030a1f56)&gt; Même si je ne comprends pas encore bien ce que cela veut dire concrètement.

Justement, c'est l'occasion de mettre à jour ton savoir concernant les blockchains et l'ecosystème autour. Tu peux poser tes questions dans red/blockchain, ou ici si tu préfères.

[13:15](#msg5a61ef56ae53c159030a2372)Red va être le 1er langage de programmation générique à supporter la programmation des contrats intelligents, et à équiper sa communauté d'une blockchain et d'un jeton (le RED) pour créer un système économique décentralisé. En pratique, ça signifie que toutes les contributions au projet de toute sorte se verront rétribuées par un certain nombre de jetons, utilisables au sein de la communauté.

DideC

[13:41](#msg5a61f59d5a9ebe4f75a9873c)Ca j'ai compris dans le principe. Ce sont les principes et réalités concrètes de la blockchain qui m'échappe encore et moi, j'aime bien comprendre les choses. Mais cela demande du temps car c'est un sujet assez vaste.  
Aujourd'hui, j'ai déjà une maison à finir de construire (en plus de la vie courante), alors le temps...

## Saturday 20th January, 2018

ldci

[18:03](#msg5a6384789cdc721e4fa7df53)Mise à jour de RedCV avec le support de ZLib http://redlcv.blogspot.fr/2018/01/image-compression-with-red.html

x8x

[22:48](#msg5a63c73a0cef4fed2ebf8cbb)@ldci Excellent merci! Ça vas être bien utile :-)  
Petite question, est-tu en contact avec Bruno? Je me demandais s'il avait perdu intérêt en Red.

## Sunday 21st January, 2018

ldci

[11:55](#msg5a647f98ae53c1590315a3f7)@x8x : Bruno est en retrait de Red en ce moment, mais je ne connais pas les raisons exactes de son désinvestissement.

x8x

[12:53](#msg5a648d3b81cd9a5d7ea30061)@ldci Merci de l'info! Dommage. :worried:

ldci

[15:30](#msg5a64b2075a9ebe4f75b5f4e7)@x8x : pour la compression des images, je m'en sers maintenant pour les images vidéo:)

[16:50](#msg5a64c4e5517037a212d583ff)Toute une série de nouveautés dans RedCV: moments de Hu et des tas de fonctions pour les matrices (https://github.com/ldci/redCV)

## Monday 22nd January, 2018

ldci

[08:59](#msg5a65a804d9f895c360457be6)@tous la compression marche très bien pour la vidéo :)

## Thursday 25th January, 2018

jocko-jc

[15:50](#msg5a69fcdfc95f22546de40555)@ldci Bravo pour ce travail !

[15:51](#msg5a69fd1398927d574535b3ea)@ldci j'ai juste un pb de compilation: Compilation Error: undefined word \_rcvGetMatCentroid

ldci

[16:05](#msg5a6a0033ce68c3bc7401fc7e)@jocko-jc je vais regarder

[16:52](#msg5a6a0b334a6b0dd32b47e86e)@jocko-jc une lib pas à jour je corrige au week-end

jocko-jc

[16:55](#msg5a6a0be7ae53c1590333e267)@ldci ok, merci

## Saturday 27th January, 2018

ldci

[15:35](#msg5a6c9c306117191e61bd2c44)@jocko-jc : c'est mis à jour sur GitHub. Bon week-end

jocko-jc

[15:50](#msg5a6c9fac40259f1a33b49416)@lcdi : Merci. Je ne réussis toujours pas à compiler . \*\** Compilation Error: invalid path value: OS-image/lock-bitmap  
\*\** in file: %/Users/user/red/exemples/redCV-master/libs/core/rcvCoreRoutines.red  
\*\** in function: exec/\_rcvGetPixel

[15:53](#msg5a6ca090ae53c1590340d20b)faut-il installer des libs quelque part ?

## Sunday 28th January, 2018

dockimbel

[08:25](#msg5a6d88de98927d5745466277)@jocko-jc Tu as essaye de compiler en mode "release" (`-r`) ?

ldci

[09:24](#msg5a6d96b86117191e61c10afe)@jocko-jc : pas d'installation particulière mais il faut recompiler la LibRedRT, cat on fait appel à des routines.  
En cas de pb; red clear puis ensuite red -c -u nom de fichier pour mettre à jour libRedRT. Ensuite un simple red -c suffit

jocko-jc

[17:28](#msg5a6e0838ac509d207d8a757b)@ldci @dockimbel merci, ça compile. Une belle collection d'exemples !

ldci

[21:10](#msg5a6e3c3098927d5745499fac)@jocko-jc : Cool. Si tu veux contribuer, je suis preneur :)

## Saturday 3th February, 2018

ldci

[07:34](#msg5a7565eba3447aac75363267)J'ai amélioré l'écriture et la lecture des vidéos webcam avec red (https://redlcv.blogspot.fr/2018/02/read-movies-with-red.html). Bon week-end :)

[16:23](#msg5a75e1e5ac509d207db3c867)lecture des fichiers TIFF avec Red en cours: https://pbs.twimg.com/media/DVH6imeWAAAR\_sT.png:large

## Monday 5th February, 2018

ldci

[17:05](#msg5a788ec793be87284d7ba28a)OK pour les fichiers TIFF contenant n images https://pbs.twimg.com/media/DVSXvb7X4AApvw\_.png

x8x

[18:05](#msg5a789cd851915d962afee493):+1:

DideC

[18:30](#msg5a78a2d036de78850cf4d8ce)Bravo François ! Très productif en ce moment :clap:

## Wednesday 7th February, 2018

ldci

[11:10](#msg5a7adebcce68c3bc7457187e)@ tous: je suis en train d'intégrer le décodage des images TIFF dans RedCV. Cela permet de traiter quasiment toutes les images tiff. Je mettrai à jour le dépot Github dès que possible.

## Saturday 10th February, 2018

ldci

[20:23](#msg5a7f54bfce68c3bc746de164)Update de redcv avec le support des fichiers Tiff https://github.com/ldci/redCV

x8x

[20:29](#msg5a7f562d97cedeb0482f1581):+1: :clap: :smile:

## Sunday 11st February, 2018

tmpbci

[11:13](#msg5a80255b86ef1bb1419636a7)@ldci ca te dirait de venir faire une presentation de Red un soir a Montreuil ou a Choisy ?

[11:13](#msg5a8025754a6b0dd32bb7dca9)de raconter ton experience

[11:15](#msg5a8025ec7084124a3462500b)dans le cadre de http://jack.tf/ ou de http://www.tmplab.org/

ldci

[15:42](#msg5a806466f283b8e54649ed8b)@tmpbci . OK sur le principe

## Friday 16th February, 2018

ldci

[14:29](#msg5a86ead776ced47639ee0f83)@dockimbel peut on savoir avec Red si on est en little ou big endian? comme avec Rebol mode: trim/all to-string get-modes system:// 'endian

[17:45](#msg5a87189dda468f7539f5eadb)redCV peut sauvegarder des images Tiff en couleur et 24 bits: https://pbs.twimg.com/media/DWLKZb7W0AIZ6M8.png:large

[20:28](#msg5a873ee90202dc012e43277a)mise à jour sur Github https://github.com/ldci/redCV

## Sunday 4th March, 2018

dockimbel

[12:09](#msg5a9be2156f8b4b9946e90cf5)@ldci Red ne tourne que sur du little endian pour le moment.

## Friday 20th April, 2018

pbaille

[09:24](#msg5ad9b1c95f188ccc1584e692)Bonjour à tous, je suis nouveau, red semble vraiment passionant :)

rcqls

[09:34](#msg5ad9b4377c3a01610d005028)Salut @pbaille, je confirme. Outre l’originalité du langage (que je ne maîtrise pas encore toutefois...), le concept de cross-compilation me fascine depuis le début en plus avec sa taille réduite… C’est d’ailleurs cet aspect de compilation qui m’a poussé à m’investir sur la branche GTK malgré mon passage sous macOS depuis quelques années.

DideC

[09:59](#msg5ad9ba1f2b9dfdbc3aadc9f6)Bonjour Pierre. En te voyant arriver hier, je me suis dit que ce nom sentait bon le francophone :-)  
Bienvenue et n'hésite pas à poser des questions en français, même s'il y a moins de Guru ici (mais on se débrouille ;-) )

pbaille

[10:09](#msg5ad9bc522b9dfdbc3aadd734)@rcqls oui la cross-compilation c'est impressionant, je decouvre à peine. Moi ce qui m'a beaucoup impressionné c'est les capacitées de metaprogramation et d'introspection. Je viens de clojure, et je ne pensais pas trouver de language allant bcp plus loin de ce coté la. J'avais certes, remarqué certains language comme forth et factor qui semblent permettre des choses similaires, et les FExprs de Kernel qui semble s'en rapprocher d'une certaine manière. Mais REBOL et Red semblent vraiment pousser jusqu'au bout la chose.

[10:09](#msg5ad9bc677c3a01610d007a44)@DideC :) ok super! merci

## Friday 11st May, 2018

SteeveGit

[10:25](#msg5af56fa75e8e2175e25976da)Salut les gens, ça fait un bail (plus d'un an ou deux). Je pense me réinvestir sur ce projet maintenant que j'ai déménagé et que j'ai mon nouveau matos ^^

dockimbel

[16:05](#msg5af5bf439ad18967b9da8163)@SteeveGit Welcome! Tu devrais lire tous les articles du blog depuis 1 an, dans l'ordre chronologique, sinon tu risques d'être perdu. ;-)

SteeveGit

[21:06](#msg5af605e6862c5e33e92a387d)Salut Nenad,faut que je monte un mem disc pour voir ce que mon nouveau i7-8700K peut faire à pleine puissance niveau temps de compilation même si je vais probablement rien voir, vu que maintenant ça compile en incrémental pour une grosse part (si j'ai bien lu)

## Sunday 13th May, 2018

grazil

[13:39](#msg5af84002bd10f34a68fb3848)Bonjour, j'essaye de faire un moteur de template HTML en Red et je suis confronté à un cas particulier sur lesquel j'aimerais être sûr que je ne peux pas faire plus simple. Pour pouvoir créer des éléments imbriqués réutilisables, je les mets dans des functions que j'appelle dans mon dialect en mettant les appels dans des parenthèses, pour pouvoir utiliser `compose/only` pour obtenir les parties générées avec des parties remplacé dynamiquement.  
Ex1: Je mets deux fonctions imbriquées qui me génèrent des `block!`s mais j'ai une erreur de contexte lorsque je fais un appel avec `compose/only`:

```
f1: func [a1] [[div (a1)]]
```

[13:40](#msg5af8404d9ad18967b9e04d69)

```
f2: func [a2] [[div (f1 a2)]]
f2 "coucou"
```

[13:44](#msg5af8413ed332ee5fad150007)Ex2: j'utilise `compose/only` dans mes fonctions ce qui règle le problème mais oblige à le remettre dans chaque fonction:

```
f3: func [a3] [compose/only [div (a3)]]
f4: func [a4] [compose/only [div (f3 a4)]]
f4 "coucou"
```

Peut on se passer des appels à `compose/only`? Existe t'il un moyen de reconnecter le `block!` généré au contexte de la function?

SteeveGit

[13:56](#msg5af843f352194a4a67dfb23c)Salut, tu veux te "passer" des appels à compose mais pour quel bénéfice au juste ? (j'ai pas compris pourquoi tu veux faire autrement ;-) )

grazil

[14:01](#msg5af84538b84be71db9029913)Pour simplifier l'écriture de ces fonctions imbriqués. C'est peut être du pinaillage... :) C'est aussi l'occasion de voir si c'est faisable avec `bind` sachant que j'ai pas vraiment compris comment utiliser cette fonction...

SteeveGit

[14:07](#msg5af846b81cfca775e105cf4b)ok, si tu veux une fonction compose/only avec un nom plus court, ben tu l'encapsules dans une fonction plus euh... courte

```
pose: func [a][compose/only a]
```

ok ok c'est pas l'invention du siècle

grazil

[14:11](#msg5af8477ca2d9513633375b5e)Oui, ca peut être une solution. :)

[14:13](#msg5af847ef52194a4a67dfba6a)Merci

SteeveGit

[14:15](#msg5af84879b84be71db902a1ef)de rien ^^

## Sunday 8th July, 2018

sylvievathoux

[19:00](#msg5b425f4c9b82c6701bacb6d7)Bonjour !  
Ça dort un peu ici ;-)  
J'ai un problème avec les fichiers d'image png utilisés dans mes scripts : ces derniers s'exécutent parfaitement, mais après compile (tous modes testés), ne se lancent pas. Exemple avec le script suivant (l'image est celle du logo de red téléchargée) :

```
Red [Needs: 'View] 
img: load %RED.png  view [image 300x300 img]
```

Au lancement de l'exe, j'obtiens ça:

```
*** Access Error: cannot open: %RED.png
*** Where: decode
*** Stack: load
```

En revanche, si je fais ça (même image):

```
Red [Needs: 'View]
img-url: https://pbs.twimg.com/profile_images/501701094032941056/R-a4YJ5K.png
img: load img-url
view [image 300x300 img]
```

... tout marche !  
J'ai dû rater un épisode...

[22:55](#msg5b42966081816669a43b22fc)Précision : pb sur macOS seulement...

## Monday 9th July, 2018

ldci

[05:28](#msg5b42f2813572e970c18134a6)Le png doit être dans le répertoire de ton exécutable

sylvievathoux

[07:11](#msg5b430aae81816669a43bd6bc)Ah, c'est bien , il y en a qui suivent !

[07:19](#msg5b430c8f60c387078369178f)Merci François, mais ça, j'avais compris ;)  
Le problème est résolu, et c'est assez crétin : je teste en parallèle sur 2 bécanes, un pc win 10 et un mac, et je double-clic bêtement partout ! Avec la bonne commande (./) l'exe produit se lance parfaitement. Ça faisait un moment que je n'avais pas mis le nez dans du code...  
Désolé de vous avoir fait perdre votre temps.  
Par contre, les bundles ne se lancent plus sur mon high sierra : j'ai le warning 32 bits et exit direct !

## Saturday 14th July, 2018

lepinekong\_twitter

[00:46](#msg5b4947f2c2d95c60f4d8c06d)@sylvievathoux c'est vrai que c'est TRES TRES calme ici ;)

ldci

[17:29](#msg5b4a32e873026160f5a0e351)Oui j’ai bcp moins de temps avec mes nouvelles fonctions 😉

x8x

[19:14](#msg5b4a4b96eb9a487f3853bc83)Vive les bleus ! :smiley:

## Sunday 22nd July, 2018

lepinekong\_twitter

[01:46](#msg5b53e1fcf02a0977a3efe860)Je suis super fière de moi: j'ai enfin réussi à faire un parse donc je vous le montre :) c'est ici http://mycodesnippets.space/redlang/parse/nlp-command  
http://mycodesnippets.space/redlang/parse/images/nlp-command.gif

x8x

[05:21](#msg5b54146c4d14bf327bdd94d3):thumbsup:

ldci

[12:04](#msg5b5472deee530e4aac8d2b39)Bravo

## Tuesday 24th July, 2018

dockimbel

[12:10](#msg5b571725e06d7e74099bec09):+1:

## Thursday 26th July, 2018

ldci

[07:31](#msg5b5978bfbd17b96159044d65)Plein de nouvelles fonctions pour RedCV. Le dépôt Github sera mis à jour en septembre car mon 💻 vient de rendre l’âme

## Saturday 4th August, 2018

ldci

[18:54](#msg5b65f67804436a1ae618202f)RedCV: mise à jour sur Github https://github.com/ldci/redCV

x8x

[19:59](#msg5b6605be077e1c2db7081c15)@ldci Oh la-la, on est déjà en Septembre.. ;-) Merci! Je me demande si la nouvelle "Apple has informed developers that it will deprecate OpenGL and OpenCL in Mojave and iOS 12" vas impacter redCV.

[20:03](#msg5b660682077e1c2db7081c19)Il y a une demande de support pour Metal ici https://github.com/opencv/opencv/issues/4898 , c'est tout ce que je trouve sur OpenCV et Metal.

ldci

[22:13](#msg5b662503a9426c705d29c721)@x8x RedCV est totalement écrit en Red et Red/system et ne devrait pas être impactée par les changements d’Apple

## Sunday 5th August, 2018

x8x

[11:43](#msg5b66e2d1077e1c2db7081d0b)C'est une bonne nouvelle! Merci François! :smiley:

## Tuesday 14th August, 2018

sylvievathoux

[16:52](#msg5b7308eb49932d4fe4df8f14)@dockimbel  
Si j'utilise des sous-blocks dans un block Draw, les commandes `pen` et `fill-pen` peuvent être spécifiées une seule fois \*\*avant les sous-blocks sous macOS\** :

```
view [base snow 400x300 draw [
    pen red line-width 6 fill-pen off
    polys: [
      [polygon 10x10 100x150 150x80]
      [polygon 80x200 180x230 350x60 ]
   ]
]]
```

C'est cool.  
En revanche, elles doivent être répétées \*\*dans chaque sous-block sous W10\*\*, sauf à supprimer un niveau de sous-block :

```
view [base snow 400x300 draw [
    pen red line-width 6 fill-pen off
   polys: [
      polygon 10x10 100x150 150x80
      polygon 80x200 180x230 350x60
  ]
]]
```

Ce qui ne m'arrange pas...  
Bonnes vacances pour ceux qui en profitent encore !

## Wednesday 15th August, 2018

ldci

[09:43](#msg5b73f5d7a6af14730b3a8362)RedCV optimisé pour la détection de forme: https://pbs.twimg.com/media/DkkzR1TX0AURmqP.png

x8x

[12:03](#msg5b74168bbd63c770b7abb5ea)Toujours mieux! Merci François! :smile:

## Sunday 26th August, 2018

ldci

[17:36](#msg5b82e51f58a3797aa3bceeee)Dynamic Time Warping (DTW) pour redCV (https://github.com/ldci/redCV). Très utile pour comparer des contours. Une image ici https://pbs.twimg.com/media/DlhWbSNX0AAYd4s.png. La documentation et les exemples sont à jour.

## Sunday 9th September, 2018

ldci

[16:23](#msg5b954915e481f854a6929098)Bonjour à tous. Enfin un peu de temps pour mettre à jour le blog: https://redlcv.blogspot.com/2018/09/freeman-code-chain-in-redcv.html. Des nouveautés dans les jours qui viennent.

## Friday 28th September, 2018

JLCyclo

[21:33](#msg5bae9e32640179275b69a3df)Bonjour tous... Je fais du dev logiciel depuis des années avec des langages qui utilisent un compilateur. Aussi, j'ai tendance à utiliser un débogueur pour debugger... Existe t-il des outils ou projets de debogueur pour red ? Pour rebol, il existait par exemple anamonitor écrit en rebol.

## Saturday 29th September, 2018

ldci

[10:14](#msg5baf507b640179275b6d512b)Sous réserve de vérification Red permet de compiler en mode debug. Amicalement

## Sunday 30th September, 2018

JLCyclo

[19:45](#msg5bb127dcc08b8b3067b1bf09)Je pense que ce mode de compil debug permet d'avoir des traces "verbose" de Red. Ma question porte plutôt sur un outil Red qui permettrait de debugger un script. On peut par exemple, instrumenter le script à debugger en mettant des "halt" et visualiser en ligne de commande les mots/variables.. Mai, existe-t-il un outil qui permettrait de mettre un point d'arrêt, visualiser les mots/variables/objets et avancer en pas à pas sans toucher au script à debugger ? ( ce serait l'équivalent en python de pdb)

## Monday 1st October, 2018

sylvievathoux

[17:14](#msg5bb255f1ef4afc4f2802c4ee)Bonjour toulmonde !  
J'ai déjà posté mon pb sur le GUI-branch, mais sait-on jamais, si quelqu'un peut m'aider ici. J'ai un souci avec le widget text-list qui ne veut pas modifier ses datas dans le script suivant (btn `Clear`pour vider le text-list, btn Àdd`pour rajouter une ligne) :`  
cnt: 1  
view [  
below  
canvas: base 400x200  
on-down [  
either empty? tl/data/(cnt) [  
append tl/data/(cnt) rejoin \[cnt " -&gt;" to-string event/offset " "]  
][  
append tl/data/(cnt) rejoin \[" -&gt;" to-string event/offset " "]  
]  
]  
tl: text-list 400x200 data \["" "" "" "" "" "" "" "" "" ""] font-size 9  
across  
button "Clear" [  
tl/data: copy \["" "" "" "" "" "" "" "" "" ""]  
cnt: 1  
]  
button "Add" \[cnt: min 10 cnt + 1]  
]  
\`  
Même comportement sur W10 et OSX  
Je bloque...

ldci

[17:20](#msg5bb25778c08b8b3067b8dbdf)J’ai un problème similaire. Initialises ton data comme un bloc vide \[] et tu devrais pouvoir faire un append sans pb

sylvievathoux

[17:49](#msg5bb25e0c600c5f64233aabcc)Non, ça ne marche pas.  
Mais j'ai eu la solution, tout simplement copy/deep ! J'y pense tout le temps, mais pas ce coup-là :(  
C'est quand même un comportement difficile à comprendre.  
Merci François.

ldci

[18:20](#msg5bb26583a9be136b94de2aaf)Cool

## Tuesday 2nd October, 2018

DideC

[13:10](#msg5bb36e4eef4afc4f28095742)@JLCyclo A ma connaissance, rien de bien avancé. En tout cas, pas qui permettent du pas à pas, etc.... Je pense que @Dockimbel à du prévoir des choses dans ce sens, mais cela n'est pas disponible/terminé.

## Tuesday 9th October, 2018

Palaing

[07:37](#msg5bbc5a9f600c5f6423788d8a)Bonjour à tous,

[07:38](#msg5bbc5b01c08b8b3067f2105d)Pour info je me lance dans la traduction en français de la doc officielle de Red. Au cas où quelqu'un aurait commencé aussi, ou envisagerait de le faire... je partagerai volontiers :)

[07:39](#msg5bbc5b29435c2a518e759914)Sinon dans le meilleur des cas, ça prendra du temps.

x8x

[07:42](#msg5bbc5be5e6090c0c3b4cb2f6)@Palaing Très bonne initiative! Bon courage! :smiley:

rcqls

[08:04](#msg5bbc61061e23486b93a83479)@Palaing Excellent!

ldci

[10:14](#msg5bbc7fa082893a2f3bbe384e)Excellente initiative 😋

## Friday 12nd October, 2018

Palaing

[20:28](#msg5bc103fcef4afc4f28638cf8)Personne n'a entendu parler d'un lexique Rebol/Red anglais-français par hasard?  
A défaut toutes les suggestions sont bienvenues pour la traduction d'expressions comme (avec le contexte):  
&gt; Get-path! returns the value of a paths selector, unevaluated.  
&gt; A `lit-path!` is a quoted or unevaluated path!.

## Tuesday 30th October, 2018

Palaing

[21:05](#msg5bd8c7a9bbdc0b2505c631a7)Ok, il n'est pas obligatoire de répondre, vous pouvez reprendre vos conversations habituelles!

## Wednesday 31st October, 2018

x8x

[10:37](#msg5bd985ddea223702d052a4f3)@Palaing Si tu veux écrire du code en français tu pourrait par example utiliser les macros, ceci:

```
#macro si:      func []['if]
#macro affiche: func []['print]
#macro vrai:    func []['true]

si vrai [affiche "Vive Red !"]
```

compilé, retournera:

```
if true [print "Vive Red !"]
```

Regarde ici pour plus d'infos sure les macros:  
https://www.red-lang.org/2016/12/entering-world-of-macros.html

[10:40](#msg5bd986a3e078fc446fca9abf)Pour un exemple d'interface multilingue, il y a un example là:  
https://www.red-lang.org/2017/07/063-macos-gui-backend.html

## Thursday 1st November, 2018

Palaing

[17:11](#msg5bdb33bad3442e1972725f1b)merci @x8x .

[17:12](#msg5bdb33f40445e15fad094f39)Ca n'est pas mon intention de départ, mais ça peut être marrant de traduire le langage. Et je vais me pencher sur les macros pour voir comment ta proposition diffère de celle qui me venait spontanément: `si: :if`

## Friday 9th November, 2018

moliad

[21:20](#msg5be5fa292138723405e0655a)@x8x dépendamment de comment tu roules ton code, même pas besoin de macro... ceci fonctionne aussi (même en Rebol)

```
si: :if   vrai: :true
```

## Tuesday 13th November, 2018

lepinekong\_twitter

[10:49](#msg5beaac3a7326df140efb5113)si: :if fait une copie c'est pas terrible pour ça non ?

[10:53](#msg5beaad3abb06d73a9968ad0c)@Palaing pour info Doc avait aussi un exemple sur redlang.org que j'ai mis aussi ici à usage perso http://mycodesnippets.space/redlang/preprocessor/red-in-french

Palaing

[17:56](#msg5beb10559600d10e64a490ed)@lepinekong\_twitter intéressant, merci!

## Friday 16th November, 2018

nverscheure

[16:47](#msg5beef4b480e46b4266bfdc09)Hello, Rebol était le language internet. Red s’inscrit comme sa suite. Savez-vous si il y a des outils pour les tests de montée en charge ? Je me dis que ce genre de language est l’idéal pour faire un outil léger, portable avec une GUI. Il y a bien Apache ab ou siege. Mais pas de partie graphique ou alors c’est un casse-tête avec du gnutplot à interfacer...

## Saturday 17th November, 2018

ldci

[17:58](#msg5bf056c02ef5b06e407fe9ae)Réseau de neurones avec Red: https://4.bp.blogspot.com/-GUmnGHihKhk/W\_BQmNbwNWI/AAAAAAAAArA/3IacpXAkJFsSRa6hn7Y5UaQ9lX1eKvibgCLcBGAs/s1600/img2.jpg

[17:59](#msg5bf05713f9993b42672528c8)Opus: http://redlcv.blogspot.com/2018/

## Sunday 18th November, 2018

ldci

[10:50](#msg5bf143fc80e46b4266cd7946)J'ai corrigé quelques erreurs notamment pour les utilisateurs Windows

## Thursday 29th November, 2018

moliad

[23:45](#msg5c007a16be66d8252650cb44)@lepinekong\_twitter `si: :if` ne copie rien, il fait just assigner la fonction à un autre mot

[23:47](#msg5c007a8d9f38cc0fd57dd4a4)@ldci je reviens d'une conférence sur le ML (avec du deep learning) intéressant d'avoir des ébauches en Red.

[23:48](#msg5c007ad843c68b3727d5b456)@ldci Seras-tu à la conférence international de réseaux neuronne / deep learning à Montréal (Canada) la semaine prochaine?

[23:49](#msg5c007afc3f50311036feab33)ce serait une super occasion de se revoir ça fait un bail le devcon Rebol à Paris

## Friday 30th November, 2018

ldci

[19:49](#msg5c01944e1c439034affa31d0)@max malheureusement pas présent à cette conférence. Si tu viens sur Paris on trouve un Moment

moliad

[19:52](#msg5c0194e93f5031103605b035)@ldci as-tu réussi à faire des RNNs en Red

ldci

[19:53](#msg5c0195346c3c565096b31e95)Oui je vais mettre sur mon blog asap

## Saturday 15th December, 2018

ldci

[18:18](#msg5c154573e86b0460b3a22b3c)Bonsoir à tous, le portage d'OpenCV pour Red est compatible avec la version 0.6.4. Je mettrai à jour le dépôt Github en début de semaine.  
Bon week)end

## Thursday 20th December, 2018

moliad

[21:08](#msg5c1c04b99f43111418709407)cool pour tout, il se pourrait que je participe sur le porting de certains projet tels que tensor flow pour Red et p-e même certaines implémentation de papiers en ML. nous sommes en train de rebâtir notre architecture de NLP et une connections à des modèles entrainés fait parti du plan. de les avoir directement en Red rendrait le tout VRAIMENT plus simple. Tout notre back-end sera clusterisé et géré dans un interface graph
