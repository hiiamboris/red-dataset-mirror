
#3807: Failure to compile console on GNU/Linux debian buster 64 bits
================================================================================
Issue is closed, was reported by pierrechtux and has 6 comment(s).
<https://github.com/red/red/issues/3807>

**Description**
I just downloaded the red sources from git, starting from scratch, and followed the instructions to compile a console. Compilation went right, but the executable doesn't want to run, here is the output:
```
  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
./console 
./console: error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory
```
The libcurl is on my system:
```
  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
locate libcurl.so.4
/home/pierre/heaume_pierre/progs_lin/google-earth/libcurl.so.4
/usr/lib/x86_64-linux-gnu/libcurl.so.4
/usr/lib/x86_64-linux-gnu/libcurl.so.4.5.0

```
If I'm doing a symlink from /usr/lib/ to the current directory, it fails differently:
```
  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
ln -s /usr/lib/x86_64-linux-gnu/libcurl.so.4 .

  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
./console 
./console: error while loading shared libraries: libcurl.so.4: wrong ELF class: ELFCLASS64

```
I'm guessing it has something to do with the architecture.


**To reproduce**
Steps to reproduce the behaviour:

1. Get a fresh git clone of Red:
```
  # pierre@latitude: ~/dev        < 2019_03_08__10_04_26 >
git clone https://github.com/dockimbel/Red
...
```
2. No need to download a Rebol 2, it's already in my $PATH (I chose to use rebol/core, since it doesn't flush the screen at launch time):
```
  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
whereis rebol_core rebol
rebol_core: /usr/bin/rebol_core
rebol: /usr/bin/rebol

  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
rebol_core
REBOL/Core 2.7.8.4.10 (23-Jan-2016)
Copyright 2016 REBOL Technologies
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
Script: "User Preferences" (19-Jun-2012/15:13:14+2:00)
pgSQL protocol loaded
mySQL protocol loaded
btn protocol loaded
Gll preferences loaded: 
Current working directory: /home/pierre/heaume_pierre/developpt/Red/
connecting to: latitude
Error while trying to connect to database bdexplo hosted by latitude on port 5432, as role pierre
>> about  
REBOL/Core 2.7.8.4.10 23-Jan-2016
Copyright 2000-2016 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM

```

3. Compile the console:
```
>> do/args %red.r "-r %environment/console/CLI/console.red"
Script: "Red command-line front-end" (none)

-=== Red Compiler 0.6.4 ===- 

Compiling /home/pierre/heaume_pierre/developpt/Red/environment/console/CLI/console.red ...
...compilation time : 1991 ms

Target: Linux 

Compiling to native code...
Script: "Red/System ELF format emitter" (none)
...compilation time : 50737 ms
...linking time     : 901 ms
...output file size : 1041424 bytes
...output file      : /home/pierre/heaume_pierre/developpt/Red/console 


== none
```


4. See error
```
  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
ll console 
-rwxr--r-- 1 pierre pierre 1018K mars   8 10:40 console

  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
./console 
./console: error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory

  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
locate libcurl.so.4
/home/pierre/heaume_pierre/progs_lin/google-earth/libcurl.so.4
/usr/lib/x86_64-linux-gnu/libcurl.so.4
/usr/lib/x86_64-linux-gnu/libcurl.so.4.5.0

  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
ln -s /usr/lib/x86_64-linux-gnu/libcurl.so.4 .

  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
./console 
./console: error while loading shared libraries: libcurl.so.4: wrong ELF class: ELFCLASS64

  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
```

**Expected behavior**
```
>> loop 3 [print "I'm content!"] 
I'm content!
I'm content!
I'm content!
```


**Platform version (please complete the following information)**
"Run `about` command from Red console and paste the output here." => If I only could...

```
  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
cat /etc/issue
Debian GNU/Linux buster/sid \n \l


  # pierre@latitude: ~/dev/Red        < 2019_03_08__10_34_01 >
uname -rva
Linux latitude 4.19.0-2-amd64 #1 SMP Debian 4.19.16-1 (2019-01-17) x86_64 GNU/Linux
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-08T12:18:22Z, pierrechtux, commented:
<https://github.com/red/red/issues/3807#issuecomment-470909723>

    Okay, it took me a while to figure it out, but I've got it: one must simply follow the advice on `https://www.red-lang.org/p/download.html` concerning 32 bits library.
    What I did:
    ```
      # root@latitude: ~        < 2019_03_08__13_08_13 >
    dpkg --add-architecture i386
    
      # root@latitude: ~        < 2019_03_08__13_08_13 >
    apt-get update
    Réception de :1 http://ftp.fr.debian.org/debian testing InRelease [158 kB]
    Atteint :2 http://linux.teamviewer.com/deb stable InRelease                                                                                                                                               
    Atteint :3 http://security.debian.org testing/updates InRelease                                                                                                                                           
    [...]
    
      # root@latitude: ~        < 2019_03_08__13_08_13 >
    apt-get install libc6:i386 libcurl4:i386
    Lecture des listes de paquets... Fait
    Construction de l'arbre des dépendances       
    Lecture des informations d'état... Fait
    Les paquets supplémentaires suivants seront installés : 
      libc-dev-bin libc6 libc6-dbg libc6-dev libc6-i386 libnghttp2-14:i386 libpsl5:i386
    Paquets suggérés :
      glibc-doc glibc-doc:i386 locales:i386
    Les NOUVEAUX paquets suivants seront installés :
      libcurl4:i386 libnghttp2-14:i386 libpsl5:i386
    Les paquets suivants seront mis à jour :
      libc-dev-bin libc6 libc6:i386 libc6-dbg libc6-dev libc6-i386
    6 mis à jour, 3 nouvellement installés, 0 à enlever et 945 non mis à jour.
    Il est nécessaire de prendre 503 ko/23.4 Mo dans les archives.
    Après cette opération, 1106 ko d'espace disque supplémentaires seront utilisés.
    Souhaitez-vous continuer ? [O/n] 
    Réception de :1 http://ftp.fr.debian.org/debian testing/main i386 libnghttp2-14 i386 1.36.0-2 [90.3 kB]
    [...]
    
      # root@latitude: ~        < 2019_03_08__13_08_13 >
    su - pierre 
    
      # pierre@latitude: ~        < 2019_03_08__13_15_43 >
    cd dev/Red/
    
      # pierre@latitude: ~/dev/Red        < 2019_03_08__13_15_43 >
    ./console 
    --== Red 0.6.4 ==-- 
    Type HELP for starting information. 
    
    >> loop 3 ["Ah!  I'm now supercontent!"]
    == "Ah!  I'm now supercontent!"
    >> loop 3 [print "Ah!  I'm now supercontent!"]
    Ah!  I'm now supercontent!
    Ah!  I'm now supercontent!
    Ah!  I'm now supercontent!
    >> 
    ```

--------------------------------------------------------------------------------

On 2019-03-08T12:21:37Z, pierrechtux, commented:
<https://github.com/red/red/issues/3807#issuecomment-470910533>

    What I still don't understand is that I hadn't changed anything to my system, and all Red things suddenly failed, yesterday.

--------------------------------------------------------------------------------

On 2019-03-08T17:28:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3807#issuecomment-471009382>

    Strange, but 32-bit libs have always been required for Red.

