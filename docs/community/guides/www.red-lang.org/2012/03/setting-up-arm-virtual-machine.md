![Red](https://static.red-lang.org/red-logo.svg)

# [Red Programming Language](https://www.red-lang.org/)

## Pages

- [Home](http://www.red-lang.org/)
- [About](http://www.red-lang.org/p/about.html)
- [Getting Started](http://www.red-lang.org/p/getting-started.html)
- [Download](http://www.red-lang.org/p/download.html)
- [Documentation](http://www.red-lang.org/p/documentation.html)
- [Contributions](http://www.red-lang.org/p/contributions.html)
- [Roadmap](http://www.red-lang.org/p/roadmap_2.html)
- [Privacy Policy](https://www.red-lang.org/p/privacy-policy.html)

## March 29, 2012

[]()

### Setting up an ARM virtual machine

***EDIT** (March 8, 2014): Updated for the 1.6.0 QEMU version.*

The recent release of the [Raspberry Pi](http://www.raspberrypi.org/) board raised a new wave of interest for the ARM platforms. As Red/System is already running on ARMv5+ platforms, a number of Red followers might want to test it on these platforms, so this article aims at giving you a quick way to setup a QEMU emulator for ARM and install a Debian GNU/Linux on top of it.

### QEMU

First thing first, let's setup the platform. [QEMU](http://wiki.qemu.org/Main_Page) is the tool we want for that job. As explained on the QEMU web site: "QEMU is a generic and open source machine emulator and virtualizer." The nice thing about QEMU is that it is able to emulate a good range of [ARM platforms](http://wiki.qemu.org/TexiDemo#ARM_System_emulator) with different CPU versions.

QEMU is distributed as a source package, like most of open source tools, however this is not always convenient for Windows users, so you will also find a link to Windows pre-compiled binaries.

- UNIX users: download and compile QEMU from [sources](http://wiki.qemu.org/Download).
- Windows users: download the binaries from this [page](http://lassauge.free.fr/qemu/), or from this [direct link](http://lassauge.free.fr/qemu/release/Qemu-1.6.0-windows.zip) to 1.6.0 zip package (52MB)

### Installing GNU/Linux

The simplest and quickest way to get a Linux/ARM distribution running on top of QEMU is to used pre-installed Debian images. These Virtual Machine images can be found [there](http://people.debian.org/~aurel32/qemu/armel/) along with additional useful information (be sure to read them all). As you can see, there are two kind of images: **standard** and **desktop**. The **desktop** one gives you the full Debian GUI environment pre-installed, but be warned, it is extremely slow, even on my Core i7 box with a medium-level graphic card, so I recommend using the **standard** version pre-installed with Debian Squeeze (latest Debian release).

The files you need from the [debian.org](http://people.debian.org/~aurel32/qemu/armel/) site are (direct links provided for convenience):

- [debian\_squeeze\_armel\_standard.qcow2](http://people.debian.org/~aurel32/qemu/armel/debian_squeeze_armel_standard.qcow2) (169MB)
- [initrd.img-2.6.32-5-versatile](http://people.debian.org/~aurel32/qemu/armel/initrd.img-2.6.32-5-versatile) (2.4MB)
- [vmlinuz-2.6.32-5-versatile](http://people.debian.org/~aurel32/qemu/armel/vmlinuz-2.6.32-5-versatile) (1.2MB)

Put them all somewhere in the same folder.

The command line for starting QEMU with the pre-installed VM is provided on the debian.org page, here is a copy of the right command line for the **standard** VM with 2.6.32 kernel:

```
qemu-system-armw -L Bios -M versatilepb -kernel vmlinuz-2.6.32-5-versatile -initrd initrd.img-2.6.32-5-versatile -hda debian_squeeze_armel_standard.qcow2 -append "root=/dev/sda1"
```

```

```

For Windows users, the easiest way to start it is to make a shortcut on qemu-system-arm , add the command-line arguments and insert the path to the VM files in the "working folder" field.

You can now just run the emulator and boot on Debian to test your environment.

For purists, it is also possible to install the Debian distro from scratch following this step-by-step [tutorial](http://www.aurel32.net/info/debian_arm_qemu.php).

### Making the Virtual Machine communicate

As you will quickly discover, the network connection is not working out of the box, so you need to add more parameters to the command-line to make it work. From my own experience, it is a black art to make it work properly (the documentation is really poor and obscure on that topic), but I ended up making the network work (and the Internet connection through the host platform) by using these additional arguments:

    -net nic -net user

Once the VM is rebooted, you can test it using a ping and then issue an \`apt-get update\` command. In case the ping test passes but not the apt-get, you might have wrong apt source URL, so you can change them by editing the [/etc/apt/sources.list](http://wiki.debian.org/SourcesList) config file.

You have now a working ARM virtual platform, but in order to make it useful for Red/System testing, you need a simple way to pass compiled files to the guest OS (Red/System can only cross-compile to ARM due to the lack of a suitable REBOL interpreter).

In order to achieve that, you need to add new parameters to the command-line in order to map a guest OS TCP port to a host OS port. For example, to map guest OS port 22 (SSH) to port 1222 on host OS, just add:

    -redir tcp:2222::22

So, the VM internal port 22 is now reachable from localhost:1222 on your host OS. You can now use your favorite SSH/SFTP/SCP client to get a remote shell and transfer files to the VM. You might need to setup a SSH server in the VM (I seem to recall that it is not installed by default in the above images), you can achieve that using the following command:

    # sudo apt-get install openssh-client openssh-server

I use SSH for moving files in and out the VM using the still excellent [SSH Secure Shell](http://sils.unc.edu/it-services/servers/using-ssh) tool for Windows, but you could as well use FTP or any other TCP-based suitable protocol.

### Additional settings

You can improve your experience with QEMU by adding more memory to the default emulated ARM platform which only has 128MB. Pushing it to 256MB (same as Raspberry PI Model A board now has) is highly recommended, just add to the command-line:

    -m 256

If you are using a non-english keyboard like myself, you can also emulate your preferred keyboard layout using for example, the following command:

    -k fr

will setup the keyboard with a french layout, other country codes are available [here](http://wiki.qemu.org/TexiDemo#sec_005finvocation). In case you get an error message about the keymap not being found, just copy the Bios/keymaps folder one level up, so that it is just above your qemu-* binaries.

That's all folks, I hope this would have help you get started! *Let me know if there is any error or missing info in this article, and let me know if it worked well for you.*

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [2:59 PM](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=4479797641492781893&from=pencil "Edit Post")

Labels: [ARM](https://www.red-lang.org/search/label/ARM), [Debian](https://www.red-lang.org/search/label/Debian), [linux](https://www.red-lang.org/search/label/linux), [QEMU](https://www.red-lang.org/search/label/QEMU), [tutorial](https://www.red-lang.org/search/label/tutorial)

[]()

#### 6 comments:

1. ![](//resources.blogblog.com/img/blank.gif)
   
   John[March 30, 2012 at 2:12 AM](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html?showComment=1333066360893#c8108562356032748800)
   
   I wish the Raspberry Pi wait list was shorter :-)
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8108562356032748800)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[July 5, 2012 at 3:09 PM](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html?showComment=1341493784919#c1786947341277474731)
   
   Le dev de red semble ralentir?  
   Dans la roadmap il y a la reécriture des compilateurs red/systeme et static en red. N'est-il pas plus judicieux d'écrire un interpreteur rebol et un parser partiel du langage C (seulement pour les instructions des fichiers .h) en red et ... ainsi d'une pierre on ferait trois coups:  
   \-un rebol open source (rêve de la communauté rebol).  
   \-plus besoin de reécrire les compilateurs.  
   \-extensions futures par dll faciles.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1786947341277474731)
   
   [Replies]()
   
   1. [Reply]()
3. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
   
   [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[July 5, 2012 at 6:22 PM](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html?showComment=1341505366146#c4118435698969504094)
   
   Oui le dev de Red a ralenti car j'effectue une mission pour un client afin de pouvoir financer la suite du projet Red. Je termine ce mois-ci (juillet), le travail sur Red reprendra donc dans la foulée. Heureusement, j'ai dans le même temps reçu d'importantes donations qui vont me permettre de ne plus travailler que sur Red jusqu'à l'année prochaine au moins.
   
   Ce que tu décris n'est pas le projet Red, mais un projet de clone pure de REBOL (en remplaçant le C par Red+Red/System) si j'ai bien compris ? Je n'ai pas compris le parser partiel du langage C ? La réécriture des compilateurs en Red est un passage obligé pour avoir un langage indépendant de tout autre (C y compris, du moins autant que faire se peut) et est une forme de validation des fonctionnalités du langage. De plus, la réécriture en Red permettra l'implémentation d'un compilateur JIT.
   
   Red n'a pas pour vocation de faire un clone de REBOL, mais de le dépasser (en gardant tous les bons aspects). Cf mes slides de présentations de Red.
   
   Pour continuer la conversation, je suggère le canal IRC #red-lang.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4118435698969504094)
   
   [Replies]()
   
   1. [Reply]()
4. ![](//resources.blogblog.com/img/blank.gif)
   
   [paul fox](http://crtags.blogspot.com)[February 6, 2013 at 12:22 AM](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html?showComment=1360106571318#c1461533800292998433)
   
   What a star! Am sitting here thinking - shall i dig out my RaspberryPi to start working on DTrace for ARM, or could I use a VM. First hit, I hit this page, seconds later I have a working ARM kernel. How brilliant, and its running on my i7 laptop.
   
   Now to get the network working....
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1461533800292998433)
   
   [Replies]()
   
   1. [Reply]()
5. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhea2YYbfPYErJ2kMzpMFdFiDrDBPvhssWA1Qn02TAaWWxu8kEiK5bowqL6NuWMeh7zeXX_EPaDHk4u-PjPHeoJbyjbRSSmdlgN9tqBDEgvMcSriu8O_rgPXus5w61KGd4/s45-c/DSC05563-small2.jpg)
   
   [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055)[February 7, 2013 at 10:32 PM](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html?showComment=1360272749048#c4310068191032642938)
   
   Glad this tutorial was useful to you.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4310068191032642938)
   
   [Replies]()
   
   1. [Reply]()
6. ![](//resources.blogblog.com/img/blank.gif)
   
   [Raymond](https://www.nakivo.com/industry/business-data-backup/)[December 5, 2019 at 12:53 PM](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html?showComment=1575546827135#c8650856559004435730)
   
   Thanks for the extensive VM guide!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8650856559004435730)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=4479797641492781893&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2012/08/redsystem-v026-released.html "Newer Post") [Older Post](https://www.red-lang.org/2012/03/redsystem-v025-released.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/4479797641492781893/comments/default)

[Star](https://github.com/red/red)   [Follow @red\_lang](https://twitter.com/red_lang)

    

Follow [@red\_lang](https://twitter.com/red_lang) on Twitter or on [/r/redlang](https://www.reddit.com/r/redlang/) subreddit.

Chat with us in our [Gitter](https://gitter.im/red/red) room.

## Search This Blog

## Total Pageviews

[Loading...](http://github.com/red/red/commits/master.atom)

## Blog Archive

- [►](javascript:void%280%29)  [2025](https://www.red-lang.org/2025/) (2)
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2025/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2025/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2024](https://www.red-lang.org/2024/) (4)
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2024/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2024/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2024/02/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2023](https://www.red-lang.org/2023/) (3)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2023/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2023/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2023/06/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2022](https://www.red-lang.org/2022/) (2)
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2022/07/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2021](https://www.red-lang.org/2021/) (2)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2021/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2021/08/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2020](https://www.red-lang.org/2020/) (4)
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2020/08/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2020/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2020/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2019](https://www.red-lang.org/2019/) (10)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2019/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2019/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2019/10/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2019/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2019/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2019/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2019/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2019/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2018](https://www.red-lang.org/2018/) (20)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2018/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2018/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2018/10/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2018/09/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2018/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2018/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2018/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2018/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2018/01/) (5)

<!--THE END-->

- [►](javascript:void%280%29)  [2017](https://www.red-lang.org/2017/) (3)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2017/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2017/07/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2017/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2016/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2015](https://www.red-lang.org/2015/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2015/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2015/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2014](https://www.red-lang.org/2014/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2014/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2014/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2014/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2014/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2014/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2013](https://www.red-lang.org/2013/) (5)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2013/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2013/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2013/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2013/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2013/01/) (1)

<!--THE END-->

- [▼](javascript:void%280%29)  [2012](https://www.red-lang.org/2012/) (8)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2012/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2012/10/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2012/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2012/08/) (1)
  
  <!--THE END-->
  
  - [▼](javascript:void%280%29)  [March](https://www.red-lang.org/2012/03/) (2)
    
    - [Setting up an ARM virtual machine](https://www.red-lang.org/2012/03/setting-up-arm-virtual-machine.html)
    - [Red/System v0.2.5 released](https://www.red-lang.org/2012/03/redsystem-v025-released.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2012/02/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2011](https://www.red-lang.org/2011/) (15)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2011/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2011/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2011/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2011/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2011/05/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2011/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2011/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2011/02/) (1)

## Tags cloud

[2D](https://www.red-lang.org/search/label/2D) (1) [alias](https://www.red-lang.org/search/label/alias) (1) [alpha](https://www.red-lang.org/search/label/alpha) (1) [Android](https://www.red-lang.org/search/label/Android) (3) [announce](https://www.red-lang.org/search/label/announce) (7) [apply](https://www.red-lang.org/search/label/apply) (1) [ARM](https://www.red-lang.org/search/label/ARM) (4) [armhf](https://www.red-lang.org/search/label/armhf) (1) [arrays](https://www.red-lang.org/search/label/arrays) (2) [AST](https://www.red-lang.org/search/label/AST) (1) [beta](https://www.red-lang.org/search/label/beta) (1) [binaries](https://www.red-lang.org/search/label/binaries) (1) [binary form](https://www.red-lang.org/search/label/binary%20form) (1) [bitset](https://www.red-lang.org/search/label/bitset) (1) [blog](https://www.red-lang.org/search/label/blog) (1) [booleans](https://www.red-lang.org/search/label/booleans) (1) [bridge](https://www.red-lang.org/search/label/bridge) (2) [bugfixes](https://www.red-lang.org/search/label/bugfixes) (4) [callback](https://www.red-lang.org/search/label/callback) (2) [casing](https://www.red-lang.org/search/label/casing) (1) [changelog](https://www.red-lang.org/search/label/changelog) (1) [China](https://www.red-lang.org/search/label/China) (2) [codecs](https://www.red-lang.org/search/label/codecs) (1) [collation](https://www.red-lang.org/search/label/collation) (1) [community](https://www.red-lang.org/search/label/community) (1) [compilation](https://www.red-lang.org/search/label/compilation) (6) [compiler](https://www.red-lang.org/search/label/compiler) (2) [conference](https://www.red-lang.org/search/label/conference) (2) [console](https://www.red-lang.org/search/label/console) (8) [context](https://www.red-lang.org/search/label/context) (2) [contribution](https://www.red-lang.org/search/label/contribution) (1) [CSDN](https://www.red-lang.org/search/label/CSDN) (1) [date](https://www.red-lang.org/search/label/date) (1) [Debian](https://www.red-lang.org/search/label/Debian) (1) [demos](https://www.red-lang.org/search/label/demos) (3) [development](https://www.red-lang.org/search/label/development) (1) [dialect](https://www.red-lang.org/search/label/dialect) (1) [dll](https://www.red-lang.org/search/label/dll) (1) [donations](https://www.red-lang.org/search/label/donations) (1) [download](https://www.red-lang.org/search/label/download) (1) [Draw](https://www.red-lang.org/search/label/Draw) (1) [DSL](https://www.red-lang.org/search/label/DSL) (1) [dynamic calls](https://www.red-lang.org/search/label/dynamic%20calls) (1) [ELF](https://www.red-lang.org/search/label/ELF) (1) [encap](https://www.red-lang.org/search/label/encap) (1) [enum](https://www.red-lang.org/search/label/enum) (1) [exceptions](https://www.red-lang.org/search/label/exceptions) (3) [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.) (1) [features](https://www.red-lang.org/search/label/features) (2) [floating point](https://www.red-lang.org/search/label/floating%20point) (3) [floats](https://www.red-lang.org/search/label/floats) (2) [FPU](https://www.red-lang.org/search/label/FPU) (4) [freebsd](https://www.red-lang.org/search/label/freebsd) (1) [functions](https://www.red-lang.org/search/label/functions) (1) [GC](https://www.red-lang.org/search/label/GC) (1) [gpio](https://www.red-lang.org/search/label/gpio) (1) [GTK+](https://www.red-lang.org/search/label/GTK%2B) (1) [GUI](https://www.red-lang.org/search/label/GUI) (9) [hash](https://www.red-lang.org/search/label/hash) (1) [HOF](https://www.red-lang.org/search/label/HOF) (1) [I/O](https://www.red-lang.org/search/label/I%2FO) (1) [IA-32](https://www.red-lang.org/search/label/IA-32) (2) [IEEE-754](https://www.red-lang.org/search/label/IEEE-754) (1) [implementation](https://www.red-lang.org/search/label/implementation) (2) [interpreter](https://www.red-lang.org/search/label/interpreter) (1) [iOS](https://www.red-lang.org/search/label/iOS) (1) [IW](https://www.red-lang.org/search/label/IW) (1) [java](https://www.red-lang.org/search/label/java) (2) [jni](https://www.red-lang.org/search/label/jni) (1) [lexer](https://www.red-lang.org/search/label/lexer) (2) [libc](https://www.red-lang.org/search/label/libc) (1) [libRed](https://www.red-lang.org/search/label/libRed) (2) [libRedRT](https://www.red-lang.org/search/label/libRedRT) (1) [linker](https://www.red-lang.org/search/label/linker) (1) [linux](https://www.red-lang.org/search/label/linux) (2) [literal arrays](https://www.red-lang.org/search/label/literal%20arrays) (2) [livecoding](https://www.red-lang.org/search/label/livecoding) (1) [load](https://www.red-lang.org/search/label/load) (2) [loader](https://www.red-lang.org/search/label/loader) (1) [macOS](https://www.red-lang.org/search/label/macOS) (1) [MacOSX](https://www.red-lang.org/search/label/MacOSX) (2) [macros](https://www.red-lang.org/search/label/macros) (2) [major](https://www.red-lang.org/search/label/major) (1) [map](https://www.red-lang.org/search/label/map) (2) [math](https://www.red-lang.org/search/label/math) (2) [meeting](https://www.red-lang.org/search/label/meeting) (1) [memory](https://www.red-lang.org/search/label/memory) (1) [migration](https://www.red-lang.org/search/label/migration) (1) [monitors](https://www.red-lang.org/search/label/monitors) (1) [namespaces](https://www.red-lang.org/search/label/namespaces) (1) [native](https://www.red-lang.org/search/label/native) (1) [navigation](https://www.red-lang.org/search/label/navigation) (1) [objective-c](https://www.red-lang.org/search/label/objective-c) (1) [objects](https://www.red-lang.org/search/label/objects) (3) [ownership](https://www.red-lang.org/search/label/ownership) (1) [pair](https://www.red-lang.org/search/label/pair) (1) [pairs](https://www.red-lang.org/search/label/pairs) (1) [parse](https://www.red-lang.org/search/label/parse) (5) [path notation](https://www.red-lang.org/search/label/path%20notation) (1) [paths](https://www.red-lang.org/search/label/paths) (1) [percent](https://www.red-lang.org/search/label/percent) (1) [pointers](https://www.red-lang.org/search/label/pointers) (2) [points](https://www.red-lang.org/search/label/points) (1) [port](https://www.red-lang.org/search/label/port) (2) [preprocessor](https://www.red-lang.org/search/label/preprocessor) (2) [presentation](https://www.red-lang.org/search/label/presentation) (2) [QEMU](https://www.red-lang.org/search/label/QEMU) (1) [questions](https://www.red-lang.org/search/label/questions) (1) [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi) (3) [react](https://www.red-lang.org/search/label/react) (1) [reactive](https://www.red-lang.org/search/label/reactive) (5) [Red](https://www.red-lang.org/search/label/Red) (2) [red/system](https://www.red-lang.org/search/label/red%2Fsystem) (4) [redbin](https://www.red-lang.org/search/label/redbin) (1) [release](https://www.red-lang.org/search/label/release) (13) [REPL](https://www.red-lang.org/search/label/REPL) (2) [routine](https://www.red-lang.org/search/label/routine) (1) [rules engine](https://www.red-lang.org/search/label/rules%20engine) (1) [runtime errors](https://www.red-lang.org/search/label/runtime%20errors) (3) [screen](https://www.red-lang.org/search/label/screen) (1) [sets](https://www.red-lang.org/search/label/sets) (1) [SFD](https://www.red-lang.org/search/label/SFD) (1) [shared libraries](https://www.red-lang.org/search/label/shared%20libraries) (2) [sorting](https://www.red-lang.org/search/label/sorting) (1) [sources](https://www.red-lang.org/search/label/sources) (1) [specs](https://www.red-lang.org/search/label/specs) (2) [stack](https://www.red-lang.org/search/label/stack) (1) [startups](https://www.red-lang.org/search/label/startups) (1) [stats](https://www.red-lang.org/search/label/stats) (1) [strings](https://www.red-lang.org/search/label/strings) (1) [subpixel](https://www.red-lang.org/search/label/subpixel) (1) [sum up](https://www.red-lang.org/search/label/sum%20up) (1) [SVG](https://www.red-lang.org/search/label/SVG) (1) [syntax](https://www.red-lang.org/search/label/syntax) (1) [tabbing](https://www.red-lang.org/search/label/tabbing) (1) [tests](https://www.red-lang.org/search/label/tests) (4) [time](https://www.red-lang.org/search/label/time) (1) [toolchain](https://www.red-lang.org/search/label/toolchain) (1) [tuple](https://www.red-lang.org/search/label/tuple) (1) [tutorial](https://www.red-lang.org/search/label/tutorial) (1) [type-checking](https://www.red-lang.org/search/label/type-checking) (1) [typeset](https://www.red-lang.org/search/label/typeset) (1) [Unicode](https://www.red-lang.org/search/label/Unicode) (4) [update](https://www.red-lang.org/search/label/update) (1) [user group](https://www.red-lang.org/search/label/user%20group) (1) [vector](https://www.red-lang.org/search/label/vector) (2) [VFP](https://www.red-lang.org/search/label/VFP) (2) [VID](https://www.red-lang.org/search/label/VID) (2) [View](https://www.red-lang.org/search/label/View) (3) [widgets](https://www.red-lang.org/search/label/widgets) (1) [x87](https://www.red-lang.org/search/label/x87) (1)

Copyright 2011-2020 Nenad Rakocevic &amp; Red Foundation. Powered by [Blogger](https://www.blogger.com).

[![Fork me on GitHub](https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67)](https://github.com/red/red)
