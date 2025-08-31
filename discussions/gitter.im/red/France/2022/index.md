# Archived messages from: [gitter.im/red/red/France](/gitter.im/red/red/France/) from year: 2022

## Saturday 1st January, 2022

ldci

[09:32](#msg61d01fa06d9ba233289d880f)Bonne Année 2022

## Thursday 6th January, 2022

Boum69

[10:52](#msg61d6c9e3d143b14f8302be3b)Meilleurs vœux pour cette nouvelle année 🙂.

## Friday 20th May, 2022

Boum69

[22:10](#msg628811f2db6f627d25912f74)Bonsoir, est ce que quelqu'un peut me dire pourquoi j'obtiens ce message d' erreur lorsque je tente de charger en mémoire un simple fichier csv qui contient de accents par exemple: ?

[22:11](#msg6288121267db9a59dbdc4b87)Mommy;Poppy;Mémé;Pépé

[22:13](#msg628812747df86c141e959c9b)Avec load file.csv

## Saturday 21st May, 2022

ldci

[05:38](#msg62887acdc61b987d33bc5ddb)@Boum69 : problèmes des. caractères accentués

[06:13](#msg62888315db6f627d2591f976)Ce format de données est meix: "Mommy","Poppy","Meme", »Pepe ».  
Regarde ici: https://stackoverflow.com/questions/43379932/access-error-invalid-utf-8-encoding-ffd8ffe0

[06:32](#msg6288877309eea00adea577d8)Il ya aussi le codec CSV.Red \`load-csv csv-data, mais il ne marche pas avec un fichier. Uniquement des strings. Je vais creuser un peu:)

Boum69

[08:55](#msg6288a8ec06a77e1e1848d9cb)Ok @ldci , c'est bien ce qu'il me semblait. J'essaie de trouver un moyen de charger un fichier CSV contenant des accents mais j'essaie en vain et j'ai atteint mes limites je pense : / . Par contre j'ai remarqué qu'avec sqlite3 les données se convertissaient automatiquement, ce serait génial de pouvoir automatiser cette tache. Je vais creuser de ce côté là (mais je ne maitrise pas la syntaxe aussi bien que vous) . Bonne journée, dans l'attente du fruit de vos recherches ;)

ldci

[10:15](#msg6288bbdd4e38f759e27f0661)Bon, à part la fonctin bin-to-string, je n’ai pas trouvé de solution correcte.

Boum69

[11:41](#msg6288cfff67db9a59dbddadca)Ok merci beaucoup, je vais tester ça ASAP.

## Sunday 22nd May, 2022

GiuseppeChillemi

[23:17](#msg628ac496db6f627d25962999)@ldci could you translate this problem and the solution? My language has accented texts too.

## Monday 23th May, 2022

Boum69

[07:20](#msg628b35bedeea5616bbbfb6bf)@ldci bonjour , je n'ais pas trouvé la fonction bin-to-string. Fait elle partie d'un codec?

ldci

[10:05](#msg628b5c84c9382316a61b1802)C’est dans le lien stackoverflow: https://stackoverflow.com/questions/43379932/access-error-invalid-utf-8-encoding-ffd8ffe0

Boum69

[22:16](#msg628c07ca06a77e1e184f66e7)Ah ok ! Merci 😁

[22:17](#msg628c07e3e393a31806207412)Je testerai ça demain. Bonne soirée @ldci

## Tuesday 24th May, 2022

ldci

[06:57](#msg628c81c1ef00bd1dc6f792c3)@GiuseppeChillemi : have a look here: https://stackoverflow.com/questions/43379932/access-error-invalid-utf-8-encoding-ffd8ffe0

GiuseppeChillemi

[07:43](#msg628c8cb5e393a318062173f1)Yes, I had already noticed the answer was in the link. Thank you.

## Sunday 25th December, 2022

ldci

[15:09](#msg63a867ae378d512c182f0e2a)Joyeux Noël à toutes et tous :)

GiuseppeChillemi

[22:40](#msg63a8d146fb195421bd546770)Mercy!

## Thursday 29th December, 2022

DideC

[10:26](#msg63ad6b610cd40c2e89ae752f)Merci François !  
Trop tard pour souhaiter un joyeux Noël pour ma part :-/  
Mais je vous souhaite à tous un très bon réveillon de la Saint Silvestre :-)

## Saturday 31st December, 2022

Boum69

[23:04](#msg63b0c0187de82d261608a100)Bonsoir, même chose pour moi je n'ai pas eu l'occasion de vous souhaiter un joyeux Noël mais je vous souhaite une très bonne année à toutes et à tous. En espérant que le language Red progresse au plus vite. 🙂

ldci

[23:17](#msg63b0c315ff1fd121b3227d8d)Bonne Année à tous :)
