# Archived messages from: [gitter.im/red/red/France](/gitter.im/red/red/France/) from year: 2019

## Thursday 24th January, 2019

lepinekong\_twitter

[17:20](#msg5c49f3dfc45b986d11b28124)Cool @ldci @moliad :)

[17:26](#msg5c49f55d95e17b4525a34b44)@ldci j'ai fait un copier coller du code de http://redlcv.blogspot.com/2018/11/neural-network-with-red-language.html j'ai cette erreur dans Red 0.6.3 et 0.6.4

```
*** Script Error: sbcount has no value
*** Where: set-path
*** Stack: view do-events do-actor do-safe makeTraining trainNetwork
```

## Friday 25th January, 2019

ldci

[13:16](#msg5c4b0c47cb47ec30009db5ba)je vais regarder ce pb

moliad

[15:39](#msg5c4b2dcc20b78635b67f324b)@ldci svp regarder tes direct chats... merci !  
(juste au cas où il n'apparaitrait pas dans ton gui de gitter)

## Sunday 27th January, 2019

ldci

[11:08](#msg5c4d9144975714406b4c7da0)@lepinekong\_twitter : contacte moi par mail et je t'envoie une version qui marche bien

## Monday 28th January, 2019

ldci

[12:31](#msg5c4ef63a975714406b554d8f)@lepinekong\_twitter : tu as juste à supprimer cette ligne sbcount/text: form i et ça marche.

lepinekong\_twitter

[18:05](#msg5c4f447eceb5a2264f565633)@ldci ok merci je vais tester.

[20:59](#msg5c4f6d17f04ef00644a034a8)@ldci ça marche :)

## Wednesday 30th January, 2019

lepinekong\_twitter

[17:53](#msg5c51e47dc2dba5382eb2f1d7)Pourquoi c'est si calme ici dans le temps les frenchies étaient plus actifs sur rebol non :)

moliad

[21:08](#msg5c521269f04ef00644b23123)on travaille fort :-)

## Thursday 31st January, 2019

x8x

[08:03](#msg5c52abd5f206e32ef917ea2b)@lepinekong\_twitter Les Frenchies sont passés à un niveau supérieur, c'est désormais la télépathie qu'ils utilisent. :smiley:

lepinekong\_twitter

[13:54](#msg5c52fe0df46373406a2dd94f)@moliad quoi vous travaillez pas avant :) @x8x ah benh mince j'ai pas le niveau encore ;)

moliad

[21:15](#msg5c53657b93fe7d5ac02189c3)@lepinekong\_twitter lol

DideC

[21:26](#msg5c536822975714406b7367bb)Pour discuter, les français vont sur les ronds point :-p

moliad

[21:27](#msg5c5368488aa5ca5abf635fef)et la discussion tourne en rond? ;-)

## Friday 1st February, 2019

ldci

[09:41](#msg5c541438975714406b77a021)Salut à tous  
J'ai mis sur GitHub (https://github.com/ldci/NeuralNetwork) un code pour jouer avec les réseaux de neurones :)

x8x

[09:53](#msg5c541729cf6bb14607456bd3)@ldci Merci! :thumbsup:

lepinekong\_twitter

[14:21](#msg5c5455e841775971a0bcd6a7)@DideC bonne idée évangéliser Red sur les ronds point ;)

moliad

[14:23](#msg5c54566778e1ed4103c5534f)@ldci Merci, je vais mettre mon équipe la dessus lundi. :smiley:

[14:32](#msg5c545862ceb5a2264f7866bc):tada: on se reparle, si on peut contribuer, on va le faire

rcqls

[16:03](#msg5c546de61b62f1265086a411)@ldci Premier test sur linux red/GTK: semble marchait … A voir plus en détails… J’ai tenté une cross-compilation de macOS pour générer les 2 executables linux et cela semble fonctionner pareil. Intéressant, j’irai regarder plus en détail ton blog. Merci!

ldci

[18:10](#msg5c548b9cceb5a2264f79d8cb)@rcqls : interessant car je n'ai pas testé avec red/GTK

rcqls

[18:40](#msg5c549282975714406b7b162a)@ldci testé d’abord sur mon repo (rcqls/red:GTK) qui a quelques tout petits coups d’avance sur le repo officiel (red/red:GTK) mais je crois que cela devrait être aussi ok sur celui-ci….

## Monday 4th February, 2019

ldci

[11:08](#msg5c581d4578e1ed4103dcee4b)Bonjour à tous OpenCV Red est mis à jour ici https://github.com/ldci/OpenCV3-red pour la version 0.6.4

[12:54](#msg5c5835f041775971a0d57cda)redCV est également à jour : https://github.com/ldci/redCV

x8x

[13:44](#msg5c5841b1df8a67280361b24a)Merci @ldci ! :thumbsup:

Palaing

[19:22](#msg5c58910741775971a0d7ec88)Bonsoir à tous, la doc officielle de Red inclut maintenant le Français: https://doc.red-lang.org/fr/ .  
Indulgence et corrections bienvenues.

x8x

[19:45](#msg5c589656cf6bb146074572ea)Excellent travail @Palaing , merci!! Vas tu continuer le travail et la mettre a jour? Il y a eu pas mal de updates sur la version anglaise depuis Septembre. :smiley:

Palaing

[19:47](#msg5c5896ee975714406b94c381)@x8x Bonne question! Ben pour l'instant je fais un break; chacun peut continuer, je ne m'offusquerai pas, bien au contraire!

## Tuesday 5th February, 2019

ldci

[15:07](#msg5c59a6af1b62f12650a8195f)@Palaing Bravo pour la traduction :)

## Wednesday 6th February, 2019

Palaing

[08:15](#msg5c5a978eca428b0645624b49)Merci @ldci ! Et bravo à toi pour https://github.com/ldci/NeuralNetwork , je rêve d'avoir le temps de jouer un peu avec.

## Thursday 7th February, 2019

lepinekong\_twitter

[16:48](#msg5c5c616f9221b9382d2ed85b)Il y a des écoles qui forment à Rebol ou à Red ;)

## Saturday 16th February, 2019

tmpbci

[01:30](#msg5c6767cd5095f6660c001754)ah mais rcqls est la aussi. Probablement apres pas avoir assez bien cherché : comment diable avoir un red qui utilise gtk ? il y a ton repository mais c'est une console speciale ? comment on la build ?

rcqls

[08:57](#msg5c67d074ecef85660bb4f204) @tmpbci voir la page wiki https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development. Je suis un peu à la bourre pour proposer un PR de ma dernière branche, `rcqls/red:GTK-dev`. En plus, je suis en train de bosser sur le `rich-text`. Voir aussi la room red/GTK pour plus de précision.

[08:58](#msg5c67d0caef98455ea4452921)I y a aussi @rebolek qui propose des binaires sur son site https://rebolek.com

tmpbci

[14:48](#msg5c6822b84bafd97ca3014325)@rcqls merci !

## Saturday 23th February, 2019

JLCyclo

[00:09](#msg5c708f29ab952d3085769bbb)Bonjour, j'ai une question au sujet des pull request github : j'ai fait un fork de red/community sans problème... après modifs, j'essaie de faire un pull request sur red/community... et ça n'a pas l'air de marcher.. faut-il faire une demande pour avoir des droits particuliers ?

rcqls

[05:18](#msg5c70d7959155d45d905d241e)@JLCyclo Salut, en effet ta PR n’apparait pas sur red/community…. sinon elle apparaitrait dans les PRs ouvertes. Es-tu sur de faire la demande d’un merge sur la branche red/community:master?

JLCyclo

[10:44](#msg5c7123f6e5eeec0d9bb1bbe2)

[10:45](#msg5c712463c82c68509e2217e2)en bas de page du compare, github affiche "No commit comments for this range"

rcqls

[11:23](#msg5c712d2eab952d30857a2870)En effet, la procédure a l’air d’être la bonne… Cela m’est arrivé une fois d’avoir le message 'you can still create the pull request. et je clique le bouton "create pull request »’ mais je ne me rappelle pas qu’il m’a refusé la PR. On voit en effet sur ton repo que tu peux soumettre la PR. Tu as retenté? Dans tous les cas tu peux tjrs fermer ta PR si elle ne te convient pas.

JLCyclo

[19:29](#msg5c719f1da378ef11f62ae59d)ça ne marche pas mieux... sur la page help, il y a cette note:Note: To open a pull request in a public repository, you must have write access to the head or the source branch or, for organization-owned repositories, you must be a member of the organization that owns the repository to open a pull request.

[19:29](#msg5c719f36c82c68509e250c81)je ne sais pas si elle s'applique pour mon problème

rcqls

[19:34](#msg5c71a05bc776985d8f3fa409)Tu n’ouvres pas une PR, tu ne fais que la soumettre… Heureusement qu’on peut soumettre une PR. EN revanche, c’est l’équipe red qui validera ou pas la PR. Cependant, peut-être qu'il y a un pb et qu’ils ont bloqué sans faire exprès la fonctionnalité. Tu peux les contacter sur red/help...

JLCyclo

[19:39](#msg5c71a16f85b7eb45691d6a39)faut dire aussi que mon navigateur est vieux et j'ai le message "github ne supporte plus mon browser web"

rcqls

[19:40](#msg5c71a1c2c82c68509e251c9b)Détail qu’il fallait souligner… tu sais quoi faire… c’est certainement la raison...

[19:46](#msg5c71a31a00aa630d9afe2ddb)tu as essayé de mettre à jour ton browser ou en installer un autre ?

JLCyclo

[19:51](#msg5c71a42ba7d733509db4e62c)Je pense qu'il n'est plus maintenu... OS trop vieux

rcqls

[19:52](#msg5c71a4689e430b3086b59236)Quel OS?

## Sunday 24th February, 2019

x8x

[00:08](#msg5c71e06d25d05406a1d648d5)@JLCyclo Ton browser ne supporte pas TLS1.2, toute crypto inférieure n'est pas sûre, regarde ici si ta version OS est supportée par \[Firefox ESR](https://www.mozilla.org/en-US/firefox/60.5.2/system-requirements/).

JLCyclo

[19:17](#msg5c72edcc1f1463042113c8be)J'ai ce problème de pull request sur github avec les OS: Windows Vista et Linux Ubuntu

[19:24](#msg5c72ef7bddaa310c89e45c18)Ubuntu 15.04

## Monday 25th February, 2019

JLCyclo

[12:13](#msg5c73dbf400aa630d9a0c0b01)J'ai parlé de mon problème dans red/help et quelqu'un a fait la Pull Request à mon nom

rcqls

[12:15](#msg5c73dc7cab952d30858ae2ce)Salut @JLCyclo A priori quand on est abonné à la french room on l’est aussi sur les autres comme red, help… J’irai voir un de ces 4 ta PR.

## Friday 1st March, 2019

ldci

[09:10](#msg5c78f7042ca5ec54745b2b92)une bonne nouvelle : Xavier Debecq qui était très impliqué dans Rebol rejoint redCV! On va donc pouvoir avancer plus vite :)

x8x

[13:34](#msg5c7934df5c5c1f016d4f92e3)@ldci Excellente nouvelle! Bienvenu Xavier! :smiley:

[13:35](#msg5c7935105c5c1f016d4f92e8)Apparemment plus on est, mieux c'est! :laughing:

DideC

[20:36](#msg5c7997e3d2d62067b72a35f0)Tiens, ça ne me dit rien !? Il avait un pseudo ?

tmpbci

[21:57](#msg5c79aab665ffa019ea706326)@rcqls a propos de gtk sur mac, j'ai pas verifié si x86 mais il y a plusieurs gtk disponible avec homebrew

rcqls

[22:01](#msg5c79abc7d2d62067b72abe8b)@tmpbci Salut! Je suis aussi sur homebrew et je crains d’avoir déjà cherché mais sans succès surtout au début quand je me suis mis à contribuer à red/GTK. Si tu as des pistes je suis preneur tout de même preneur bien que pour l’instant j’utilise docker sans aucun souci. Merci!

## Saturday 2nd March, 2019

tmpbci

[01:34](#msg5c79dd9165ffa019ea7196a6)@rcqls tu utilises quelle version de gtk ?

rcqls

[04:51](#msg5c7a0be1e8ea1437379aa653)@tmpbci 3.22.30 (ou autour) est celle qui est généralement installée.

## Sunday 10th March, 2019

ldci

[15:20](#msg5c852b263162ec7bc74cf097)@tous: request-font matche bien dans la console . quand on utilise view, on obtient une belle erreur: \*\** Runtime Error 1: access violation  
\*\** at: 0003EC56h  
Qui aurait une idée lumineuse?

## Tuesday 19th March, 2019

ldci

[17:49](#msg5c912ba1d0133e21e5df3aae)@rcqls J'ai testé gtk sur un linux Mint et en virtual box: bravo c'est prometteur

rcqls

[17:57](#msg5c912d9e0d719050572fd861)@ldci Merci François pour ce commentaire très sympa! Plus trop le temps d’explorer tes formidables développements pour l’instant mais ce sera avec plaisir très prochainement.

## Wednesday 20th March, 2019

ldci

[08:47](#msg5c91fe368126720abc11bade)@rcqls Pour l'instant redCV ne fonctionne pas avec redGTK. Je vais tester le Binding OpenCV qui devrait ne pas poser de pb.

[11:16](#msg5c9220f02fb6800d804e51a7)@rcqls : bon quelques pbs de libs manquantes. Il faut que je recompile OpenCV en 32 bits. Je ferai ça quand j'aurais un peu de temps :)

rcqls

[12:00](#msg5c922b7949fdaa0d81e66ee5)@ldci Cool! Du coup je regarderais aussi redCV...

## Monday 25th March, 2019

ldci

[12:32](#msg5c98ca4b8126720abc3e9310)@tous Des nouveautés pour redCV : https://redlcv.blogspot.com

rcqls

[16:02](#msg5c98fb960d71905057632b65)@ldci Je profite de cette opportunité pour tester sous Red/GTK. La bonne nouvelle que cela compile mais en effet les résultats ne sont pas bons. Je m’attendais à pire…. J’avoue que le codage des images est pour moi un peu nébuleux … J’ai notamment passer des plombes à essayer d’avoir les bonnes couleurs dans les outils de raytracing mais sans succès. La bonne nouvelle c’est que redCV est un bon labo pour debogguer les images dans red/GTK (utilisant GDK). J’ai tout de même aussi testé sous mac OS et c’est pas pas du tout. Félicitations!

ldci

[16:53](#msg5c99078952c7a91455f42535)@rcqls Génial, tu me tiens au courant. RedCV fonctionne bien avec macOS et Windows et évidemment j'attends avec impatience la version Linux/GTK:)

## Tuesday 26th March, 2019

rcqls

[15:55](#msg5c9a4b5736704f6eddd7d0c3)@ldci Je regarde ton code redCV et en effet c’est inspirant car (surement en tant qu’expert en image) tu as l’air de mieux connaître tous les formats d’images. Moi j’ai tâtonné sans complètement comprendre toutes ces variations dans les formats et d’ailleurs je n’ai pas complètement abouti. En combinant mon projet gtk.reds avec ton redCV, je compte bien (ou du moins j’espère) y voir plus clair. Les compilations en red sont trop longues, le projet gtk.reds en red/system sans la recompilation du runtime red permet une compilation en quelque seconde. A voir…. je vais peut-être déchanter plus vite que je ne crois...

ldci

[16:40](#msg5c9a55fd81b15c5e4b8d9cce)@rcqls La compilation demande absolument l'option -r depuis la version 0.6.4 ce qui n'était pas le cas avant. Je vais regarder si on peut améliorer pour le runtime. Pour les images, Red utilise 32 bits (4 entiers) format classique. J'ai encore des choses à voir sur les autres formats. A +

rcqls

[16:41](#msg5c9a56576a3d2e230d2b4a85)@ldci J’ai lu ta doc et tout est clair mais l’option -r -u ne marche pas pour la compilation de la console… (après discussion avec @qtxie).

## Tuesday 16th April, 2019

PierreChTux\_twitter

[08:39](#msg5cb594d68148e555b2b2d3c5)Bonjour à tous,

[08:40](#msg5cb59508f851ee043dc6d81e)Je cherche désespérément comment mettre un shebang correct en haut d'un script red qui tourne sur mon GNU/Linux préféré...

[08:41](#msg5cb5952ca84e0c501a3d24bc)Je sais bien: c'est pas du GTK ni même du GUI (pour le moment); n'empêche, ça me frustre un peu...

[08:42](#msg5cb5958c1f6e900d5e3fa6ab)J'ai dû mettre l'exécutable red avec un autre nom, pour éviter le conflit avec red (ed - line-oriented text editor, appelé en mode restreint):  
\# pierre@latitude: ~ &lt; 2019\_04\_16\_\_10:42:33 &gt;  
/usr/bin/redlang  
\--== Red 0.6.4 ==--  
Type HELP for starting information.

&gt;&gt;

ldci

[08:47](#msg5cb59689016a930a45ca8f09)@PierreChTux\_twitter : sur MacOS #! /usr/local/bin/red fonctionne très bien :)

PierreChTux\_twitter

[08:47](#msg5cb5969425686a7dc33c79af)Et du coup, voilà à quoi ressemble le début de mon script:

#!/usr/bin/redlang -e  
Red [  
Title: "Adjust time on a distant Pi (semopi) from the localhost time."  
]  
do load to-file system/options/cache/startup

[08:48](#msg5cb596d0bd70a40d5f5a5706)@ldci Hm... J'en concevrais quelque jalousie par rapport à MacOS, si j'étais d'humeur chagrino-mequine...

[08:49](#msg5cb5971793fb4a7dc239e37c)Quand j'appelle mon script simplement par redlang avec le script en argument, tout baigne, preuve en est:

\# pierre@latitude: ~/bin &lt; 2019\_04\_16\_\_10:48:41 &gt;  
redlang semofi\_reglage\_date\_semopi\_\_sur\_date\_hostcourant.red  
latitude  
Réglage de l'heure du semopi à partir de l'heure courante de latitude.  
Utile quand le Pi a redémarré en oubliant l'heure.  
Tue, 16 Apr 2019 08:48:48 +0000  
Date sur latitude: mardi 16 avril 2019, 10:48:48 (UTC+0200)  
Date sur semopi: Tue Apr 16 10:48:47 CEST 2019  
Tue, 16 Apr 2019 08:48:48 +0000  
Date sur semopi: Tue Apr 16 10:48:48 CEST 2019

\# pierre@latitude: ~/bin &lt; 2019\_04\_16\_\_10:48:49 &gt;

[08:50](#msg5cb597498148e555b2b2e361)En revanche, si je souhaite démarrer le script de manière classique avec la ligne shebang, ça m3rdoie:

\# pierre@latitude: ~/bin &lt; 2019\_04\_16\_\_10:48:49 &gt;  
semofi\_reglage\_date\_semopi\_\_sur\_date\_hostcourant.red  
\** Script Error: Invalid compressed data - problem: -3  
\** Near: script: decapsulate  
if none? script

\# pierre@latitude: ~/bin &lt; 2019\_04\_16\_\_10:50:03 &gt;

ldci

[08:53](#msg5cb597fcbd70a40d5f5a5fe4)Il me semble qu'il manque # avant le !/usr/bin/redlang. A quoi correspond le -e ?

PierreChTux\_twitter

[08:55](#msg5cb598653ebbdc55b3c772ec)Le # est bien là. Je tente de le mettre entre pour qu'il soit lisible:  
`# pierre@latitude: ~/bin < 2019_04_16__10:54:09 > head semofi_reglage_date_semopi__sur_date_hostcourant.red #!/usr/bin/redlang -e Red [ Title: "Adjust time on a distant Pi (semopi) from the localhost time." ] do load to-file system/options/cache/startup HOSTNAME: trim_last_char call_wait_output_error "hostname" print rejoin ["Réglage de l'heure du semopi à partir de l'heure courante de " HOSTNAME "." newline "Utile quand le Pi a redémarré en oubliant l'heure."] call_wait_output_error "date -R -u" tt: trim_last_char call_output call_wait_output_error rejoin [{sh -c 'echo "Date sur } HOSTNAME {:`date`"'}]`

[08:55](#msg5cb59882a0790b29c9c5f8c1)Bon. Ce c\*uill\*n de gittruc bouffe le #, de toute évidence.

[08:57](#msg5cb59916759abc043ccd78d2)\[!\[capture\_2019\_04\_16\_\_10:55:56\_window.png](https://files.gitter.im/red/red/France/zDtr/thumb/capture\_2019\_04\_16\_\_10\_55\_56\_window.png)](https://files.gitter.im/red/red/France/zDtr/capture\_2019\_04\_16\_\_10\_55\_56\_window.png)

[08:58](#msg5cb59931b34ccd69e7c83040)Voilà. Obligé de mettre une capture d'écran pour montrer un terminal, j'ai honte.

[09:01](#msg5cb599e7a84e0c501a3d46d9)\[!\[image.png](https://files.gitter.im/red/red/France/YezR/thumb/image.png)](https://files.gitter.im/red/red/France/YezR/image.png)

[09:01](#msg5cb599f6f851ee043dc6f9f5)Le -e , j'ai rajouté ça par prudence: ça fait de l'encap, pour interpréter et non compiler:

\# pierre@latitude: ~ &lt; 2019\_04\_16\_\_11:00:34 &gt;  
redlang -h | grep "\\-enc"  
\-e, --encap : Compile in encap mode, so code is interpreted

[09:03](#msg5cb59a560aad635019911ace)Si j'enlève le -e, ça fait pareil:

\** Script Error: Invalid compressed data - problem: -3  
\** Near: script: decapsulate  
if none? script

[09:04](#msg5cb59a8431aec969e8b40eeb)Bon, ça n'est pas dramatique; c'est juste que ça rend assez laborieuse l'écriture de jobs cron ou autres bidules de tous les jours...

[09:05](#msg5cb59ace759abc043ccd843e)Sinon, question géographique: je suis à Paris en ce moment (pas pour longtemps): ça dirait à quelqu'un de se retrouver dans cette capitale (meurtrie) pour boire un coup et parler de choses positives, à savoir Red et son Avenir Radieux?

ldci

[09:06](#msg5cb59af8016a930a45caad34)@PierreChTux\_twitter : bien évidemment :) Dis-moi quand ça t'arrange

PierreChTux\_twitter

[09:06](#msg5cb59b0493fb4a7dc239fb93);)

[09:06](#msg5cb59b13c55bd14d35f32235)Cet après-midi? Demain?

ldci

[09:07](#msg5cb59b5420fbe911eec3d15c)Suis libre en fin d'après-midi

PierreChTux\_twitter

[09:09](#msg5cb59bd73ebbdc55b3c78d78)Allez. Rendez-vous où? Je suis mobile, véhiculé par les transports communistes.

ldci

[09:11](#msg5cb59c293ebbdc55b3c79116)Je te propose l'EPHE 4-14 rue Ferrus Paris 14 dans mon bureau de Doyen :)

PierreChTux\_twitter

[09:11](#msg5cb59c41f851ee043dc70b1d)Doigt-ien? Allez, ça marche.

ldci

[09:12](#msg5cb59c7d3ebbdc55b3c7948b)OK vers 17 heures? Tu prends l'escalator et ensuite monte au 2 étage avec les ascebceurs

[09:13](#msg5cb59cb2f851ee043dc7100f)ascenseurs. L'EPHE est à gauche en sortant. Faut sonner à la porte. Le mieux serait 16h45 car il y a encore du monde à l'accueil

PierreChTux\_twitter

[09:14](#msg5cb59cf1759abc043ccd9593)Est-ce bien là?

https://www.openstreetmap.org/#map=18/48.83100/2.34000&amp;layers=G

ldci

[09:15](#msg5cb59d24016a930a45cab959)Oui juste à coté du Mariott Hotel

PierreChTux\_twitter

[09:15](#msg5cb59d4125686a7dc33ca996)Ça roule.

[09:15](#msg5cb59d498148e555b2b30eeb)À tout à l'heure!

ldci

[09:16](#msg5cb59d54759abc043ccd97b6)Génial A tout à l'heure

PierreChTux\_twitter

[09:17](#msg5cb59d9431aec969e8b42336)Si ya d'autres fous pour rigoler un peu plus, en suivant le vieil adage, dans cette conurbation très étrange qu'est Paris, tout est indiqué!

[09:17](#msg5cb59da920fbe911eec3e004)(j'espère que le bureau du doigt-ien est grand... capacité de ? 2000 personnes?...)

ldci

[09:17](#msg5cb59dab3ebbdc55b3c79b8a)Yep )

PierreChTux\_twitter

[09:17](#msg5cb59db020fbe911eec3e067)Coule

[13:12](#msg5cb5d4d531aec969e8b59a33)Les transports pas risiens étant ce qu'ils sont, ainsi que les enchaînements de rendez-vous, je crains de ne pas pouvoir arriver très tôt.

ldci

[13:14](#msg5cb5d52e20fbe911eec570c4)Tu me mets un message quand tu arrives à Ferrus

PierreChTux\_twitter

[14:13](#msg5cb5e2f73ebbdc55b3c99ad6)Dans le XVIème, 2h de décalage des rendez-vous... Je pense être libéré entre 17 et 18h.Quid de votre emploi du temps, @ldci ? Compatible?

[14:13](#msg5cb5e2ff1f6e900d5e41c891)Sinon demain?

ldci

[14:13](#msg5cb5e31d8148e555b2b51daa)Ca me va j'ai des RV demain

[15:23](#msg5cb5f376759abc043cd00402)Je voulais dire, ça me va ce soir :)

moliad

[15:32](#msg5cb5f5a1016a930a45cd606d)bonjour tout le monde, ici Maxim de Montréal, je serai à Paris dans la semaine du 28 avril ce serais sympa si on pouvais se retrouver un soir de cette semaine là pour souper et/ou s'alcooliser :thumbsup: avec d'autre Redboleurs. le devcon de paris (2007) ça fait déjà une décennie!

PierreChTux\_twitter

[15:38](#msg5cb5f6e520fbe911eec67429)Chouchou Semaine du 28 avril? Ah, pas sûr que je puisse me libérer. Mais je vais voir si c'est possible!

[15:38](#msg5cb5f6f893fb4a7dc23ccc42)Pas chouchou =&gt; coucou

[15:38](#msg5cb5f7101f6e900d5e425886)Je pars du XVIème.

ldci

[15:39](#msg5cb5f74ef851ee043dc99c88)@PierreChTux\_twitter : tu me mets un message quand tu arrives

[15:40](#msg5cb5f758c55bd14d35f5d1e9)Je viendrais t'ouvrir

moliad

[15:40](#msg5cb5f75ec55bd14d35f5d207)nous serons dans le 11iem arrondissement :-)

ldci

[15:41](#msg5cb5f7a3f851ee043dc99efa)@moliad : je serai ravi de passer un moment : tu peux préciser tes dates?

moliad

[15:42](#msg5cb5f7eb8148e555b2b5b252)nous serons disponible à partir du 28 avril (dimanche) jusqu'au 3 mai (vendredi)

ldci

[15:43](#msg5cb5f82da0790b29c9c8b93a)Bon pas de pb: je suis parisien toute cette semaine

PierreChTux\_twitter

[16:25](#msg5cb601dfa4ef097471ab4ba8)Ascenseur

## Wednesday 17th April, 2019

moliad

[13:47](#msg5cb72e6ea4ef097471b35590)toutes mes condoléances pour la cathédrale. je me compte chanceux d'avoir pu la visiter 2 fois déjà.

## Sunday 21st April, 2019

PierreChTux\_twitter

[08:49](#msg5cbc2eb797dcb371d8ea8654)Merci @moliad . Je l'ai vue plusieurs fois, mais je ne l'avais pas visitée, ou alors j'étais trop petit pour en avoir gardé un souvenir.

## Thursday 25th April, 2019

ldci

[12:50](#msg5cc1ad1d97dcb371d80f824a)la mise à jour de redCV avec les nouvelles fonctions de distance: https://github.com/ldci/redCV

## Friday 26th April, 2019

PierreChTux\_twitter

[06:08](#msg5cc2a04ab4700e023dd4706a)Ah, super, ça tombe à point nommé: j'ai pris une journée de congé aujourd'hui, et il fait trop froid pour bricoler dehors.Zou!

[06:09](#msg5cc2a080990feb4518048444)"This library needs View  
For Windows and macOS. Available for Linux ASAP."

[06:09](#msg5cc2a0941cd0b8307d74e6da);-[

rcqls

[06:25](#msg5cc2a46bb4700e023dd48f55)@PierreChTux\_twitter Marche avec Linux avec la branch `rcqls/GTK-dev` avec compilation à partir des sources (pour le moment)...

PierreChTux\_twitter

[06:46](#msg5cc2a9365b3f941aa593b192)Au quai, super!

[06:48](#msg5cc2a9cf8446a6023e7accfd)Ah? Je ne vois pas cette branche, dans le Red que je viens tout juste de puller...

rcqls

[06:50](#msg5cc2aa434b4cb471d95c5baa)`https://github.com/rcqls/red` branch GTK-dev ...

PierreChTux\_twitter

[06:51](#msg5cc2aa7c97dcb371d816514c)Ah, au quai. J'avais pas pigé que c'était pas dans le repositoire principal. J'y vais.

rcqls

[06:54](#msg5cc2ab0b8446a6023e7ad43d)Regardes `https://github.com/rcqls/reds` pour compiler à partir des sources

PierreChTux\_twitter

[06:55](#msg5cc2ab5fe416b84519e15688)Question c0n: je git clone directement à partir de ce repositoire, et je pourrais y faire des pull requests directement tranquillou? Ou faut-il plutôt que je forke ça sur mon github?

rcqls

[07:24](#msg5cc2b2473b6cb0686a55c88f)git clone suffit ….

[08:00](#msg5cc2ba8eb4700e023dd52c28)@PierreChTux\_twitter J’ai ajouté un peu plus d’aide sir le README de \[https://github.com/rcqls/reds](https://github.com/rcqls/reds) pour compiler un example de redCV

PierreChTux\_twitter

[09:00](#msg5cc2c8b22e2caa1aa6bfdb19)Au quai, merci!

[14:48](#msg5cc31a4fb4700e023dd7f60e)Bon, j'ai réussi à compiler tout ça, mais il me manque de la GTK, de toute évidence.

```
# pierre@latitude: ~/dev/red_rcqls        < 2019_04_26__16:27:32 >
reds -r environment/console/CLI/console-view.red 
...
Compiling to native code...
Script: "Red/System ELF format emitter" (none)
...compilation time : 70379 ms
...linking time     : 810 ms
...output file size : 972664 bytes
...output file      : /home/pierre/heaume_pierre/developpt/red_rcqls/console-view 



  # pierre@latitude: ~/dev/red_rcqls        < 2019_04_26__16:27:32 >
./console-view 
./console-view: error while loading shared libraries: libgtk-3.so.0: cannot open shared object file: No such file or directory
```

[14:49](#msg5cc31a638446a6023e7e22b9)J'ai bêtement fait un

```
# root@latitude: ~        < 2019_04_26__16:43:35 >
apt install libgtk-3-dev
```

mais cela n'a rien changé...

rcqls

[14:50](#msg5cc31a9c990feb451807f4b9)Je t’ai mis les indications dans le readme…. voir requirements

PierreChTux\_twitter

[14:50](#msg5cc31aae990feb451807f542)Ah ouais, j'avais pas fini de lire... RTFM, autoconseil.

[15:31](#msg5cc3244bb489bb6ed7cc2e37)\[!\[image.png](https://files.gitter.im/red/red/France/123v/thumb/image.png)](https://files.gitter.im/red/red/France/123v/image.png)

[15:31](#msg5cc324558790b0307e06f9e1)Joie incommensurable. Mille merci, @rcqls , j'ai du VIEW mû par Red sur ma Debian!

[15:32](#msg5cc324ab8790b0307e06fcf4)Allez, je vais passer en Red un des rares programmes graphiques utiles que j'ai fait en Rebol: un grapheur de presse-papiers. Yapuka.  
Et je vais voir ce fameux RedCV.  
Dans la joie.

rcqls

[15:49](#msg5cc328851cd0b8307d78d5a3)@PierreChTux\_twitter Si tu ne souhaites que jouer avec red/GTK il y a la page du wiki \[GTK-bindings](https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development) et parmi les liens il y a \[https://toltex.u-ga.fr/users/RCqls/Red/console-view](https://toltex.u-ga.fr/users/RCqls/Red/console-view) qui pointe sur le dernier console-view que je génère (donc parfois instable).En revanche, @rebolek met un site à disposition pour des binaires. Amuses-toi bien!

[15:52](#msg5cc3293d5b3f941aa59765a4)Aussi n’oublies pas de tester les repos red/code et red/community (comme dit dans mon readme du projet reds) qui montre assez bien l’avancée de red/GTK.

ldci

[15:59](#msg5cc32acf375bac74700cdada)@rcqls Bon j'ai testé un peu sur un Mint 32 bits dans une VB. Pour le gui ça marche assez bien dans l'ensemble avec cependant des problèmes d'ajustement des faces. Sur cette version de Mint, la plupart du code ne fonctionne pas bien (image mal décodées, erreur de pointeur...). Curieusement selon le thème utilisé par Mint on obtient des résultats différents ! Dernier point cette instruction n'a pas fonctionné : git checkout origin/GTK-dev # user mode. J'obtiens un fatal error. En tout cas c'est encourageant et ce serait vraiment utile d'avoir un red pour linux.

rcqls

[16:02](#msg5cc32b8fb489bb6ed7cc60c4)@ldci tu n’étais pas sur la branche rcqls/GTK-dev ? Cela ne marche bien qu’avec la modification de hier soir sur cette branche de développement…. Conversion marche parfaitement pour moi par exemple… ce qui n’était pas le cas avant hier soir! Je prépare un Vagrantfile pour avoir une VBox qui marche avec le rcqls/GTK-dev….

ldci

[16:06](#msg5cc32c748446a6023e7ea941)@rcqls : je réinstalle proprement et je te dis. Normalement j'ai du prendre cette branche Dev

rcqls

[16:07](#msg5cc32cccb4700e023dd87b0e)@ldci Utilises-tu mon reds ? il fait l’équivalent du binaire red… et surtout s’utilise à partir de la console macOS

ldci

[16:09](#msg5cc32d452e2caa1aa6c2c843)oui c'est très bien reds et ça compile parfaitement

rcqls

[16:10](#msg5cc32d5ab4700e023dd8805f)Fais un git branch pour savoir sur quelle branche tu étais…

ldci

[16:10](#msg5cc32d8e97dcb371d81a0739)Je suis en train de refaire un VB propre

rcqls

[16:11](#msg5cc32d994b4cb471d96040e6)Donc le git checkout tu dois le faire dans la console macOS en crosscompilation… pas dans la machine virtuelle...

ldci

[17:35](#msg5cc3416cb489bb6ed7cd07da)@rcqls : Bravo ça fonctionne très bien avec la gtk-dev . Exemple: https://drive.google.com/file/d/1NbHHmKSx6H4RcAh3yR61OZNgUvgnwE5V/view?usp=sharing

rcqls

[17:39](#msg5cc342358790b0307e07da4a)@ldci Cool! Ceopendanr celui-là marchait bien pour moi avant mon fix de hier. As-tu pu tester Conversion? Celui-là ne marchait pas avant hier soir… En fait les erreurs venaient lorsque acquire-buffer était utilisé… Bravo toi-aussi pour ces jolis rendus!

ldci

[17:57](#msg5cc34685e416b84519e5d23b)@rcqls Conversion marche très bien :)

rcqls

[18:45](#msg5cc351c197dcb371d81b1bef)@ldci Excellent! Tu me diras(aucune urgence) lorsque tu trouves des exemples qui ne marchent pas…. J’en ai pas trouvé en les comparant au macOS.

PierreChTux\_twitter

[20:08](#msg5cc3654b1cd0b8307d7a7f0e)Bon, tout ça est impeccable!  
Tout ce que j'ai testé jusqu'ici fonctionne à merveille, que du bonheur, merci @rcqls !

[20:09](#msg5cc3656db4700e023dda041e)Maintenant, j'utilisais plein de trucs et bidules Rebol pour lesquels il va me falloir réécrire et/ou adapter.

ldci

[20:10](#msg5cc365bc375bac74700e8482)On est plus intelligent à plusieurs

PierreChTux\_twitter

[20:10](#msg5cc365c71cd0b8307d7a8196)@ldci hihi!

ldci

[20:11](#msg5cc365dc5b3f941aa5991026)Et oui

rcqls

[20:11](#msg5cc365e43d78aa6c039dcca7)@PierreChTux\_twitter Bonne nouvelle si tout fonctionne bien! Super aussi pour tes futures adaptations!

PierreChTux\_twitter

[20:11](#msg5cc3660d8790b0307e08ce52)Un truc absolument majeur pour moi, c'est l'accès à PostgreSQL, qui se fait d'une manière extraordinairement simple en Rebol.

ldci

[20:12](#msg5cc366123d78aa6c039dcde0)En tout cas pour RedCV c’est géant

PierreChTux\_twitter

[20:12](#msg5cc36630990feb45180a147c)Allez, j'essaye RedCV. Ou je dors et je fais ça demain?...

ldci

[20:13](#msg5cc3665197dcb371d81ba862)Tu n’en auras pas pour longtemps

PierreChTux\_twitter

[20:13](#msg5cc366661cd0b8307d7a8563)@ldci hihi. Allez, je dormirai plus tard! C'est parti!

ldci

[20:13](#msg5cc3666d8446a6023e80365a)Red est génial

PierreChTux\_twitter

[20:13](#msg5cc366874b4cb471d961e636)Oui. Quoique parfois, un nom plus... oh, pardon.

ldci

[20:13](#msg5cc3668797dcb371d81ba95a)Tu me tiens au courant

PierreChTux\_twitter

[20:14](#msg5cc366944b4cb471d961e660)J'ai failli jouer à mon Shadwolf...

rcqls

[20:14](#msg5cc366a3e416b84519e6bd5e)@ldci Je viens de créer un Vagrantfile pour lancer facilement une ubuntu i386 et tester red/GTK, redCV ….

ldci

[20:15](#msg5cc366d3a4ef09747104f80c)Ok tu mets ça où ?

rcqls

[20:16](#msg5cc3672e6a84d76ed8fd953a)Je le peaufine et je pense que je le mettrais dans un repo vagrant-red-gtk pour la comparaison avec docker-red-gtk.

ldci

[20:17](#msg5cc36744b489bb6ed7ce190d)Bon Shadwolf, le retour ?

[20:17](#msg5cc367664b4cb471d961e9b6)@rcqls merci

PierreChTux\_twitter

[20:18](#msg5cc367908790b0307e08d9d0)&gt; Bon Shadwolf, le retour ?

;-D

Non, non, c'est pas moi, promis!  
Mais si je m'applique un peu, je dois pouvoir faire un peu dans ce genre...

ldci

[20:18](#msg5cc367b0e416b84519e6c38a)Ah les géologues !

PierreChTux\_twitter

[20:19](#msg5cc367b6990feb45180a1c8d)Il traîne par ici, ce redoutable et formidable personnage?

[20:19](#msg5cc367c5990feb45180a1d71)Pourquoi, il est géologue, aussi, Shadwolf??

ldci

[20:19](#msg5cc367d3990feb45180a1d96)Non pas sur red

[20:19](#msg5cc367e92e2caa1aa6c45d28)C’était un joke

PierreChTux\_twitter

[20:20](#msg5cc367f15b3f941aa5991f60);-)

[20:20](#msg5cc368205b3f941aa59920c4)Putaise, mais c'est énorme, ce redCV!

ldci

[20:21](#msg5cc36832a4ef097471050400)Merci

PierreChTux\_twitter

[20:21](#msg5cc3683de416b84519e6c7f7)

```
# pierre@latitude: ~/dev        < 2019_04_26__22:16:16 >
git clone https://github.com/ldci/redCV red_cv
Clonage dans 'red_cv'...
remote: Enumerating objects: 71, done.
remote: Counting objects: 100% (71/71), done.
remote: Compressing objects: 100% (49/49), done.
Réception d'objets:  96% (1674/1732), 65.05 MiB | 329.00 KiB/s   
...
```

[20:21](#msg5cc3684a1cd0b8307d7a91d1)Ah non, ça n'était pas du tout un compliment!

[20:21](#msg5cc3685397dcb371d81bb74e)Je parlais de la taille!

[20:21](#msg5cc36862375bac74700e97b2)Ma ligne ADSL provinciale est saturée...

[20:21](#msg5cc36865990feb45180a21ee)Ah, ça y est...

ldci

[20:22](#msg5cc3687d2e2caa1aa6c45fc0)Tu rigoles c’est tout petit

PierreChTux\_twitter

[20:22](#msg5cc368803b6cb0686a5b1006)C'est arrivé, je pars à la découverte de ce bidule.

ldci

[20:22](#msg5cc36893a4ef0974710505be)Bon test

PierreChTux\_twitter

[20:22](#msg5cc368a397dcb371d81bb971)

```
# pierre@latitude: ~/dev/red_cv        < 2019_04_26__22:22:05 >
du -sh .
96M     .
```

J'en ai une petite.

[20:23](#msg5cc368ab8790b0307e08e228)Bande passante, je veux dire...

[20:23](#msg5cc368c01cd0b8307d7a964a)C'est un truc que j'adorais dans Rebol, c'est la minusculité des choses.

ldci

[20:23](#msg5cc368d4b489bb6ed7ce240c)Et j’espère c’est énorme 😀

PierreChTux\_twitter

[20:23](#msg5cc368dd990feb45180a2547)Hihi.

ldci

[20:24](#msg5cc3690f97dcb371d81bbd38)Quand même tu as un opencv riquiqui

PierreChTux\_twitter

[20:25](#msg5cc369214b4cb471d961f616)96M tout de même!

ldci

[20:25](#msg5cc3692c5b3f941aa5992845)Pour le même prix

[20:26](#msg5cc3695a375bac74700e9fcf)Tu es sûr pour la taille ?

[20:26](#msg5cc3698397dcb371d81bc26b)Je vais vérifier

PierreChTux\_twitter

[20:26](#msg5cc36983e416b84519e6d033)Oui, c'est ce que je viens d'avoir en git clonant:

```
# pierre@latitude: ~/dev        < 2019_04_26__22:16:16 >
git clone https://github.com/ldci/redCV red_cv
Clonage dans 'red_cv'...
remote: Enumerating objects: 71, done.
remote: Counting objects: 100% (71/71), done.
remote: Compressing objects: 100% (49/49), done.
remote: Total 1732 (delta 25), reused 50 (delta 22), pack-reused 1661
Réception d'objets: 100% (1732/1732), 81.25 MiB | 273.00 KiB/s, fait.
Résolution des deltas: 100% (968/968), fait.

  # pierre@latitude: ~/dev        < 2019_04_26__22:21:43 >
cd red_cv/

  # pierre@latitude: ~/dev/red_cv        < 2019_04_26__22:22:05 >
du -sh .
96M     .
```

[20:27](#msg5cc369a84b4cb471d961f8ce)Ah oui...

rcqls

[20:27](#msg5cc369cd375bac74700ea246)c’est le .git qui est lourd surement àcause de l’historique des images….

PierreChTux\_twitter

[20:28](#msg5cc369df2e2caa1aa6c4678a)C'est effectivement tout petit:

```
# pierre@latitude: ~/dev/red_cv        < 2019_04_26__22:22:31 >
du -sh *
11M     docs
1.5M    images
896K    libs
12K     README.md
1.1M    samples
```

C'est le git qui prend toute la place, en fait:

```
# pierre@latitude: ~/dev/red_cv        < 2019_04_26__22:27:07 >
du -sh .git
82M     .git
```

ldci

[20:28](#msg5cc369ed97dcb371d81bc546)Ah je sais : des images dans le répertoire

PierreChTux\_twitter

[20:28](#msg5cc369f05b3f941aa5992d86)@rcqls oui, exactement.

[20:29](#msg5cc36a2a8790b0307e08eb3a)@ldci même pas: elles ne font guère qu'1.5M, ça tiendrait presque sur une disquette. C'est tout le bazar de git qui est dans .git qui prend cette place.

[20:29](#msg5cc36a325b3f941aa5992fbb)Pagrave.

ldci

[20:30](#msg5cc36a6c97dcb371d81bc8ea)Bon je vais virer les images

PierreChTux\_twitter

[20:30](#msg5cc36a7e5b3f941aa599322d)@ldci non, non, surtout pas!

ldci

[20:31](#msg5cc36a922e2caa1aa6c46b7c)Ok

PierreChTux\_twitter

[20:31](#msg5cc36ab6375bac74700ea67e)C'est uniquement lors du premier git clone que la chose est un peu lourde (et encore: uniquement pour les bouseux comme moi ou les Africains); ensuite, tout se fait de manière superlégère par git.

ldci

[20:32](#msg5cc36acd2e2caa1aa6c46d15)En tout cas le code est est petit

rcqls

[20:32](#msg5cc36ade8790b0307e08ee0a)Il faudrait juste simplifier le .git mais je ne vois pas comment faire sans reconstruire le projet… à voir...

ldci

[20:33](#msg5cc36afc5b3f941aa599361c)Yep à voir

PierreChTux\_twitter

[20:33](#msg5cc36b00b489bb6ed7ce3281)&gt; En tout cas le code est est petit  
Et, comme nous le pensons en filigrane depuis un moment, ça n'est pas la taille qui compte, que la manière de s'en servir...

rcqls

[20:33](#msg5cc36b09375bac74700ea906)Virer les images ne supprimerait que 1.5M

ldci

[20:33](#msg5cc36b143d78aa6c039df044)Trop vieux pour ça

PierreChTux\_twitter

[20:34](#msg5cc36b474b4cb471d962024a)@rcqls non, on s'en tape, ça n'a rien de grave. Il vaut mieux que ça soit un peu lourdingue au départ, comme ça l'est maintenant, mais qu'on garde l'historique des commit et autres branches, qui est précieux comme tout.

rcqls

[20:34](#msg5cc36b616a84d76ed8fdb15d)Tu as raison un petrit jeune pourrait y réfléchir!….

ldci

[20:35](#msg5cc36b89e416b84519e6e006)Et oui

PierreChTux\_twitter

[20:35](#msg5cc36b973b6cb0686a5b2566)Purée, il y en a qui ne se foulent pas trop, pour les commentaires des commit!  
Et moi qui faisais des complexes de ne pas assez documenter mes commit, me voilà totalement décomplexé!

ldci

[20:36](#msg5cc36bc0b4700e023dda2c7b)Bienvenue au club

PierreChTux\_twitter

[20:36](#msg5cc36bca3d78aa6c039df665);)

rcqls

[20:36](#msg5cc36bdd375bac74700eae2f)@PierreChTux\_twitter tu as raison sauf que l’historique aussi lourd n’est certainement pas lié au code mais à des binaires (images à mon avis) qui ont été supprimé mais qui restent dans le .git

PierreChTux\_twitter

[20:36](#msg5cc36bea97dcb371d81bd38a)Ah!

moliad

[20:37](#msg5cc36c263d78aa6c039df935)y' a une commande git qui peut supprimer des nodes qui ne sont plus liés activement... je me rapelle plus comment mais ça se fait.

[20:38](#msg5cc36c2d8790b0307e08f83d)(dans git)

ldci

[20:38](#msg5cc36c2e8446a6023e80603b)Ah la génération java

[20:38](#msg5cc36c5697dcb371d81bd5b5)@max tu es quand sur Paris ?

PierreChTux\_twitter

[20:39](#msg5cc36c79b4700e023dda2f50)Ah non, pas de gros mots! java, mais quelle horreur!

ldci

[20:39](#msg5cc36c97b4700e023dda2f79)Joke

PierreChTux\_twitter

[20:40](#msg5cc36ca0b4700e023dda2f90)Hihi. Got it...

ldci

[20:41](#msg5cc36d09a4ef097471051fb5)Bon les folks je bosse demain. Bonne soirée

PierreChTux\_twitter

[20:42](#msg5cc36d20b4700e023dda3203)Bonne nuit. Travail en gilet jaune?

moliad

[20:42](#msg5cc36d2fb4700e023dda3265)@ldci j'arrive demain soir, nous serons dispo à partir de dimanche

ldci

[20:42](#msg5cc36d31375bac74700eb7bb)Cité des sciences

PierreChTux\_twitter

[20:42](#msg5cc36d426a84d76ed8fdc1a6)@ldci super!

[20:43](#msg5cc36d862e2caa1aa6c47e42)@moliad Bon voyage! Ne pas oublier un gilet jaune, manière d'être dans le bain du moment!  
La redbolution française 2.0...

[20:44](#msg5cc36d94a4ef097471052524)Plutôt yellowlution, d'ailleurs...

ldci

[20:44](#msg5cc36da06a84d76ed8fdc50d)@moliad suis retenu lundi soir mais libre à partir de mardi

moliad

[20:44](#msg5cc36db56a84d76ed8fdc533)l'hotel est sur la place de la nation en plus

[20:44](#msg5cc36db8b4700e023dda3655):-)

PierreChTux\_twitter

[20:44](#msg5cc36dc93d78aa6c039e03db)@moliad vous êtes invité dans le Sud-Ouest, dans le Gers. Gîte et couvert.

ldci

[20:45](#msg5cc36dd08790b0307e09062a)Génial

moliad

[20:45](#msg5cc36ddab4700e023dda3681)parfais. la meilleure journée pour moi est le mercredi

ldci

[20:45](#msg5cc36df72e2caa1aa6c4802c)On fait un red conf dans le Gers

rcqls

[20:46](#msg5cc36e224b4cb471d9621761)@PierreChTux\_twitter Du sud-ouest? Je suis originaire de Pau …

PierreChTux\_twitter

[20:46](#msg5cc36e278446a6023e806ca9)&gt; On fait un red conf dans le Gers

Alors ça, sans aucun problème! J'ai une grosse salle mise à disposition par la mairie, un réseau de gîtes et chambres d'hôtes.

moliad

[20:46](#msg5cc36e3a3d78aa6c039e07b3)hehe nous irons à Lyon pour une journée de meeting et hop on reviens le soir à Paris

PierreChTux\_twitter

[20:46](#msg5cc36e3ce416b84519e6ef54)&gt; @PierreChTux\_twitter Du sud-ouest? Je suis originaire de Pau …

Boudiou! Un Béarnais!  
Je suis à Condom, dans le Gers.

[20:47](#msg5cc36e5c3b6cb0686a5b3638)Et je suis Basque (entre autres) d'origine...

ldci

[20:47](#msg5cc36e5e3d78aa6c039e07fe)@max ok pour mercredi

PierreChTux\_twitter

[20:48](#msg5cc36e8e3b6cb0686a5b36c6)@moliad et @ldci amusez-vous bien et picolez un bon coup!

rcqls

[20:48](#msg5cc36eb88446a6023e806e3a)@PierreChTux\_twitter pelotari cela te parle en tant quie basque alors… cela a occupépé toute ma jeunesse!

ldci

[20:49](#msg5cc36ebc8446a6023e806e3f)Tu rigoles

PierreChTux\_twitter

[20:49](#msg5cc36eda3b6cb0686a5b3994)@rcqls expatrié à Grenoble? J'y ai travaillé, il y a une paire d'années. J'avais d'ailleurs un collègue, un libriste (nous n'étions que deux dans la boîte), qui était intéressé par RedBol.

moliad

[20:49](#msg5cc36edcb4700e023dda3e7d)&gt; amusez-vous bien et picolez un bon coup!

pas besoin de conduire... je vais définitement en profiter

PierreChTux\_twitter

[20:50](#msg5cc36effe416b84519e6f4f6)&gt; @PierreChTux\_twitter pelotari cela te parle en tant quie basque alors… cela a occupépé toute ma jeunesse!

Saine occupation!

ldci

[20:50](#msg5cc36f0a3b6cb0686a5b3a62)Je reviens de Grenoble

rcqls

[20:50](#msg5cc36f0f3b6cb0686a5b3b2a)@PierreChTux\_twitter Yep sur grenoble depuis 94...

[20:50](#msg5cc36f268790b0307e090dd0)@ldci Non, tu étais où?

PierreChTux\_twitter

[20:51](#msg5cc36f4a2e2caa1aa6c48754)Je n'ai habité que trois ans en Xiberoa, et je n'ai guère taquiné la pilota qu'en tapant quelques coups au fronton de Bildoze, pour rigoler, avec copains et pitchounets.

rcqls

[20:51](#msg5cc36f696a84d76ed8fdcfc3)Ah ah ah...

PierreChTux\_twitter

[20:52](#msg5cc36f71b4700e023dda4078)&gt; &gt; amusez-vous bien et picolez un bon coup!  
&gt; pas besoin de conduire... je vais définitement en profiter

@ldci connaît de TRÈS bonnes adresses. Tout du moins UNE très bonne.

ldci

[20:52](#msg5cc36f83375bac74700ec873)@rcqls dans le Trieve

PierreChTux\_twitter

[20:52](#msg5cc36f9a8446a6023e807263)C'est marrant, ici, c'est le bordel. On se croirait presque sur AltMe.

ldci

[20:52](#msg5cc36fa7b4700e023dda41dc)Saint jean d’herans

moliad

[20:53](#msg5cc36fb45b3f941aa5995980)@PierreChTux\_twitter une bonne partie des users s'y sont clonés ;-)

rcqls

[20:53](#msg5cc36fdc8790b0307e09126d)Très beau le Triève…

ldci

[20:54](#msg5cc36fea3b6cb0686a5b3f62)Yep

PierreChTux\_twitter

[20:54](#msg5cc37000b4700e023dda4461)AltMe, j'avais essayé, très rigolo, mais purée, le temps que ça faisait perdre! J'avais arrêté quand j'étais parti en mission, et puis voilà.

rcqls

[20:56](#msg5cc3706e990feb45180a5fdc)@ldci J’ai un pote qui habite au village à côté cornillon…. Marrant…

moliad

[20:56](#msg5cc3709097dcb371d81bf650)Didec est'il encore un Redboléen ?

[20:56](#msg5cc370983b6cb0686a5b4449)y'en a qui le voient encore?

ldci

[20:57](#msg5cc370a14b4cb471d962297c)J’espère

PierreChTux\_twitter

[20:58](#msg5cc370e8a4ef097471053aad)Ah, cagade, redcv me fait des cacanerveux.

```
# pierre@latitude: ~/dev/red_cv/libs        < 2019_04_26__22:56:28 >
reds -c redcv.red 
[...]
REBOL/View 2.7.8.4.3 6-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM


Type desktop to start the Viewtop.
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.6.4 ===- 

Compiling /home/pierre/heaume_pierre/developpt/red_cv/libs/redcv.red ...
Compiling libRedRT...
...compilation time : 1185 ms

Compiling to native code...
Script: "Red/System ELF format emitter" (none)
...compilation time : 38128 ms
...linking time     : 507 ms
...output file size : 661092 bytes
...output file      : /home/pierre/heaume_pierre/developpt/red_cv/libs/libRedRT.so 

*** Compilation Error: undefined word layout 
*** in file: /home/pierre/heaume_pierre/developpt/red_cv/libs/redcv.red
*** near: [layout [
        title title 
        image 256x256
    ] 
    view/no-wait win 
    win
]
```

Scrogneugneu.

rcqls

[20:59](#msg5cc3713f4b4cb471d9622d82)`reds -r`?

ldci

[21:00](#msg5cc3716a97dcb371d81bfa1f)bonne question

rcqls

[21:01](#msg5cc371928790b0307e091d78)non c’est sur … `reds -c` ne marche pas c’est sur… en linux

PierreChTux\_twitter

[21:01](#msg5cc371a3b489bb6ed7ce6891)&gt; Didec est'il encore un Redboléen ?

Je n'ai jamais \*vu* personne de Redboléen avant le mois dernier, quand j'ai rencontré @ldci .  
Mais Didec était encore RedBoléen le 18-Feb-2019/9:21:41, ainsi qu'en témoigne le mot qu'il a laissé là:  
http://www.digicamsoft.com/cgi-bin/rebelBB.cgi?thread=12Oct2018195614914932

ldci

[21:01](#msg5cc371a88790b0307e091d8f)Rrs

PierreChTux\_twitter

[21:01](#msg5cc371b08446a6023e807dfe)&gt; `reds -r`?

Ach. Je tente.

ldci

[21:01](#msg5cc371bda4ef097471053f4b)Reds -r

PierreChTux\_twitter

[21:02](#msg5cc371f4b4700e023dda50b7)

```
# pierre@latitude: ~/dev/red_cv/libs        < 2019_04_26__23:01:51 >
reds -r redcv.red 
[...]
POP protocol loaded
IMAP protocol loaded
HTTP protocol loaded
FTP protocol loaded
NNTP protocol loaded
HTTPS protocol loaded
Script: "User Preferences" (19-Jun-2012/15:13:14+2:00)
pgSQL protocol loaded
mySQL protocol loaded
btn protocol loaded
Gll preferences loaded: 
Current working directory: /home/pierre/heaume_pierre/developpt/red_cv/libs/
connecting to: semopi
Connected to database postgeol hosted by semopi on port 5432, logged in as role pierre
REBOL/View 2.7.8.4.3 6-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM


Type desktop to start the Viewtop.
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.6.4 ===- 

Compiling /home/pierre/heaume_pierre/developpt/red_cv/libs/redcv.red ...
*** Compilation Error: undefined word layout 
*** in file: /home/pierre/heaume_pierre/developpt/red_cv/libs/redcv.red
*** near: [layout [
        title title 
        image 256x256
    ] 
    view/no-wait win 
    win
]
```

Pas mieux...

rcqls

[21:03](#msg5cc37225b4700e023dda5203)C’est quoi ce recv.red c’est pas dans samples?

PierreChTux\_twitter

[21:04](#msg5cc372403b6cb0686a5b4f91)Dans ~/dev/red\_cv/libs

[21:04](#msg5cc372573d78aa6c039e27d7)Je vais tenter plutôt de taper dans samples.

rcqls

[21:05](#msg5cc3727fa4ef097471054385)Ce sera bcp mieux (comme dans mon readme ahahah)

ldci

[21:05](#msg5cc372962e2caa1aa6c4a029)Oui ça doit marcher

PierreChTux\_twitter

[21:05](#msg5cc372b62e2caa1aa6c4a1b7)Rhaputaingue, RTFM bis repetita...

```
# pierre@latitude: ~/dev/red_cv/samples/voronoi        < 2019_04_26__23:04:45 >
reds -r voronoi.red 
...
Type desktop to start the Viewtop.
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.6.4 ===- 

Compiling /home/pierre/heaume_pierre/developpt/red_cv/samples/voronoi/voronoi.red ...
*** Compilation Error: undefined word layout 
*** in file: /home/pierre/heaume_pierre/developpt/red_cv/samples/voronoi/voronoi.red
*** near: [layout [
        title "Voronoï Diagram 3" 
        text "Number of seeds" 
        f1: field 50 [if error? try [nSeeds: to-integer f1/text] [nSeeds: 30 f1/text: form nSeeds] process] 
        text 60 "Distance" 
        dp: drop-down 85 data ["Euclidian" "Manhattan" "Minkowski" "Chebyshev"] 
        select 1 
        on-change [dparam: face/selected 
            either dparam = 3 [f2/visible?: true] [f2/visible?: false] 
            process
        ] 
        f2: field 40 "3.0" [if error? try [mparam: to-float f2/text] [mparam: 3.0 f2/text: form mparam] process] 
        cb: check "Show seeds" true [param: face/data] 
        button 75 "Generate" [process] 
        button 45 "Quit" [quit] 
        return 
        img: base 640x480 map 
        return 
        text 150 "© Red Foundation 2019" 
        f3: field 480 
        do [f1/text: form nSeeds f2/visible?: false]
    ]]

  # pierre@latitude: ~/dev/red_cv/samples/voronoi        < 2019_04_26__23:05:38 >
```

[21:06](#msg5cc372cd97dcb371d81c05cd)Bon. Je dois être trocon, ou il est trop tard. Je vais dormer, ça ira mieux demain.

ldci

[21:07](#msg5cc372f6a4ef0974710547af)Ok bonne nuit

PierreChTux\_twitter

[21:07](#msg5cc373028446a6023e808633)Bonne nuit, les gars!

rcqls

[21:07](#msg5cc373183d78aa6c039e2cd4)@PierreChTux\_twitter avant de dormir il est où le repo rcqls/GTK-dev?

PierreChTux\_twitter

[21:08](#msg5cc37334b4700e023dda5b15)Ah, tout juste!

[21:08](#msg5cc3733ce416b84519e711b2)Avant que je ne dorme...

[21:09](#msg5cc373996a84d76ed8fdf093)Voici:

```
# pierre@latitude: ~/dev        < 2019_04_26__23:08:34 >
ls red_rcqls/    # Le repositoire rcqls:
boot.red           CODE_OF_CONDUCT.md  docs         quick-test  system
bridges            compiler.r          environment  README.md   tests
BSD-3-License.txt  console-view        lexer.r      red.r       usage.txt
BSL-License.txt    CONTRIBUTING.md     libRed       run-all.r   utils
build              crush.so            modules      runtime     version.r

  # pierre@latitude: ~/dev        < 2019_04_26__23:09:07 >
ls red_cv/      # Le repositoire redcv:
docs  images  libs  README.md  samples

  # pierre@latitude: ~/dev        < 2019_04_26__23:09:28 >
```

rcqls

[21:10](#msg5cc373d06a84d76ed8fdf353)`reds —root ~/dev/red_rcqls -r voronoi.red`

PierreChTux\_twitter

[21:11](#msg5cc373ebb489bb6ed7ce792e)Ah bord3l, je crois que je sais...

[21:11](#msg5cc373f0990feb45180a7c86)Ah pardon.

rcqls

[21:11](#msg5cc3740b2e2caa1aa6c4a95e)No souci! Bonne nuit à tous!

PierreChTux\_twitter

[21:12](#msg5cc3742b4b4cb471d9624130)Non: j'avais d'abord fait un git clone avec le nom par défaut, j'avais suivi le README (si, si, un peu).

rcqls

[21:12](#msg5cc374413d78aa6c039e34b2)Je vais ajouter une variable d’environnement `RED_GTK_DIR`pour spécifier le répertoire pour reds

PierreChTux\_twitter

[21:13](#msg5cc37461375bac74700ee8a6)Puis j'avais été peu satisfait des nommages des répertoires dans mon arborescence existante, du coup, j'avais fait un autre git clone

```
git clone https://github.com/rcqls/red
```

Et je crois bien que j'ai oublié de me git brancher au bon endroit...

[21:13](#msg5cc37475b4700e023dda63a0)Eh oui:

```
# pierre@latitude: ~/dev/red_rcqls        < 2019_04_26__23:10:38 >
git status 
Sur la branche master
Votre branche est à jour avec 'origin/master'.

Fichiers non suivis:
  (utilisez "git add <fichier>..." pour inclure dans ce qui sera validé)

        console-view
        crush.so
        tests/.react-test.red.swp

aucune modification ajoutée à la validation mais des fichiers non suivis sont présents (utilisez "git add" pour les suivre)
```

[21:14](#msg5cc3749c4b4cb471d96244ca)

```
# pierre@latitude: ~/dev/red_rcqls        < 2019_04_26__23:10:40 >
git checkout origin/GTK-dev
Note : extraction de 'origin/GTK-dev'.

Vous êtes dans l'état « HEAD détachée ». Vous pouvez visiter, faire des modifications
expérimentales et les valider. Il vous suffit de faire une autre extraction pour
abandonner les commits que vous faites dans cet état sans impacter les autres branches

Si vous voulez créer une nouvelle branche pour conserver les commits que vous créez,
il vous suffit d'utiliser « checkout -b » (maintenant ou plus tard) comme ceci :

  git checkout -b <nom-de-la-nouvelle-branche>

HEAD est maintenant sur ae064914 ready for better redCV

  # pierre@latitude: ~/dev/red_rcqls        < 2019_04_26__23:13:34 >
```

rcqls

[21:15](#msg5cc374ed6a84d76ed8fdfaeb)Par défaut reds l’attend en `~/Github/red` mais je le change demain… bonne nuit

PierreChTux\_twitter

[21:16](#msg5cc37528990feb45180a84f5)Oui, j'avais modifié un ou deux chemins dans le script... J'ai 800 xterm ouverts et un terminator. C'est trop. Je ferme tout. Bonne nuit!

moliad

[21:19](#msg5cc375e6375bac74700ef395)je trouve le t-1000 plus fluide :smirk:

PierreChTux\_twitter

[21:22](#msg5cc3767997dcb371d81c20de)T1000? C'était mon premier ordinateur "compatible PC", un Toshiba portable qui avait coûté la peau du Q de mon Papa. 8088, 512 Ko de RAM, MS-DOS 2.11 en ROM, un lecteur de disquettes 1.44Mo.  
Quelle bête.  
Toutefois, l'adjectif "fluide" n'est pas le premier qui me viendrait en tête pour qualifier cette merveilleuse machine...

rcqls

[23:02](#msg5cc38e128790b0307e09d485)@ldci voir red/GTK room pour le vagrantfile….

## Saturday 27th April, 2019

moliad

[02:17](#msg5cc3bb9ea4ef0974710704d4)(le terminator T-1000 ;-)

PierreChTux\_twitter

[09:54](#msg5cc426e4990feb45180ecc61)...

[09:55](#msg5cc426fe375bac74701326fd)Désolé, ma culture cinématographique n'allait pas jusque là...

[09:55](#msg5cc42705a4ef0974710988b9)https://commons.wikimedia.org/wiki/File%3AToshiba\_T1000\_3.jpg?wprov=sfla1

## Sunday 28th April, 2019

tmpbci

[00:34](#msg5cc4f50b5b3f941aa5a31dc2)tres interessé par une rencontre IRL

[00:37](#msg5cc4f5b22e2caa1aa6ce5a58)Une possibilité de lieu pas trop loin de nation est le fuz dont j'ai les clefs.

[00:37](#msg5cc4f5be6a84d76ed807e775)https://fuz.frama.site

[00:38](#msg5cc4f5f62e2caa1aa6ce5cde)pas avant 21h30 dans la semaine. Si mercredi il y aura des gens puisque reunion hebdomadaire.

[00:39](#msg5cc4f6475b3f941aa5a323cd)Comme je les bassine avec Rebol et Red depuis longtemps ils seront ravis d'heberger cette IRL et seront curieux du sujet.

[00:40](#msg5cc4f66797dcb371d825a1e3)mercredi ca sera ouvert plus tot donc.

[00:41](#msg5cc4f6bfe416b84519f0b16a)souvent c'est crepes le mercredi soir mais chacun est libre de ramener quelque chose a glouglou ou miam.

[00:43](#msg5cc4f71fb489bb6ed7d849ff)bref si vous voulez evangeliser et echanger avec des codeurs de toutes les ecoles c'est l'endroit en plus de la convivialité

[00:49](#msg5cc4f8882e2caa1aa6ce6db2)ah c'est ferie mercredi donc ca peut etre vraiment a n'importe quelle heure :) il y a un HTC vive si vous voulez essayer :)

rcqls

[20:16](#msg5cc60a1d1cd0b8307d8ba46b)@ldci Voir GTK room pour l’info sur le binaire `red-gtk` (binaire r`ed`mais avec View/GTK.

[20:30](#msg5cc60d6c5b3f941aa5aa407b)@PierreChTux\_twitter Tu peux aussi être intéresé car cela simplifie l’utilisation de redCV sur linux…. je remets le lien ici: \[red-gtk](https://toltex.u-ga.fr/users/RCqls/Red/red-gtk )

## Monday 29th April, 2019

ldci

[11:14](#msg5cc6dc883b6cb0686a71b8e8)@rcqls J'ai retrouvé un téléphone BQ qui tourne sous Linux. Ce serait rigolo de voir si red peut tourner dessus. Avis aux amateurs:)

rcqls

[11:17](#msg5cc6dd608446a6023e9665a4)@ldci Connais pas les téléphones BQ mais je suppose qu’ils tournent sous linux (Ubuntu?). A voir si les dépendances gtk3 et autres peuvent facilement s’installer … après avec `red-gtk` c’est extrêmement simple d’essayer….

ldci

[11:23](#msg5cc6deb94b4cb471d9789164)@rcqls Oui c'est sous ubuntu. je vais regarder quand j'aurais un peu de temps

## Tuesday 30th April, 2019

ldci

[09:14](#msg5cc8120c3b6cb0686a7a3c22)@rcqls Vraiment du bon boulot redGTK. Mon code marche parfaitement. Example tesseract.red : https://drive.google.com/file/d/1InydcCchKj4P5rNwt32KbeQtY0\_pbZPb/view?usp=sharing

rcqls

[11:02](#msg5cc82b54b489bb6ed7ee4160)Cool! Je ne l’avais pas essayé celui-là!

moliad

[21:56](#msg5cc8c4975b3f941aa5bce1ec)françois, tu es habilité à tweaker tesseract un peu (ou bcp?)

## Wednesday 1st May, 2019

ldci

[10:06](#msg5cc96f99e416b845190ef116)Juste pour le fun et illustrer les capacités de Red

## Thursday 2nd May, 2019

PierreChTux\_twitter

[13:42](#msg5ccaf3b7b4700e023d0ce81f)&gt; tres interessé par une rencontre IRL

Ah ouais, super!

[13:42](#msg5ccaf3d16a84d76ed8319f6f)&gt; Comme je les bassine avec Rebol et Red depuis longtemps ils seront ravis d'heberger cette IRL et seront curieux du sujet.

:-D

[13:43](#msg5ccaf4113b6cb0686a8e77c8)&gt; @PierreChTux\_twitter Tu peux aussi être intéresé car cela simplifie l’utilisation de redCV sur linux…. je remets le lien ici: \[red-gtk](https://toltex.u-ga.fr/users/RCqls/Red/red-gtk )

Merci! Je vais aller voir dès que j'ai quelques minutes, après le taff tout à l'heure.

[13:59](#msg5ccaf7a4a4ef097471383238)&gt; tres interessé par une rencontre IRL

Moi pareil; en revanche, je suis très loin de la capitale. Normalement, je devrais y monter lors de la semaine 21.

rcqls

[14:02](#msg5ccaf85d2e2caa1aa6f7531f)@PierreChTux\_twitter Au faitj’ai mis un lien sur la page wiki \[GTK-Bindings de red](https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development).

PierreChTux\_twitter

[14:04](#msg5ccaf8dee416b8451919ef55)Ah, au fait: mon problème de shebang qui ne fonctionnait pas a disparu, comme par enchantement, à partir du moment où j'ai fait pointer mon "redlang" vers "dev/red\_rcqls/console-view" =&gt; super et merci!

rcqls

[14:05](#msg5ccaf937375bac7470421044)Tant mieux!

## Sunday 5th May, 2019

rcqls

[16:32](#msg5ccf10185b3f941aa5e7eae5)@ldci Une petite question sur la librairie libcameraLib.dylib: d’où sort-elle c’est de ton propre cru créé à partir de opencv3 ? Ma 2eme question puis-je avoir la même pour linux?

ldci

[16:34](#msg5ccf10812e2caa1aa612c8c0)Oui j’avais fait des tests mais ne pas l’utiliser car vieille compilation

## Tuesday 7th May, 2019

DideC

[14:49](#msg5cd19b176a84d76ed85edb29)@moliad Et oui mon coco, je suis toujours de ce Redbol monde ! J'utilise mes petites applis Rebol tous les jours ou presque. Je suis resté l'éternel bricoleur avec rebol 2.  
Je suis Red avec grand intérêt, et aussi avec distance car j'ai moins de temps pour l'ordi !

PierreChTux\_twitter

[14:52](#msg5cd19b942e2caa1aa6241dba)@DideC "l'éternel bricoleur avec rebol 2."  
Hihi! On est deux!  
Et de plus en plus, je passe mes scripts de Rebol2 en Red.  
Et certains en Fred.

## Wednesday 8th May, 2019

moliad

[15:16](#msg5cd2f2c55a1d435d4607df62)@DideC cool content d'avoir de tes nouvelles, c'est dommage, j'étais en France (paris &amp; lyon) la semaine dernière... on aurait pu aller prendre un verre!

JLCyclo

[17:08](#msg5cd30cf28fcdb05d479f1a3f)bonjour, au sujet de la modification du "body" d'une fonction: on dirait que le body des fonctions incluses dans Red ne peuvent pas être modifiées

[17:08](#msg5cd30cf70f381d0a767fe4d5)\`

[17:09](#msg5cd30d3cb149ca5098583785)

```
>> f: func [x][1 + x]
== func [x][1 + x]
>> f 2
== 3
>> insert body-of :f [print "coucou"]
== [1 + x]
>> source f
f: func [x][print "coucou" 1 + x]
>> f 2
coucou
== 3
```

[17:09](#msg5cd30d48da34620ff908c7e5)par contre

[17:16](#msg5cd30ed9f251e60ffa492a49)

```
>> insert body-of :probe [print "coucou"]
== [
    print mold :value 
    :value
]
>> source probe
probe: func [
    "Returns a value after printing its molded form" 
    value [any-type!]
][print "coucou" 
    print mold :value 
    :value
]
>> probe "defr"
"defr"
== "defr"
```

de même si je recopie le body dans une user function

```
>> f: :probe
== func [
    "Returns a value after printing its molded form" 
    v...
>> source f
f: func [
    "Returns a value after printing its molded form" 
    value [any-type!]
][print "coucou" 
    print mold :value 
    :value
]
>> f "defr"
"defr"
== "defr"
```

[17:22](#msg5cd310645d48a24fd093193a)Un avis pour modifier le body d'une fonction intégrée dans Red ou recopier son body pour ensuite le modifier...

[20:17](#msg5cd3396a79d7005099394c74)J'ai trouvé une solution

[20:19](#msg5cd339ec56271260f92a8cf7)

```
>> c: body-of :probe
== [
    print mold :value 
    :value
]
>> insert c [print "coucou"]
== [
    print mold :value 
    :value
]
>> c
== [print "coucou" 
    print mold :value 
    :value
]
>> probe: func spec-of :probe copy c
== func [
    "Returns a value after printing its molded form" 
    v...
>> probe "derft"
coucou
"derft"
== "derft"
>>
```

## Thursday 9th May, 2019

PierreChTux\_twitter

[10:30](#msg5cd401475a887e1cd9b98486)&gt; @DideC cool content d'avoir de tes nouvelles, c'est dommage, j'étais en France (paris &amp; lyon) la semaine dernière... on aurait pu aller prendre un verre!

Volontaire pour le verre, qui aurait dû être téléguidé: je suis situé aux antipodes de Lyon et de Paris... Au fond du Sud-Ouest, dans la Gascogne... Pas de voie ferrée, pas d'autoroute, dans la gadoue. Peinard.  
Ce sera pour une prochaine fois!

[10:42](#msg5cd403faf52a237516002c0d)&gt; Un avis pour modifier le body d'une fonction intégrée dans Red ou recopier son body pour ensuite le modifier...

Hm.  
J'avoue que j'aurais fait, très bêtement, une autre fonction qui appelle la première version. Brutal.

Quelque chose comme ça:

```
>> probe_: does [:probe print "coucoucou"]
== func [][:probe print "coucoucou"]
>> probe: :probe_
== func [][:probe print "coucoucou"]
>> probe "zouzou"
coucoucou
== "zouzou"
```

[10:42](#msg5cd4042fb149ca50985f0ebe)@JLCyclo C'est un peu plus propre...

JLCyclo

[20:05](#msg5cd488258fcdb05d47aa06e1)@PierreChTux\_twitter je vois ce que tu veux dire.. en fait ici, je pense que does ne convient pas car probe a des parametres, et ils ne sont alors pas transmis à probe.. A l'exécution, probe fait un print mold de ses parametres et retourne ses parametres

[20:07](#msg5cd4888c56271260f933df70)Le nouveau probe voulu devrait être:

[20:09](#msg5cd488efe7f42160fa5fcb72)

```
>> probe "zouzou"
coucoucou
"zouzou"
== "zouzou"
```

[20:20](#msg5cd48b7fe7f42160fa5fe158)En fait, je pense que :probe est incorrect dans does (:probe retourne la definition spec+body)

[20:36](#msg5cd48f33f52a2375160484b9)le nouveau body est ici incorrect

[20:42](#msg5cd4909856271260f93419f4)Par exemple:

[20:43](#msg5cd490f15a887e1cd9bdb974)

```
>> insert body-of :probe [print "coucoucou"]
== [
    print mold :value 
    :value
]
>> probe: func spec-of :probe copy body-of :probe
== func [
    "Returns a value after printing its molded form" 
    v...
>> probe "zouzou"
coucoucou
"zouzou"
== "zouzou"
>>
```

PierreChTux\_twitter

[21:13](#msg5cd4980fda34620ff913e1f0)En effet, oui.

## Friday 17th May, 2019

JLCyclo

[18:20](#msg5cdefb6c8265145bbb29edbb)A tous:

[18:22](#msg5cdefbee7c363c75a7f94bef)Je vous encourage à utiliser la mise à jour de rdbstep.red disponible à \[https://github.com/red/community](https://github.com/red/community) dans le dossier tool

moliad

[18:25](#msg5cdefc7f63dea422b49cdf7a)comment tu as fais le stepping... en modifiant l'interpréteur ou en faisant une analyse du code dans l'interpréteur du code lui-même?

JLCyclo

[18:25](#msg5cdefc9d75d9a575a6fb8c1e)cet outil permet d'exécuter en pas à pas un script red. il comporte une commande help et peut aller en pas à pas dans les boucles, les blocs conditionnels et les fonctions. On peut aussi executer des commandes red pour afficher des variables par exemple

moliad

[18:27](#msg5cdefd1963dea422b49ce2b9)c'est donc un script .red qui analyse un block qu'on lui donne, pas à pas ?

JLCyclo

[18:27](#msg5cdefd1bad024978c6e28606)l'outil est basé sur do/next. Le script est un block red et on exécute do/next. Pour aller en step into, on repère le bloc into et on fait des do/next

moliad

[18:27](#msg5cdefd2163dea422b49ce38c)hehe ok.

[18:27](#msg5cdefd2becdf942b4cfdb619):thumbsup:

JLCyclo

[18:29](#msg5cdefd7cd22ba766a2b3e261)pour les step into, il repère les mots correspondants aux loops, conditions... et exécute les blocs en do/next

[18:29](#msg5cdefda7879f4478c79786da)on peut même exécuter en step into view, layout..

moliad

[18:30](#msg5cdefdb97c363c75a7f959c6)pas mal!

JLCyclo

[18:31](#msg5cdefde89404bf2aed631334)il n'est pas parfait car ne distingue pas toujours les boucles ou blocs qu'on peut faire en do/next

[18:32](#msg5cdefe3b0ec37966a187e78e)L'étape suivante serait de gérer des breakpoints.

## Sunday 19th May, 2019

PierreChTux\_twitter

[19:54](#msg5ce1b46f6366992a94e83434)@JLCyclo ah, intéressant outil! Je n'ai pas réussi à le faire tourner; je dois RTFMer un peu, sans doute.

## Monday 20th May, 2019

JLCyclo

[08:41](#msg5ce2684c9404bf2aed796c3d)@PierreChTux\_twitter Dans le header du fichier, il y a une section "Usage" et "Help" qui peut aider pour mettre en oeuvre le programme.

PierreChTux\_twitter

[10:43](#msg5ce284c16366992a94ed71fd)@JLCyclo merci, je lirai ça.déjà à l'exécution que ça a planté. J'utilise le `reds` de @rcqls , c'est peut-être pour ça.

[10:46](#msg5ce2856983ae782aee9cb70e)Scrogneugneu, le client gitter ne me permet pas de corriger... Ce que je voulais écrire: "C'est déjà à l'exécution que ça a planté."

rcqls

[10:47](#msg5ce285b60ac9852a950c5a66)@PierreChTux\_twitter `reds` c’est pour compiler un script red à partir des sources. Je pense que le debugger de @JLCyclo c’est pour le mode interprété… Tu peux utiliser le binaire `red-gtk` si tu veux tester le debugger avec View en linux.

[10:50](#msg5ce2866383ae782aee9cbd92)@PierreChTux\_twitter Au fait, tu as une camera sur ton ordi avec linux?

PierreChTux\_twitter

[16:13](#msg5ce2d21c13e9854e3338b18c)@rcqls oui, j'ai une caméra, et même que cheese la reconnaît. J'ai vu passer la discussion sur l'autre canal ;-)

rcqls

[16:50](#msg5ce2dae983ae782aee9f58d5)@PierreChTux\_twitter Cool si tu as le temps de tester, ce serait cool…. pour avoir un feedback sur du vrai matos linux. L’installation et le test préliminaire sont rapide à faire (cf Red/GTK room)

## Tuesday 21st May, 2019

PierreChTux\_twitter

[19:45](#msg5ce455607c363c75a71d6d2c)@JLCyclo classieux!  
Merci, super outil!

[19:46](#msg5ce4559dd22ba766a2d82052)(pardon: je parle du débogueur pas à pas)

[21:23](#msg5ce46c4675d9a575a62018ec)@rcqls je viens de tenter gtkcam. Ça n'a point allumé ma webcam, alors que le test `gst-launch-1.0 v4l2src ! videoconvert ! gtksink` a bien affiché une image.

[21:26](#msg5ce46d137c363c75a71e220d)Voilà mon terminal:

```
# pierre@latitude: ~        < 2019_05_21__21:57:13 >
wget https://toltex.u-ga.fr/users/RCqls/Red/gtkcam
--2019-05-21 21:57:20--  https://toltex.u-ga.fr/users/RCqls/Red/gtkcam
Résolution de toltex.u-ga.fr (toltex.u-ga.fr)… 129.88.13.66
Connexion à toltex.u-ga.fr (toltex.u-ga.fr)|129.88.13.66|:443… connecté.
requête HTTP transmise, en attente de la réponse… 200 OK
Taille : 22556 (22K) [text/plain]
Sauvegarde en : « gtkcam »

gtkcam                                           100%[========================================================================================================>]  22.03K   124KB/s    ds 0.2s    

2019-05-21 21:57:21 (124 KB/s) — « gtkcam » sauvegardé [22556/22556]


  # pierre@latitude: ~        < 2019_05_21__21:57:21 >
chmod +x gtkcam 


  # root@latitude: ~        < 2019_05_21__22:47:37 >
apt install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-pulseaudio
Lecture des listes de paquets... Fait
Construction de l'arbre des dépendances       
Lecture des informations d'état... Fait
gstreamer1.0-libav est déjà la version la plus récente (1.15.0.1+git20180723+db823502-2).
gstreamer1.0-libav passé en « installé manuellement ».
...
amd64 1.14.4-1 [1111 kB]
1111 ko réceptionnés en 2min 0s (9288 o/s)                                     
Sélection du paquet gstreamer1.0-tools précédemment désélectionné.
(Lecture de la base de données... 889053 fichiers et répertoires déjà installés.)
Préparation du dépaquetage de .../gstreamer1.0-tools_1.14.4-1_amd64.deb ...
Dépaquetage de gstreamer1.0-tools (1.14.4-1) ...
Paramétrage de gstreamer1.0-tools (1.14.4-1) ...
Traitement des actions différées (« triggers ») pour man-db (2.8.5-2) ...

  # root@latitude: ~        < 2019_05_21__22:50:11 >



  # pierre@latitude: ~        < 2019_05_21__22:57:15 >
vi_bkp_diff .bashrc
239a240,243
> # Pour faire tourner gtkcam
> export RED_GTK_CAMERA=YES
> export GST_V4L2_USE_LIBV4L2=1
> 

  # pierre@latitude: ~        < 2019_05_21__23:13:51 >
gst-launch-1.0 v4l2src ! videoconvert ! gtksink
Définition du pipeline à PAUSED...
Le pipeline est actif et n’a pas besoin de phase PREROLL…
Passage du pipeline à la phase PLAYING…
New clock: GstSystemClock
ERREUR : de l’élément /GstPipeline:pipeline0/GstGtkSink:gtksink0 : Output widget was destroyed
Information de débogage supplémentaire :
gstgtkbasesink.c(486): gst_gtk_base_sink_show_frame (): /GstPipeline:pipeline0/GstGtkSink:gtksink0
Execution ended after 0:00:07.269765264
Définition du pipeline à PAUSED...
Définition du pipeline à READY (prêt)…
Définition du pipeline à NULL…
Libération du pipeline…

  # pierre@latitude: ~        < 2019_05_21__23:15:55 >
 #  Cela fonctionne.

  # pierre@latitude: ~        < 2019_05_21__23:16:02 >
./gtkcam 

(gtkcam:1488): GStreamer-CRITICAL **: 23:16:19.474: gst_bin_add_many: assertion 'GST_IS_ELEMENT (element_1)' failed

(gtkcam:1488): GStreamer-CRITICAL **: 23:16:19.474: gst_element_link_pads_full: assertion 'GST_IS_ELEMENT (src)' failed

(gtkcam:1488): GStreamer-CRITICAL **: 23:16:19.474: gst_element_link_pads_full: assertion 'GST_IS_ELEMENT (dest)' failed

(gtkcam:1488): GLib-GObject-CRITICAL **: 23:16:19.517: g_object_get: assertion 'G_IS_OBJECT (object)' failed

(gtkcam:1488): Gtk-CRITICAL **: 23:16:19.517: gtk_widget_set_size_request: assertion 'GTK_IS_WIDGET (widget)' failed

(gtkcam:1488): Gtk-CRITICAL **: 23:16:19.517: gtk_container_add: assertion 'GTK_IS_WIDGET (widget)' failed

(gtkcam:1488): Gtk-CRITICAL **: 23:16:19.517: gtk_widget_show: assertion 'GTK_IS_WIDGET (widget)' failed

  # pierre@latitude: ~        < 2019_05_21__23:16:32 >
 # Une petite fenêtre apparaît avec 3 boutons. Seul le bouton QUIT provoque une réaction.
```

rcqls

[21:28](#msg5ce46d7bad024978c606fa45)@PierreChTux\_twitter Merci pour le retour…. même si c’est bizarre car en théorie c’est la même chose qui est fait dans gtkcam… Ah peut-être as-tu oublié d'installer les équivalents en i386. Le test que tu as fait avec `gst-laucnch`est certainement en 64bits alors que red a besoin de 32bits.

PierreChTux\_twitter

[21:29](#msg5ce46db00ac9852a9519d9b2)Ah oui. Effectivement, j'ai pas mis les 32 bits, ma machine étant, bêtement, en 64 bits.

[21:30](#msg5ce46dddd22ba766a2d8c6cd)Je regarde pour dénicher ces paquets en versions gersoises...

rcqls

[21:30](#msg5ce46e03879f4478c7bc120d)Tu es sous debian? Ah Ah Ah pour la blague sur le 32 du Gers!

PierreChTux\_twitter

[21:30](#msg5ce46e0e7c363c75a71e296c)Oui, pardon, debian buster.

[21:31](#msg5ce46e36b313d72314069ac8)

```
# pierre@latitude: ~        < 2019_05_21__23:31:02 >
cat /etc/issue
Debian GNU/Linux 10 \n \l
```

[21:32](#msg5ce46e528f019114ae93650e)J'adore les noms des paquets! ugly, bad...

rcqls

[21:35](#msg5ce46f3b83ae782aeeaa4529)Tu rajoutes juste `:i386` à chaque package… Normalement si ta debian est récente tu n’as pas besoin de ugly et bad…. As-tu eu besoin de gstreamer-gtk3?

[21:37](#msg5ce46f8b0ac9852a9519e8e2)Pour le test, tu devrais avoir le gst-launch en mode 32 bits quelquepart….

[21:37](#msg5ce46fa713e9854e3343c29f)mais gtkcam est équivalent au test….

PierreChTux\_twitter

[21:37](#msg5ce46fa99404bf2aed87c9e6)gstreamer-gtk3: je ne sais pas.

[21:38](#msg5ce46fbbef853135c8fe30c0)Ach, des putaraillasses de dépendances...

rcqls

[21:39](#msg5ce46ffa13e9854e3343c39b)ubuntu et debian peuvent différer sur gtksink (dans gstreamer-gtk3 en ubuntu) alors que normalement il est dans plugins-good

PierreChTux\_twitter

[21:39](#msg5ce46fff63dea422b4c197db)Bon, il me vire mon cheese...

rcqls

[21:39](#msg5ce4700d75d9a575a620301f)Ah bon???

PierreChTux\_twitter

[21:39](#msg5ce4702513e9854e3343c5c3)Oui, pagrave. Des dépendances qui ne vont plus, certainement. Je me le remettrai, si j'en ai l'usage.

rcqls

[21:40](#msg5ce47042ef853135c8fe33d7)Il devrait updater plutôt….

PierreChTux\_twitter

[21:40](#msg5ce4705213e9854e3343c651)Voilà où ça en est:

```
libmplex2-2.1-0:i386 mais ne sera pas installé
E: Impossible de corriger les problèmes, des paquets défectueux sont en mode « garder en l'état ».

  # root@latitude: ~        < 2019_05_21__23:38:22 >
apt install libgstreamer1.0-0:i386 gstreamer1.0-plugins-base:i386 gstreamer1.0-plugins-good:i386 gstreamer1.0-plugins-bad:i386 gstreamer1.0-plugins-ugly:i386 gstreamer1.0-libav:i386 gstreamer1.0-tools:i386 gstreamer1.0-x:i386 gstreamer1.0-alsa:i386 gstreamer1.0-pulseaudio:i386 gstreamer1.0-gtk3:i386 libmjpegutils-2.1-0:i386 libmpeg2encpp-2.1-0:i386 libmplex2-2.1-0:i386
Lecture des listes de paquets... Fait
Construction de l'arbre des dépendances       
Lecture des informations d'état... Fait
gstreamer1.0-plugins-base:i386 est déjà la version la plus récente (1.14.4-1).
libgstreamer1.0-0:i386 est déjà la version la plus récente (1.14.4-1).
Les paquets suivants ont été installés automatiquement et ne sont plus nécessaires :
  apg cheese-common doc-debian-fr doc-linux-fr-text gir1.2-gepub-0.6
  gnome-control-center-data kio-sieve libgepub-0.6-0 libgl1-mesa-glx:i386
  libgstreamer-plugins-bad1.0-0 libmodule-find-perl libmozjs-52-0 libofa0
  libphobos2-ldc-shared-dev libphobos2-ldc-shared82 libproc-processtable-perl
  libsort-naturally-perl libvo-aacenc0 libvo-amrwbenc0 libwildmidi2 libzbar0
  maint-guide-fr mousetweaks node-fstream python-qgis-common realmd
Veuillez utiliser « apt autoremove » pour les supprimer.
Les paquets supplémentaires suivants seront installés : 
  gstreamer1.0-gl:i386 liba52-0.7.4:i386 libaa1:i386 libaacs0:i386
  libass9:i386 libavc1394-0:i386 libavfilter7:i386 libavformat58:i386
  libbdplus0:i386 libbluray2:i386 libbs2b0:i386 libcaca0:i386 libcdio18:i386
  libchromaprint1:i386 libcurl3-gnutls:i386 libdc1394-22:i386 libdca0:i386
  libde265-0:i386 libdv4:i386 libdvdnav4:i386 libdvdread4:i386
  libegl-mesa0:i386 libegl1:i386 libfaad2:i386 libfftw3-double3:i386
  libflite1:i386 libfluidsynth1:i386 libgbm1:i386 libgme0:i386
  libgraphene-1.0-0:i386 libgssdp-1.0-3:i386 libgstreamer-gl1.0-0:i386
  libgstreamer-plugins-bad1.0-0:i386 libgudev-1.0-0:i386 libgupnp-1.0-4:i386
  libgupnp-igd-1.0-4:i386 libiec61883-0:i386 libilmbase23:i386 libkate1:i386
  liblilv-0-0:i386 libmms0:i386 libmodplug1:i386 libmpcdec6:i386
  libmpeg2-4:i386 libmysofa0:i386 libncursesw6:i386 libnice10:i386
  libnorm1:i386 libofa0:i386 libopencore-amrnb0:i386 libopencore-amrwb0:i386
  libopenexr23:i386 libopenmpt0:i386 libpgm-5.2-0:i386 libpostproc55:i386
  libraw1394-11:i386 libreadline7:i386 librubberband2:i386 libsbc1:i386
  libserd-0-0:i386 libshout3:i386 libsidplay1v5:i386 libslang2:i386
  libsodium23:i386 libsord-0-0:i386 libsoundtouch1:i386 libspandsp2:i386
  libsratom-0-0:i386 libsrtp2-1:i386 libssh-gcrypt-4:i386 libswscale5:i386
  libtag1v5:i386 libtag1v5-vanilla:i386 libvidstab1.1:i386 libvo-aacenc0:i386
  libvo-amrwbenc0:i386 libwayland-server0:i386
  libwebrtc-audio-processing1:i386 libwildmidi2:i386 libxv1:i386 libzbar0:i386
  libzmq5:i386
Paquets suggérés :
  frei0r-plugins:i386 libbluray-bdj:i386 libdv-bin:i386 libdvdcss2:i386
  libfftw3-bin:i386 libfftw3-dev:i386 fluidr3mono-gm-soundfont:i386
  | timgm6mb-soundfont:i386 | fluid-soundfont-gm:i386 libraw1394-doc:i386
  serdi:i386 sidplay-base:i386 sordi:i386
Les paquets suivants seront ENLEVÉS :
  cheese gnome gnome-contacts gnome-control-center gnome-core
  gnome-video-effects gstreamer1.0-plugins-bad gstreamer1.0-tools
  libcheese-gtk25 libcheese8 libmjpegutils-2.1-0 libmpeg2encpp-2.1-0
  libmplex2-2.1-0 task-gnome-desktop
Les NOUVEAUX paquets suivants seront installés :
  gstreamer1.0-alsa:i386 gstreamer1.0-gl:i386 gstreamer1.0-gtk3:i386
  gstreamer1.0-libav:i386 gstreamer1.0-plugins-bad:i386
  gstreamer1.0-plugins-good:i386 gstreamer1.0-plugins-ugly:i386
  gstreamer1.0-pulseaudio:i386 gstreamer1.0-tools:i386 gstreamer1.0-x:i386
  liba52-0.7.4:i386 libaa1:i386 libaacs0:i386 libass9:i386 libavc1394-0:i386
  libavfilter7:i386 libavformat58:i386 libbdplus0:i386 libbluray2:i386
  libbs2b0:i386 libcaca0:i386 libcdio18:i386 libchromaprint1:i386
  ...
```

rcqls

[21:42](#msg5ce470ae6366992a94fb5484)enlève les bad et ugly!

PierreChTux\_twitter

[21:42](#msg5ce470b5b313d7231406a9b6)Heureusement que j'ai une liaison à Internet qui ne rame pas trop, dans mon petit hôtel.

[21:42](#msg5ce470b98f019114ae93772f)Ah, au quai.

rcqls

[21:43](#msg5ce470edecdf942b4c21dba8)et autres du style alsa libav….

PierreChTux\_twitter

[21:43](#msg5ce470fbb313d7231406ad0f)Pareil, il m'enlève mon cheese...

[21:45](#msg5ce471659404bf2aed87d635)pulseaudio aussi, je vire?

rcqls

[21:45](#msg5ce47173b313d7231406aff5)C’est bizarre que du i386 vire du 64bits…. oui tu peux virer aussi (pulseaudio) ….

PierreChTux\_twitter

[21:46](#msg5ce471cb75d9a575a6203a3e)Ce doivent être d'autres paquets qui dépendent d'un truc et qui ne peuvent pas piffrer un autre... Les dependency hells...

[21:47](#msg5ce471da879f4478c7bc2a23)Je vais essayer de ne pas refaire une Frankendebian!

[21:47](#msg5ce471e7ecdf942b4c21e262)J'en ai déjà trop fait, de par le passé...

rcqls

[21:47](#msg5ce471f8d22ba766a2d8e030)`libmjpegutils-2.1-0:i386 libmpeg2encpp-2.1-0:i386 libmplex2-2.1-0:i386` tu as rajouté cela?

PierreChTux\_twitter

[21:48](#msg5ce472269404bf2aed87da9b)Voilà ce que j'ai mis:

```
# root@latitude: ~        < 2019_05_21__23:45:37 >
apt install libgstreamer1.0-0:i386 gstreamer1.0-plugins-base:i386 gstreamer1.0-plugins-good:i386 gstreamer1.0-tools:i386 gstreamer1.0-x:i386 gstreamer1.0-pulseaudio:i386 gstreamer1.0-gtk3:i386 libmjpegutils-2.1-0:i386 libmpeg2encpp-2.1-0:i386 libmplex2-2.1-0:i386
Lecture des listes de paquets... Fait
Construction de l'arbre des dépendances       
Lecture des informations d'état... Fait
gstreamer1.0-plugins-base:i386 est déjà la version la plus récente (1.14.4-1).
libgstreamer1.0-0:i386 est déjà la version la plus récente (1.14.4-1).
Les paquets suivants ont été installés automatiquement et ne sont plus nécessaires :
  apg cheese-common doc-debian-fr doc-linux-fr-text freepats gir1.2-gepub-0.6 gnome-control-center-data kio-sieve libgepub-0.6-0 libgl1-mesa-glx:i386 libgstreamer-plugins-bad1.0-0
  libmodule-find-perl libmozjs-52-0 libofa0 libphobos2-ldc-shared-dev libphobos2-ldc-shared82 libproc-processtable-perl libsort-naturally-perl libvo-aacenc0 libvo-amrwbenc0 libwildmidi-config
  libwildmidi2 libzbar0 maint-guide-fr mousetweaks node-fstream python-qgis-common realmd
Veuillez utiliser « apt autoremove » pour les supprimer.
Les paquets supplémentaires suivants seront installés : 
  gstreamer1.0-gl:i386 libaa1:i386 libavc1394-0:i386 libcaca0:i386 libdv4:i386 libegl-mesa0:i386 libegl1:i386 libgbm1:i386 libgraphene-1.0-0:i386 libgstreamer-gl1.0-0:i386 libgudev-1.0-0:i386
  libiec61883-0:i386 libncursesw6:i386 libraw1394-11:i386 libshout3:i386 libslang2:i386 libtag1v5:i386 libtag1v5-vanilla:i386 libwayland-server0:i386 libxv1:i386
Paquets suggérés :
  libdv-bin:i386 libraw1394-doc:i386
Les paquets suivants seront ENLEVÉS :
  cheese gnome gnome-contacts gnome-control-center gnome-core gnome-video-effects gstreamer1.0-plugins-bad gstreamer1.0-tools libcheese-gtk25 libcheese8 libmjpegutils-2.1-0 libmpeg2encpp-2.1-0
  libmplex2-2.1-0 task-gnome-desktop
Les NOUVEAUX paquets suivants seront installés :
  gstreamer1.0-gl:i386 gstreamer1.0-gtk3:i386 gstreamer1.0-plugins-good:i386 gstreamer1.0-pulseaudio:i386 gstreamer1.0-tools:i386 gstreamer1.0-x:i386 libaa1:i386 libavc1394-0:i386
  libcaca0:i386 libdv4:i386 libegl-mesa0:i386 libegl1:i386 libgbm1:i386 libgraphene-1.0-0:i386 libgstreamer-gl1.0-0:i386 libgudev-1.0-0:i386 libiec61883-0:i386 libmjpegutils-2.1-0:i386
  libmpeg2encpp-2.1-0:i386 libmplex2-2.1-0:i386 libncursesw6:i386 libraw1394-11:i386 libshout3:i386 libslang2:i386 libtag1v5:i386 libtag1v5-vanilla:i386 libwayland-server0:i386 libxv1:i386
0 mis à jour, 28 nouvellement installés, 14 à enlever et 33 non mis à jour.
Il est nécessaire de prendre 2584 ko/12.8 Mo dans les archives.
Après cette opération, 4483 ko d'espace disque supplémentaires seront utilisés.
Souhaitez-vous continuer ? [O/n] 
Réception de :1 http://ftp.fr.debian.org/debian testing/main i386 gstreamer1.0-tools i386 1.14.4-1 [1113 kB]
Réception de :2 http://ftp.fr.debian.org/debian testing/main i386 libxv1 i386 2:1.0.11-1 [25.1 kB]
Réception de :3 http://ftp.fr.debian.org/debian testing/main i386 gstreamer1.0-x i386 1.14.4-1 [1283 kB]
...
```

[21:48](#msg5ce4722c8f019114ae93800c)Ah, terminé...

[21:49](#msg5ce4726a13e9854e3343d0a0)Victoire.

[21:49](#msg5ce472799d64e537bceb21a6)

```
# pierre@latitude: ~        < 2019_05_21__23:47:35 >
./gtkcam 

  # pierre@latitude: ~        < 2019_05_21__23:48:55 >
elephsay "V I C T O I R E !   J'ai vu ma tronche!"
GTK VERSION: 3.24.5
     _________________________________________
    < V I C T O I R E !   J'ai vu ma tronche! >
     -----------------------------------------

        \    __
         \ /(  )\_---------_
          { (°°) }          )\
          { /()\ }          | \
           / () \  |____\   |
          /  !! |\ |     |  |\
             J  [__|     [__||

  # pierre@latitude: ~        < 2019_05_21__23:49:20 >
```

rcqls

[21:51](#msg5ce472e70ac9852a9519fd8b)Ah Ah! Il ne reste plus qu’à tester red-gtk avec tests/view-test.red en desactivant le mode debug au début du fichier…. ceci dit tu pourras me confirmer le runtime erreur en mode debug

PierreChTux\_twitter

[21:51](#msg5ce472ee879f4478c7bc330e)\[!\[image.png](https://files.gitter.im/red/red/France/Sjtw/thumb/image.png)](https://files.gitter.im/red/red/France/Sjtw/image.png)

[21:52](#msg5ce473087c363c75a71e4c34)Allons-y...

rcqls

[21:53](#msg5ce4734663dea422b4c1ae59)Tu sauras alors le premier à faire le test sur un véritable ordi linux!

[21:53](#msg5ce4737063dea422b4c1b073)prends bien le red-gtk (lien sur GTK room)

PierreChTux\_twitter

[21:53](#msg5ce4737313e9854e3343d57e)Euh... Déjà que je suis le \*seul* de la boîte où je bosse à avoir un "véritable" ordi GNU/Linux... ;-(

[21:54](#msg5ce47379d22ba766a2d8eb28)C'est trop d'honneur!

[21:54](#msg5ce473a87c363c75a71e5102)Le red-gtk de https://github.com/rcqls/red ? Je vais voir sur gtkroume...

rcqls

[21:55](#msg5ce473c4ad024978c60726f7)Non… c’est sur mon serveur

PierreChTux\_twitter

[21:55](#msg5ce473d59404bf2aed87e3dc)Ah!

[21:55](#msg5ce473ddad024978c607278b)Je cherche dans la GTK roume...

rcqls

[21:56](#msg5ce473f683ae782aeeaa662d)je te remets le lien \[https://toltex.u-ga.fr/users/RCqls/Red/red-gtk](https://toltex.u-ga.fr/users/RCqls/Red/red-gtk)

PierreChTux\_twitter

[21:58](#msg5ce47479ecdf942b4c21f251)Ah, c'est bon, j'avais fini par le redénicher...

[21:58](#msg5ce4748c879f4478c7bc3ccd)

```
# pierre@latitude: ~        < 2019_05_21__23:57:28 >
wget https://toltex.u-ga.fr/users/RCqls/Red/red-gtk
--2019-05-21 23:57:31--  https://toltex.u-ga.fr/users/RCqls/Red/red-gtk
Résolution de toltex.u-ga.fr (toltex.u-ga.fr)… 129.88.13.66
Connexion à toltex.u-ga.fr (toltex.u-ga.fr)|129.88.13.66|:443… connecté.
requête HTTP transmise, en attente de la réponse… 200 OK
Taille : 1378982 (1.3M) [text/plain]
Sauvegarde en : « red-gtk »

red-gtk             100%[===================>]   1.31M   127KB/s    ds 9.9s    

2019-05-21 23:57:41 (136 KB/s) — « red-gtk » sauvegardé [1378982/1378982]


  # pierre@latitude: ~        < 2019_05_21__23:57:41 >
chmod +x red-gtk 

  # pierre@latitude: ~        < 2019_05_21__23:57:50 >
./red-gtk 
Compiling compression library...
Compiling Red console...
```

[21:58](#msg5ce47496879f4478c7bc3daa)It is compilationningue.

rcqls

[21:59](#msg5ce474cdb313d7231406c3c7) Tu peux modifier le tests/view-test.red

PierreChTux\_twitter

[21:59](#msg5ce474cfad024978c6072cf4)Et voilà.

[21:59](#msg5ce474da0ac9852a951a0a08)Dans quel repositoire?

rcqls

[22:00](#msg5ce474eaef853135c8fe5494)le repo `red` officiel…. ou le mien puisque c’est un clone

PierreChTux\_twitter

[22:00](#msg5ce474ef9404bf2aed87ebae)Au quai.

rcqls

[22:02](#msg5ce475770ac9852a951a0db1)tu devrais avoir un drop-list avec `/dev/video0` à sélectionner...

PierreChTux\_twitter

[22:03](#msg5ce475c163dea422b4c1c216)Ayé, j'ai trouvé (pardon, c'est le bazar dans mon ~) le script.

[22:09](#msg5ce477236366992a94fb7e45)Je cherche la drop-list...

rcqls

[22:10](#msg5ce4774e8f019114ae93a278)As-tu fait `export RED_GTK_CAMERA=YES` ?

PierreChTux\_twitter

[22:11](#msg5ce47784ef853135c8fe6467)Oui, je l'ai dans mon .bashrc:

```
# pierre@latitude: ~/dev/red_rcqls/tests/gtk3        < 2019_05_22__00:10:33 >
echo $RED_GTK_CAMERA 
YES
```

[22:11](#msg5ce4779a75d9a575a620633e)

```
# pierre@latitude: ~/dev/red_rcqls/tests/gtk3        < 2019_05_22__00:10:46 >
~/red-gtk view-test.red
```

rcqls

[22:12](#msg5ce477c283ae782aeeaa7e26)et tu ne vois pas un rectangle noir?

[22:12](#msg5ce477e29d64e537bceb46da)dessous il y a la drop-list….

PierreChTux\_twitter

[22:13](#msg5ce4781b9d64e537bceb4866)modifier =&gt; que dois-je modifier, au juste, dans le view-test.red ?

[22:14](#msg5ce4784575d9a575a62065b2)\[!\[image.png](https://files.gitter.im/red/red/France/m3JT/thumb/image.png)](https://files.gitter.im/red/red/France/m3JT/image.png)

rcqls

[22:14](#msg5ce4784c9404bf2aed8803c3)Executes-le d’abord sans modif…. il génère une erreur...

PierreChTux\_twitter

[22:14](#msg5ce4785163dea422b4c1d442)Point de rectangle noir.

[22:15](#msg5ce478658f019114ae93aaa5)Ni d'erreur; ou alors elle est perdue dans l'oubli de mon xterm...

rcqls

[22:15](#msg5ce4786c83ae782aeeaa81a4)je confirme bizarre….

PierreChTux\_twitter

[22:15](#msg5ce478860ac9852a951a2160)Je relance avec un xterm qui a plein de mémoire...

rcqls

[22:16](#msg5ce478ab879f4478c7bc55ee)c’est pas le bon view-test.red??? tu l’as pris dans tests/gtk3/view-test.red????

PierreChTux\_twitter

[22:16](#msg5ce478b0879f4478c7bc55f1)Voilà le début:

```
# pierre@latitude: ~/dev/red_rcqls/tests/gtk3        < 2019_05_22__00:15:12 >
~/red-gtk view-test.red 
GTK VERSION: 3.24.5
Experimental camera initialized!
-- on-change event -- 
        face : window 
        word : type 
        old  : word 
        new  : word
-- on-change event -- 
        face : window
```

[22:16](#msg5ce478d6ecdf942b4c220c86)Voilà:

```
# pierre@latitude: ~/dev/red_rcqls/tests/gtk3        < 2019_05_22__00:16:32 >
ls -l view-test.red 
-rw-r--r-- 1 pierre pierre 23426 mai   21 21:32 view-test.red
```

rcqls

[22:16](#msg5ce478d90ac9852a951a248e)va dans `~/dev/red_cqls/tests`

PierreChTux\_twitter

[22:17](#msg5ce478e7d22ba766a2d91152)J'y suis.

rcqls

[22:17](#msg5ce4790263dea422b4c1d9dc)là tu devrais avoir une erreur à l'execution

PierreChTux\_twitter

[22:18](#msg5ce47936ad024978c6074af9)Ah, au quai. Pardon, j'avais pas pris le bon, en effet.

[22:18](#msg5ce479440ac9852a951a2820)

```
new  : integer

*** Runtime Error 1: access violation
*** at: 08075564h
```

[22:19](#msg5ce4795a0ac9852a951a2959)Alors, j'édite le bouzin.

rcqls

[22:19](#msg5ce4795a879f4478c7bc5979)Ok normal! et maintenant tu corriges: `system/view/debug?: no`

[22:19](#msg5ce4797a75d9a575a6206e15)normalement `recycle/off` devrait aussi le faire...

PierreChTux\_twitter

[22:19](#msg5ce479818f019114ae93b277)Y O U P I !

[22:20](#msg5ce479a263dea422b4c1dcd3)\[!\[image.png](https://files.gitter.im/red/red/France/zlik/thumb/image.png)](https://files.gitter.im/red/red/France/zlik/image.png)

[22:20](#msg5ce479c3ecdf942b4c221440)C'est grande merveille, en vérité.

rcqls

[22:21](#msg5ce479d075d9a575a6207038)Super! Tu es le winner: le premier à faire fonctionner la camera sur un vrai linux!

PierreChTux\_twitter

[22:21](#msg5ce479dc9d64e537bceb54bc)Youhou! La gloire!

rcqls

[22:21](#msg5ce479ea9d64e537bceb553b)Merci pour ton temps pour ce test!

PierreChTux\_twitter

[22:21](#msg5ce479f69d64e537bceb5549)Allez, je vais frimer dans la chambre à côté, dans la langue de cheikh spire.

[22:21](#msg5ce47a02ef853135c8fe75ba)De rien! Merci pour ton taff!

rcqls

[22:22](#msg5ce47a198f019114ae93b568)Excellent! Have fun!

## Thursday 6th June, 2019

PierreChTux\_twitter

[07:44](#msg5cf8c46e3dcdab4003fac2c4)Bien le coucou à tous, je profite d'un voyage en TGV pour -enfin- tâcher de faire tourner RedCV sur mon GNU/Linux Debian préféré.

[07:45](#msg5cf8c4b7ff3f016baab282e4)J'utilise le reds de @rcqls, et voici ce que ça me sort quand je tente de compiler un des exemples de RedCV:

```

```

[07:49](#msg5cf8c5a1cea8295279ff5efa)

```
# pierre@latitude: ~/heaume_pierre/developpt/red_cv/samples/voronoi        < 2019_06_06__09:41:31 >
ll
total 8.0K
-rwxr-xr-x 1 pierre pierre 2.5K avril 26 22:21 mapdiagram.red
-rwxr-xr-x 1 pierre pierre 1.8K avril 26 22:21 voronoi.red

  # pierre@latitude: ~/heaume_pierre/developpt/red_cv/samples/voronoi        < 2019_06_06__09:41:32 >
reds -u -c voronoi.red 

REBOL/View 2.7.8.4.3 (6-Jan-2011)
Copyright 2011 REBOL Technologies
REBOL is a Trademark of REBOL Technologies
All rights reserved.

Finger protocol loaded
REBOL/View 2.7.8.4.3 (6-Jan-2011)
Copyright 2011 REBOL Technologies
REBOL is a Trademark of REBOL Technologies
All rights reserved.

Finger protocol loaded
Whois protocol loaded
Daytime protocol loaded
SMTP protocol loaded
ESMTP protocol loaded
POP protocol loaded
IMAP protocol loaded
HTTP protocol loaded
FTP protocol loaded
NNTP protocol loaded
HTTPS protocol loaded
Script: "User Preferences" (19-Jun-2012/15:13:14+2:00)
pgSQL protocol loaded
mySQL protocol loaded
btn protocol loaded
Gll preferences loaded: 
Current working directory: /home/pierre/heaume_pierre/developpt/red_cv/samples/v
connecting to: latitude
Connected to database postgeol hosted by latitude on port 5432, logged in as rol
REBOL/View 2.7.8.4.3 6-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM


Type desktop to start the Viewtop.
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.6.4 ===- 

Compiling /home/pierre/heaume_pierre/developpt/red_cv/samples/voronoi/voronoi.re
Compiling libRedRT...
...compilation time : 1117 ms

Compiling to native code...
Script: "Red/System ELF format emitter" (none)
...compilation time : 32599 ms
...linking time     : 476 ms
...output file size : 659636 bytes
...output file      : /home/pierre/heaume_pierre/developpt/red_cv/samples/voronoREBOL/View 2.7.8.4.3 (6-Jan-2011)
Copyright 2011 REBOL Technologies
REBOL is a Trademark of REBOL Technologies
All rights reserved.

Finger protocol loaded
Whois protocol loaded
Daytime protocol loaded
SMTP protocol loaded
ESMTP protocol loaded
POP protocol loaded
IMAP protocol loaded
HTTP protocol loaded
FTP protocol loaded
NNTP protocol loaded
HTTPS protocol loaded
Script: "User Preferences" (19-Jun-2012/15:13:14+2:00)
pgSQL protocol loaded
mySQL protocol loaded
btn protocol loaded
Gll preferences loaded: 
Current working directory: /home/pierre/heaume_pierre/developpt/red_cv/samples/voronoi/
connecting to: latitude
Connected to database postgeol hosted by latitude on port 5432, logged in as role pierre
REBOL/View 2.7.8.4.3 6-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM


Type desktop to start the Viewtop.
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.6.4 ===- 

Compiling /home/pierre/heaume_pierre/developpt/red_cv/samples/voronoi/voronoi.red ...
*** Compilation Error: undefined word layout 
*** in file: /home/pierre/heaume_pierre/developpt/red_cv/samples/voronoi/voronoi.red
*** near: [layout [
        title "Voronoï Diagram 3" 
        text "Number of seeds" 
        f1: field 50 [if error? try [nSeeds: to-integer f1/text] [nSeeds: 30 f1/text: form nSeeds] process] 
        text 60 "Distance" 
        dp: drop-down 85 data ["Euclidian" "Manhattan" "Minkowski" "Chebyshev"] 
        select 1 
        on-change [dparam: face/selected 
            either dparam = 3 [f2/visible?: true] [f2/visible?: false] 
            process
        ] 
        f2: field 40 "3.0" [if error? try [mparam: to-float f2/text] [mparam: 3.0 f2/text: form mparam] process] 
        cb: check "Show seeds" true [param: face/data] 
        button 75 "Generate" [process] 
        button 45 "Quit" [quit] 
        return 
        img: base 640x480 map 
        return 
        text 150 "© Red Foundation 2019" 
        f3: field 480 
        do [f1/text: form nSeeds f2/visible?: false]
    ]]
```

[08:10](#msg5cf8ca67b76eac527aafcead)\[!\[image.png](https://files.gitter.im/red/red/France/VNA7/thumb/image.png)](https://files.gitter.im/red/red/France/VNA7/image.png)

[08:10](#msg5cf8ca783dcdab4003faeb14)

```
*** Compilation Error: undefined word layout
```

J'ai la même erreur quand je tente de compiler un script toucon avec reds:

```
# pierre@latitude: /tmp        < 2019_06_06__10:04:53 >
which reds 
/home/pierre/bin/reds

  # pierre@latitude: /tmp        < 2019_06_06__10:04:55 >
ll ~/bin/reds
-rwxr-xr-x 1 pierre pierre 1.9K avril 26 16:13 /home/pierre/bin/reds

  # pierre@latitude: /tmp        < 2019_06_06__10:05:02 >
file ~/bin/reds
/home/pierre/bin/reds: Bourne-Again shell script, ASCII text executable

  # pierre@latitude: /tmp        < 2019_06_06__10:05:08 >
head ~/bin/reds
#!/bin/bash

## default values
redroot="$HOME/bin"
redargs=""
redmv=""
debug=""

## default depending on state an OS
# case $OSTYPE in

  # pierre@latitude: /tmp        < 2019_06_06__10:05:14 >
cat coucou.red 
Red  []
view layout [text "Coucou"]

  # pierre@latitude: /tmp        < 2019_06_06__10:05:27 >
reds coucou.red 
REBOL/View 2.7.8.4.3 (6-Jan-2011)
Copyright 2011 REBOL Technologies
REBOL is a Trademark of REBOL Technologies
All rights reserved.

Finger protocol loaded
Whois protocol loaded
Daytime protocol loaded
SMTP protocol loaded
ESMTP protocol loaded
POP protocol loaded
IMAP protocol loaded
HTTP protocol loaded
FTP protocol loaded
NNTP protocol loaded
HTTPS protocol loaded
Script: "User Preferences" (19-Jun-2012/15:13:14+2:00)
pgSQL protocol loaded
mySQL protocol loaded
btn protocol loaded
Gll preferences loaded: 
Current working directory: /tmp/
connecting to: latitude
Connected to database postgeol hosted by latitude on port 5432, logged in as role pierre
REBOL/View 2.7.8.4.3 6-Jan-2011
Copyright 2000-2011 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM


Type desktop to start the Viewtop.
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.6.4 ===- 

Compiling /tmp/coucou.red ...
...using libRedRT built on 6-Jun-2019/7:57:16
*** Compilation Error: undefined word layout 
*** in file: /tmp/coucou.red
*** near: [layout [text "Coucou"]]

  # pierre@latitude: /tmp        < 2019_06_06__10:05:44 >
```

En revanche, quand je fais tourner le même script par console-view, ça fonctionne correctement:

```
# pierre@latitude: /tmp        < 2019_06_06__10:05:44 >
which redlang
/usr/bin/redlang

  # pierre@latitude: /tmp        < 2019_06_06__10:06:24 >
ll /usr/bin/redlang
lrwxrwxrwx 1 root root 24 mars   7 16:59 /usr/bin/redlang -> /home/pierre/bin/redlang

  # pierre@latitude: /tmp        < 2019_06_06__10:06:53 >
ll ~/bin/redlang 
lrwxrwxrwx 1 pierre pierre 3 mars   8 13:13 /home/pierre/bin/redlang -> red

  # pierre@latitude: /tmp        < 2019_06_06__10:06:59 >
ll ~/bin/red
lrwxrwxrwx 1 pierre pierre 39 avril 26 21:32 /home/pierre/bin/red -> /home/pierre/dev/red_rcqls/console-view

  # pierre@latitude: /tmp        < 2019_06_06__10:07:04 >
file ~/dev/red_rcqls/console-view 
/home/pierre/dev/red_rcqls/console-view: ELF 32-bit LSB executable, Intel 80386, version 1 (GNU/Linux), dynamically linked, interpreter /lib/ld-linux.so.2, stripped

  # pierre@latitude: /tmp        < 2019_06_06__10:07:20 >
cat coucou.red 
Red  []
view layout [text "Coucou"]

  # pierre@latitude: /tmp        < 2019_06_06__10:07:33 >
redlang coucou.red 
GTK VERSION: 3.24.5

  # pierre@latitude: /tmp        < 2019_06_06__10:08:18 >
```

Qu'ai-je donc loupé, dans ce bazar?

rcqls

[08:14](#msg5cf8cb50b76eac527aafd6d6)@PierreChTux\_twitter Je pense que tu oublies `Red[Needs: View]`...

PierreChTux\_twitter

[08:47](#msg5cf8d31e481ef4167bdb7691)Ach. En effet. Désolé, ça n'est que la seconde fois que je tente de faire du view en Red... Et ça fair des années que j'avais arrêté d'en faire en Rebol.

[08:47](#msg5cf8d32b702b7e5e763a1266)#rouille

## Wednesday 3th July, 2019

PierreChTux\_twitter

[16:15](#msg5d1cd49dbe7a46664461e755)Eh marde, galaire... Alors que Red tournait parfaitement en GTK et tout, voilà que j'ai eu l'idée de quitter Debian pour Devuan, et impossible de refaire tourner Red... Dependency hell typique.

[16:15](#msg5d1cd4a95ce02535b0181ad5)Je pleure en silence. Mais je ne regrette pour autant pas du tout d'avoir réussi à m'échapper de systemd (troll détecté ;o)).

## Monday 22nd July, 2019

ldci

[14:32](#msg5d35c8e1b2db751dabac8769)Bonjour à tous: grosse mise à jour de redCV avant le break d'été: https://github.com/ldci/redCV/tree/master

## Friday 23th August, 2019

ldci

[16:13](#msg5d6010bedbf5ae2d42b0cfb1)Bonjour tout le monde. Des nouveautés ici: https://github.com/ldci/ffmpeg

## Monday 26th August, 2019

ldci

[11:35](#msg5d63c40368406739f986a990)Du nouveau: https://github.com/ldci/ffmpeg.

## Wednesday 4th September, 2019

Palaing

[10:35](#msg5d6f93691a16fc388742b86f)@ldci sur le readme.md , les 2 liens intitulés red-lang.org et ffmpeg.org pointent en fait vers l'adresse erronée https://github.com/ldci/ffmpeg/blob/master...

## Thursday 5th September, 2019

ldci

[17:56](#msg5d714c4d2f93ab5a150f16c5)Merci je vais corriger

## Tuesday 19th November, 2019

fvanzeveren

[07:10](#msg5dd3955ce75b2d5a19fc4e9b)Bonjour à tous, quelqu'un connaitrait-il l'adresse email d'Olivier Auverlot, auteur de magic? J'ai fait les adaptations nécessaires pour que magic fonctionne avec Red sous IIS, Apache, etc... et j'aimerais lui demander la permission de reprendre le développement et de distribuer une nouvelle version sur github. Merci

DideC

[08:37](#msg5dd3a9cb6ba2347d2dbec224)Salut @fvanzeveren, je n'ai pas trouvé son email, mais il Tweet donc tu peux peut-être le chopper par là : https://twitter.com/olivierauverlot

## Wednesday 20th November, 2019

fvanzeveren

[09:57](#msg5dd50e04167c4f62b786d588)Bonjour, je suis à la recherche d'un hébergeur qui accepte l'utilisation de rebol et de red comme moteur cgi. Il faudrait évidemment que la version linux proposée inclue les librairies nécessaires (libc6 et compatibilité x386) afin de pourvoir faire tourner les exécutable rebol et red. Si quelqu'un pouvait m'indiquer un tel hébergeur. merci.
