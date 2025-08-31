# Archived messages from: [gitter.im/red/GTK](/gitter.im/red/GTK/) from year: 2019

## Sunday 6th January, 2019

dockimbel

[10:48](#msg5c31dcecaac7082e6fe105da)One big show-stopper of GTK integration is the terrible CSS-like string-oriented API to set widgets graphic properties. We need a lower-level access, bypassing this interface. A good start for that would be to see if such lower-level API is already exposed in GTK one way or another. If not, we should consider exporting the related functions and submit a argumented patch to GTK main repo.

rcqls

[11:10](#msg5c31e22b57c6883f9b6f9334)@dockimbel Is the red team working already in this branch? Good to know before investing more in this branch. @loziniak contacts me since, if I remember properly, he wants to try to compile the wallet for linux.

dockimbel

[11:18](#msg5c31e3f057c6883f9b6f9fd6)@rcqls No, we're not. All the available low-level resources are for now assigned to our big goals to achieve in 2019 (see the new blog article).

rcqls

[11:21](#msg5c31e4bb5ec8fe5a850d78cb)@dockimbel It makes sense. Reading quickly the blog article I did not know if `Linux` development was included in the `Red/Pro` project.

[11:31](#msg5c31e7071d1c2c3f9ccdbf3d)With an extended `docker-red-gtk`, we could pretty easily use `red/gtk` in the macOS environment by developping taylor-made bash scripts. As I said before, my thought is that it could be a possible temporary replacement when macOS 32bit disappears and if red/64bit not yet provided by the Red team. Of course, developemenit of the `Linux` Red/View really matters alone because of the magic cross-compilation of `red` toolchain.

## Monday 7th January, 2019

qtxie

[02:32](#msg5c32ba4c26d86e4d5638d894)Regarding the GTK API, it still has lower-level APIs for setting almost all the properties, though it's marked as deprecated in the document. I think we can still use them as what \[SWT lib](https://www.eclipse.org/swt/) did.

dockimbel

[02:36](#msg5c32bb3412db9607e74a370f)@qtxie Good!

rebolek

[09:53](#msg5c3321a31948ad07e8ffdea3)@rcqls I see there's a new branch GTK-New, will the development be done there? I'm doing automated builds for GTK version, so I'd like to know if I should switch my script to this branch, thanks.

dockimbel

[09:55](#msg5c33221d82a6c30b9099ffe0)No, the official GTK branch is red/GTK.

rebolek

[09:56](#msg5c33226abd592b2e6e6600d9)Ok, thanks.

rcqls

[10:12](#msg5c3325f95ec8fe5a85151ca8)@rebolek This `GTK-New` is the development that I have done to be poissibly merged in the red/master branch. @qtxie asks me this and it will review it. Right now, I have treated it and it works (apparently) for red-0.6.4

[10:16](#msg5c3327191d1c2c3f9cd5586b)It seems finally that the best thing is to PR to red/GTK branch. Eventhough, to maintain this branch seems difficult when a lot of changes are made in the red/master branch.

[10:26](#msg5c33294e4ed182787770f7a4)@qtxie @dockimbel Is it possible to refresh/merge the red/GTK branch when changes are updated to the red/master branch because it was pretty painful to adapt the code (I mean, the common code shared with the other backends) to make GTK development working for red-0.6.4 ?

dockimbel

[10:33](#msg5c332ae36370df0b91a24e2c)Yes, we will refresh red/GTK with latest master.

rebolek

[10:47](#msg5c332e334ed18278777117c5)@rcqls thanks for info. I leave my script as is and will build from `red/GTK`.

rcqls

[11:34](#msg5c333941357dd7655d2e133f)@dockimbel excellent news! Thanks!

[12:15](#msg5c3342df12db9607e74d574a)For info:

\### Files shared between red/master and red/GTK (having some Linux/GTK changes)

1\. boot.red  
1\. compiler.r  
1\. build/includes.r  
1\. environment/codecs/bmp.red  
1\. environment/codecs/gif.red  
1\. environment/codecs/jpeg.red  
1\. environment/codecs/png.red  
1\. modules/view/VID.red  
1\. modules/view/backends/platform.red  
1\. runtime/red.reds  
1\. runtime/definitions.reds

dockimbel

[12:17](#msg5c3343581948ad07e800abbe)@qtxie ^---

greggirwin

[18:43](#msg5c339dcd82a6c30b909d48ea)We got a comment on the new blog entry. I tried to reply, but blogger isn't letting me for some reason. I was going to post this, if someone else can jump in:

There is a partial GTK implementation, done by community member @rcqls. It's not a priority for the core team, but anyone is welcome to contribute to it. We have a new chat room for it as well: https://gitter.im/red/GTK

toomasv

[18:53](#msg5c33a0381d1c2c3f9cd88236)@greggirwin Posted... And saw this: "Your comment will be visible after approval. "

greggirwin

[19:12](#msg5c33a48c3cf6c35a84a720ea)Thanks, Published. I don't know why my own messages don't show, or even come up for me to moderate myself.

toomasv

[19:23](#msg5c33a7158b6399655e21bf2d)Self-referencing paradoxes :wink:

loziniak

[23:17](#msg5c33de164ed1827877759cc4)Does it mean that compiling from red/red/GTK branch should work? I get an error:

```
Compiling /home/maciek/red/github-red-gtk/environment/console/CLI/console.red ...
*** Syntax Error: Invalid word! value
*** in file: /home/maciek/red/github-red-gtk/modules/view/backends/platform.red
*** line: 846
*** at: {]

#switch config/GUI-engine [
^-native [}
```

[23:34](#msg5c33e1ffaac7082e6fed8b97)I've compiled from `rcqls/red/GTK-New` and it compiles and tests run ok.

## Tuesday 8th January, 2019

rcqls

[04:12](#msg5c34231182a6c30b90a089b5)@loziniak Good to know! Have you tried to compile `console-view.red` (`console.red` with `Needs: 'View` ) and then execute `console-view tests/react-view.red`?

[05:42](#msg5c343828aac7082e6fef6f0e)@loziniak I guess that in the process to update the GTK branch with the `rcqls/red:GTK-New` branch, @dockimbel merged master branch into the GTK branch. This makes the GTK branch unusable for a temporary while until the validation of the PR for merging`rcqls/red:GTK-New` branch . It could be good maybe to tag the commit 4de550b00b7e1b0fa410ec93dd3e9cc3336abad8 (corresponding to the GTK branch related to red-0.6.3) to something like `red-0.6.3-gtk3` .

dockimbel

[06:05](#msg5c343d8c1d1c2c3f9cdc374f)@qtxie is working on making the red/GTK work after the merge. Some pieces are missing in GTK backend to handle the latest version of View engine.

rcqls

[07:11](#msg5c344d141948ad07e807245b)@dockimbel I don’t really understand what you mean by "latest View engine ». The goal of `rcqls/red:GTK-New` was to make GTK backend compatible with the latest version View engine being in the `red/red:master` branch. So @qtxie is preparing improvements with respect to `rcqls/red:GTK-New` ? Ok, I’ll wait for these changes.

[07:11](#msg5c344d2773360b4d55d69450)Oh! I see your comment in the PR now!

dockimbel

[07:21](#msg5c344f73bd592b2e6e6d6ccc)@rcqls Qingtian pushed a fix: https://github.com/red/red/commit/6c55966463295c353e77265d2948e6c21319368b, so now you can sync your branch to red/GTK, and then send a PR with the diff changes you've made.

rcqls

[07:30](#msg5c3451a41d1c2c3f9cdcb048)What this fix does was already done in `rcqls/red:GTK-New`… I don’t understand why I have to sync my `rcqls/red:GTK` since I put everything in `rcqls/red:GTK-New` which is based on `red/red:master` with the corrected GTK codes introduced to solve the problem of compilation and execution.

dockimbel

[07:35](#msg5c3452b44ed1827877783fb7)@rcqls You can sync red/GTK with rcqls/red:GTK-New. In case of conflicts, you can keep your code version if you think it's better.

[07:38](#msg5c3453728b6399655e25f4c2)Your previous PR cointained too many unrelated commits, so we could not identify the changes you've made. That's why we needed to upgrade our own branch to latest master first, to match yours.

rcqls

[07:48](#msg5c3455e95ec8fe5a851cb840)Yes, that what I understood (if you see my previous answer to @loziniak ). The fix: red/red@6c55966 was already in my PR. After your merging of the `red/red:master` into `red/red:GTK` my PR was enough so I think that fix: red/red@6c55966 was unnecessary and if I send my PR now I think it could have some slight conflicts because of slight change of formatting between fix: red/red@6c55966 and my PR `rcqls/red:GTK-New`. BTW, I am not used to sync red/GTK with rcqls/red:GTK-New. Is it possible to cancel red/GTK with the commit red/red@6c55966 to only resend my PR as is?

dockimbel

[07:55](#msg5c34577d3cf6c35a84ab90a4)&gt; BTW, I am not used to sync red/GTK with rcqls/red:GTK-New.

Just rebase your rcqls/red:GTK-New branch from red/GTK. Then you can revert changes made in red/GTK if you want. That is pretty straightforward to do.

[08:03](#msg5c34593e1491b27876db4872)You cannot resend your "PR as-is", as you didn't rebase your branch to red/GTK first, resulting in hundreds of unrelated commits.

[08:14](#msg5c345bcd5ec8fe5a851cde94)In this commit https://github.com/red/red/pull/3716/commits/6b76e6d4f756bc7d04ae2fb7fe2ae8ee5ae43e15, all the GTK-related files are added again, why? Something is wrong with your PR and/or your branch.

[08:32](#msg5c3460121d1c2c3f9cdd141e)Did you create that GTK-new branch by copying files from GTK over it? If so, that is wrong, because all the git history is then lost. You should always fork a branch to start a new one, in order to retain the history.

[08:34](#msg5c3460823cf6c35a84abc6b4)If that's the case, you should sync your rcqls/red:GTK branch to red/GTK, then copy back all the files from GTK-new on it (git adding the new files if any), then commit the changes, and finally submit a PR.

rcqls

[08:36](#msg5c346108357dd7655d35669a)This PR was based on the latest `red/red:master` and the goal was to  
1\) add the GTK-related files updated or not depending on the latest `red/red:master`  
2\) change the shared files.  
It seems to me to modify the old `red/red:GTK` branch directly to integrate the latest red master was more difficult. It was also an exercise for me to really see what are the files to maintain like expressed in the repo `rcqls/red-gtk`

And you’re right about your comment on adding GTK files, I did not realize that I was loosing the history… and it was then a bad idea.  
But if you include now more regularly changes made in red:master to red:GTK it would be easier to maintain.

dockimbel

[08:47](#msg5c3463bc1d1c2c3f9cdd2d41)&gt; But if you include now more regularly changes made in red:master to red:GTK it would be easier to maintain.

Just ask us to update the branch with latest master changes when you need it.

[08:50](#msg5c34644e6370df0b91aa0d93)As a rule of thumb, if your PR does not include \*only* the changes you've made since previous PR, you probably did something wrong.

rcqls

[09:09](#msg5c3468b25ec8fe5a851d2a1c)You’re fully right… But my primary goal was just to make things working first.

As a little comment, in this particular case, after your merging `red/red:master` into `red/red:GTK` my PR seems to be ok without loosing the history. But maybe, I miss something…

[12:35](#msg5c3499121d1c2c3f9cde8a36)@dockimbel @qtxie I closed the two previous PR and I have submitted a new one with only the significant updated code for the laster red/red:master. I updated first my `rcqls/red:GTK` branch before the new PR. Hope it is the good one! Thanks

qtxie

[14:03](#msg5c34adb66370df0b91abf25a)@rcqls Thanks. I saw you added some rules (adjust-buttons, capitalize, Cancel-OK) for it. Do we really need them? Is a document about those rules somewhere? For example, the rules for Windows is according to this document: https://docs.microsoft.com/en-us/windows/desktop/appuistart/-user-interface-principles#spacing-and-positioning.

dockimbel

[14:30](#msg5c34b3f526d86e4d564528e8) @rcqls Thanks, much better now. :+1:

[14:30](#msg5c34b40f12db9607e7568682)

rcqls

[15:03](#msg5c34bbab8b6399655e28a3dc)@dockimbel Thanks a lot for your help!  
@qtxie I really don’t know about rules. I put it first in a phase of debugging mode when execution failed. But you can remove it as you wish. As a non professional, my primary goal is to make things working first and then to clean the code when it is more stable. `red:GTK` branch is some sort of developping branch since it integrates all the backends (except Android one) and necessarily the GTK backend. It could be good to have a more general branch called red:View (for instance) integrating Android backend too because IMHO one of the killer feature of red is the cross-compilation. Remember that I am more a macOS user (even if I use it mostly as a linux user)… So my humble effort in helping in the development of GTK backend is mostly because of this feature of cross-compilation which is of course combined with View. `red` has eveything to be THE master language to manage your computer.

loziniak

[19:04](#msg5c34f42baac7082e6ff44549)@rcqls my binary compiled (I compiled with `Needs: View`) from \*GTK-New* runs `tests/react-test.red` ok. I haven't found `tests/react-view.red`.

[19:09](#msg5c34f54f4ed18278777c718f)Regarding branches: I would assume that \*GTK* branch will be merged into \*master* eventually (when we deal with all GTK problems), just like \*Android* branch, since these are core features of Red. They are on the roadmap at last :-)

rcqls

[19:32](#msg5c34fad23cf6c35a84afddf8)@loziniak Sorry, my mistake for `tests/react-view.red`, it is indeed `tests/react-test.red`. But you can also try a lot of examples in

\* `tests/`and `tests/gtk3` folders of the `red:GTK` branch  
\* `red/code` repo  
\* `red/community` repo

It would give you an overall of what is working and above all what is missing.

loziniak

[19:57](#msg5c35009d357dd7655d39afe3)Do you think it's a good idea to include `Needs: View` line in GTK branch?

rcqls

[19:59](#msg5c35011b8b6399655e2a7894)I already added in `console-view.red` which is simply `console.red` with `Needs: ‘View`.

loziniak

[20:00](#msg5c35016b1491b27876dfbd22)Second question: What branch to run View tests first: \*GTK* or \*rcqls/GTK-New\*? Which would be more useful for development?

rcqls

[20:05](#msg5c350274aac7082e6ff4a3f2)`rcqls/red:GTK` (which would become `red/red:GTK` after PR validation ) is the official one (and is the same than `rcqls/red:GTK-New` but with history). rcqls/red:GTK-New\` will then be removed! It only helps me to update to red-0.6.4...

loziniak

[20:09](#msg5c35037173360b4d55db77a8)Ok, then next: Can we update https://toltex.u-ga.fr/RedGtk to reflect current state of red/GTK development? Maybe instead a github wiki page could be created?

rcqls

[20:12](#msg5c35042f3cf6c35a84b01a57)`https://toltex.u-ga.fr/RedGtk` is my own page that I can modify easily… there is nothing official with this page. Obviously, it is much better to manage a wiki page on GitHub and you are welcome to create it.

loziniak

[20:14](#msg5c3504be1d1c2c3f9ce17a1a)Ok, so I'll try to include there all the info I have :-)

rcqls

[20:15](#msg5c3504df1d1c2c3f9ce17b0a)Excellent!

loziniak

[21:29](#msg5c3516374ed18278777d431c)@rcqls, you include \*libcanberra* in dependencies list. Does Red/View have also some sound functions?

rcqls

[21:45](#msg5c351a0f26d86e4d5647c730)@loziniak Don’t think so! I think that it is automatic dependencies or some of my ignorance ….

loziniak

[22:14](#msg5c3520df8b6399655e2b47ad)Wiki page: https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development

## Wednesday 9th January, 2019

rcqls

[09:32](#msg5c35bf9b3cf6c35a84b47fa4)Great! I think you should mention that the official repo is `red/red:GTK` branch which would be (I hope) merged soon!

loziniak

[09:42](#msg5c35c22082a6c30b90ab08fa)I linked your repo as default, because I suppose there will be main development, just merged into official \*red* repo from time to time. So if anybody is interested in current state of Gtk bindings, she will probably be more interested in your repo.

[09:48](#msg5c35c36c1491b27876e46088)Feel free to edit this as you wish :-)

rcqls

[10:25](#msg5c35cc33bd592b2e6e76ead1)The goal is to PR to the `red/red:GTK` repo. We hope that other developers than me propose PR to the `red/red:GTK` repo. When a PR is significant the reviewing is obviously longer than a short PR.

[13:43](#msg5c35fa7f1491b27876e5d02d)@rebolek Is Manjaro an archlinux-based distribution? I think so. Did you manage to have console (with View enabled) working?

rebolek

[13:45](#msg5c35fb0e357dd7655d3fa774)@rcqls Yes, Manjaro is Arch based. And yes, I've just downloaded my automated build, tried `view [button "hello"]` and it works.

rcqls

[13:47](#msg5c35fb834ed182787782bb25)@rebolek @loziniak has an archlinux distrib and it fails. I created a docker container and I can confirm the issue:

```
>> view [button "hello"]

*** Runtime Error 32: segmentation fault
*** at: F63B733Eh
```

Any idea?

9214

[13:49](#msg5c35fbf16370df0b91b45e14)@loziniak I believe your \[SO question](https://stackoverflow.com/questions/54109186/segmentation-fault-with-gtk-console-on-64-bit-system) can be better addressed in this room.

loziniak

[13:49](#msg5c35fbff57c6883f9b89470d)@rebolek can you paste results of `pacman -Q | grep lib32`?

rebolek

[13:50](#msg5c35fc1273360b4d55e1593f)@rcqls Sorry, I forgot I'm on Ubuntu now, I have Manjaro in VM here, so let me try it again...

[13:51](#msg5c35fc5bbd592b2e6e7828cf)@rcqls segfault confirmed

rcqls

[13:51](#msg5c35fc7a1948ad07e811df7d)@9214 This question asked by @loziniak could be discussed here too in the red/GTK community!

[13:52](#msg5c35fc8b57c6883f9b894ab6)@rebolek Thanks!

9214

[13:53](#msg5c35fccaaac7082e6ffa7906)My point is that SO is barely monitored by anyone who has a say in GTK branch development, and this room was created specifically to address development of GTK backend. So, why not bring discussion here?

loziniak

[13:53](#msg5c35fcd482a6c30b90ac8780)@9214 probably true, perhaps I'll delete it. Although gitter chats have one problematic property - they disappear and ar not google-able.

rcqls

[13:53](#msg5c35fcf3aac7082e6ffa79a5)@rebolek About your question:

```
[red]$ pacman -Q | grep lib32
lib32-alsa-lib 1.1.7-1
lib32-at-spi2-atk 2.30.0-1
lib32-at-spi2-core 2.30.0-1
lib32-atk 2.30.0-1
lib32-attr 2.4.48-1
lib32-bzip2 1.0.6-3
lib32-cairo 1.16.0-1
lib32-colord 1.4.3-1
lib32-cracklib 2.9.6-2
lib32-curl 7.63.0-1
lib32-dbus 1.12.12-1
lib32-dconf 0.30.1-1
lib32-e2fsprogs 1.44.5-1
lib32-expat 2.2.6-1
lib32-fontconfig 2:2.13.1+12+g5f5ec56-1
lib32-freetype2 2.9.1-1
lib32-fribidi 1.0.5-1
lib32-gcc-libs 8.2.1+20181127-1
lib32-gdk-pixbuf2 2.38.0-1
lib32-glib-networking 2.58.0-1
lib32-glib2 2.58.2-1
lib32-glibc 2.28-5
lib32-gmp 6.1.2-2
lib32-gnutls 3.6.5-1
lib32-gtk3 3.24.2-1
lib32-harfbuzz 2.3.0-1
lib32-icu 63.1-2
lib32-json-glib 1.4.4-1
lib32-keyutils 1.6-1
lib32-krb5 1.16.1-1
lib32-lcms2 2.9-1
lib32-libcanberra 0.30+2+gc0620e4-1
lib32-libcap 2.25-2
lib32-libcroco 0.6.12+4+g9ad7287-2
lib32-libcups 2.2.10-1
lib32-libdatrie 0.2.12-1
lib32-libdrm 2.4.96-1
lib32-libelf 0.175-1
lib32-libepoxy 1.5.3-1
lib32-libffi 3.2.1-2
lib32-libgcrypt 1.8.4-1
lib32-libglvnd 1.1.0-1
lib32-libgpg-error 1.32-1
lib32-libgudev 232-1
lib32-libgusb 0.3.0-1
lib32-libidn 1.35-1
lib32-libidn2 2.0.5-1
lib32-libjpeg-turbo 2.0.0-1
lib32-libldap 2.4.46-1
lib32-libltdl 2.4.6+40+g6ca5e224-4
lib32-libnsl 1.2.0-1
lib32-libogg 1.3.3-2
lib32-libpciaccess 0.14-1
lib32-libpng 1.6.36-1
lib32-libproxy 0.4.15-2
lib32-libpsl 0.20.2-1
lib32-librsvg 2.44.11-1
lib32-libsoup 2.64.2-1
lib32-libssh2 1.8.0-3
lib32-libtasn1 4.13-1
lib32-libthai 0.1.28-1
lib32-libtiff 4.0.10-1
lib32-libtirpc 1.1.4-1
lib32-libunistring 0.9.10-1
lib32-libusb 1.0.22-1
lib32-libvorbis 1.3.6-1
lib32-libx11 1.6.7-1
lib32-libxau 1.0.8-2
lib32-libxcb 1.13.1-1
lib32-libxcomposite 0.4.4-3
lib32-libxcursor 1.1.15-1
lib32-libxdamage 1.1.4-3
lib32-libxdmcp 1.1.2-2
lib32-libxext 1.3.3-2
lib32-libxfixes 5.0.3-2
lib32-libxft 2.3.2-2
lib32-libxi 1.7.9-2
lib32-libxinerama 1.1.4-1
lib32-libxkbcommon 0.8.2-1
lib32-libxml2 2.9.8-5
lib32-libxrandr 1.5.1-2
lib32-libxrender 0.9.10-2
lib32-libxshmfence 1.3-1
lib32-libxtst 1.2.3-2
lib32-libxxf86vm 1.1.4-2
lib32-llvm-libs 7.0.1-1
lib32-lm_sensors 3.5.0-2
lib32-lz4 1.8.3-1
lib32-mesa 18.3.1-1
lib32-ncurses 6.1-3
lib32-nettle 3.4.1-1
lib32-openssl 1:1.1.1.a-1
lib32-p11-kit 0.23.14-1
lib32-pam 1.3.1-1
lib32-pango 1:1.42.4-1
lib32-pcre 8.42-1
lib32-pixman 0.34.0-2
lib32-polkit 0.114-1
lib32-readline 7.0.005-1
lib32-rest 0.8.1-1
lib32-sqlite 3.26.0-1
lib32-systemd 240.0-1
lib32-tdb 1.3.16-1
lib32-util-linux 2.33-1
lib32-wayland 1.16.0-1
lib32-xz 5.2.4-1
lib32-zlib 1.2.11-2
lib32-zstd 1.3.7-1
[user@4fd1ae2b91a9 red]$
```

9214

[13:54](#msg5c35fd0182a6c30b90ac885d)@loziniak true. If there's anything noteworthy you want to remember - use our Github wiki. I believe you already created a dedicated page there. Or are you following a habit of making SO entries and answering them yourself, as in engineering journal?

rebolek

[13:54](#msg5c35fd055ec8fe5a852760ac)They don't disappear.

loziniak

[13:55](#msg5c35fd66357dd7655d3fb7a5)I thought maybe it's not a Red problem, and perhaps someone watching `archlinux` tag would suggest a solution.

rebolek

[13:55](#msg5c35fd6b3cf6c35a84b6187e)@loziniak

```
[sony@manjarovm ~]$ pacman -Q | grep lib32
lib32-alsa-lib 1.1.7-1
lib32-alsa-plugins 1.1.7-1
lib32-at-spi2-atk 2.30.0-1
lib32-at-spi2-core 2.30.0-1
lib32-atk 2.30.0-1
lib32-attr 2.4.48-1
lib32-bzip2 1.0.6-3
lib32-cairo 1.16.0-1
lib32-colord 1.4.3-1
lib32-cracklib 2.9.6-2
lib32-curl 7.63.0-1
lib32-dbus 1.12.12-1
lib32-dconf 0.30.1-1
lib32-e2fsprogs 1.44.5-1
lib32-expat 2.2.6-1
lib32-flac 1.3.2-2
lib32-flex 2.6.4-2
lib32-fontconfig 2:2.13.1+12+g5f5ec56-1
lib32-freetype2 2.9.1-1
lib32-fribidi 1.0.5-1
lib32-gcc-libs 8.2.1+20181127-1
lib32-gdk-pixbuf2 2.38.0-1
lib32-glew 2.1.0-1
lib32-glib-networking 2.58.0-1
lib32-glib2 2.58.2-1
lib32-glibc 2.28-5
lib32-glu 9.0.0-4
lib32-gmp 6.1.2-2
lib32-gnutls 3.6.5-1
lib32-gtk3-classic 3.24.2+7+g43aeb52b73-1
lib32-harfbuzz 2.3.0-1
lib32-icu 63.1-2
lib32-json-glib 1.4.4-1
lib32-keyutils 1.6-1
lib32-krb5 1.16.1-1
lib32-lcms2 2.9-1
lib32-libasyncns 0.8+3+g68cd5af-2
lib32-libcanberra 0.30+2+gc0620e4-1
lib32-libcanberra-pulse 0.30+2+gc0620e4-1
lib32-libcap 2.25-2
lib32-libcroco 0.6.12+4+g9ad7287-2
lib32-libcups 2.2.10-1
lib32-libcurl-compat 7.63.0-1
lib32-libdatrie 0.2.12-1
lib32-libdrm 2.4.96-1
lib32-libelf 0.175-1
lib32-libepoxy 1.5.3-1
lib32-libffi 3.2.1-2
lib32-libgcrypt 1.8.4-1
lib32-libglvnd 1.1.0-1
lib32-libgpg-error 1.32-1
lib32-libgudev 232-1
lib32-libgusb 0.3.0-1
lib32-libice 1.0.9-3
lib32-libidn 1.35-1
lib32-libidn2 2.0.5-1
lib32-libjpeg-turbo 2.0.0-1
lib32-libldap 2.4.46-1
lib32-libltdl 2.4.6+40+g6ca5e224-4
lib32-libnsl 1.2.0-1
lib32-libogg 1.3.3-2
lib32-libpciaccess 0.14-1
lib32-libpng 1.6.36-1
lib32-libproxy 0.4.15-2
lib32-libpsl 0.20.2-1
lib32-libpulse 12.2-1
lib32-librsvg 2.44.11-1
lib32-libsm 1.2.3-1
lib32-libsndfile 1.0.28-2
lib32-libsoup 2.64.2-1
lib32-libssh2 1.8.0-3
lib32-libtasn1 4.13-1
lib32-libthai 0.1.28-1
lib32-libtiff 4.0.10-1
lib32-libtirpc 1.1.4-1
lib32-libunistring 0.9.10-1
lib32-libusb 1.0.22-1
lib32-libva 2.3.0-1
lib32-libva-intel-driver 2.2.0-1
lib32-libva-mesa-driver 18.3.1-1
lib32-libva-vdpau-driver 0.7.4-6
lib32-libvdpau 1.1.1-3
lib32-libvorbis 1.3.6-1
lib32-libx11 1.6.7-1
lib32-libxau 1.0.8-2
lib32-libxcb 1.13.1-1
lib32-libxcomposite 0.4.4-3
lib32-libxcursor 1.1.15-1
lib32-libxdamage 1.1.4-3
lib32-libxdmcp 1.1.2-2
lib32-libxext 1.3.3-2
lib32-libxfixes 5.0.3-2
lib32-libxft 2.3.2-2
lib32-libxi 1.7.9-2
lib32-libxinerama 1.1.4-1
lib32-libxkbcommon 0.8.2-1
lib32-libxml2 2.9.8-5
lib32-libxmu 1.1.2-2
lib32-libxrandr 1.5.1-2
lib32-libxrender 0.9.10-2
lib32-libxshmfence 1.3-1
lib32-libxss 1.2.3-1
lib32-libxt 1.1.5-2
lib32-libxtst 1.2.3-2
lib32-libxxf86vm 1.1.4-2
lib32-llvm-libs 7.0.1-1
lib32-lm_sensors 3.5.0-2
lib32-lz4 1.8.3-1
lib32-mesa 18.3.1-1
lib32-mesa-demos 8.4.0-1
lib32-ncurses 6.1-3
lib32-nettle 3.4.1-1
lib32-openssl 1:1.1.1.a-1
lib32-p11-kit 0.23.14-1
lib32-pam 1.3.1-1
lib32-pango 1.43.0-1
lib32-pcre 8.42-1
lib32-pixman 0.34.0-2
lib32-polkit 0.114-1
lib32-readline 7.0.005-1
lib32-rest 0.8.1-1
lib32-sqlite 3.26.0-1
lib32-systemd 239.6-2
lib32-tdb 1.3.16-1
lib32-util-linux 2.33-1
lib32-wayland 1.16.0-1
lib32-xz 5.2.4-1
lib32-zlib 1.2.11-2
lib32-zstd 1.3.7-1
```

9214

[13:56](#msg5c35fd9b73360b4d55e16638)Anyway, keep up the good work :+1: Sorry for interruption.

loziniak

[13:58](#msg5c35fdf773360b4d55e16765)@rcqls @rebolek thanks! I thought you have View working when I asked for 23 libs list.

[13:58](#msg5c35fdfd82a6c30b90ac8fcc)32*

[13:58](#msg5c35fe071d1c2c3f9ce7798a)32-bit*

rebolek

[13:59](#msg5c35fe2c1491b27876e5e640)@loziniak No, I forgot I have Ubuntu on this machine, I have Manjaro at home.

[13:59](#msg5c35fe394ed182787782cc5b)So that's why it was working :smile:

rcqls

[13:59](#msg5c35fe4f26d86e4d564d4c6d)@9214 No problem, I think that the question has to be addressed too in SO which is a larger community. But I asked to @rebolek because of his comment about `Manjaro`.

loziniak

[14:00](#msg5c35fe9773360b4d55e16a58)@9214 @rebolek maybe you have an idea how could it be debugged? would be good to know which instruction triggers the segfault.

9214

[14:01](#msg5c35fecb3cf6c35a84b6249d)@loziniak the first step probably would be to compile a buggy script in debug mode (`-d` flag) and examine the output.

loziniak

[14:01](#msg5c35fecd26d86e4d564d4f3d)Does my `system/view/debug?: yes` output from SO is of any use?

9214

[14:04](#msg5c35ff5c12db9607e75ed24a)@loziniak hard to say, though it indicates at what point things went south. One more check you can also do is to run it with disabled GC (`recycle/off`).

rcqls

[14:04](#msg5c35ff81bd592b2e6e78403c)@9214 I already did it and it fails anyway

loziniak

[14:05](#msg5c35ffb6357dd7655d3fc778)does it mean adding `recycle/off` line in red script?

9214

[14:05](#msg5c35ffbd4ed182787782d908)@loziniak yes.

rcqls

[14:06](#msg5c35ffd2aac7082e6ffa8be9)@9214 Is `-d -r` flag correct to debug?

9214

[14:06](#msg5c35ffe46370df0b91b475ca)@rcqls yup.

rcqls

[14:07](#msg5c36003a8b6399655e308a2d)@9214 I guess that « yup » means « yes » (Sorry not a native speaker and not a really English or American speaker)

rebolek

[14:09](#msg5c36007c5ec8fe5a85277797)aye

loziniak

[14:09](#msg5c36008dbd592b2e6e7848ba)

```
>> yup = yes
*** Script Error: yup has no value
```

rebolek

[14:10](#msg5c3600b96370df0b91b47c72)Hm, debug mode doesn't help much:

```
[sony@manjarovm red]$ ./console-view 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> view [button "hello"]

*** Runtime Error 32: segmentation fault
*** Cannot determine source file/line info.
***
Neoprávněný přístup do paměti (SIGSEGV) (core dumped [obraz paměti uložen])
[sony@manjarovm red]$
```

rcqls

[14:10](#msg5c3600c057c6883f9b8968ff)With `-d -r` flags:

```
>> view [button "hello"]

*** Runtime Error 32: segmentation fault
*** Cannot determine source file/line info.
***
```

[14:10](#msg5c3600cb57c6883f9b896914)@rebolek Yep!

loziniak

[14:11](#msg5c3601038b6399655e30907b)Maybe instead of compiling `console` with -d, we should compile `tests/react-test.red` with -d ?

rebolek

[14:13](#msg5c360179357dd7655d3fd5e1)@loziniak I don't use that test, I get the crash with simple `view [button "hello"]`

rcqls

[14:14](#msg5c3601e112db9607e75ee444)@rebolek But maybe the error message would be more informative! I am trying...

[14:15](#msg5c36021e12db9607e75ee606)No luck!

```
*** Runtime Error 32: segmentation fault
*** Cannot determine source file/line info.
***
Segmentation fault
```

loziniak

[14:17](#msg5c36025c6370df0b91b489c2)As a lame user I'd probable start inserting `print`s in various places inside `modules/view/backends/gtk3/gtk.reds` :-)

rebolek

[14:17](#msg5c360261bd592b2e6e785756)So I guess we would need to add some manual debug to lines to Red to see where the crash happens.

[14:17](#msg5c360296bd592b2e6e78586a)@loziniak that's not lame, that's the official way to do it ! :smile:

rcqls

[14:20](#msg5c36031773360b4d55e18b34)I tested more scripts and weirdly `tests/gtk3/view-test.red` failed (was not for `red-0.6.3)`. I added `recycle/off` and eveything was ok! So i’ll add it in the `red:GTK` branch.

9214

[14:21](#msg5c360359aac7082e6ffaa27d)&gt; was not for red-0.6.3

Right, because GC was merged in master branch in 0.6.4 release.

loziniak

[14:22](#msg5c36039e1d1c2c3f9ce7a58e)@rcqls I cannot confirm `recycle/off` in `tests/gtk3/view-test.red` works for me.

[14:23](#msg5c3603d873360b4d55e191c0)I mean it does not work for me even with `recycle/off`.

rcqls

[14:24](#msg5c36040573360b4d55e19296)@9214 Yep! But it is working for macOS without `recycle/off` (I guess it is the same on Windows system.)! So I think that something is missing in the `red:GTK` branch.

loziniak

[14:24](#msg5c360438aac7082e6ffaa892)On macOS you have gtk3?

rcqls

[14:25](#msg5c3604585ec8fe5a85278d66)@loziniak No, the native `macOS` red

9214

[14:28](#msg5c3604fe1d1c2c3f9ce7afd1)There's a nasty memory leak somewhere here.

rcqls

[14:29](#msg5c3605498b6399655e30ada1)@9214 It is most than likely! That’s why `red:GTK` is unstable…

loziniak

[14:34](#msg5c3606844ed182787783045e)But it's interesting that it works ok on 32-bit Debian.

[14:52](#msg5c360abebd592b2e6e7895ab)Could also be a bug in Gtk or other library, because Debian and Ubuntu get older versions of software than Arch

rcqls

[14:57](#msg5c360bca8b6399655e30e0da)@loziniak Or simply the red binding inthe red:GTK which it is planned for older gtk3 API… An idea would be to check if this kind of \[ruby stuff](https://github.com/mvz/gir\_ffi-gtk) is working for your Archlinux and in such a case it would confirm your idea.

guaracy

[15:42](#msg5c36167957c6883f9b89fceb)with system/view/debug?: yes

```
$ ./console
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> system/view/debug?: yes
== true
>> view []
-- on-change event -- 
        face : window 
        word : type 
        old  : word 
        new  : word
-- on-change event -- 
        face : window 
        word : size 
        old  : none 
        new  : pair
-- on-change event -- 
        face : window 
        word : pane 
        old  : none 
        new  : block
-- on-change event -- 
        face : window 
        word : parent 
        old  : none 
        new  : object
-- on-change event -- 
        face : window 
        word : text 
        old  : none 
        new  : string
-- on-change event -- 
        face : window 
        word : offset 
        old  : none 
        new  : pair
-- on-change event -- 
        face : window 
        word : offset 
        old  : pair 
        new  : pair
show: window  with?: false

*** Runtime Error 32: segmentation fault
*** at: F75B0C58h
```

rcqls

[16:28](#msg5c36212026d86e4d564e394d)@guaracy Thanks! I saw that too and it stops before `show` (IMHO randomly depending on the example)….

loziniak

[22:34](#msg5c3676da5aa04d46c585718f)@rcqls ruby stuff works: https://www.robotix-lozinski.pl/ruby\_ffi\_gtk\_test.png

rcqls

[23:47](#msg5c36880366f3433023a1764f)@loziniak So red:GTK deserves a debug session for arch!

## Friday 11st January, 2019

rcqls

[11:23](#msg5c387c9e8db70e46c4ec82da)@qtxie kindly merged the PR and red/red:GTK is now useable with red-0.6.4. @rebolek your automated builds can be run.

rebolek

[11:30](#msg5c387e47dfe133282032de90)@rcqls yes, I've seen the notice in the morning. Autobuild runs ~6:20 UTC, so tomorrow's build will be done with this new version. Many thanks!

rcqls

[11:32](#msg5c387ee454d8bb07ccd24219)@rebolek I guess it was automatic builds. Could you please remind me the url to download these binaries?

rebolek

[11:34](#msg5c387f28317e2407cd152ca4)@rcqls https://rebolek.com/builds/  
Ignore the \*italic\*/\*\*bold\** message, for some reason it only works when run manually, not from Cron.

rcqls

[11:34](#msg5c387f5a6a394e28218ef556)@rebolek Thanks!

[11:38](#msg5c38801d6a394e28218efb1f)@rebolek I think you could replace the link to Rcqls’s note with the link to the wiki page intiated by @loziniak.

mikeparr

[11:44](#msg5c3881aaef78da1bcee3df91)I'm just thinking about user-documentation in the future. There are several similar tutorials for Ruby, Python. Would it be possible to automatically convert their examples into Red (at least partially)?

rebolek

[11:45](#msg5c3881d5317e2407cd15400e)@rcqls Right, the link has been changed.

[11:46](#msg5c3881ffa57b501bcfe95de9)@mikeparr it would be possible, but it means writing Ruby/Python/... translator to Red :smile:

rcqls

[11:48](#msg5c388297783a5553d818a48e)@mikeparr IMHO if I understand correctly your idea, you have to know first that the red/red:GTK branch uses gtk stuff internally and it is not a gtk plugin as usually made in ruby and python. The goal is to provide cross-compiling tool with the same visual in any platform.

mikeparr

[14:03](#msg5c38a22d5aa04d46c5937213)@rcqls Ah, yes, I misunderstood. So the user programs in a dialect , maybe similar to VID? (Sorry for noob question.)

rcqls

[14:53](#msg5c38adfbb35a087766669759)@mikeparr No problem, red/red:GTK is supposed to run with exactly the same code used on Windows and masOS. It is the purpose of cross-compilation also.

## Saturday 12nd January, 2019

loziniak

[00:32](#msg5c3935a72e25e453d769b76d)@mikeparr it's user programs in VID, not dialect similar to VID. GTK branch is development of just another backend for View/VID/Draw for Linux using Gtk3 library, just as Win32 libraries is used for Windows and Cocoa library is used for macOS.

[01:18](#msg5c39405a9fa58135b54fcd90)Guys, does `console` binary differ from usual `red` binary? I want to compile Red Wallet for Gtk and run command `./console -r wallet.red`, but I get error:

```
*** Access Error: cannot open: %-r
*** Where: read
*** Stack:
```

Is it possible to build a normal binary with ability to compile programs for Linux?

greggirwin

[02:47](#msg5c39554b9fa58135b55048b2)The Red binary you download today is the toolchain. When you run it, it builds the console. So, yes, they are different.

rcqls

[05:59](#msg5c39824f0999400604d9df50)@loziniak see the content of my script red-compile`inside`docker-red-gtk`. it is mostly equivalent to red binary which «  encapsulates » the rebol binary. The info for compiling sred cript is provided on the Readme of the main repo.. BTW, you already did that when you compiled`react-test.red\`

[06:25](#msg5c39886c9fa58135b5517451)`console.red` is a compiled red script providing a REPL combined with a runner of red-script.

[07:33](#msg5c399836ba355012a426c16f)@loziniak JUst to let you know that (at least) manage pretty quickly to compile wallet.red but at execution `usb-device` (in `libs/usb-monitors.red`) is not iyet mplemented on linux.  
1\. libs/hidapi.red

```
#switch OS [
		Windows  [#include %windows.reds]
		macOS	 [#include %macOS.reds]
		linux	 [#include %linux.reds]
		#default []
	]
```

1\. libs Linux.reds: replace `read_timeout` -&gt; `read-timeout`

[07:40](#msg5c399a071cb70a372ac670b9)@loziniak if you use `docker-red-gtk` (that I change slightly to have also an archlinux distrib) with ubuntu container and if you assume you have cloned `red/red:GTK` and `red/walllet` in a home subfolder `~/RedLinux` you could compile `wallet.red` with the command-line `red-compile —root RedLinux/red RedLinux/wallet/wallet.red` by assuming thaht in the container `pwd` is `/home/user/work` as it is by default when you run the container `red-docker`.

[07:43](#msg5c399aba0999400604da6ed4)@loziniak I also tried to quickly see the issue on archlinux (thanks to my archlinux docker container) and it looks very weird since it fails at the creation of the window which is weird.

[07:48](#msg5c399bb58318994524d7ea89)I have also realized that, on ubuntu (container), it was just impossible to execute consecutively 2 binary compiled from red script (for instance `./react-test &; ./react-test&`. I fixed that in my repo (from now) by changing the kind of GApplication. Now it works…

[07:56](#msg5c399db30999400604da8391)@rebolek Since you told me that you had a Manjaro linux box, do you remember if you managed to have GTK stuff working one day on this box? This bug on archlinux is really weird. I’ll try to create other containers (with different kind of distrib) to see if it works only on ubuntu-based distribs which is really weird.

[08:29](#msg5c39a5810721b912a5694019)Since now, I have many different containers with different distribs (on my macOS but it could be on linux), I can tell you that the binary built on Archlinux is ok since it works on Ubuntu.

[10:36](#msg5c39c33e20b78635b60f33f8)@loziniak Simple red view script `react-test` compiled from `tests/react-test.red` works fine in Centos. Issue seems to be related to Archlinux and maybe the dynamic library loading process since the binary produced by ARchlinux run perfectly on Centos and Ubuntu. So it is not a pb of compilation….

## Monday 14th January, 2019

rcqls

[20:32](#msg5c3cf1e132a8370605cfeef5)@dockimbel Nothing major, but by investigating minimal docker image with alpine linux distrib I realize that by simply adding in `red/system/config.r`

```
Linux-Musl [
	OS:			'Linux
	format: 	'ELF
	type:		'exe
	dynamic-linker: "/lib/ld-musl-i386.so.1"
]
```

it allows us to (cross-)compile with`-t Linux-Musl` for `must-gcc` (which has its own `glibc`). Nothing major, since the result is the same (than installing Alpine package `libc6-compat`): GTK windows are shown but not the widgets inside. Don’t know what is the issue…. I created a virtualbox with alpine i386 edge linux and same result with the same installation than my dockerfile.

## Tuesday 15th January, 2019

dockimbel

[05:49](#msg5c3d745835350772cf32aa17)Good to know that Red's runtime is compatible with musl lib.

rebolek

[06:45](#msg5c3d818a0999400604f2c733)I had troubles with file access when using Red with `musl`. But it's been a year, so maybe it's fixed already. Having Red working with musl would be great for embedded devices, it's libc of choice for OpenWRT and other small distros.

rcqls

[06:56](#msg5c3d8418cb47ec3000469da5)@rebolek An alternative is `libc6-compat` that allows us to use `/lib/ld-linux.so.2`. (`gcompat`used to be too but it does not work now). Apparently, everything goes well on alpine without package `libc6-compat` as shown below (you can test it with `rcqls/docker-red-gtk` repo):

```
bash-4.4$ ldd console-view-musl
	/lib/ld-musl-i386.so.1 (0xf7732000)
	libc.so.6 => /lib/ld-musl-i386.so.1 (0xf7732000)
	libm.so.6 => /lib/ld-musl-i386.so.1 (0xf7732000)
	libgtk-3.so.0 => /usr/lib/libgtk-3.so.0 (0xf6fcb000)
	libcurl.so.4 => /usr/lib/libcurl.so.4 (0xf6f52000)
	libgdk-3.so.0 => /usr/lib/libgdk-3.so.0 (0xf6e9e000)
	libgmodule-2.0.so.0 => /usr/lib/libgmodule-2.0.so.0 (0xf6e99000)
	libpangocairo-1.0.so.0 => /usr/lib/libpangocairo-1.0.so.0 (0xf6e8b000)
	libX11.so.6 => /usr/lib/libX11.so.6 (0xf6d59000)
	libXi.so.6 => /usr/lib/libXi.so.6 (0xf6d47000)
	libXfixes.so.3 => /usr/lib/libXfixes.so.3 (0xf6d40000)
	libcairo-gobject.so.2 => /usr/lib/libcairo-gobject.so.2 (0xf6d38000)
	libcairo.so.2 => /usr/lib/libcairo.so.2 (0xf6c2d000)
	libgdk_pixbuf-2.0.so.0 => /usr/lib/libgdk_pixbuf-2.0.so.0 (0xf6c09000)
	libatk-1.0.so.0 => /usr/lib/libatk-1.0.so.0 (0xf6be4000)
	libatk-bridge-2.0.so.0 => /usr/lib/libatk-bridge-2.0.so.0 (0xf6bb4000)
	libepoxy.so.0 => /usr/lib/libepoxy.so.0 (0xf6ace000)
	libpangoft2-1.0.so.0 => /usr/lib/libpangoft2-1.0.so.0 (0xf6ab8000)
	libpango-1.0.so.0 => /usr/lib/libpango-1.0.so.0 (0xf6a6f000)
	libfontconfig.so.1 => /usr/lib/libfontconfig.so.1 (0xf6a2d000)
	libgio-2.0.so.0 => /usr/lib/libgio-2.0.so.0 (0xf687b000)
	libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0xf6833000)
	libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0xf6729000)
	libintl.so.8 => /usr/lib/libintl.so.8 (0xf671a000)
	libssh2.so.1 => /usr/lib/libssh2.so.1 (0xf66eb000)
	libssl.so.44 => /lib/libssl.so.44 (0xf669c000)
	libcrypto.so.42 => /lib/libcrypto.so.42 (0xf64f7000)
	libz.so.1 => /lib/libz.so.1 (0xf64de000)
	libXinerama.so.1 => /usr/lib/libXinerama.so.1 (0xf64da000)
	libXrandr.so.2 => /usr/lib/libXrandr.so.2 (0xf64ce000)
	libXcursor.so.1 => /usr/lib/libXcursor.so.1 (0xf64c3000)
	libXcomposite.so.1 => /usr/lib/libXcomposite.so.1 (0xf64bf000)
	libXdamage.so.1 => /usr/lib/libXdamage.so.1 (0xf64bb000)
	libXext.so.6 => /usr/lib/libXext.so.6 (0xf64a8000)
	libfreetype.so.6 => /usr/lib/libfreetype.so.6 (0xf63f3000)
	libxcb.so.1 => /usr/lib/libxcb.so.1 (0xf63c9000)
	libpixman-1.so.0 => /usr/lib/libpixman-1.so.0 (0xf6331000)
	libpng16.so.16 => /usr/lib/libpng16.so.16 (0xf62fc000)
	libxcb-shm.so.0 => /usr/lib/libxcb-shm.so.0 (0xf62f8000)
	libxcb-render.so.0 => /usr/lib/libxcb-render.so.0 (0xf62e9000)
	libXrender.so.1 => /usr/lib/libXrender.so.1 (0xf62de000)
	libatspi.so.0 => /usr/lib/libatspi.so.0 (0xf62af000)
	libdbus-1.so.3 => /usr/lib/libdbus-1.so.3 (0xf625d000)
	libharfbuzz.so.0 => /usr/lib/libharfbuzz.so.0 (0xf61e4000)
	libexpat.so.1 => /usr/lib/libexpat.so.1 (0xf61c3000)
	libmount.so.1 => /lib/libmount.so.1 (0xf616c000)
	libffi.so.6 => /usr/lib/libffi.so.6 (0xf6164000)
	libpcre.so.1 => /usr/lib/libpcre.so.1 (0xf6104000)
	libbz2.so.1 => /usr/lib/libbz2.so.1 (0xf60f7000)
	libXau.so.6 => /usr/lib/libXau.so.6 (0xf60f3000)
	libXdmcp.so.6 => /usr/lib/libXdmcp.so.6 (0xf60ec000)
	libgraphite2.so.3 => /usr/lib/libgraphite2.so.3 (0xf60c8000)
	libblkid.so.1 => /lib/libblkid.so.1 (0xf607b000)
	libbsd.so.0 => /usr/lib/libbsd.so.0 (0xf6063000)
	libuuid.so.1 => /lib/libuuid.so.1 (0xf605b000)
bash-4.4$ ./console-view-musl

** (console-view-musl:8): WARNING **: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-XG4JK9DsTL: Connection refused

(console-view-musl:8): GLib-GIO-CRITICAL **: g_dbus_proxy_new_sync: assertion 'G_IS_DBUS_CONNECTION (connection)' failed
--== Red 0.6.4 ==--
Type HELP for starting information.

>> a: 1
== 1
```

rebolek

[07:03](#msg5c3d85a88ce4bb25b8b3a616)@rcqls try `read %.`

[07:03](#msg5c3d85c7c45b986d11625aec)I had problems with file access with Musl on TurrisOS (OpenWRT).

rcqls

[07:04](#msg5c3d85f50721b912a58126e1)@rebolek

```
>> read %.
== [%"" %"" %"" %"" %"" %"" %"" %"" %"" %""]
```

rebolek

[07:04](#msg5c3d86071cb70a372adef338)@rcqls Thanks, so the problem is still here.

[07:06](#msg5c3d865920b78635b6268c8b)I wanted to investigate it more deeply when the work on new IO will start.

rcqls

[07:06](#msg5c3d8671dab15872ce98161f)@rebolek Good to know! Thanks!

[07:08](#msg5c3d86e48ce4bb25b8b3ae7d)Same error with `libc6-compat`….

rebolek

[07:09](#msg5c3d870e32a8370605d38885)on Alpine?

rcqls

[07:09](#msg5c3d871f20b78635b626938f)yes

rebolek

[07:10](#msg5c3d8754ba5936605bc0f341)but libc6-compat is musl, isn't it?

rcqls

[07:11](#msg5c3d87ae0721b912a5813490)it is the name of the alpine package.

loziniak

[07:36](#msg5c3d8d6595e17b452553a2bf)I think @rcqls meant that error is present in both cases: 1) with modified `red/system/config.r` and without \*libc6-compat\*, 2) unmodified Red sources plus \*libc6-compat\*.

## Wednesday 16th January, 2019

loziniak

[11:23](#msg5c3f1431dab15872cea23235)Hi! I run a script from documentation:

```
view [
    list: text-list data ["John" "Bob" "Alice"]
    button "Add" [append list/data "Sue"]
    button "Change" [lowercase pick list/data list/selected]
]
```

and clicking "Add" does nothing. Is something wrong with Gtk bindings? Can you check on other systems? I use `linux-gui-190111` binary from @rebolek's auto-builds.

rcqls

[11:27](#msg5c3f152c20b78635b6310ac4)@loziniak I confirm the issue. Something to fix. I’ll see that...

rebolek

[11:32](#msg5c3f1664ba5936605bcb2115)@loziniak confirmed on Ubuntu.

rcqls

[11:36](#msg5c3f174adab15872cea24cee)@loziniak A quick look at source code and I guess it is not implemented yet. I’ll do it since it is the kind of job I forgot to do….

loziniak

[11:37](#msg5c3f17950721b912a58b835f)Lovely :-)

rcqls

[16:01](#msg5c3f5555c45b986d116e96c3)@loziniak @rebolek Fixed! Sent a PR. If @qtxie is quick enough to accept the PR new binaries will be on @rebolek’s server tomorrow morning.

rebolek

[16:02](#msg5c3f5590f780a1521f1db389)Wow, cool!

rcqls

[16:09](#msg5c3f571e8318994524fca4b3)In fact, red-View is very well-designed and it is always amazing to see how it is not so difficult to code (even in red/system). Actually, I had already done most of the stuff about text-list,drop-list and drop-down (the patch applies too for these widgets) but I forgot to connect data update. Of course, the code is not optimal yet but for a prototype it is IMHO okay.

[16:15](#msg5c3f589d0721b912a58d4f91)@rebolek If you are kind enough, and as an experimented redboller (that I am not), could you please give some information about `para`. I don’t want to bother the really busy Red team. Could you give me also minimal examples (view mode and VID mode), if I have to test it. Of course, if you have some free time…

[16:17](#msg5c3f5908f780a1521f1dcce1)What’s gtk object could be used to represent a `para` object?

rebolek

[17:06](#msg5c3f649a0999400604ff7e26)@rcqls I'll take a look at it. Last time I tried `para` it was not implemented yet, so I have to check it. I will let you know today evening (in 2-3 hours, once I finish some duties).

rcqls

[17:33](#msg5c3f6afb0999400604ffad16)@rebolek No worry! I have time. What I ask you is not necessarily for linux. But what I want to know is how to use it in redbol. I saw the documentation but this object seems to be like a modifier of some widgets. Thanks a lot.

rebolek

[17:54](#msg5c3f6fee8ce4bb25b8c083de)@rcqls I understand, I want to test it on Win VM and/or macOS. Anyway, `para` is not a modifier, it's a widget in itself. It's a block of text with specific properties.

[17:56](#msg5c3f703495e17b452560557b)See http://www.rebol.com/docs/view-face-object.html for details:

&gt; Provides the text paragraph attributes of a face. This object controls the text origin, margin, indentation, tabs, scrolling and other attributes. If you want to modify the para object, you should copy it first. See Para section.

[17:58](#msg5c3f70d8ba355012a44c1311)I'll check if it's implemented in other OSes, but if it's not and Linux would be first - well...that would be something :smile:

rcqls

[17:59](#msg5c3f7106ba355012a44c137f)@rebolek Thanks already for this info about the fact that it is a widget! THe rebol doc is typically this kind of info that I weirdly don’t understand perfectly. Maybe some examples would help…IMHO It is already implemented in other OSs. That’s why I am interested to do ti in GTK….

rebolek

[18:01](#msg5c3f7187ba355012a44c1748)It's almost a widget. You can have multiple `para`s (it's shortened paragraph) in `text` widget.

rcqls

[18:03](#msg5c3f71dadab15872cea4cb3f)I guess that para stands for paragraph? So I have to check whether this is developped in GTK...

rebolek

[18:03](#msg5c3f71ff0999400604ffdc97)If not, text would need to be composed of multiple text widgets.

rcqls

[18:04](#msg5c3f724b35350772cf3fdc86)I guess GTK is rich enough to have this kind of stuff… Thanks!

rebolek

[18:15](#msg5c3f74acdab15872cea4e0e9)I believe it is. I just don't know GTK API, sorry.

rcqls

[18:17](#msg5c3f753bba355012a44c2f76)maybe something related to GtkTextView but in read-only mode?

[18:20](#msg5c3f75f2ba355012a44c33c8)GtkTextTag looks like similar to para in red …

greggirwin

[20:39](#msg5c3f969532a8370605e16b72)@rcqls, thanks for your renewed efforts here. Great progress.

rcqls

[23:58](#msg5c3fc51ef780a1521f2097de)@greggirwin Thanks for your support!

## Thursday 17th January, 2019

loziniak

[00:07](#msg5c3fc75132a8370605e2aace)@rcqls it works with code from `rcqls/red:GTK`, confirmed. Thanks!

[20:32](#msg5c40e65435350772cf495808)@rcqls have you tried to debug our \*Segmentation Fault @ arch* error? Because I've got another one :-) I've \[tried to compile wallet under linux](https://github.com/robotix-pl/wallet/tree/softwallet), but I'm getting `Runtime Error 1: access violation` at execution. I think it can be connected to Gtk, because I've disabled all usb &amp; hardware code.

[20:36](#msg5c40e7640721b912a597721f)Perhaps you could tell me how to debug that if you had some time.

rcqls

[20:37](#msg5c40e7a21cb70a372af56606)@loziniak Ok, I am trying to compile your repo but I have this output:

```
*** Compilation Error: invalid path value: hid/open
*** in file: %/Users/rcqls/tmp/wallet/wallet.red
*** in function: exec/ctx454~open
*** at line: 1
*** near: [1820x1
    h: hid/open vendor_id product_id null type
    either
]
```

When I gave a try last time, I think I was able to compile it…

[20:40](#msg5c40e836f780a1521f27edd1)The bug Segmentation fault is a weird one…. When trying to debug it stops directly so as I told you it is a low level issue… For such issue, IMHO, one needs a true debugger...

loziniak

[20:47](#msg5c40e9f48ce4bb25b8ca1c6b)you have to compile \*softwallet* branch.

rcqls

[20:50](#msg5c40ea93746d4a677acbff37)@loziniak ok! I’ll try again

[20:59](#msg5c40eca127611d4204bdc3fa)confirmed issue on ubuntu! I am trying to have a quick look if it is GTK related issue...

[21:11](#msg5c40ef7e0721b912a597a655)Of course, it works on macOS! This is the job of the Red Team!

[21:12](#msg5c40efc6f780a1521f281f84)I am trying now just to compile the GTK part of wallet … I'll let you know

loziniak

[21:18](#msg5c40f112f780a1521f282636)thanks!

rcqls

[21:45](#msg5c40f75f0721b912a597d86b)@loziniak Isolating the GTK part and deactivating the resizing part, the GTK compiles and executes apparently properly:

```
Red [
	Title: "wallet"
	Needs: 'View
]
wallet: context [	
	list-font: make font! [name: get 'font-fixed size: 11]

	ui: layout compose [
		title "RED Wallet"
		text 50 "Device:" ;dev: drop-list 125 :do-select-device
		btn-send: button "Send" ;:do-send disabled
		token-list: drop-list data ["ETH" "RED"] 60 ;select 1 :do-select-token
		net-list:   drop-list data ["mainnet" "rinkeby" "kovan" "ropsten"] ;select 1 :do-select-network
		btn-reload: button "Reload" ;:do-reload disabled
		return
		
		text bold "My Addresses" pad 280x0 
		text bold "Balances" right return pad 0x-10
		
		addr-list: text-list font list-font 520x100 return middle
		
		info-msg: text 285x20
		text right 50 "Page:" tight
		page-info: drop-list 40 
			data collect [repeat p 10 [keep form p]]
			;select (page + 1)
			;:do-page
		btn-prev: button "Prev" ;disabled :do-prev-addr 
		btn-more: button "More" ;:do-more-addr
	]

	run: does [
		;min-size: ui/extra: ui/size
		;setup-actors
		;monitor-devices
		;do-auto-size addr-list
		view/flags ui 'resize
	]
]

wallet/run
```

[21:49](#msg5c40f86527611d4204be0e55)\[!\[wallet.png](https://files.gitter.im/red/GTK/7YL3/thumb/wallet.png)](https://files.gitter.im/red/GTK/7YL3/wallet.png)

loziniak

[21:59](#msg5c40fada20b78635b63dabc0)And why did you deactivate resizing part?

rcqls

[22:03](#msg5c40fbce8318994524078168)Because it is something to consider in a second step… There are another priority for GTK development… I’ll have a look later just because I am curious.

loziniak

[22:05](#msg5c40fc2520b78635b63db5c2)Ok, I was just curious. It would be important information if, for example, resize code generated an error.

[22:07](#msg5c40fca820b78635b63db90c)I'm trying to install debugging symbols for Gtk and use gdb to maybe get some useful information.

rcqls

[22:09](#msg5c40fcfff780a1521f287430)Is gdb useable with \`red/system ? I have some doubt but I am curious...

[22:10](#msg5c40fd47cb47ec30005da0c4)For resizing possible error, I let you investigate it first…

loziniak

[22:11](#msg5c40fd9ddab15872ceaecb7f)I don't know, it will be first time I use it. But I hope that I'll be able to get some logs from Gtk library before the crash occurs. I found info, that gdb can debug python code, so probably Red also.

rcqls

[22:20](#msg5c40ffb495e17b45256a636a)Ok we’ll see! Hope it works! I tried `LD_PRELOAD` but without any success… BTW, do you know that the archlinux image is at least twice larger than the ubuntu one. Archlinux installs a lot of dependencies. Did you give a try with `docker-red-gtk` ? I did not test it with linux but I guess it would work pretty easily. On macOS, I cross-compile a red-script and I execute the binary inside the container. The workflow would be on linux:

```
## inside the host
cd <path>
redc <script>.red
docker-red run <path>/<script>
```

You should have `~/Github/red` with branch `GTK` activated.

[22:37](#msg5c4103c3f780a1521f28a237)Python is compiled with gcc but not red! But maybe it could work since red/system could connect gtk libraries with its ffi features.

[22:38](#msg5c4103eb95e17b45256a7caf)I already did this kind of debugging with `R` since it is also compiled with gcc.

[22:59](#msg5c4108cbba355012a4565cff)@loziniak Thanks for giving me a good example (to improve GTK) about resizing stuff since I have now a minimal example (wallet) that resizes in macOS but not in GTK. Something to improve…

loziniak

[23:10](#msg5c410b5f35350772cf4a4dff)I've tried \*gdb\*, but it was not informative to me. But it was interesting, that under gdb even a simple program, that did run earlier, crashed wit SIGSEGV. Here is an output for your isolated version of wallet:

```
(gdb) run
Starting program: /media/vboxsf/wallet2 

Program received signal SIGSEGV, Segmentation fault.
0x0804b068 in ?? ()
(gdb) bt
#0  0x0804b068 in ?? ()
#1  0xb7fee918 in _dl_sysdep_start (start_argptr=0xbffff6c0, dl_main=0xb7fd83d0 <dl_main>) at ../elf/dl-sysdep.c:253
#2  0xb7fd7f8f in _dl_start_final (arg=0xbffff6c0) at rtld.c:415
#3  _dl_start (arg=<optimized out>) at rtld.c:522
#4  0xb7fd70bb in _start () from /lib/ld-linux.so.2
```

rcqls

[23:12](#msg5c410bdcba355012a4566e6c)So it looks like a problem of loading?

loziniak

[23:12](#msg5c410be1ba355012a4566e6e)Maybe it has not even reached Gtk routines...

rcqls

[23:12](#msg5c410bfb8ce4bb25b8caf488)Maybe!

[23:13](#msg5c410c24ba355012a4566fbb)BTW, the ruby tools last time needed to be tested in i386 mode!

loziniak

[23:24](#msg5c410ec995e17b45256ac22a)Even a binary compiled without view, just `print "test"`, gets a SIGSEGV under gdb.

rcqls

[23:25](#msg5c410effdab15872ceaf3d01)And this binary works normally?

loziniak

[23:25](#msg5c410f069bfa375aab1a307d)yes.

[23:26](#msg5c410f2ecb47ec30005e11a2)I've also tested a simple CLI binary that loads LIBC's strcmp function and runs it, with same result

rcqls

[23:27](#msg5c410f6f35350772cf4a6945)So gdb is not useful here!

loziniak

[23:27](#msg5c410f7635350772cf4a6949)Apparently :-)

## Friday 18th January, 2019

rebolek

[08:14](#msg5c418b008ce4bb25b8cde80e)@rcqls Is there some info what works, what does not and what is going to be implemented next?

rcqls

[08:22](#msg5c418cd783189945240b0315)@rebolek Not yet… but I will do soon when the red:GTK would be at least mostly useable. But for sure, `camera`, `para` and `rich-text` are not implemented and I am in the process to provide some preliminary `resizing` stuff and stuff that is related like changing offset and size. That’s why, good minimal examples are good to illustrate missing things. Feel free to send me some examples!

rebolek

[08:24](#msg5c418d52f780a1521f2bcbb7)I'll try to do some, thanks for info!

rcqls

[08:40](#msg5c4190f9c45b986d117cdcf1)@rebolek @loziniak The example `vid-wallet.red` in my repo `rcqls/red-tests` is working since the windows is able to be resized. I’ll send a PR.

rebolek

[11:52](#msg5c41bdf027611d4204c2d6c6)I've got a strange bug, see this code:

```
Red []

do %../red-tools/html-tools.red

main: [
    tab-panel [
        "Chart" [
            radio "box" []
        ]
    ]   
]
main: layout main
view/no-wait main

do-events
```

[11:52](#msg5c41be0b7a0f4d5b19cb2b2f)This crashes here's the debug output:

```
>> do %d.red
root size: 3454, root max: 4874, cycles: 0

*** Runtime Error 98: assertion failed
*** in file: /home/sony/Code/red/runtime/datatypes/object.reds
*** at line: 69
***
***   stack: red/object/rs-find 00000062h 0808B0ADh
***   stack: red/object/rs-find F4CE7154h F4C45A80h
***   stack: gui/connect-mouse-events 0A358190h 0A16DEF4h F4CE7154h 1382
***   stack: gui/OS-make-view 0A16DEF4h 171164072
***   stack: ctx371~make-view 0A16DEF4h 0A16DF04h
***   stack: show
***   stack: show
***   stack: show
***   stack: show
***   stack: view
***   stack: red/_function/call 0A16D904h F7F3D884h
***   stack: red/interpreter/eval-code 0A16D904h F4A47B98h F4A47BA8h true F4A47B78h F4A47864h F4B452ECh
***   stack: red/interpreter/eval-path F4A47B78h F4A47B88h F4A47BA8h false false false false
***   stack: red/interpreter/eval-expression F4A47B88h F4A47BA8h false false false
***   stack: red/interpreter/eval 0A16D8F4h true
***   stack: red/natives/try* true 0
***   stack: do-file
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments F4B4471Ch F4A43C50h F4A43C50h 00000000h 00000000h
***   stack: red/interpreter/eval-code F4B4471Ch F4A43C40h F4A43C50h false 00000000h 00000000h F4B4471Ch
***   stack: red/interpreter/eval-expression F4A43C40h F4A43C50h false false false
***   stack: red/interpreter/eval 0A16D844h true
***   stack: red/natives/catch* true 1
***   stack: ctx471~try-do F4B91D90h
***   stack: ctx471~do-command F4B91D90h
***   stack: ctx471~eval-command F4B91D90h
***   stack: ctx471~run F4B91D90h
***   stack: ctx471~launch F4B91D90h
***   stack: ***_start
```

[11:53](#msg5c41be2620b78635b6427726)But if I comment the `do` line, it does not crash. There's no View related code in `html-tools`.

rcqls

[11:55](#msg5c41bec227611d4204c2dcff)@rebolek red-tools is the code on your repo?

[12:09](#msg5c41c1e4c45b986d117e117b)My first attempt is that I manage to cross-compile it by adding `Red [Needs: View]` and it seems to work.also with my new (cross-)compiled `console-view`.

[12:10](#msg5c41c218ba355012a45ac003)I mean with the `do` line and by cloning your repo … (actually by pulling it)

[12:13](#msg5c41c2cef780a1521f2d1cff)\[!\[bolek-test.png](https://files.gitter.im/red/GTK/tRpF/thumb/bolek-test.png)](https://files.gitter.im/red/GTK/tRpF/bolek-test.png)

[12:16](#msg5c41c38d35350772cf4e9ea7)Even `do %bolek.red` works in the console-view repl where `boles.red` contains your code. Don’t think it is related to my last commit!

rebolek

[12:27](#msg5c41c6329bfa375aab1ea9bb)@rcqls right, `red-tools` is my repo available on GitHub

[12:27](#msg5c41c645ba355012a45ada24)I haven't compiled the code, just run it from console.

[12:29](#msg5c41c6b6c45b986d117e2fd8)I'll try your branch, I was on red/GTK, not rcqls/GTK

[12:33](#msg5c41c7aa27611d4204c31901)@rcqls With your branch it works fine, sorry for bothering you!

rcqls

[12:56](#msg5c41cce5746d4a677ad18328)@rebolek No problem! That’s Interesting! My last commit seems to be more interesting that I thought about your last example.

rebolek

[14:11](#msg5c41de8df780a1521f2de084)@rcqls Here's one bug with GTK branch:

```
>> load "0.00000152"
== 0.0
```

Master branch returns proper result:

```
>> load "0.00000152"
== 1.52e-6
```

[14:26](#msg5c41e2161cb70a372afb8763)It's actually even more terrifying:

```
>> 0.1
== 0.0
>> zero? 0.1
== true
```

[14:37](#msg5c41e49c9bfa375aab1f8ac6)Ok, this is getting really ridiculous.

```
>> 5 / 2.0
== 2,5.0
```

rcqls

[14:59](#msg5c41e9e80721b912a59dda8e)@rebolek Are yiu sure? That’s what I get:

```
--== Red 0.6.4 ==--
Type HELP for starting information.

>> 5 / 2.0
== 2.5
>> load "0.00000152"
== 1.52e-6
>> 0.1
== 0.1
>> zero? 0.1
== false
>> 5 / 2.0
== 2.5
>> os-info
== make object! [
    name: "Ubuntu 18.04.1 LTS"
    arch: 'x86_64
    version...
```

rebolek

[15:05](#msg5c41eb2127611d4204c413cd)@rcqls I have version built today from commit `38ebe69d`:

```
➜  red git:(38ebe69d) ✗ ./console-view 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> about
Red 0.6.4 for Linux built 18-Jan-2019/13:31:43+01:00

>> 5 / 2.0
== 2,5.0
```

[15:05](#msg5c41eb3995e17b45256ff8fa)It seems like some locale related problem I guess from the `2,5.0` value

rcqls

[15:13](#msg5c41ed36cb47ec3000637347)@rebolek My `rcqls/red:GTK` branch is close to be up to date with the `red/red:master` branch… Not the one provided by `red/red:GTK` is less recent compared with master branch. Is this a possible explanation ? It is weird! I am trying to provide a link to have my last generated `console-view`...

[15:20](#msg5c41eecddab15872ceb49523)@rebolek You can test with this (binary) \[console-view](https://toltex.u-ga.fr/users/RCqls/Red/console-view)

rebolek

[15:23](#msg5c41ef58ba355012a45bf7fb)Thanks, I'm on train now, I will check it once I get home.

guaracy

[22:13](#msg5c424f9e0721b912a5a086a3)Changing locale works fine.

```
# guaracym @ guaracy-pc in ~/red/gtk/red on git:GTK x [20:03:52] 
$ red 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> 5 / 2.0
== 2.5
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 145 date: 5-Jan-2019/1:37:59 commit: #1c0642eff9a233db8902c9b06730202a1c0f1982 ]
PLATFORM: [ name: "Manjaro Linux" OS: 'Linux arch: 'x86_64 version: 4.14.92 build: "#1 SMP PREEMPT Wed Jan 9 16:51:38 UTC 2019" ]
--------------------------------------------
>> q

# guaracym @ guaracy-pc in ~/red/gtk/red on git:GTK x [20:04:15] 
$ ./console-view 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> 5 / 2.0
== 2,5.0
>> get-env "LANG"
== "pt_BR.UTF-8"
>> q

# guaracym @ guaracy-pc in ~/red/gtk/red on git:GTK x [20:04:36] 
$ LC_ALL=C ./console-view
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> 5 / 2.0
== 2.5
>> 0.1
== 0.1
>> zero? 0.1
== false
>>
```

rcqls

[22:19](#msg5c425105cb47ec3000660f95)@guaracy Thanks! BTW, you seem to have an Archlinux based linux distribution, do you have View working? I guess not...

guaracy

[22:27](#msg5c4252b495e17b452572b3c9)@rcqls View ends the program with a segmentation fault. Seens to work on Manjaro 32 bits.

rcqls

[22:29](#msg5c425364dab15872ceb749db)@guaracy Thanks! The behavior is the same as initially reported by @loziniak. Good to know that it works for 32bits Archlinux based distribution. I need to find a docker image i32bits Archlinux based to test it.

## Saturday 19th January, 2019

loziniak

[00:36](#msg5c42710cba355012a45f6751)@rebolek how did you get such a nice debug output? Is this with \*console* compiled with `-d` option? I compiled console with `-d` inside Rebol string: `echo 'Rebol[] do/args %red.r "-d -r %environment/console/CLI/console.red"' | ./rebol +q -s`, but under Arch I still get no debug info:

```
% ./console 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> view []

*** Runtime Error 32: segmentation fault
*** Cannot determine source file/line info.
***
```

koksyn

[22:10](#msg5c43a04d35350772cf5a432b)@rcqls Hi, I launched successfully your \*docker-red-gtk* script from Github and docker container (under Ubuntu 16.04 lts). Then I tried to compile \*\*react-test.red\*\*, it was compiled without errors. Then I executed this compiled binary from my host system (ubuntu) - it works without any errors :) View was visible.

I've done also the same steps with \*\*wallet.red\** (modified Red wallet) from @loziniak 's branch \*softwallet (\[link](https://github.com/robotix-pl/wallet/tree/softwallet))\*. But with `-d` (debug) option. I've seen output like:

```
mateusz@mateusz-desktop:~/Red/docker-red-gtk/Scripts$ ./wallet
root size: 4226, root max: 5308, cycles: 0
root size: 4226, root max: 5308, cycles: 1
root size: 4226, root max: 5308, cycles: 2
root size: 4226, root max: 5308, cycles: 3
root size: 4226, root max: 5308, cycles: 4
root size: 4226, root max: 5308, cycles: 5
root size: 4226, root max: 5308, cycles: 6
root size: 4226, root max: 5308, cycles: 7
root size: 4226, root max: 5308, cycles: 8

*** Runtime Error 98: assertion failed
*** in file: /home/user/red/red/runtime/datatypes/object.reds
*** at line: 69
***
***   stack: red/object/rs-find 00000062h 080909E9h
***   stack: red/object/rs-find F3835A80h F5254A80h
***   stack: gui/connect-mouse-events 08E8C1A0h 08C7FF9Ch F3835A80h 108
***   stack: gui/OS-make-view 08C7FF9Ch 0
***   stack: ctx371~make-view 08C7FF9Ch 08C7FFACh
***   stack: show
***   stack: view
***   stack: ctx573~run F7FA1A90h
***   stack: ***_start
```

It looks like a problem with Mouse events (?) What do you think - what can be wrong?

rcqls

[22:29](#msg5c43a4bc1cb70a372a0693ac)Hi @koksyn, you are also interested (like @loziniak ) in compiling wallet. I guess the Red team is also iterested in Good to know that you use `docker-red-gtk`. What OS do you have? And what repo did you clone in your `~/Github/red` since you need to have the latest development to compile the wallet as in the repo from @loziniak. All my PR are not accepted yet in the official repo `red/red:GTK`. So you should use temporarily my repo `rcqls/red:GTK` including some resizing stuff missing in the official repo but not for long I hope. Eventhough, I already gave a try and if I remember correctly I managed to compile but with an error violation just normal since the wallet is a very complete application thanks to the Red team.

## Monday 21st January, 2019

loziniak

[10:34](#msg5c45a03595e17b4525866ab0)Hi! Me and @koksyn work together on the same project. @koksyn, great that you managed to generate this debug info.

[11:18](#msg5c45aa8acb47ec30007a6083)@rcqls @koksyn I tracked an error down to `_on-over` value in \*gtk3/gui.reds\*, and it's set only in line 53. So, maybe it's connected with Garbage Collector? Perhaps we could try to compile things with `recycle/off`, and see what happens?

rcqls

[11:20](#msg5c45aaef0721b912a5b4acd5)@loziniak What repo do you use to compile wallet? `rcqls/red:GTK` or `red/red/GTK` ?

koksyn

[19:57](#msg5c462426cb47ec30007da386)@rcqls  
The OS I have is `Ubuntu 16.04.1 LTS (4.15.0-43-generic)` 64-bit.

Steps I made earlier:  
\- cloned your repo `docker-red-gtk`  
\- changed 1 line in `docker-red-init.sh` (deleting `> /dev/null` in searching for IP address of docker0, because this command caused "Error in docker-red: no IP address!").  
Maybe it is not an issue at macOS.  
\- added `docker-red-init.sh` to `.bash_profile`  
\- creating docker image by `docker-red build`  
\- jumped inside container (ip address taken from docker0): `docker run --rm -ti -v ~/:/home/user/work -e DISPLAY=$(/sbin/ip -o -4 addr list docker0 | awk '{print $4}' | cut -d/ -f1):0 rcqls/red-gtk-ubuntu`  
\- using `red-compile` to compile `wallet.red` with debug  
\- executing compiled binary in my host system (Ubuntu 16.04.1 LTS) outside docker container

Which repo I used? I can see in Dockerfile: `RUN git clone -b GTK https://github.com/red/red.git` so it wasn't `rcqls/red:GTK`. `Ubuntu` was setted as docker image distrib (by default).

Thanks to you I understood that wallet have some features, that might not be fully implemented yet - inside `rcqls/red:GTK`. And these errors are just normal.

\-----  
Next steps (from today):

I assume I should edit Dockerfile to clone `rcqls/red:GTK` instead, so I've change that inside your bash scripts and Dockerfile.  
\- Choosed distrib: "Ubuntu"  
\- Cloned repo: `rcqls/red:GTK` in Dockerfile  
\- Changed build-dir to `docker-red --build-dir local build`

Result was the same (Runtime error 98) as earlier.

Furthermore the 'react-test' does not work after today's changes, but it works earlier when I used GTK from `red/red`.  
I've send this compiled binary to @loziniak, to check how it will behave with his OS.

rcqls

[20:13](#msg5c4627cd8ce4bb25b8ea891d)@koksyn Thanks for the feedback, since I could not give a try about `docker-red-gtk`to a linux box. IAs mentionned in the README, you don’t need to change the repo inside the Dockerfile, you just have to clone `red/red:GTK` or `rcqls/red:GTK` in `~/Github`. The red-compile script would then take this folder to compile red script. BTW, if you are on Ubuntu, you could simply install the red as usual and if you want to use the latest GTK repo to compile use my `reds` script to compile directly on yopur system. In such case, `docker-red-gtk` is only useful to test another distribution. Just as a comment `red` binary (which does not include View for linux) could be simply replace with `reds` which is a bash-script (like red-compile) from the source. If you avec `~/Github/red` folder (red/red:GTK or rcqls/red:GTK), `reds ~/Github/red/environment/console/CLI/console-view.red` should compile the red script to build the expected `console-view` binary. To get the wallet binary `reds wallet.red` (after cd to wallet.red folder).

[20:53](#msg5c463130dab15872ceceeaba)@koksyn Forget to confirm that I introduced a bug yesterday that I have fixed just one hour ago.

## Tuesday 22nd January, 2019

rcqls

[08:08](#msg5c46cf8020b78635b66255ef)@koksyn To be more precise about `reds` bash script: if you clone red in a path `~/tmp/red` (for instance), you can compile console-view:  
\* solution 1: in a terminal in any folder &lt;folder&gt;:

```
reds —root  ~/tmp/red  ~/tmp/red/environment/console/CLI/console-view.red
```

creating `/console-view`  
\* solution 2:

```
cd  ~/tmp/red
reds —root  . environment/console/CLI/console-view.red
```

creating `~/tmp/red/console-view`

Of course, this assumes you have a linux box. Otherwise add `-t Linux` to cross-compile.

## Wednesday 23th January, 2019

rebolek

[08:16](#msg5c4822c10a491251e33f451c)Hm.

```
>> 5 / 2.5
== 2,5.0
>> 5 / 2,5
== 2,5.0
```

rcqls

[08:19](#msg5c4823a7cb47ec30008a8294)@rebolek did you see the comment of @guaracy ? What is the result after: `LC_ALL=C ./console-view` ?

[08:22](#msg5c482429f780a1521f55795d)`get-env "LANG "` ?

rebolek

[08:22](#msg5c4824391cb70a372a22e94e)@rcqls I missed that comment, sorry. I guess my locale `cs_CZ.UTF8`or something like that, let me check.

[08:23](#msg5c482486cb47ec30008a89a8)@rcqls it works that way:

```
>> 5 / 2.5
== 2.0
>> 5 / 2.0
== 2.5
```

[08:24](#msg5c4824a60a491251e33f53d3)Nut why standard Red doesn't have this problem, only `GTK` branch?

rcqls

[08:25](#msg5c4824f7c45b986d11a6835b)@rebolek good news! And it is indeed weird that it occurs only in red/GTK branch… red/GTK is supposed to be red/master + GTK plugin. Don’t know what part of the source code could be affected by locale settings.

[08:28](#msg5c4825a48ce4bb25b8f75e81)Maybe GTK internationalization stuff? To check!

rebolek

[08:30](#msg5c482643746d4a677af9349b)@rcqls I believe it must have something to do with GTK. Anyway, it's good to have a way to run it on my system. Thanks very much!

rcqls

[08:32](#msg5c48268a9bfa375aab4751e2)@rebolek Your welcome and above all thanks @guaracy !

rebolek

[08:32](#msg5c48269720b78635b66b496b)Yes, thanks @guaracy !

## Wednesday 30th January, 2019

rebolek

[12:46](#msg5c519cad13a2814df6ef78e5)I've got my Redwatch testing script working on Linux, this is great!

rcqls

[13:28](#msg5c51a6719221b9382de79363)@rebolek Is it related to GTK? (I guess so because of « watch »)

rebolek

[13:29](#msg5c51a6c7975714406b6761ab)@rcqls certainly, it's a test app for my chart widgets in Draw. It's called Redwatch, because it watches RED token price (great source of data for chart testing).

rcqls

[13:30](#msg5c51a708f46373406a24f320)As a statistician, I am interested in chart! Good to know….

rebolek

[13:31](#msg5c51a738ceb5a2264f666d93)Yes, it's great that I've got it running on Linux too, it will make development easier for me.

rcqls

[13:34](#msg5c51a7e2454aad4df7c81ff5)When I have free time, I try to make scripts in the code repo working. The last one is : `code/Scripts/resize-image.red`. But it works with my repo `rcqls/GTK`. Many other works already…

greggirwin

[22:51](#msg5c522a8cca428b06452b5989)Woohoo! Thanks for the continuing updates on progress.

## Thursday 31st January, 2019

rcqls

[00:19](#msg5c523ef6975714406b6b91eb)@greggirwin `resize-imager.ed` is a nice red port...

## Tuesday 5th February, 2019

rebolek

[18:41](#msg5c59d8bf975714406b9cf25a)@rcqls I found one thing, where GTK version works better than Windows one! In Windows, line is limited to just 1000 elements. GTK version has no such limit, which is cool!

rcqls

[18:56](#msg5c59dc7478e1ed4103e89499)@rebolek Just checked code and you’re right it is indeed hard coded in both macOS and windows (and can be increased). No limitation is coded for line in GTK using cairo. All these implementations was done by @qtxie. BTW, after working a bit on shape, `code/Scripts/tiger.red` is working using my repo `rcqls/red:GTK`. However, I have a bug with the timer …. stopping it by closing the window fails…

rebolek

[19:22](#msg5c59e28cc2dba5382ee728e3)I've reported it to @qtxie already and he agreed that the limit makes no sense and should be removed, but probably had more important things to do. So GTK is ahead of both Win and macOS in this regard :smile:

[19:25](#msg5c59e31d7b68f94102781ff9)Good to hear that Tiger works! I'm having another problem, with enough widgets, I get access violation. After removing some of them, layout works fine.

rcqls

[19:47](#msg5c59e854454aad4df7fdfbf8)@rebolek if you think that it is possible to provide such an example, it could help…

rebolek

[19:48](#msg5c59e8a2c2dba5382ee7580e)@rcqls I would love to, but it usually happens with more complex code, it's hard to isolate. Anyway, I'll keep trying to make it simple and post it when I have something.

[19:49](#msg5c59e8d741775971a0e0de32)It's not very high number of widgets, around 10, but it seems it depends on other code also.

rcqls

[19:50](#msg5c59e90e7b68f94102784ae0)@rebolek No problem, I understand that… Actually I have one example already of such kind of problem ...

[20:03](#msg5c59ebfdf04ef00644e58e4c)A simplified version of the gobang game `vid-base.red` in my repo `rcqls/red-tests` is such a weird case where access violation occurs after I uncomment 1 more case and when I click one of them ….

[21:18](#msg5c59fda61b62f12650aaa1f6)@rebolek Just added `recycle/off` makes the gobang game or Recode working…. Good news….

[22:16](#msg5c5a0b5178e1ed4103e9e839)@rebolek After a long investigation, found the explanation why `recycle/off` was needed on linux for many examples. The fix was first proposed by @qtxie on macOS for image in `runtime/collector.reds`. Really happy to have found this fix. Tell me if this fix your problem (only on my repo form now). It was related to image. Good news, `code/Scripts/mandelbrot.red` is working now and `Gobang.red`, `view-test.red` no more need `recycle/off`.

[22:29](#msg5c5a0e3c7b68f941027963de)Oops! `tests/gtk3/view-test.red` still needs `recycle/off`...

## Wednesday 6th February, 2019

rcqls

[08:51](#msg5c5aa006c2dba5382eec4b7e)Good news (at least for me), the issue about the freezing of the window after an attempt to close it (when timer activated) is fixed (in my repo). I’ll send a PR soon. As a direct consequence, `tiger.red`, `particules.red` works properly.

rebolek

[09:09](#msg5c5aa45578e1ed4103edca01)@rcqls thanks for your work! I'll compile exe from your repo to see the improvements and let you know.

[09:26](#msg5c5aa841f46373406a5fc7a6)@rcqls I got compilation error with your repo:

```
Compiling to native code...
*** Compilation Error: undefined symbol: g_application_quit 
*** in file: %/home/sony/Code/red/modules/view/backends/gtk3/gui.reds 
*** in function: exec/gui/OS-destroy-view
*** at line: 1906 
*** near: [
    g_application_quit GTKApp
]
```

rcqls

[09:27](#msg5c5aa882975714406ba250be)Oups! sorry I forgot to push this fix… I’ll do it now...

[09:29](#msg5c5aa8dff46373406a5fcb95)@rebolek Done!

rebolek

[09:34](#msg5c5aaa3678e1ed4103edf44e)Now it compiles fine, thanks!

rcqls

[09:36](#msg5c5aaa8c1b62f12650af0268)Hope it works better now for you as it is here on my computer!

rebolek

[09:36](#msg5c5aaaad13a2814df62aa3db)It works much better now, the GUI does not crash anymore, thanks!

[09:38](#msg5c5aaaf978e1ed4103edf8ff)Are you interested in GTK error warning I get in the console? My GUI works fine, but there's some debug output.

rcqls

[09:38](#msg5c5aab30454aad4df702ef86)Good news! There is still some weird behaviors… execution of same red script can fail when launched from different folder….

rebolek

[09:39](#msg5c5aab5878e1ed4103edfb33)I still get crash when running the same script more times in row.

rcqls

[09:40](#msg5c5aab73ca428b064562dfee)@rebolek Yes I can be interested even if I guess what it is because I have a lot of these error messages

rebolek

[09:41](#msg5c5aabbb8aa5ca5abf8f0b13)The first two errors are repeated:

```
(console-view:23040): Gtk-CRITICAL **: 10:38:18.170: gtk_widget_get_pango_context: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:23040): Pango-CRITICAL **: 10:38:18.170: pango_layout_new: assertion 'context != NULL' failed

(console-view:23040): Gtk-WARNING **: 10:38:18.182: Could not load a pixbuf from /org/gtk/libgtk/theme/Adwaita/assets/bullet-symbolic.svg.
This may indicate that pixbuf loaders or the mime database could not be found.
```

rcqls

[09:42](#msg5c5aac00c2dba5382eec975b)Memory leak is more than possible… If you find minimal example that crashes … don’t hesitate to share...

[09:44](#msg5c5aac6b975714406ba26baf)Except the last message about svg, I see the other messages very often. Something related to font that I’ll work soon since rich text is not far from my next task...

[09:45](#msg5c5aacce8aa5ca5abf8f0fb1)I also need to check more carefully when to apply `g_object_unref` to gtk objects.

[09:47](#msg5c5aad3a1b62f12650af14c8)@rebolek Could you tell me what kind of widget or object you are using a lot in your application? (because my examples are minimal and I don’t think I can have the same issue)

rebolek

[09:51](#msg5c5aae1c454aad4df703014a)Here's my layout:

```
24 lay: [
 25     below
 26     p: base 400x200
 27     f: field 400
 28     across 
 29     button "Test" [
 30         draw-chart
 31     ]
 32     button "Synth" [
 33         get-wave
 34     ]
 35     return
 36     text "Cuttof" slider [bafl/frequency: to float! face/data get-wave]
 37     text "resonance" slider [bafl/resonance: to float! face/data get-wave]
 38     return
 39     radio "Line" [chart-line?: true chart-style: 'line draw-chart]
 40     radio "Spline" [chart-line?: true chart-style: 'spline draw-chart]
 41     radio "Box" [chart-line?: false chart-style: 'box draw-chart]
 42     radio "Circle" [chart-line?: false chart-style: 'circle draw-chart]
 43     radio "Cross" [chart-line?: false chart-style: 'cross draw-chart]
 44 ]
```

rcqls

[09:52](#msg5c5aae4b13a2814df62ac248)thanks!

rebolek

[09:57](#msg5c5aaf9013a2814df62acc9a)https://i.imgur.com/UuUtMKL.png

[09:57](#msg5c5aaf9e78e1ed4103ee1b9d)That's the GUI.

rcqls

[10:02](#msg5c5ab0cdceb5a2264fa1d31c)The good news is that it looks very similar to macos. I tested your layout with a minimal application but it does crash after 10 attempts. I guess maybe it is what you are doing inside your actors that can crash the application if there is memory leaks (maybe from the GTK size). How many times do you need to have your application crashed ?

rebolek

[10:04](#msg5c5ab13ef04ef00644ea9cc2)5x when I'm doing nothing (moving sliders changes chart), 2x with activity

rcqls

[10:11](#msg5c5ab2bb93fe7d5ac04d6873)Weird… Have you tried with only the layout as in your previous minimal example? For me there is nothing. I have noticed also sometimes that I need to reboot my computer when something goes wrong…. Of course this is the proof that there is memory leaks. However the last commit has a better free-handles that was just ignored before so I think you could try to reboot once at least to see if it is not a remaining bad management of memory…

rebolek

[10:54](#msg5c5abcedc2dba5382eed1a52)How much memory does your computer have?

rcqls

[10:56](#msg5c5abd70454aad4df7036e05)8Go but everything is working in docker and I don’t know how much memory is allocated for dockerized container….

rebolek

[10:57](#msg5c5abd9b93fe7d5ac04d9247)I see. I'm running it native, so it has probably more memory available before I need to restart.

rcqls

[11:01](#msg5c5abe9793fe7d5ac04d9529)I guess docker give 2Go for my container but not sure… With alpha development I am sure that leaks memory and weird behaviors happen. Twice I thought it was my updated code which generated a bug when actually it was only bad behavior of the OS after some bad executions. I only needed to reboot twice when I knew something weird was occurring….

[11:11](#msg5c5ac0f093fe7d5ac04da000)@rebolek BTW, did you add `recycle/off` at the beginning and `recycle/on` at the end… I think it is no more necessary but for `view-test.red` it is still necessary (otherwise refresh of the window is incomplete) meaning that something weird is occurring…. I am also working on resizing that I think weirdly very slow...

rebolek

[11:12](#msg5c5ac135c2dba5382eed3e55)@rcqls no, I haven't tried it with recycle yet. I'll try it.

[11:14](#msg5c5ac1839221b9382d237eb1)it's almost same IMO.

rcqls

[18:34](#msg5c5b28b854f21a71a10c686c)Just to inform that I sent a PR with a lot of improvements and fixes...

[18:36](#msg5c5b293e9221b9382d26900d)@rebolek `rcqls/red:GTK` is now my branch to submit PR and `rcqls/red:GTK-dev` my development branch.

greggirwin

[23:44](#msg5c5b715b8790df06206f18a7)I'm monitoring this channel, and the progress is fantastic. Thanks so much guys. I see the PR, and hope @qtxie will be able to OK it for merging soon.

## Thursday 7th February, 2019

rcqls

[08:56](#msg5c5bf2c5454aad4df70bb432)@greggirwin Hope too since at some point it is the more complete branch (too bad that Android branch is not provided too)… Cross-compilation is really something I love above all with a small footprint software.

loziniak

[12:56](#msg5c5c2b1713a2814df63507a8)Hi! I've compiled a `console-view` from latest \*rcqls/GTK* branch, and I've got these errors on first run:

```
>> do %tests/react-test.red

(console-view:621): Gtk-CRITICAL **: 13:40:06.059: gtk_widget_get_pango_context: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:621): Pango-CRITICAL **: 13:40:06.060: pango_layout_new: assertion 'context != NULL' failed
free(): invalid pointer
Aborted
```

On subsequent runs I've got `*** Runtime Error 1: access violation` errors on last two lines instead. \*Gtk-CRITICAL* and \*Pango-CRITICAL* sequence was repeated 6 times.

[12:58](#msg5c5c2b7978e1ed4103f869fc)That was on 32-bit Debian. And on Arch I still get segmentation fault:

```
$ ./console-view                              
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> view []

*** Runtime Error 32: segmentation fault
*** Cannot determine source file/line info.
***
```

rebolek

[12:58](#msg5c5c2b8941775971a0f047f4)@loziniak I've tried `react-test.red` also and got this:

```
>> do %react-test.red

(console-view:8427): Gtk-CRITICAL **: 13:57:51.776: gtk_widget_get_pango_context: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:8427): Pango-CRITICAL **: 13:57:51.777: pango_layout_new: assertion 'context != NULL' failed

(console-view:8427): Gtk-CRITICAL **: 13:57:51.856: gtk_widget_get_pango_context: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:8427): Pango-CRITICAL **: 13:57:51.856: pango_layout_new: assertion 'context != NULL' failed

(console-view:8427): Gtk-CRITICAL **: 13:57:51.861: gtk_widget_get_pango_context: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:8427): Pango-CRITICAL **: 13:57:51.861: pango_layout_new: assertion 'context != NULL' failed

(console-view:8427): Gtk-CRITICAL **: 13:57:51.862: gtk_widget_get_pango_context: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:8427): Pango-CRITICAL **: 13:57:51.862: pango_layout_new: assertion 'context != NULL' failed

(console-view:8427): Gtk-CRITICAL **: 13:57:51.862: gtk_widget_get_pango_context: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:8427): Pango-CRITICAL **: 13:57:51.862: pango_layout_new: assertion 'context != NULL' failed

(console-view:8427): Gtk-CRITICAL **: 13:57:51.867: gtk_widget_get_pango_context: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:8427): Pango-CRITICAL **: 13:57:51.867: pango_layout_new: assertion 'context != NULL' failed

(console-view:8427): Gtk-CRITICAL **: 13:57:51.868: gtk_widget_get_pango_context: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:8427): Pango-CRITICAL **: 13:57:51.868: pango_layout_new: assertion 'context != NULL' failed

(console-view:8427): Gtk-CRITICAL **: 13:57:51.873: gtk_widget_get_pango_context: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:8427): Pango-CRITICAL **: 13:57:51.873: pango_layout_new: assertion 'context != NULL' failed

*** Runtime Error 16: invalid virtual address
*** at: F6A31E10h
```

[12:59](#msg5c5c2ba213a2814df6350c6f)But I'm able to run my scripts just fine, so it must be something in react demo.

[12:59](#msg5c5c2bc478e1ed4103f86bb2)this is on Ubuntu 64bit with 32bit libs. I can confirm that Arch (Manjaro) still doesn't work yet.

rcqls

[13:16](#msg5c5c2fbd7b68f9410287f6b3)@loziniak, @rebolek My last work tried to change the way fonts are managed as it was expected by the Red Team. I have noticed too that `style` is now buggy when considering font in the style. I will try to consider it soon … But just to prove my purpose: change the line 20 in `react-test.red` `style value: text "0" 30 right bold` with `style value: text "0" 30 right ;bold` and everything would be fine.

rebolek

[13:18](#msg5c5c3027975714406bace44d)@rcqls I still get the same debug output, but there's no crash and the test works. Thanks!

rcqls

[13:18](#msg5c5c303293fe7d5ac052a19a)But thank you for your comments since it will give me the right direction to solve the problem.

loziniak

[13:19](#msg5c5c3044ceb5a2264fac3d90)@rcqls confirmed :-)

rcqls

[13:20](#msg5c5c30a48aa5ca5abf946d6c)Gtk is very verbose with a lot of warnings `Gtk-critical`… It reminds us that nothing is perfect yet!

[13:24](#msg5c5c318513a2814df63536b6)@loziniak I have no idea about the archlinux problem… and I will not consider it since I could not be sure that it is not related to `red` code. I really tried for a while but without any success.

rebolek

[13:25](#msg5c5c31c9ca428b06456da3ba)If I can find some time, I'll add some debug output to see where the problem happens on Arch, but I don't expect to get to it soon.

rcqls

[13:25](#msg5c5c31e3f04ef00644f5220d)Somebody here (in this forum) think that it works on archlinux 32 bits…. but I did not find any docker image on i386.

rebolek

[13:26](#msg5c5c3206f04ef00644f5238e)AFAIK Arch 32 is discontinued.

loziniak

[13:26](#msg5c5c320d13a2814df6353ba0)I understand. Get GTK working on stable architectures should be a top priority, and Arch is not mainstream :-)

[13:41](#msg5c5c357a41775971a0f09218)I'll keep trying anyway and will report if something changes.

rcqls

[15:37](#msg5c5c50c2f04ef00644f611a3)To complete my comment about style adding ‘bold’ directly after call of style ‘ value' works when failing when declared in the style …. This is a bit weird for me….It is certainly related to font creation which no more a string but a real font\_description and the behavior differs when used inside style or directly.

[21:19](#msg5c5ca0cdceb5a2264fafaa1c)@loziniak @rebolek After tracking bug on style with font, I also realized that my last work on resizing makes `tests/vid.red` not working anymore. The bug on style was related to change on font. Everything is fine again for these two issues as in `rcqls/red:GTK` branch. `code/Scripts/mandelbrot.red` is then working because of the fix on style.

## Friday 8th February, 2019

rebolek

[06:41](#msg5c5d24b7ef98455ea4fc111a):+1:

[07:32](#msg5c5d307116e4682259873bd6)@rcqls I've got strange error, where I have very simple layout:

```
win: [
    below
    p: base 400x200
    button "Test" [get-wave]
]
```

[07:32](#msg5c5d308b253c2b5ea3d7609a)`view win` leads to `Access violation`, but `view/no-wait win do-events` works fine.

rcqls

[07:41](#msg5c5d32c5dc3f0523cc7c0a31)@rebolek not confirmed on my computer...

rebolek

[07:42](#msg5c5d32f33608b004a08c99ae)@rcqls there is some non-gui code before this, I try removing it, to see if it changes.

[07:43](#msg5c5d3339d1e3093ab5e42448)With the unrelated code it does not crash.

[07:48](#msg5c5d3455253c2b5ea3d77a4a)It's interesting, because I have second GUI, that uses same scripts, is much complicated (~20 widgets instead of 2) and does not crash.

[07:58](#msg5c5d368edc3f0523cc7c2255)It's confusing. What runs and what not is bit unpredictable. I get one script running 5x in row and 6th time it crashes, but the second one, that crashed starts working.

[08:09](#msg5c5d392bd1e3093ab5e44be7)Maybe I need to restart?

rcqls

[08:32](#msg5c5d3eb2d1e3093ab5e47651)@rebolek I can confirm that sometimes there are unpredictable results… and as I told you before, I restart the computer (but not so often, twice at most in the time being) even if this is not expected on unix-based OS. Also, I don’t know what is the effect of GC. The timer issue I had was related to GC. `recycle/off` did not solve the problem… Red/GTK is not in its phase on stabilization even things get better and better...

rebolek

[08:34](#msg5c5d3f28d1e3093ab5e47871)@rcqls I know it's on development, I'm just reporting stuff I find. And thank you for your efforts!

rcqls

[08:36](#msg5c5d3fa8604f233ab6d3876a)@rebolek (Just in case, I was not complaining at all) I am really happy that you are playing with it… it gives me a lot of feed-back ...

## Saturday 9th February, 2019

rcqls

[15:44](#msg5c5ef55ad1e3093ab5f03b27)Good news (at least for me)! Draw dialect knows how to underline text because of the introduction of pango\_cairo instead of cairo considered by the cairo team themself as a toy when drawing text. I am now in the road for richtext… that strangely looks like very similar to GtkTextView (internally at least) but richtext needs to be developped from a GtkDrawingArea to get similar features of GtkTextView. Of course this is normal since `red` uses different native OS skill first. Also markup in richtext looks like similar to markup of pango which is more simple than using atrributes directly (Pango markup is not directly related to css styles).

rebolek

[17:11](#msg5c5f09d7604f233ab6dfa25d)@rcqls good news not just for you! keep up the great work you are doing! :fireworks:

## Sunday 10th February, 2019

c61292558

[16:05](#msg5c604bdeef98455ea41102f0)

```
~/Desktop/releases/rebol-core$ cp rebol-core/rebol red/
cp: 无法获取'rebol-core/rebol' 的文件状态(stat): 没有那个文件或目录
```

[16:06](#msg5c604be88328315deccf49ef)

```
~/Desktop/releases/rebol-core$ cp rebol-core/rebol red/
cp: 无法获取'rebol-core/rebol' 的文件状态(stat): 没有那个文件或目录
```

[16:06](#msg5c604c055095f6660cce7427)not that file or dir  
@rcqls

rcqls

[16:07](#msg5c604c534003460b2d298831)you need rebol to compile red source…. just download it… from rebol website

[16:08](#msg5c604c8e28c89123cba69c37)This is not related to GTK branch but compilation of red source which requires rebol

c61292558

[16:54](#msg5c6057435095f6660ccec724)Install 32-bit dependencies: at-spi2-core, libgtk-3-bin

[16:55](#msg5c605766126af75deb826931)i can't install these dependencies successfully. @rcqls

[16:55](#msg5c60576eadf6cb0b2c964b00)↑

rcqls

[16:55](#msg5c605799d1e3093ab5f91d8a)which distribution?

c61292558

[16:56](#msg5c6057c416e468225992967c)deepin os

[16:56](#msg5c6057d9253c2b5ea3ec20ae)basis on debian 9.0

[16:57](#msg5c6057e5ef98455ea4115952)@rcqls

rcqls

[16:59](#msg5c6058898328315deccfa58e)did you follow \[this page](https://www.red-lang.org/p/download.html) first and then adapt to gtk dependencies?

[17:01](#msg5c6058dadc3f0523cc910a19)you need at least

```
dpkg --add-architecture i386
    apt-get update
    apt-get install libc6:i386 libcurl3:i386
```

[17:02](#msg5c605917adf6cb0b2c965623)you then need to postfix all the installed tools with ‘:i386'

c61292558

[17:09](#msg5c605ad45095f6660ccedfde)\`

[17:10](#msg5c605affecef85660b81a4cf)

```
>> Rebol[] do/args %red.r "-r %console.red"
** Access Error: Cannot open /home/zptian/Desktop/red-GTK/environment/console/CLI/red.r
** Near: do/args %red.r "-r %console.red"
```

[17:10](#msg5c605b0d8328315deccfb952)@rcqls

[17:10](#msg5c605b1a4003460b2d29ead3)

```
>> Rebol[] do/args %red.r "-r %console.red"
** Access Error: Cannot open /home/zptian/Desktop/red-GTK/environment/console/CLI/red.r
** Near: do/args %red.r "-r %console.red"
```

[17:12](#msg5c605b6b16e468225992a14c)too slow...

[17:12](#msg5c605b6d253c2b5ea3ec3a15)\[!\[image.png](https://files.gitter.im/red/GTK/fDXl/thumb/image.png)](https://files.gitter.im/red/GTK/fDXl/image.png)

[17:13](#msg5c605ba080df6804a1802bb9)

```
libc6:i386 已经是最新版 (2.27-3)。
libcurl3:i386 已经是最新版 (7.60.0-1)。
```

is the latest version

[17:13](#msg5c605bae5095f6660ccee53b)@rcqls

[17:15](#msg5c605c1f253c2b5ea3ec3d8c)and then how can i know install successfully? at-spi2-core, and libgtk-3-bin

[17:15](#msg5c605c21253c2b5ea3ec3d8e)?

[17:18](#msg5c605cf1604f233ab6e81a3f)\[!\[image.png](https://files.gitter.im/red/GTK/SlRA/thumb/image.png)](https://files.gitter.im/red/GTK/SlRA/image.png)

[17:32](#msg5c606024253c2b5ea3ec5aed)

```

```

-=== Red Compiler 0.6.4 ===-

Compiling /home/sdfsdf/Desktop/red-GTK/environment/console/CLI/console.red ...  
...compilation time : 6724 ms

Target: Linux

Compiling to native code...  
Script: "Red/System ELF format emitter" (none)  
...compilation time : 589714 ms  
...linking time : 7410 ms  
...output file size : 1436604 bytes  
...output file : /home/sdf/Desktop/red-GTK/console

== none

```

```

ok or not?

rcqls

[17:50](#msg5c6064675095f6660ccf1c7b)You need console-view.red which incluse 'Needs: View' or add it to console.rend

## Monday 11st February, 2019

c61292558

[04:04](#msg5c60f4317502282258d8b4b8)if red-lang depend on GTK+,why don't I use GTK+ directly?

[04:04](#msg5c60f4397502282258d8b4bd)@rcqls

rcqls

[05:33](#msg5c61091fef98455ea415c351)@c61292558 I am not part of the Red team, just a community member, and I don’t have to (and can’t) answer this question . But it is really clear for me why I prefer working with red instead of GTK directly…. much more easier and the goal is to develop View (and VID dialect)) code which are cross-compilable. Linux does not have native GUI as the other OS but GTK is the most popular. Just to let you know, I am a macOS user now and my development on Linux is done with cross-compilation and it is awesome from my point of view. Of course, you are free to use GTK directly.

rebolek

[08:57](#msg5c6139044003460b2d2f6bdb)@c61292558  
&gt; if red-lang depend on GTK+,why don't I use GTK+ directly?

What do you mean by that?

## Tuesday 12nd February, 2019

rcqls

[07:05](#msg5c627035126af75deb90791e)Rich-text development work in progress: color, underline, strike seem ok… issue with font but need some further work.

rebolek

[07:50](#msg5c627acb28c89123cbb51b84)great news!

[09:30](#msg5c629219ef98455ea4205c1c)@rcqls gradients are not supported yet?

c61292558

[11:42](#msg5c62b11def98455ea4213f06)I have no malice. @rebolek

[11:43](#msg5c62b14a16e46822599b9881)I'm just curious.

rebolek

[11:43](#msg5c62b17728c89123cbb6a837)@c61292558 I understand, I just don't know what you mean by using GTK directly.

c61292558

[11:49](#msg5c62b2ba126af75deb926069)Using red-lang on linux ,it seems that red-lang is a middleware because it calls the libraries of GTK+,

[11:49](#msg5c62b2bd126af75deb926078)right?

rebolek

[11:49](#msg5c62b2c97502282258dfad99)yes

c61292558

[11:49](#msg5c62b2e25095f6660cdeab50)I don't know if I understand this way, right?

rebolek

[11:50](#msg5c62b3004003460b2d39ba6e)You're right, Red on Linux uses GTK for GUI.

c61292558

[11:50](#msg5c62b3204bafd97ca3db886c)so some developers will think ,why I don't use the GTK+?

[11:51](#msg5c62b34628c89123cbb6b428)Instead of red-lang

rebolek

[11:51](#msg5c62b3588328315decdf9beb)Well you still need to write your software in some language.

c61292558

[11:52](#msg5c62b38ddc3f0523cca0d3e6)This is a purely hypothetical situation.

rebolek

[11:52](#msg5c62b38f4bafd97ca3db8b67)Red gives you the advantage, that the same program will run not just under Linux, but under Windows and macOS too, using native GUI there.

c61292558

[11:54](#msg5c62b409253c2b5ea3fc4075)No my opinions.^\_^ I love red-lang as much as I used to do.

rebolek

[11:56](#msg5c62b486dc3f0523cca0d8d8)If I look at this example https://www.gtk.org/tutorial1.2/gtk\_tut-6.html and comapre it to `view [button "Hello"]` then the advantage of using Red is pretty obvious :smile:

c61292558

[12:00](#msg5c62b548ecef85660b9174a0)oh,Obviously!

[12:00](#msg5c62b565126af75deb9272a7)LOL

[12:04](#msg5c62b6424003460b2d39cf6b)@rebolek ,you are the part of red-lang team ?

rebolek

[12:09](#msg5c62b795604f233ab6f8371b)I'm doing some work for Fullstack.

c61292558

[13:13](#msg5c62c6954bafd97ca3dc19be)how can i launch GTK+ version?

rebolek

[13:14](#msg5c62c6a6d1e3093ab509bcb6)are you familiar with `git`?

c61292558

[13:14](#msg5c62c6c17502282258e005e3)\[!\[image.png](https://files.gitter.im/red/GTK/jh9x/thumb/image.png)](https://files.gitter.im/red/GTK/jh9x/image.png)

[13:14](#msg5c62c6c8ecef85660b91fe98)i had downloaded the folder

rebolek

[13:15](#msg5c62c6f316e46822599bf18b)I see. You need to put `rebol` executable into that folder, run it and compile in Rebol

c61292558

[13:16](#msg5c62c72c126af75deb92f4b7)copy the rebol-core folder?

[13:16](#msg5c62c7404bafd97ca3dc1e02)\[!\[image.png](https://files.gitter.im/red/GTK/xxit/thumb/image.png)](https://files.gitter.im/red/GTK/xxit/image.png)

[13:17](#msg5c62c74ddc3f0523cca1677d)\[!\[image.png](https://files.gitter.im/red/GTK/2J51/thumb/image.png)](https://files.gitter.im/red/GTK/2J51/image.png)

rebolek

[13:17](#msg5c62c7504003460b2d3a515a)just the `rebol`file is enough, so you won't have troubles with paths

c61292558

[13:17](#msg5c62c781d1e3093ab509c4ee)so i don't move the folder?

[13:17](#msg5c62c783dc3f0523cca16876)right?

rebolek

[13:18](#msg5c62c79f8328315dece030aa)no, there's no need for moving the folder, you just need the `rebol` executable file and nothing else

c61292558

[13:19](#msg5c62c7d3d1e3093ab509c67d)\[!\[image.png](https://files.gitter.im/red/GTK/mDM7/thumb/image.png)](https://files.gitter.im/red/GTK/mDM7/image.png)

[13:19](#msg5c62c7ecef98455ea421e34c)thank you and then ?

rebolek

[13:19](#msg5c62c7ef4bafd97ca3dc21e8)copy `rebol` to `red-GTK`

[13:20](#msg5c62c809ecef85660b9208b7)And then run it. Rebol's console should open.

c61292558

[13:20](#msg5c62c8135095f6660cdf4e54)\[!\[image.png](https://files.gitter.im/red/GTK/yUo7/thumb/image.png)](https://files.gitter.im/red/GTK/yUo7/image.png)

rebolek

[13:20](#msg5c62c8314003460b2d3a54d7)You may need to make it executable, if it isn't

c61292558

[13:21](#msg5c62c8404bafd97ca3dc24bb)\[!\[image.png](https://files.gitter.im/red/GTK/vt2E/thumb/image.png)](https://files.gitter.im/red/GTK/vt2E/image.png)

rebolek

[13:21](#msg5c62c84fecef85660b920ae3)Great.

[13:21](#msg5c62c86c28c89123cbb75345)now you can compile with `do/args %red.r "arguments here"`

c61292558

[13:25](#msg5c62c95d126af75deb9305ae)wait a minute,i have some troubles

[13:32](#msg5c62cad37502282258e010b2)

```
>> do/args %red.r "-r %environment/console/CLI/console.red"
** Access Error: Cannot open /home/zpt/red.r
** Near: do/args %red.r "-r %environment/console/CLI/console.red"
```

rebolek

[13:32](#msg5c62cadfdc3f0523cca180b6)You are in `/home/zpt/` directory, not in `red-GTK`

[13:32](#msg5c62caf37502282258e010bc)you should be in `red-GTK/`, where you copied `rebol`

c61292558

[13:33](#msg5c62cb1b8328315dece047c0)but the rebol executable file is in gtk folde

[13:33](#msg5c62cb1e253c2b5ea3fceda2)r

[13:33](#msg5c62cb4680df6804a19096d7) i type the "ls" command ,

rebolek

[13:34](#msg5c62cb52126af75deb9314d7)and what it returns

c61292558

[13:34](#msg5c62cb747502282258e01137)you are right....

[13:34](#msg5c62cb7b604f233ab6f8c957)why?

[13:35](#msg5c62cb92d1e3093ab509e478)I copy the rebol file and run it in gtk folder

[13:36](#msg5c62cbe5adf6cb0b2ca707a8)why it still in the Dsektop folder

rebolek

[13:36](#msg5c62cbf9ef98455ea4220243)I don't know, just `cd` to the `red-GTK` folder

c61292558

[13:37](#msg5c62cc25adf6cb0b2ca7094e)\[!\[image.png](https://files.gitter.im/red/GTK/qxEI/thumb/image.png)](https://files.gitter.im/red/GTK/qxEI/image.png)

rebolek

[13:38](#msg5c62cc52604f233ab6f8ce84)it seems that you are in `red-GTK` folder. You can check it with `pwd`

c61292558

[13:38](#msg5c62cc56ecef85660b922bec)exciting!

[13:41](#msg5c62cd1cecef85660b92320b)@rebolek

rebolek

[13:42](#msg5c62cd3badf6cb0b2ca70fd2)@c61292558 good, you've just compiled Red console.

c61292558

[13:43](#msg5c62cd647502282258e01501)complied red console?

rebolek

[13:43](#msg5c62cd787502282258e01515)yes

c61292558

[13:44](#msg5c62cdce8328315dece058c4)\[!\[image.png](https://files.gitter.im/red/GTK/7GQl/thumb/image.png)](https://files.gitter.im/red/GTK/7GQl/image.png)

[13:44](#msg5c62cddaecef85660b923b3f)run the console executable file?

rebolek

[13:45](#msg5c62cdef4bafd97ca3dc4e08)why not

c61292558

[13:45](#msg5c62cdf4dc3f0523cca198df)

```
red-GTK/console: error while loading shared libraries: libgtk-3.so.0: cannot open shared object file: No such file or directory
```

rebolek

[13:45](#msg5c62ce04d1e3093ab509f727)Ok, so you need to install 32bit GTK libs

c61292558

[13:46](#msg5c62ce18126af75deb932d87)but i've install GIMP ,

[13:46](#msg5c62ce2b80df6804a190ad75)It brings the libs,right?

rebolek

[13:46](#msg5c62ce3728c89123cbb781d9)Yes, but probably 64bit. Red dosn't support 64bits yet, so you need 32bit libs.

c61292558

[13:46](#msg5c62ce5080df6804a190ae8c)and then ...

[13:47](#msg5c62ce5c4bafd97ca3dc521e)how can i download the libraries

rebolek

[13:47](#msg5c62ce5e253c2b5ea3fd06b4)and then it should work

[13:47](#msg5c62ce6e80df6804a190af68)what distro is Deepin based on? Ubuntu?

c61292558

[13:47](#msg5c62ce7628c89123cbb78407)debian

[13:47](#msg5c62ce8e80df6804a190afb3)7+

[13:48](#msg5c62ce934003460b2d3a89b8)debian 9.0

[13:48](#msg5c62ce9e16e46822599c0d67)based on debian 9.0

rebolek

[13:50](#msg5c62cf0f4003460b2d3a8cd8)I see. So you need something like `sudo apt-get install libgtk-3-bin:i386`

[13:50](#msg5c62cf2f8328315dece0638e)Maybe the lib name is bit different, I'm not sure.

c61292558

[13:51](#msg5c62cf755095f6660cdf8a11)type your command then it can download "at-spi2-core, libgtk-3-bin"?

[13:51](#msg5c62cf788328315dece064e3)right?

rebolek

[13:52](#msg5c62cf87ecef85660b924916)that should be right I guess

c61292558

[13:52](#msg5c62cfaf16e46822599c0fc1)\[!\[image.png](https://files.gitter.im/red/GTK/Rxpl/thumb/image.png)](https://files.gitter.im/red/GTK/Rxpl/image.png)

rebolek

[13:53](#msg5c62cfec28c89123cbb790a8)just ignore the warnings and be aware that there may be crashes. GTK version is in development

[13:54](#msg5c62d000adf6cb0b2ca7222f)now you can try `view [button "Test"]` for example

[13:54](#msg5c62d0054bafd97ca3dc5bf1)and it should work

c61292558

[13:54](#msg5c62d01516e46822599c11ea)what is the meaning of the warning?

[13:54](#msg5c62d01f604f233ab6f8ebb5)why it be broken?

[13:54](#msg5c62d02c253c2b5ea3fd1417)why it was be broken?

rebolek

[13:55](#msg5c62d03eecef85660b924e05)I can't answer that, maybe @rcqls knows.

c61292558

[13:55](#msg5c62d05becef85660b924ec1)@rcqls can you help me ?

[13:55](#msg5c62d05fdc3f0523cca1acef)what is the meaning of the warning?

rebolek

[13:55](#msg5c62d068126af75deb9340ea)I have similar warning, but GTK works just fine.

c61292558

[13:56](#msg5c62d081ef98455ea42225cb)

```
Try running the command
  gdk-pixbuf-query-loaders > /usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache
to make things work again for the time being.
```

[13:56](#msg5c62d086ecef85660b924f73)can i try?

rebolek

[13:56](#msg5c62d0a5adf6cb0b2ca726e7)have you tried `view [button "test"]` in Red console?

c61292558

[13:57](#msg5c62d0e7ef98455ea422287f)yes,i can run

[13:58](#msg5c62d0ee16e46822599c157d)\[!\[image.png](https://files.gitter.im/red/GTK/aWM9/thumb/image.png)](https://files.gitter.im/red/GTK/aWM9/image.png)

rebolek

[13:58](#msg5c62d0f97502282258e02861)great, so it works!

c61292558

[13:59](#msg5c62d1505095f6660cdf9529)thank you very much

rebolek

[14:00](#msg5c62d16228c89123cbb79851)you're welcome

[14:00](#msg5c62d16680df6804a190c9d7)have fun!

c61292558

[14:00](#msg5c62d170ef98455ea4222bff)\[!\[image.png](https://files.gitter.im/red/GTK/Gf9w/thumb/image.png)](https://files.gitter.im/red/GTK/Gf9w/image.png)

[14:00](#msg5c62d17fd1e3093ab50a0fce)sudo: dk-pixbuf-query-loaders：cannot found the command

rebolek

[14:01](#msg5c62d1a7ef98455ea4222cbe)it's `gdk-...`, not `dk-...`

c61292558

[14:02](#msg5c62d1dd4003460b2d3aa16b)

```
sudo: gdk-pixbuf-query-loaders：cannot found the command
```

rebolek

[14:04](#msg5c62d260adf6cb0b2ca732eb)Hm, I'm afraid I can't help you with that.

c61292558

[14:05](#msg5c62d2944003460b2d3aa696)it doesn't matter,you've helped me a lot.

[14:05](#msg5c62d2a2ecef85660b925d14)thank you again.

[14:06](#msg5c62d2dcadf6cb0b2ca737e2)start my red-lang travel!

rebolek

[14:06](#msg5c62d2e77502282258e02dae):rocket:

c61292558

[14:48](#msg5c62dcd1adf6cb0b2ca78dd1)\[!\[image.png](https://files.gitter.im/red/GTK/qHUV/thumb/image.png)](https://files.gitter.im/red/GTK/qHUV/image.png)

[14:48](#msg5c62dcd4253c2b5ea3fd7914)how to run this test file? @rebolek

[15:54](#msg5c62ec1b28c89123cbb86d51)I can use cd command to locate in the folder on Red console

[15:55](#msg5c62ec5928c89123cbb86ebb)@rcqls

[15:55](#msg5c62ec7fdc3f0523cca2942a)\[!\[image.png](https://files.gitter.im/red/GTK/kEky/thumb/image.png)](https://files.gitter.im/red/GTK/kEky/image.png)

[17:00](#msg5c62fb92126af75deb949ae5)the same code why it dosen't calucate like that in win10?

rebolek

[17:00](#msg5c62fba8ef98455ea42386a7)what code?

c61292558

[17:00](#msg5c62fbab80df6804a1920ba9)\[!\[image.png](https://files.gitter.im/red/GTK/4YQD/thumb/image.png)](https://files.gitter.im/red/GTK/4YQD/image.png)

[17:05](#msg5c62fcc4604f233ab6fa3506)\[cal.red](https://files.gitter.im/red/GTK/efKu/cal.red)

[17:05](#msg5c62fcc94003460b2d3bedb8)↑

rcqls

[17:08](#msg5c62fdabecef85660b93a51c)@rebolek You can try gradient using `code/Scripts/gradient-lab.red`, you’ll see gradient but maybe there is some fix to do… (linear and radiant gradients are implemented but I suspect a radiant is not perfect)...

c61292558

[17:09](#msg5c62fde3ef98455ea42394c3)https://files.gitter.im/red/GTK/Gf9w/image.png

[17:10](#msg5c62fdf4253c2b5ea3fe7a05)

```
sudo: gdk-pixbuf-query-loaders：cannot found the command
```

[17:10](#msg5c62fdfa28c89123cbb8f9df)@rcqls

rebolek

[17:12](#msg5c62fe65604f233ab6fa42c9)@rcqls Thanks, I'll try it. I was trying linear gradient and nothing was shown. Same code worked on Windows. But maybe I was doing something wrong.

rcqls

[17:12](#msg5c62fe75ecef85660b93ac83)Sorry! I don’t understand what you are doing … Actually I have not too much time this week and I am trying to develop rich-text.

c61292558

[17:13](#msg5c62fe9f4bafd97ca3ddc91a)I use the red-gtk and found a warning

rcqls

[17:13](#msg5c62fea2adf6cb0b2ca898e5)@rebolek tests/draw.red linear gradient is working!

c61292558

[17:13](#msg5c62feb08328315dece1cccf)

```
Try running the command
  gdk-pixbuf-query-loaders > /usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache
to make things work again for the time being.
```

[17:14](#msg5c62fede126af75deb94b44a)but i don't know what will happen when I developing on linux

[17:14](#msg5c62fee9ef98455ea4239c68)@rcqls

rcqls

[17:15](#msg5c62ff14adf6cb0b2ca89d4d)@c61292558 I understand and I don’t know since I never seen this message and what you show is not a warning…. it is a message and I can’t see all the command executed...

c61292558

[17:17](#msg5c62ff8cdc3f0523cca323d6)when I had installed all the things about the red-gtk,and then run the" console " ,

[17:17](#msg5c62ff9fd1e3093ab50b929a)It showed a warnning

rebolek

[17:17](#msg5c62ffbf5095f6660ce0f98d)@rcqls thanks for info, it may be some problem on my side. I let you know when I get to testing it.

[17:18](#msg5c62ffcf80df6804a1922917)And good luck with rich-text!

rcqls

[17:18](#msg5c62ffdd604f233ab6fa4de4)thanks @rebolek !

c61292558

[17:19](#msg5c63000cdc3f0523cca326ed)

```
zpt@zpt-PC:~/Desktop/red-GTK$ ./console

(console:4617): GdkPixbuf-WARNING **: 01:18:46.831: Cannot open pixbuf loader module file '/usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache': 没有那个文件或目录

This likely means that your installation is broken.
Try running the command
  gdk-pixbuf-query-loaders > /usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache
to make things work again for the time being.
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>>
```

[17:19](#msg5c630013253c2b5ea3fe89d7)@rcqls

[17:19](#msg5c63001c8328315dece1d823)↑

rcqls

[17:20](#msg5c63005fadf6cb0b2ca8a695)@c61292558 install `gdk-pixbuf-query-loaders` ...

c61292558

[17:21](#msg5c630091adf6cb0b2ca8a889)sudo apt-get install gdk-pixbuf-query-loaders?

rcqls

[17:23](#msg5c63010480df6804a1923482)Please, you’re on linux and you should find which package you need on your debian distro…. I am not supposed to know this … when i need it I google it as any linux user.

[17:24](#msg5c63014380df6804a192363a)could you echo `ls /usr/lib/i386-linux-gnu/`

c61292558

[17:24](#msg5c63015e8328315dece1df4d)yes

[17:25](#msg5c63018b80df6804a19238ab)

```
alsa-lib                            libogg.so.0.8.2
audit                               libopenal.so.1
avahi                               libopenal.so.1.18.2
deepin-wine                         libOpenCL.so.1
dri                                 libOpenCL.so.1.0.0
gconv                               libopenjp2.so.2.3.0
gdk-pixbuf-2.0                      libopenjp2.so.7
gio                                 libopus.so.0
glib-2.0                            libopus.so.0.6.1
gtk-3.0                             libOSMesa.so.6
i686                                libOSMesa.so.8
krb5                                libOSMesa.so.8.0.0
libasound.so.2                      libp11-kit.so.0
libasound.so.2.0.0                  libp11-kit.so.0.3.0
libasyncns.so.0                     libpanel.so.5
libasyncns.so.0.3.1                 libpanel.so.5.9
libatk-1.0.so.0                     libpanel.so.6
libatk-1.0.so.0.22810.1             libpanel.so.6.1
libatk-bridge-2.0.so.0              libpango-1.0.so.0
libatk-bridge-2.0.so.0.0.0          libpango-1.0.so.0.4200.1
libatomic.so.1                      libpangocairo-1.0.so.0
libatomic.so.1.2.0                  libpangocairo-1.0.so.0.4200.1
libatspi.so.0                       libpangoft2-1.0.so.0
libatspi.so.0.0.1                   libpangoft2-1.0.so.0.4200.1
libavahi-client.so.3                libpcap.so.0.8
libavahi-client.so.3.2.9            libpcap.so.1.8.1
libavahi-common.so.3                libpciaccess.so.0
libavahi-common.so.3.5.3            libpciaccess.so.0.11.1
libavcodec.so.57                    libpcreposix.so.3
libavcodec.so.57.107.100            libpcreposix.so.3.13.3
libavresample.so.3                  libpixman-1.so.0
libavresample.so.3.7.0              libpixman-1.so.0.34.0
libavutil.so.55                     libpng16.so.16
libavutil.so.55.78.100              libpng16.so.16.34.0
libcairo-gobject.so.2               libproxy.so.1
libcairo-gobject.so.2.11510.0       libproxy.so.1.0.0
libcairo.so.2                       libpsl.so.5
libcairo.so.2.11510.0               libpsl.so.5.3.0
libcolordprivate.so.2               libpulse-simple.so.0
libcolordprivate.so.2.0.5           libpulse-simple.so.0.1.0
libcolord.so.2                      libpulse.so.0
libcolord.so.2.0.5                  libpulse.so.0.20.1
libcroco-0.6.so.3                   librest-0.7.so.0
libcroco-0.6.so.3.0.1               librest-0.7.so.0.0.0
libcrypto.so.1.0.2                  librsvg-2.so.2
libcrystalhd.so.3                   librsvg-2.so.2.40.20
libcrystalhd.so.3.6                 librtmp.so.1
libcups.so.2                        libsamplerate.so.0
libcurl.so.3                        libsamplerate.so.0.1.8
libcurl.so.4                        libsasl2.so.2
libcurl.so.4.5.0                    libsasl2.so.2.0.25
libdatrie.so.1                      libsensors.so.4
libdatrie.so.1.3.4                  libsensors.so.4.4.0
libdb-5.3.so                        libshine.so.3
libdrm_amdgpu.so.1                  libshine.so.3.0.1
libdrm_amdgpu.so.1.0.0              libSM.so.6
libdrm_intel.so.1                   libSM.so.6.0.1
libdrm_intel.so.1.0.0               libsnappy.so.1
libdrm_nouveau.so.2                 libsnappy.so.1.1.7
libdrm_nouveau.so.2.0.0             libsndfile.so.1
libdrm_radeon.so.1                  libsndfile.so.1.0.28
libdrm_radeon.so.1.0.1              libsndio.so.6.1
libdrm.so.2                         libsoup-2.4.so.1
libdrm.so.2.4.0                     libsoup-2.4.so.1.8.0
libedit.so.2                        libsoup-gnome-2.4.so.1
libedit.so.2.0.56                   libsoup-gnome-2.4.so.1.8.0
libelf-0.170.so                     libsoxr.so.0
libelf.so.1                         libsoxr.so.0.1.1
libepoxy.so.0                       libspeex.so.1
libepoxy.so.0.0.0                   libspeex.so.1.5.0
libexpatw.so.1                      libsqlite3.so.0
libexpatw.so.1.6.7                  libsqlite3.so.0.8.6
libexslt.so.0                       libssh2.so.1
libexslt.so.0.8.20                  libssh2.so.1.0.1
libffi.so.6                         libssl.so.1.0.2
libffi.so.6.0.4                     libstdc++
```

[17:27](#msg5c6301f6adf6cb0b2ca8b484)@rcqls

rcqls

[17:28](#msg5c63025116e46822599ce453)Sorry I can’t help… At least not now…. You should find the solution before: `view [button {hello}]` is it working?

c61292558

[17:29](#msg5c63026880df6804a1923e76)yes,it's working

[17:29](#msg5c63026b4bafd97ca3dde850)but...

[17:29](#msg5c630281ecef85660b93cc2b)the same code why it dosen't calucate like that in win10?

[17:29](#msg5c63028e4bafd97ca3dde95d)different result

[17:31](#msg5c6302d8d1e3093ab50bb090)I'm sorry to interrupt you....

rcqls

[17:32](#msg5c630327d1e3093ab50bb1ef)It works for me!

c61292558

[17:32](#msg5c630332126af75deb94da0e)I must go to sleep now,see you ,good night !thank you very much,rcqls

rcqls

[17:32](#msg5c630349253c2b5ea3fea098)Have a good sleep!

c61292558

[17:33](#msg5c630355dc3f0523cca33ed2)thank you again

[17:33](#msg5c63036adc3f0523cca33fb8)expect your rich text

rcqls

[17:34](#msg5c6303988328315dece1f1f8)Your code cal.red works for me…. don’t understand what is your issue???

c61292558

[17:34](#msg5c6303a880df6804a19246a4)i can click the button

[17:34](#msg5c6303b7adf6cb0b2ca8c3a9)and i can't calucate

[17:35](#msg5c6303ee4bafd97ca3ddf229)Have no reaction when i click the button

rcqls

[17:35](#msg5c6303f84003460b2d3c260b)You don’t install my version… `rcqls/red:GTK-dev` branch. That why maybe it does not work for you!

[17:36](#msg5c6304315095f6660ce11f16)I developped this lately and the PR on the official red/GTK is not yet sent!

[17:37](#msg5c630455126af75deb94e4fa)Do the same install but with my repo and it should work as it is in my computer!

c61292558

[17:37](#msg5c63046b28c89123cbb92ee6)oh...i use the master branch ...

[17:38](#msg5c6304a45095f6660ce1221f)I download it tomorrow

rcqls

[17:38](#msg5c6304a5604f233ab6fa758f)`git clone -b GTK-dev https://github.com/rcqls/red`

c61292558

[17:39](#msg5c6304cf253c2b5ea3fead75)but my version is the 0.6.4

[17:39](#msg5c6304da4003460b2d3c2e35)isn't it ?

rcqls

[17:40](#msg5c63051fdc3f0523cca34d2e)Nothing related to version, all my versions are 0.6.4 but all are different since I am developping new stuff still in rcqls/red:GTK-dev

c61292558

[17:41](#msg5c63055516e46822599cee90)so I should use the gtk-dev branch,right?

rcqls

[17:42](#msg5c63057bef98455ea423cec7)As I told you and from my repo: `git clone -b GTK-dev https://github.com/rcqls/red`

c61292558

[17:44](#msg5c6305ed7502282258e0f136)\[!\[image.png](https://files.gitter.im/red/GTK/zwea/thumb/image.png)](https://files.gitter.im/red/GTK/zwea/image.png)

[17:44](#msg5c6305f980df6804a1925816)only download this one ,ok or not?

rcqls

[17:45](#msg5c630629adf6cb0b2ca8d848)do you use git?

c61292558

[17:45](#msg5c630646ef98455ea423d57a)Rarely use

rcqls

[17:45](#msg5c630653253c2b5ea3feb839)run `git clone -b GTK-dev https://github.com/rcqls/red` in some folder and that’s all!

[17:46](#msg5c63066480df6804a1925b5e)install git, it is so simple!

c61292558

[17:47](#msg5c630698253c2b5ea3feb9d8)ok,had download it

[17:56](#msg5c6308b7adf6cb0b2ca8e8be)\[!\[image.png](https://files.gitter.im/red/GTK/V2tn/thumb/image.png)](https://files.gitter.im/red/GTK/V2tn/image.png)

[17:56](#msg5c6308db8328315dece2154c)Did not improve.....

rcqls

[17:57](#msg5c63090b80df6804a1926e28)did you try to execute your code cal.red?

c61292558

[17:57](#msg5c63091a8328315dece216a8)yes

[17:57](#msg5c63091d16e46822599cfea9)run it

[17:58](#msg5c63092f5095f6660ce146e1)still can't click and calucate

[17:58](#msg5c6309475095f6660ce1476d)\[!\[image.png](https://files.gitter.im/red/GTK/dGDb/thumb/image.png)](https://files.gitter.im/red/GTK/dGDb/image.png)

rcqls

[17:59](#msg5c63098780df6804a1927222)so if it does not work, maybe you should install gdk-pixbuf-query-loaders… but not sure!

c61292558

[18:00](#msg5c6309be4bafd97ca3de1f61) i had download the file

rcqls

[18:01](#msg5c6309de253c2b5ea3fed561)I will try in a few day to make the install in docker of debian image…

c61292558

[18:01](#msg5c6309fb4bafd97ca3de211c)i am the deepin os based on debian 9.0

[18:01](#msg5c630a008328315dece21d39)a distr

rcqls

[18:03](#msg5c630a7bd1e3093ab50bf0ed)\[!\[Capture d’écran 2019-02-12 à 19.02.45.png](https://files.gitter.im/red/GTK/tfvX/thumb/Capture-d\_ecran-2019-02-12-a-19.02.45.png)](https://files.gitter.im/red/GTK/tfvX/Capture-d\_ecran-2019-02-12-a-19.02.45.png)

c61292558

[18:04](#msg5c630a985095f6660ce15181)i am on linux...not mac os..

rcqls

[18:04](#msg5c630aa7ef98455ea423f316)Of course! This is linux output!

[18:05](#msg5c630ad416e46822599d02a6)I need to go… bye!

c61292558

[18:05](#msg5c630aefecef85660b9409ed)i have t o sleep...

[18:05](#msg5c630af65095f6660ce152ef)see u next time

## Wednesday 13th February, 2019

rebolek

[07:28](#msg5c63c715adf6cb0b2cadeaf4):point\_up: \[February 12, 2019 6:13 PM](https://gitter.im/red/GTK?at=5c62fea2adf6cb0b2ca898e5) you're right, linear and radial gradient work, however if you look at `pen gradient`, where gradient is done with simple `pen linear red green blue` - it doesn't work and that'đ actually what I've been trying - just simple gradient with `fill-pen linear 10.20.30 100.150.200`. So it works only with all values and looking at the \[docs](https://doc.red-lang.org/en/draw.html#\_linear\_gradient\_pen) the values are in different order than in the docs and I'm not sure how to make gradient that from top to bottom, only left to right as in the example.

rcqls

[07:42](#msg5c63ca4e8328315dece73bde)@rebolek I have noticed some issue on color. I managed to fix some but not everyone. For the gradient syntax I had the pb too and I changed the syntax after playing with the wonderful gradient-lab.red. This issue would be easy to fix. I'll do that soon since I think I am not too far from ending rich text since after many tries I think pango markup is the best solution to deal with fonts and styles as red want to do it... Thanks for ur feedback...

rebolek

[07:43](#msg5c63ca90604f233ab6ffbaef)&gt; I am not too far from ending rich text ...

great news!

c61292558

[18:05](#msg5c645c704003460b2d45b9f7)/usr/lib/x86\_64-linux-gnu/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders  
running the file can solve the warnning:

[18:05](#msg5c645c75dc3f0523ccacf1df)

```
(console:4617): GdkPixbuf-WARNING **: 01:18:46.831: Cannot open pixbuf loader module file '/usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache': 没有那个文件或目录

This likely means that your installation is broken.
Try running the command
  gdk-pixbuf-query-loaders > /usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache
to make things work again for the time being.
```

[18:06](#msg5c645c934003460b2d45bb66)gdk-pixbuf-query-loaders.

Respectech

[19:27](#msg5c646fbaadf6cb0b2cb2da23)Do you think it will be possible to run Red/View on Linux-ARM soon?

rebolek

[19:29](#msg5c647025604f233ab6049d4a)@Respectech I guess it should be possible (with same limitations as on x86) right now, but I haven't tried it yet, my Pi is not connected to monitor.

Respectech

[19:37](#msg5c6471eb4003460b2d4651d8)No problem. If your Pi is connected to the network, you can run graphical applications on it from your PC. See my blog article for details: https://ameridroid.com/blogs/ameriblogs/how-to-run-graphical-linux-programs-from-your-sbc-on-your-windows-computer-or-android-phone-tablet

[19:37](#msg5c64720028c89123cbc334c3)It's really easy.

rebolek

[19:40](#msg5c64729c8328315decec25c1)I can VNC to it, but I don't have Xwindows installed. But I've got second Pi that's currently unused, so I can try it with this one. If you're not in a hurry, I try it and let you know.

Respectech

[19:42](#msg5c647320d1e3093ab5160c44)That would be great! I'll be out of the office for a couple of days, but I'd love to write an article about it for our readers next week, if it works!

rebolek

[19:43](#msg5c6473784003460b2d465e10)I'm curios too. It would be nice if could have Red/View on something like Pinebook.

Respectech

[19:48](#msg5c64749eadf6cb0b2cb30464)Ah yes! I have a Pinebook as well. Did you see Pine64 is coming out with a PineTab, a new PineBook, a PinePhone and other cool stuff soon? https://ameridroid.com/blogs/ameriblogs/good-read-new-pine64-products-coming-soon

rebolek

[20:04](#msg5c6478584bafd97ca3e85af6)Yes, I've read about it. Pinephone seems very interesting. Well, other devices too :)

## Thursday 14th February, 2019

c61292558

[12:10](#msg5c655ab15095f6660cf18799)the color still black

[12:10](#msg5c655aba126af75deba51bfc)\[!\[image.png](https://files.gitter.im/red/GTK/NWIR/thumb/image.png)](https://files.gitter.im/red/GTK/NWIR/image.png)

[12:10](#msg5c655acc28c89123cbc96c7e)\[!\[image.png](https://files.gitter.im/red/GTK/tnJg/thumb/image.png)](https://files.gitter.im/red/GTK/tnJg/image.png)

[12:13](#msg5c655b5a4bafd97ca3ee6a44)@rcqls

## Friday 15th February, 2019

guaracy

[12:10](#msg5c66ac1d4bafd97ca3f79877)@rebolek Red on RPi?  
!\[red-RPi](https://i.ibb.co/fY2hzYc/Captura-de-Tela-deepin-terminal-20190215024556.png)

## Saturday 16th February, 2019

Respectech

[00:04](#msg5c6753a24bafd97ca3fc54bd)@guaracy That looks exciting! Is there an executable package for Red-GTK-ARM that I can download to test?

9214

[00:08](#msg5c67548badf6cb0b2cc72dc6)@Respectech follow the \[development notes](https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development).

Respectech

[00:09](#msg5c6754d280df6804a1b0befb)@9214 OK. Thanks!

rebolek

[06:42](#msg5c67b0c5ef98455ea444626d)@Respectech I have automted GTK builds for ARM, but it's not tested https://www.rebolek.com/builds/

rcqls

[08:50](#msg5c67cef116e4682259b07080)@guaracy Nice to see View on rpi!

## Monday 18th February, 2019

Respectech

[19:51](#msg5c6b0cc816e4682259c4cf82)Great work, @rebolek

It also works on ODROID !\[ODROID](https://i.imgur.com/CeG1IdM.png)

[19:52](#msg5c6b0d0a80df6804a1c7e291)This is very exciting as now I can (almost) move all my development to Red (waiting for full I/O).

[19:55](#msg5c6b0dca28c89123cbee82df)Incidentally, the two examples that gave bad results didn't do so on Red/GTK on Ubuntu/ARM 18.04:

```
>> load "0.00000152"
== 1.52e-6
>> 5 / 2.0
== 2.5
```

rebolek

[19:57](#msg5c6b0e154bafd97ca313976b)@Respectech I'm glad someone has use for it! I see that he service is running for 229 days, time flies fast. I probably should check how much space do all the builds take :smile:

[19:58](#msg5c6b0e4f750228225808f393)My theory is that the bad results depend on locale settings.

Respectech

[22:22](#msg5c6b30261f14630421e1d5d4)Bug report for the GTK version on RPi:

```
>> draw 10x10 [fill-pen black]

*** Runtime Error 1: access violation
*** at: B64EDD1Ch
```

```
>> draw 10x10 [fill-pen 0.0.0]

*** Runtime Error 1: access violation
*** at: B645FD1Ch
```

[22:23](#msg5c6b307dc82c68509efb616d)But an empty block on 'draw works:

```
>> draw 10x10 []
== make image! [10x10 #{
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF...
```

## Tuesday 19th February, 2019

rcqls

[04:49](#msg5c6b8ac9c82c68509efd89f2)@Respectech not related to RPi… fill-pen not yet considered… but soon… working now on richtext which is not as easy I primarily thought. BTW not all my development on `rcqls/red:GTK-dev` on `red/red:GTK`. Thanks for reporting.

rebolek

[07:08](#msg5c6bab549155d45d903b4d91)@rcqls there's a problem with translate, its value is accumulating. See this snippet:

```
view [base 200x200 draw [translate 10x0 [line 0x0 10x10] translate 20x0 [line 0x0 10x10] translate 30x0 [line 0x0 10x10] translate 40x0 [line 0x0 10x10]]]
```

It should draw four lines right next to each other but the space between them is increasing.

rcqls

[07:10](#msg5c6babf0b6c74f1e2e767fa0)@rebolek Thanks!

## Wednesday 20th February, 2019

rcqls

[09:43](#msg5c6d214cc82c68509e07cac3)@rebolek translate issue fixed but still in my repo `rcqls/red:GTK-dev`. New segment7 stuffs are then working.

rebolek

[09:44](#msg5c6d218600aa630d9ae060dc)@rcqls Thanks! I'm now working on `stylize`, so will check it once I've got it ready.

[09:47](#msg5c6d224500aa630d9ae064df)(well not right now obviously, now I'm trying to find out why my custom `mv` works differently than `mv` in BusyBox... :smile: )

rcqls

[09:49](#msg5c6d229300aa630d9ae0674d)Ok! I see that segment7! is already replaced with segment! And good luck for the `mv`!

rebolek

[09:51](#msg5c6d230c9e430b3086984b62)Yes, @toomasv added more segments to display letters also, so it's no longer seven segments display. Thanks, it's very confusing problem, but what can I do, it's my job to fix it.

rcqls

[09:53](#msg5c6d238a35c7a50422808d4b)\[!\[Capture d’écran 2019-02-20 à 10.52.46.png](https://files.gitter.im/red/GTK/Nf3d/thumb/Capture-d\_ecran-2019-02-20-a-10.52.46.png)](https://files.gitter.im/red/GTK/Nf3d/Capture-d\_ecran-2019-02-20-a-10.52.46.png)

rebolek

[09:54](#msg5c6d23c2ab952d30855faeb1)hehe :)

Respectech

[20:05](#msg5c6db2ef7667931e2fd33724)Any updates on rich-text or 'fill-pen functionality on GTK?

greggirwin

[21:45](#msg5c6dca76ddaa310c89c36787)Nice work guys. @rebolek, we're still going to make ReddyBox, right, to replace BusyBox?

rebolek

[21:47](#msg5c6dcaddb6c74f1e2e848c1b)@greggirwin this is C code I was talking about, but I would love to port it Red/System, once we can have pointers to functions...

greggirwin

[22:01](#msg5c6dce3cab952d3085645246)Doesn't need to be Red/System, though some things from BB may need to be. I haven't looked at it in a long time. The goal, though, is a portable environment that works on all platforms.

## Thursday 21st February, 2019

pekr

[06:25](#msg5c6e44637667931e2fd6b2fe)@rebolek I have thought, that R/S has basically everything we would wish for integration. If it is not the case, can we have some REP on that?

rebolek

[06:28](#msg5c6e45191f14630421f5b6a1)Function pointers were intentionally left out, but I hope this can change in the future. IIRC, there's some really hacky way to get them, but I haven't tried in a while, so I'm not sure. Anyway, this discission is more for Red/System channel.

rcqls

[06:55](#msg5c6e4b74b6c74f1e2e879f0a)@rebolek There is a section `Function pointer` in the red/system documentation and actually I am using this kind of function pointer to sort glist. But maybe it is not what you want….

rebolek

[07:10](#msg5c6e4ee1c4da4a11f58df235)@rcqls \*A function pointer can be assigned to a variable for later use or dereferencing. \*\*Such a variable cannot be passed as an argument to other functions, nor returned by a function.\*\** - this is the problem I've got.

rcqls

[07:14](#msg5c6e4fe97667931e2fd6fa15)@rebolek So you want a red/system function having as argument a pointer function (or maybe the returning result of a red/system function). My use case is indeed passing red/system function as an argument of C function.

rebolek

[07:15](#msg5c6e5018a378ef11f614f5a2)@rcqls yes, I want to use one R/S function as an argument to other R/S function.

qtxie

[07:19](#msg5c6e511fc82c68509e0f6c19)@rebolek You have to convert it to a int-ptr!.

```
Red/System []

add-func!: alias function! [
	a	[integer!]
	b	[integer!]
]

my-add: func [a [integer!] b [integer!]][probe a + b]

return-func: func [return: [int-ptr!]][as int-ptr! :my-add]

call-func: func [
	f [int-ptr!]
	/local
		add-f [add-func!]
][
	add-f: as add-func! f
	add-f 3 4
]

call-func return-func
```

rebolek

[07:22](#msg5c6e51a05df86a45686c8eaa)@qtxie thanks, I remember there was some kludge like this.

rcqls

[07:24](#msg5c6e524400aa630d9ae82fc1)@9214 Nice! And it makes sense...

qtxie

[07:26](#msg5c6e5293c776985d8f2a35bf)It's not convinient to use. I seldom need it so it's not a big trouble for now.

greggirwin

[08:03](#msg5c6e5b59ddaa310c89c6e40b)It would be good to put that somewhere, maybe in the Guru Meditations wiki, so it doesn't get lost in chat.

rcqls

[08:12](#msg5c6e5d5dc776985d8f2a7848)@loziniak as a comment, I checked version of GTK and `GTK VERSION: 3.24.2` is for archlinux when `GTK VERSION: 3.22.30` (or around) is used for other Linux distributions. Maybe, this is an explanation of the specific issue for the Archlinux distribution. I hope it is not the reason otherwise, we will have to fix that when GTK would migrate to GTK 4. I need to find a docker installation with GTK 4 and test all the current development.

[08:13](#msg5c6e5db59e430b3086a01f06)If somebody has already tested `red/GTK` with GTK version at least 3.24 it would be good to know.

nodrygo

[08:47](#msg5c6e65a0a7d733509d9fb656) work for me on Linux Mint19 - libgtk-3-0:i386 3.22.30  
another question do you have a RED compiler for GTK  
I have no license for REBOL PRO to build one and seem it is impossible to buy one nowadays

rebolek

[08:51](#msg5c6e66adb6c74f1e2e88455a)You don't need Rebol Pro, you can build Red console in free version of Rebol.

rcqls

[08:52](#msg5c6e66bb00aa630d9ae8aeff)@nodrygo Why do you need it? From source you could compile console-view.

nodrygo

[08:54](#msg5c6e673fa378ef11f6158d39)@rcqls yes I can create console, but, may be I mistake, from console I can't create autonomous code

rebolek

[08:55](#msg5c6e6765ab952d308567fb7c)@nodrygo you have to compile in Rebol, not in Red.

nodrygo

[08:56](#msg5c6e67b7a7d733509d9fc712)I have try that  
`do/args %red.r "%../code/Scripts/clock.red"`  
but end with  
"""  
\*\** Compilation Error: unknown path root variable: red/object/path-parent  
\*\** in file: %/home/ygo/devygo/RED/code/Scripts/clock.red  
\*\** at line: 332  
\*\** near: [  
set-path* eval-path \_context/get ~system as cell! ~script as  
]  
"""

rcqls

[08:56](#msg5c6e67bbddaa310c89c73aa6)@nodrygo see my bash script `reds` inside `https://github.com/rcqls/docker-red-gtk` as an example.

nodrygo

[08:57](#msg5c6e67e01f14630421f699a9)thank' I'll look

rcqls

[08:57](#msg5c6e67faa378ef11f6159397)I use it to (cross-)compile any red script. It is not only related to docker. I use it as a replacement of `red` binary but I need to have a source repo (for me `~/Github/red` but you can specify another root)

[10:07](#msg5c6e7867c776985d8f2b2980)Goods news, everything is apparently fine with `ubuntu:disco` and `GTK VERSION: 3.24.5` (latest). All the few examples I launch, were working...

[10:09](#msg5c6e78d39155d45d904d89bb)@loziniak So the archlinux issue is not related to GTK version.

rebolek

[10:09](#msg5c6e78ec9e430b3086a0d4c1)So it's both good and bad news :)

rcqls

[10:11](#msg5c6e7937ab952d3085686d05)For me it is a better news since I suspect that for Archlinux, it is maybe an installation issue or loading dynamic libraries issue….

rebolek

[10:12](#msg5c6e7975c776985d8f2b3058)I see.

[16:17](#msg5c6ecf0fb6c74f1e2e8b2606)@rcqls what is the minimal version of GTK required?

rcqls

[16:18](#msg5c6ecf599155d45d904fe2ae)@rebolek I don’t know exactly. I would say around 3.22.

rebolek

[16:19](#msg5c6ecf7d7667931e2fda5ce8)So no luck with 3.4 :D

rcqls

[16:19](#msg5c6ecfa0ab952d30856acd55)Difficult to say? Why do you have a so old gtk version?

[16:20](#msg5c6ecfb9a378ef11f6187b77)You just have to check… maybe it is ok BTW

rebolek

[16:21](#msg5c6ed0179e430b3086a32154)I am on one old machine right now that has 3.4 and wanted to try some things.

[16:22](#msg5c6ed03ca7d733509da294c5)But I'm going to reinstall the machine anyway, so it's more of rethorical question.

rcqls

[16:23](#msg5c6ed077ab952d30856ad308)In the documentation of gtk, each function is described with the version it appears. So it is possible to know but it is a long run.

[16:23](#msg5c6ed0945df86a4568700d45)Just try!

rebolek

[16:24](#msg5c6ed0b59155d45d904fec22)do you have a link?

rcqls

[16:26](#msg5c6ed11ca7d733509da29b94)You mean for all the functions. They are in different html files but you can google it and you will go to the documentation (it is the way I do now). But you have also to check pango and gdk.

[16:27](#msg5c6ed171a7d733509da29cb5)\[gtk doc](https://developer.gnome.org/gtk3/stable/)

rebolek

[16:29](#msg5c6ed205c82c68509e12eff0)Thanks! I take a look. It's not very important, I'm just curious.

[16:33](#msg5c6ed2f6ddaa310c89ca179d)My error is `undefined symbol: gtk_list_box_new` and ListBox was implemented in 3.10.

rcqls

[16:34](#msg5c6ed332c82c68509e12fa5d)Difficult to avoid gtk\_list\_box\_new in the red/gtk development…

rebolek

[16:36](#msg5c6ed37e00aa630d9aeba622)No problem, as I said, I'm going to reinstall the device and was just curious. I'm on train and have nthing better to do :)

rcqls

[16:38](#msg5c6ed3eb9e430b3086a33caa)\[gtk 3.4 doc](https://developer.gnome.org/gtk3/3.4/)

[16:40](#msg5c6ed4639e430b3086a33fbb)old name was gtk\_list\_store?

[16:41](#msg5c6ed49eb6c74f1e2e8b4a7c)In theory, it is possible to maintain all version since you can acces version from gtk (what I did this morning)...

rebolek

[16:41](#msg5c6ed4a85df86a4568702ff5)don't waste your time on it, really. People using 5 years old system should upgrade :smile:

rcqls

[16:41](#msg5c6ed4be00aa630d9aebb213)Just curious too!

rebolek

[16:42](#msg5c6ed4ebc4da4a11f59188c5)Ah, I understand that :)

rcqls

[16:42](#msg5c6ed4f485b7eb45690b2d74)But I am fighting the issue about the color of image in a base widget. Sometimes, it is weird!

[18:56](#msg5c6ef46c85b7eb45690c0914)After a long run, the weird color issue is fixed and `Mandelbrot.red` and `raytracer.red` have the proper colors. It was far from obvious (at least for me).

toomasv

[19:34](#msg5c6efd3085b7eb45690c435e)@rcqls Bravo!

rcqls

[19:34](#msg5c6efd4fa378ef11f619bc23)@toomasv Thanks!

greggirwin

[19:59](#msg5c6f033c00aa630d9aed0757)Woohoo!

rcqls

[21:57](#msg5c6f1eb085b7eb45690d2c6f)Before to go to bed, I just realized after further reading that pango is amazing since it deals with new lines and wrap mode like a boss. So pango markup language is a really good solution generating pango attributes automatically. Richtext multibox mode works also. I just need a bit of more work to provide a first version of rich-text.

[21:57](#msg5c6f1ec8c4da4a11f5939669)\[!\[Capture d’écran 2019-02-21 à 22.47.51.png](https://files.gitter.im/red/GTK/VC2x/thumb/Capture-d\_ecran-2019-02-21-a-22.47.51.png)](https://files.gitter.im/red/GTK/VC2x/Capture-d\_ecran-2019-02-21-a-22.47.51.png)

[21:57](#msg5c6f1ed09e430b3086a56557)\[!\[Capture d’écran 2019-02-21 à 22.52.06.png](https://files.gitter.im/red/GTK/JCQ7/thumb/Capture-d\_ecran-2019-02-21-a-22.52.06.png)](https://files.gitter.im/red/GTK/JCQ7/Capture-d\_ecran-2019-02-21-a-22.52.06.png)

## Friday 22nd February, 2019

rebolek

[06:39](#msg5c6f99215df86a4568758323)@rcqls amazing, as usual! :clap:

rcqls

[06:41](#msg5c6f998ea7d733509da7f530)@rebolek Thanks! There is still some few bugs (« here » does not show in the first box) but nothing major since it is my wrong coding that I need to fix.

toomasv

[06:46](#msg5c6f9ab0c82c68509e186063) @rcqls Great!

rcqls

[06:48](#msg5c6f9b34e5eeec0d9ba7c62f)@toomasv `rich-text.beginner3` is then working. Actually the size of font in linux are different from windows and macOS. Something to look at later.

toomasv

[07:19](#msg5c6fa288ddaa310c89cfc532)@rcqls Does `size-text` return a correct size?

rcqls

[07:22](#msg5c6fa32aab952d3085706ca7)@toomasv Normally the font is the right one since it is provided by its name.But maybe, it is because of spacing that I do not consider yet. `size-text` is not yet implemented for richtext from now. I’ll do it soon.

toomasv

[07:24](#msg5c6fa3aa85b7eb456910ba54)Ok. :+1:

## Saturday 23th February, 2019

toomasv

[10:49](#msg5c712538a378ef11f627ff06)@rcqls Here's another \[challenge](https://github.com/toomasv/makedoc/blob/master/easy-VID-rt.red) for GTK :smile: :  
\[!\[easy-VID](https://toomasv.red/images/Easy-VID/easy-VID-rt.gif)](https://toomasv.red/images/Easy-VID/easy-VID-rt.gif)

rcqls

[11:20](#msg5c712c6dc4da4a11f5a0cced)@toomasv Hahaha! Thanks! Excellent challenge since I am trying to implement text-box-metrics which seems to be required for this new challenge!

[11:38](#msg5c7130ad5df86a45687f71e9)BTW, you are a red artist!

toomasv

[13:00](#msg5c7143da7667931e2fea6732):smile:

rcqls

[21:53](#msg5c71c0eb85b7eb45691e327a)@toomasv Not perfect but not so far!!!

[21:54](#msg5c71c0faa7d733509db598a5)\[!\[Capture d’écran 2019-02-23 à 22.52.14.png](https://files.gitter.im/red/GTK/bxCq/thumb/Capture-d\_ecran-2019-02-23-a-22.52.14.png)](https://files.gitter.im/red/GTK/bxCq/Capture-d\_ecran-2019-02-23-a-22.52.14.png)

## Sunday 24th February, 2019

toomasv

[05:33](#msg5c722cc100aa630d9a014f64):clap: It’s coming!

guaracy

[13:00](#msg5c7295811f1463042111901d)thank you @toomasv . i'll replace my ugly viewer (based on gtk-demo) by your cool easy-vid-rt. I'll change the parser to accept emacs's org-mode pages.  
!\[ugly](https://i.imgur.com/0F7CEdP.png)

[13:06](#msg5c7296e1c776985d8f4546cd)@rcqls , even if i don't write thank you, consider that i thank you every day for your great work to bring GTK to Red

rcqls

[13:10](#msg5c7297b21f14630421119cd5)@guaracy Thanks! Good to know that some people from linux community are playing with this tool! BTW, if you have some examples to share with us, it always motivating to see how this tool is used and above all help me to find out what are the next developments to accomplish. Have fun!

nodrygo

[13:48](#msg5c72a0997667931e2ff28a3b)@rcqls I confirm you make a great work thank you for your Gtk contrib

rcqls

[14:18](#msg5c72a7b0c4da4a11f5a9ce24)Thanks @nodrygo ! Nice to see that you are also a Julia user. Julia language is IMHO the future of numerical language. Even if i am supposed to be an expert in R, I am in love with Julia. However, I want Red to be THE master language (and for me a replacement of ruby).

[14:23](#msg5c72a8f1ab952d3085831db0)Watching your DemosRed repo… Interesting for debugging red/gtk branch.

toomasv

[15:06](#msg5c72b2fac776985d8f45fb0f)@guaracy You are welcome! :smile:

nodrygo

[16:37](#msg5c72c8435df86a456888f9b5)@rcqls in fact I am a (old retired) serial language lover (try a lot) ;-) my preferred in order: Racket, Common Lisp, Julia but Julia is probably excellent for scientist (that I am not) to heavy, LLVM very big, difficult to create autonomous program  
I have leaved RED 2 years ago because Linux second zone citizen and no Gtk ;-) so your investment is great  
May be I'd better to speak French my English is limited LoL :-)

rcqls

[16:39](#msg5c72c8d75df86a456888fdbb)If you are French, it is indeed easier to jump to the red-france room.

dander

[22:54](#msg5c732096ddaa310c89e59623)@rcqls I just wanted to say how I'm impressed with all you've been doing here. I got around to taking a look at your docker-red-gtk repo, and wanted to share this, running on Windows using vcxsrv for XServer. I'm sure it should work as well from WSL  
\[!\[image.png](https://files.gitter.im/red/GTK/T55q/thumb/image.png)](https://files.gitter.im/red/GTK/T55q/image.png)

rcqls

[23:04](#msg5c732313c82c68509e2e42c8)@dander Thanks for your nice comment. I am really happy if you managed to use my docker-red-gtk repo since I don’t have a windows computer. Do you need to adapt the procedure or you just installed the vcxsrv by specifying the DISPLAY variable. Thanks again for the feed-back!

## Monday 25th February, 2019

dander

[00:55](#msg5c733d08c4da4a11f5ad82be)

rcqls

[06:52](#msg5c7390a300aa630d9a09e310)@dander Thanks for your feedback… I think `docker-red` bash script can be adapted to have it useable in the 3 main OS….

[06:57](#msg5c7391c7a378ef11f636a068)Today is a great news (for me at least) since I managed to make working the `shrinkable.red` example provided by the artist @toomasv. I simply replaced `gtk_fixed` with `gtk_layout` which is much more flexible than the first one. As a direct consequence, `panel` is clickable (I never managed to have it with `gtk_fixed`). `gtk_layout` seems to be promissing too since it embeds automatic scroller….

[06:57](#msg5c7391e31f1463042117c4b0)\[!\[Capture d’écran 2019-02-25 à 07.50.32.png](https://files.gitter.im/red/GTK/IGCd/thumb/Capture-d\_ecran-2019-02-25-a-07.50.32.png)](https://files.gitter.im/red/GTK/IGCd/Capture-d\_ecran-2019-02-25-a-07.50.32.png)

rebolek

[06:58](#msg5c739204a7d733509dc08cef)@rcqls great news!

toomasv

[07:57](#msg5c739fdd7667931e2ff8d35e)@rcqls :clap: :art:

mydoghasworms

[10:25](#msg5c73c2afab952d30858a2a2b)I have just tried the GTK Red version on Linux with the latest build from Rebolek's website. I am very excited about this. I had actually given up on Red due to the lack of support for the GUI on Linux (like @nodrygo). Thanks to @rcqls and everyone involved for making Red GUI on Linux possible! Now the next question is when 64 bit support will be available. Do I understand the blog correctly that 64 bit support will only be available this year in the Pro version?

rebolek

[10:32](#msg5c73c43a00aa630d9a0b5370) @mydoghasworms It's hard to say when and how will be 64bit Red available.

rcqls

[10:37](#msg5c73c55a5df86a45688f4125)@mydoghasworms Since I am developping red-GTK a lot in this period, I do not push a lot on the official repo `red/red:GTK` but you could always use my development repo `rcqls/red:GTK-dev`. I will send a PR when I have done most of the important things. When this done, the branch would still be unstable and a period of stabilization (with in particular memory leaks fixes) would then come. I am working on menu BTW. There is still some issue on richtext, but overall is not so bad from now. Examples in the doc mostly work.  
Like you, I am expecting 64bits (and also bootstrap to increase development since the compiler would be very fast written in red/red-system). I spend a lot of time waiting for compilation.

[15:20](#msg5c7407bf9e430b3086c4745c)Menubar are coming in red-GTK (playing with @nodrygo example)…. Next is context menu and maybe menubar in some modal window. Eventhough, I don’t have examples of everything. If some brave people can give me simple examples I would appreciate….

[15:21](#msg5c7407f01f146304211b1baa)\[!\[Capture d’écran 2019-02-25 à 16.16.10.png](https://files.gitter.im/red/GTK/bfAh/thumb/Capture-d\_ecran-2019-02-25-a-16.16.10.png)](https://files.gitter.im/red/GTK/bfAh/Capture-d\_ecran-2019-02-25-a-16.16.10.png)

rebolek

[15:41](#msg5c740c989e430b3086c49896)That's really cool, @rcqls ! I would love to make some examples tomorrow, but maybe I'll be too late :smile:

rcqls

[15:43](#msg5c740d245df86a456891588c)@rebolek Never know indeed but however they would be helpful to test if everything is working properly.

rebolek

[15:47](#msg5c740df9b6c74f1e2eacb60a)It's in GTK-dev?

rcqls

[15:48](#msg5c740e555df86a456891621b)Not yet, since I am figthing with the connection ‘on-menu’. But when it is ready, I push it in GTK-dev as usual.

[16:16](#msg5c7414ee9155d45d906f394f)@rebolek Pushed in GTK-dev! It seems to work for a MainMenu attached to the window. BTW, the example of @nodrygo I used, needs to be slightly adapted since it lasts a bit… But it was a full example of MainMenu.

[16:30](#msg5c74182ea7d733509dc4567b)I could try the MainMenu of the diager of @toomasv. It mostly works … One day (hopefully soon), it would work on linux…

[16:34](#msg5c74191db6c74f1e2ead1136)As usual, @toomasv has an example (pretty sophisticated) of context menu : `richtext.medium2`… So it’s my use case hoping that it is not not too hard!

toomasv

[16:57](#msg5c741e83c82c68509e34d479)@rcqls Good news about menu! Have you tried \[editor](https://github.com/toomasv/editor)? It has simple main menu and also contextual menu. Little demo too:  
\[!\[editor](https://toomasv.red/images/Editors/editor1.gif)](https://toomasv.red/images/Editors/editor1.gif)  
(Haven't tried it for some time though)

rcqls

[16:59](#msg5c741edcab952d30858cf402)@toomasv Thanks! I did not know this one! Another challenge!

toomasv

[17:01](#msg5c741f621f146304211be38d)I hope it is easily surpassed!

rcqls

[17:03](#msg5c741ff5b6c74f1e2ead45dc)Currently, I have only the menu and I can read an example but since I don’t have yet the context menu I can’t go further… But I think I would be done soon since contetxual menu does not seem to be too hard with GTK… but we never know… Thanks again @toomasv

toomasv

[17:04](#msg5c742016b6c74f1e2ead47cf)You are most welcome!

nodrygo

[18:52](#msg5c74398155d9a05812419734)@rcqls you probably mistake on demo maker ;-)  
I have not written menu code  
but good to know you are working on that

rcqls

[19:30](#msg5c744251fec94e50777e21f3)No no you are the author of my previous screenshot of your application basic edit.red (the name of the author is @nodrygo)… Don’t remember ? But I think it is an old project you maybe forgot…. Hahaha!

[21:18](#msg5c745b940bd37b4835c9e68d)Context menu added with populate-popup option for area (i.e. gtk\_textview) (certainly add this ability to another widget like gtk\_entry). I mostly manage to have the (gem) editor working except that text-box-metrics is not perfect yet and selection block is not working properly….

greggirwin

[22:44](#msg5c746fbbfb14c23f17e02a0b)@mydoghasworms, very likely that 64-bit will only be in Pro this year.

Thanks for all the continued work on this @rcqls. Glad to see others are excited about it as well.

## Tuesday 26th February, 2019

Respectech

[00:28](#msg5c74882efb14c23f17e0c64f)@rcqls Many many thanks for working on the GTK version! Do you have a place where I can make a donation?

[00:29](#msg5c7488504e758e79a398ac9a)Also, any idea when 'fill-pen will be implemented?

rcqls

[02:53](#msg5c74aa14bb33072d387b9467)Thanks @greggirwin for all your continued encouragement! Difficult for me to understand the contour of Pro version of red. IMHO, 64bit is today a minimal requirement (compared with other languages) above all on system like macOS and linux. On Windows, it is not the same problem since red is fully useable with ease. So 64bits in Pro version makes sense on Windows since it is not required. However I understand that the red team needs to make money to make the development of red possible. From my side, I believe that language with best design principles (and in particular by making life easier for users/developers) would be clearly one of the language of the future. Red can be one of these languages since it gathers so many excellent principles. However we also need that the development language is pretty fast. I really appreciate that red is excellent on the Windows side or more generally on the commercial side, but I think also that gathering community like linux could help in the development because these people could possibly fasten the development of red above all if red makes life easier for developers (Julia is an example in the domain of numerical languages because of its huge community in the core development). Without taking into account all the elegant key-features of red, the duality REPL/Cross-compilation (leading to simplistic installations) is a dead key feature and red is IMHO far from being in advance compared with other more common popular languages. So my goal is to help in the linux side because I am always amazed when using this feature of cross-compilation with so much ease. I am also happy to see people playing with red on small computer like rasperry pi. It is a corner that can really matter in the future because Red is also an ecological language which is a really great key-feature above all in this period. I wish a long life to red!

[03:06](#msg5c74ad484d8904118ceb974e)@Respectech Thanks for your encouragement ( and I really have no idea how to receive donation)! IIf you provide a list of features and simple examples already running on Windows and macOS that you want running on red-GTK I could try to do my best in developing it. The good news is that IMHO cairo documentation is pretty good with respect of another documentations because there is a lot of helpful examples.

PeterWAWood

[05:43](#msg5c74d1f8b54299599d7d20a8)@rcqls The time and efforts that you have dedicated to GTK support on Red is beyond generous. I believe the correct word insuch circumstances is Chapeau!

pekr

[06:43](#msg5c74e02c55d9a0581245d7eb)rcqls should get some red coins :-)

rcqls

[06:45](#msg5c74e06eb54299599d7d806c)@PeterWAWood Thanks for this French touch! I don’t mention it but it is also a gift for me to discover the internals of red designed by @dockimbel and @qtxie (and certainly carl).

[06:48](#msg5c74e13c6d148f483451b3ca)@pekr hahaha! Too funny! Thanks!

nodrygo

[08:32](#msg5c74f98335c01307533da4ce)@rcqls you are probably using 'edit' from @toomasv  
the 'basicedit' I wrote 3 years ago dosen't work any more except if you have updated it ;-)

rcqls

[08:34](#msg5c74f9f8608c6f37362684ec)@nodrygo I cloned DemosRed from your repo! And indeed I just updated some code to have it working at least for the menubar that I wanted to test.

nodrygo

[08:44](#msg5c74fc668a7def0752db5310)@rcqls I am flattered :-)  
I for my part tested the good @toomasv 'edit' and the context menu seems to work  
you did great work really

rcqls

[08:47](#msg5c74fd32608c6f3736269d3a)@nodrygo I am fixing the face/selected to have the red artist (known as @toomasv ) edit working!

[08:51](#msg5c74fe2e35c01307533dc7e7)Oups! I need to fix `offset-to-caret` for edit and not face/selected. @toomasv rich text.medium2 is now (mostly) working. I know there is still an issue in my development if markup blocks are not embedded...

[16:57](#msg5c75700135c013075340eedb)Today, adding selected facet (get and set) for area and field…

[17:21](#msg5c75759e35c01307534115ae)@Respectech I answered too quickly about fill-pen. It is partially developed… I can’t see the point of your example. The three following examples (even if failing on linux) would give the same result on Windows and macOS.

```
draw 2x2 [fill-pen red]
draw 2x2 [fill-pen black]
draw 2x2 []
```

The following example works on Linux too:

```
view[
 	base 100x50 draw [fill-pen red box 10x10 80x40]
 ]
```

[17:34](#msg5c7578908a7def0752deb45b)In another words, I don’t think it is a priority since this use case is very limited because you can do directly `make image! 2x2` in order to have the same result. Tell me if you have some other use cases in such vein that do not work.

[18:53](#msg5c758b40e1446a6ebe4da0e7)Quickly (surprisingly), in one attempt I am supposed to have fixed the draw arc function. Of course this has to be tested by some draw experts. I actually used the try.red example in @toomasv editor.red repo.

toomasv

[19:26](#msg5c7592e347276019e983259a)@rcqls I don't know how far you are with shape dialect, but when you are at it, you might try \[arc study tool](https://gist.github.com/toomasv/01817e797fdb38d277d4c01dad89b326)

rcqls

[19:47](#msg5c7597edc1cab53d6f42a66b)As usual, this is a very good tool to test development. Thanks @toomasv !  
Since you seem to have everything in your bag, I dare to ask you if you have some basic examples on para that could help me to develop it. I roughly understand the use but I am unable to build some clever examples to help me its development. Of course, it is just in case you already did something in this domain. Thanks again for your help. The two challenges that you gave me are my main guides and I am not so far. You give me a third challenge… Hahaha…

[19:51](#msg5c7598ab2ca5ec547445011e)Something is missing… \[!\[Capture d’écran 2019-02-26 à 20.49.31.png](https://files.gitter.im/red/GTK/aDgv/thumb/Capture-d\_ecran-2019-02-26-a-20.49.31.png)](https://files.gitter.im/red/GTK/aDgv/Capture-d\_ecran-2019-02-26-a-20.49.31.png)

greggirwin

[19:56](#msg5c7599e2212d0c1e1a9e4b9b)@rcqls will definitely get a big bag of RED tokens for his efforts. :^)

As far as 64-bit and Red/Pro, we really wish there were easy answers. FOSS benefits many, but primarily those who use it, not the creators. How to make that sustainable is an unanswered question.

toomasv

[20:04](#msg5c759bdf4a65f75473307082)@rcqls Here is how it looks on W10:  
\[!\[arc-study](https://toomasv.red/images/Tools/arc-study2.gif)](https://toomasv.red/images/Tools/arc-study2.gif)

rcqls

[20:05](#msg5c759c004a65f75473307165)@greggirwin Hahaha… You’re right I think that there is not easy answer on everything….

[20:07](#msg5c759c78212d0c1e1a9e5d6d)@toomasv Thanks for your effort in this animation, actually it looks similar in macOS. I was about to try on my win7 virtual box. Now I know more clearly my third challenge.

toomasv

[20:07](#msg5c759c95d2d62067b70f6ebc)And here is one earlier version:  
\[!\[arc-study](https://toomasv.red/images/Tools/arc-study.gif)](https://toomasv.red/images/Tools/arc-study.gif)

rcqls

[20:08](#msg5c759cd62ca5ec5474451992)Excellent tools indeed to test implementation of draw dialect!

toomasv

[20:12](#msg5c759d93e1446a6ebe4e230f)@rcqls Thanks! I don't remember at the moment where I have used `para`. Let me sit on it a bit.

rcqls

[20:14](#msg5c759e175015f21e19649aad)No emergency! Just in case you have some in your huge number of gists….

Respectech

[23:02](#msg5c75c5974a65f75473318d04)@rcqls

```
odroid@xu4-bo:~$ ./rpi-gui-190226 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> draw 50x50 [fill-pen black box 0x0 50x50]

*** Runtime Error 1: access violation
*** at: B64D3D1Ch
```

on Windows:

```
>> draw 50x50 [fill-pen black box 0x0 50x50]
== make image! [50x50 #{
    24242400000000000000000000000000000000000...
>>
```

[23:03](#msg5c75c5bcb1503b3d704af3c4)I understand what you are saying by having a workaround. I will give that a try. But I thought that it would be good to note that there are functional differences between Windows and GTK.

[23:06](#msg5c75c69235c0130753433ba1)On Windows:

```
>> draw 2x2 [fill-pen red]
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
```

rcqls

[23:09](#msg5c75c70ec1cab53d6f43e516)@Respectech Thank you for your feedback. You’re right and I already know these differences. But this use case is very specific. I will deal with that in a decent time… DO you have another use cases that are mising for you?

Respectech

[23:12](#msg5c75c7d24a65f754733199f0)I am trying to run a script that I wrote as a demo called %explosions.red. I just tried it with your method, and it seems to get farther, but still fails. I'm trying to track down a simple test to isolate the failure.

rcqls

[23:15](#msg5c75c87e53efa912037f93e0)Thanks it could be helpful…. I hope also you are using my repo `rcqls/red:GTK-dev` branch since it is now far from being in advance compared to the official repo.

Respectech

[23:15](#msg5c75c89f212d0c1e1a9f8130)I am using the automated build at https://www.rebolek.com/builds/files/rpi-gui-190226

[23:18](#msg5c75c93bc1cab53d6f43f40e)How would I use your branch?

rcqls

[23:19](#msg5c75c972e8ea1437377e5df6)This is like the official repo since @rebolek automate the build from the official repo…. If you can wait few days I will send a PR at the end of the week. Otherwise you could compile console-view as @rebolek does. You could have a look of the Red-GTK wiki page to see how to compile from source.

Respectech

[23:20](#msg5c75c9bc2ca5ec54744640c0)In any case, I cannot get these two examples to give identical results (I need to build the display before displaying it, so I can't use 'view directly):

```
>> draw 2x2 [fill-pen red fill-pen black box 0x0 2x2]
== make image! [2x2 #{242424000000000000000000}]
>> layout [i: image 2x2 draw [fill-pen red fill-pen black box 0x0 2x2]]
== make object! [
    type: 'window
    offset: none
    size: 22x22...
>> i/image
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
```

[23:21](#msg5c75c9e5212d0c1e1a9f8974)OK. I will wait. Let me know when I should try again. :-)

rcqls

[23:26](#msg5c75cb2fd2d62067b710a69b)If you could indeed provide an example or simply provide your code, it would be easier for me to develop what it is mising for you. I need to go to bed...

[23:32](#msg5c75cca70966d91204ef8833)@toomasv I am closer and closer from the first challenge...

[23:33](#msg5c75ccc4b1503b3d704b2299)\[!\[Capture d’écran 2019-02-27 à 00.31.21.png](https://files.gitter.im/red/GTK/XaMH/thumb/Capture-d\_ecran-2019-02-27-a-00.31.21.png)](https://files.gitter.im/red/GTK/XaMH/Capture-d\_ecran-2019-02-27-a-00.31.21.png)

[23:33](#msg5c75cce7e1446a6ebe4f5e58)But still need improvement…

Respectech

[23:46](#msg5c75cfd2e8ea1437377e82c7)@rcqls Here's the code: http://video.respectech.com:8080/a.com/explosions.red

## Wednesday 27th February, 2019

rebolek

[06:51](#msg5c763387e8ea14373780d84c) @Respectech @rcqls If there's demand, I can automated builds for @rcqls branch(es) also, it's just few more lines in config.

rcqls

[07:05](#msg5c7636b92ca5ec547448d0bf)@rebolek Thanks! I am trying to fix the issue reported by @Respectech. My last commit in `rcqls/red:GTK-dev` would not solve the problem since development is required. Except if @Respectech needs console-view for Rasperry Pi, I think it is not necessary since I can also provide a link to my last generated \[`console-view`](https://toltex.u-ga.fr/users/RCqls/Red/console-view). It can also be useful for you if you don’t want to pull my repo. Maybe it could be good to add it to wiki page related to GTK.

rebolek

[07:08](#msg5c76375453efa912038241ba)I usually don't use my automated builds myself, I build everything manually and locally, so I'm pulling your repo already.

[07:10](#msg5c7637dce1446a6ebe51f176)I've been also thinking on build-on-demand - you will choose repo, commit and platform and server will build executable for you. This is bit more work however (UI, abuse prevention and solving the delay problem) and I'm not sure it's worth spending that time on it.

rcqls

[07:15](#msg5c76391ce8ea14373780f4f3)Interesting but as you say, I don’t think it’s worth it now. BTW, you should add link of automated builds for Linux/GTK on the wiki page. I just added the link to get my last generated `console-view`. In fact I use syncthing to synchronize some files of my computer and my server.

rebolek

[07:16](#msg5c76393a4a65f75473345fcb)what wiki?

rcqls

[07:16](#msg5c7639545015f21e19683be6)https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development

rebolek

[07:23](#msg5c763af68a7def0752e36d02)Done

[07:24](#msg5c763b1bd2d62067b7133e0c)@rcqls your console-view build is automated?

rcqls

[07:24](#msg5c763b4247276019e9872de2)Nice for the link…

[07:25](#msg5c763b742ca5ec547448f39c)@rebolek Not automated, the last one I have compiled… That’s Syncthing which makes the synchronization (like dropbox) with my server and syncthing is peer to peer so directly available on the server.

rebolek

[07:26](#msg5c763b8835c0130753460b8c)Ok, just curious :)

[07:28](#msg5c763c16608c6f37362ebc8a)I'll take a look at syncthing, I need something like that also.

rcqls

[07:30](#msg5c763c8947276019e9873542)Seafile, owncloud are server system synchronization so you generally need to install a client on the server too to have the ability to serve the binary. It is another use case.

rebolek

[07:46](#msg5c764043b1503b3d704dcf33)@rcqls I've also added workaround for `LOCALE` bug to wiki

rcqls

[07:49](#msg5c7640edc1cab53d6f46c596)@rebolek Great idea!

rebolek

[07:50](#msg5c764134e1446a6ebe523278)BTW, I've tried my `text-table` style with your latest build, but it still crashes. It's probably too complex for current version.

rcqls

[07:50](#msg5c764157d2d62067b7136876)Do you have a minimal example?

rebolek

[07:54](#msg5c76421b65ffa019ea594722)Hm, doesn't crash on second try. I'll need to experiment with it bit more and let you know.

rcqls

[07:56](#msg5c7642b55015f21e196881f5)Thanks! I experiment this kind of behavior too but I am not surprised since memory leaks have to be considered soon more carefully when the overall of functionality would be great.

toomasv

[09:23](#msg5c76571e212d0c1e1aa2ec78)@rcqls Great progress! Again!

rebolek

[09:24](#msg5c76575947276019e987e725)@rcqls Right, leads need to be addressed really soon, lot of my layouts crash even before displaying.

rcqls

[09:27](#msg5c765809e8ea14373781c5b5)@rebolek BTW, it is not so often for me… But maybe what you are cooking is something greedy in memory.

[09:29](#msg5c7658922ca5ec547449b502)And memory leaks hunting would require some clever examples...

rebolek

[09:30](#msg5c7658ae47276019e987efa0)I guess so, I'm doing complex styles in Draw, like charts or text table. However, it's not usually the draw complexity that is causing the crash, for example I've been trying to do some simple demo, that has draw area and two text-lists with text labels. This demo was crashing and to get rid of crash, I had to remove `text` style. So now text-lists have no labels, but it works.

rcqls

[09:40](#msg5c765b005015f21e19692cc5)@rebolek Yep, drawing stuff is good since cairo is an excellent tool, very well documented with plenty of examples. For instance, in my first attempt I am about to fix the issue reported by @Respectech :

```
>> draw 50x50 [fill-pen black box 0x0 50x50]
== make image! [50x50 #{
    000000000000000000000000000000...
>>
```

which is the same output than macOS (not windows but I guess it is because of the format file).

[19:35](#msg5c76e66c4a65f75473391639)@Respectech There is no more failure when executing your script. I even write an example in the same spirit of your code:

```
Red[]

img: make image! 100x50
random/seed now/time/precise

color-choice: 'random

color: does [
	case [
		color-choice = 'random [random 255.255.255.0]
		color-choice = 'red 	[255.0.0]
		color-choice = 'green 	[0.255.0]
		color-choice = 'blue 	[0.0.255]
	]
]

draw_box: does [
	draw_blk: compose [fill-pen (color) box 10x10 80x40]
	draw img draw_blk
]

view compose [
	below
 	i: image (draw_box)

	rate 32
	on-time [
		i/image: draw_box
		show i
	]
	button "red" 	[color-choice: 'red]
	button "green" 	[color-choice: 'green]
	button "blue" 	[color-choice: 'blue]
	button "rand" 	[color-choice: 'random]

]
```

which goes the same in Linux and macOS. But weirdly, your script (only on linux) is working but badly (and I don’t know why yet) the explosion is growing too fast compared with the behavior on macOS (and I guess on Windows). Since there is only (except if Iam wrong) pen, fill-pen, circle draw commands I guess they are weirdly the possible culprit. Need to investigate this ….

[19:36](#msg5c76e6b64a65f75473391823)I checked that the generated values are exactly the same in both OS. So it is a drawing issue…

[19:47](#msg5c76e94b47276019e98bdb97)Btw, I only checked the new exploded particules … Really weird since my example works exactly the same even for circle, 2 circles ...

[19:49](#msg5c76e9d353efa91203871d0e)Btw, I only checked the new exploded particules … Really weird since my example works exactly the same even for circle, 2 circles … Maybe it’s time to test the debugger introduced recently by @JLCyclo

Respectech

[19:54](#msg5c76eb0b2ca5ec54744dbb6a)@rcqls Cool! I can't test it because I don't know how to get either a working executable or build it myself.

[19:55](#msg5c76eb290966d91204f6e310)Could the "growing too fast" be because the code is more efficient in Linux?

[19:55](#msg5c76eb454a65f75473393209)Or maybe the 'rate functionality is not working correctly on Linux.

rcqls

[20:01](#msg5c76eca14a65f75473393ae6)@Respectech After some more experiments (by growing age and size) it seems that only the first particule explodes…. the other don’t ….. I fixed also the random/seed. So the particules are maybe not appended properly.  
To test it you can simply follow the the wiki page … it is not so complicated… you only need to download the rebol for your architecture. BTW are you linux x64 ou x32 or are you on ondroid or raspberry pi?

## Thursday 28th February, 2019

Respectech

[00:43](#msg5c772ebab1503b3d70541670)Linux ARM 32-bit

[00:44](#msg5c772ed75015f21e196eccf9)I have been testing on an ODROID-XU4 running Ubuntu MATE 18.04 with a 4.14 kernel.

[00:45](#msg5c772f26d2d62067b719c8b0)@rcqls I'd like to make a donation to you for your efforts by sending you an ODROID-XU4 with accessories so that you have something more powerful than a Raspberry Pi to test on.

[01:10](#msg5c77351553efa91203890098)I thought I would be really cool and compile it directly on my XU4 as I have a custom ARM version of R2 that Carl compiled for me. Although Red compiled fine, it won't run:

```
REBOL/Core 2.7.8.4.8 (16-Jan-2016)
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
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.6.4 ===- 

Compiling /home/odroid/red/environment/console/CLI/console.red ...
...compilation time : 6362 ms

Target: RPI 

Compiling to native code...
Script: "Red/System ELF format emitter" (none)
...compilation time : 151424 ms
...linking time     : 2543 ms
...output file size : 2142820 bytes
...output file      : /home/odroid/red/console
```

[01:11](#msg5c77353c53efa9120389014b)

```
odroid@xu4-bo:~/red$ sudo chmod 777 console
odroid@xu4-bo:~/red$ ./console

*** Runtime Error 1: access violation
*** at: 0008717Ch
```

[01:11](#msg5c773559e1446a6ebe58afe4)Am I missing some step?

[01:16](#msg5c7736628a7def0752ea2d1e)If you want a copy of R2 for ARM Linux, you can get it here:

```
wget http://video.respectech.com:8080/a.com/r2
```

[01:21](#msg5c7737b3d2d62067b719f72a)I cloned this repository for the above test:

[01:22](#msg5c7737b847276019e98ddd77)

```
git clone -b GTK https://github.com/rcqls/red.git
```

[01:22](#msg5c7737c435c01307534cd98c)Should that be GTK-dev?

[01:36](#msg5c773b31c1cab53d6f4d7355)I tried with "GTK-dev" in place of "GTK", but it made no difference. I am not skilled with "git".

rcqls

[02:17](#msg5c77449c2ca5ec54744ff055)@Respectech You re on the right way:

```
git clone -b GTK-dev https://github.com/rcqls/red.git
```

But instead `console.red` just compile `console-view.red` which has the View characteristics.

[02:38](#msg5c7749c3d2d62067b71a5fca)@Respectech Thank you for your proposition of donation!

Respectech

[08:16](#msg5c7798d465ffa019ea621cc8)Ok. I will try that tomorrow.

rcqls

[14:27](#msg5c77efee8a7def0752eede72)Happy to announce a first version of draw image with CROP option. This time I needed one hundred of trials to make it working with cairo. I guess there is a simpler solution when you are a cairo coder with lot of experience. The great news is that the excellent ballots.red is working (except some arc issue but this would be fixed later when I will focus more carefully on draw shapes and paths).

[14:28](#msg5c77f02647276019e992727d)\[!\[Capture d’écran 2019-02-28 à 15.28.28.png](https://files.gitter.im/red/GTK/XmAs/thumb/Capture-d\_ecran-2019-02-28-a-15.28.28.png)](https://files.gitter.im/red/GTK/XmAs/Capture-d\_ecran-2019-02-28-a-15.28.28.png)

rebolek

[14:29](#msg5c77f064d2d62067b71ec627)@rcqls wonderful, as usual! :clap:

toomasv

[15:04](#msg5c77f8772ca5ec5474549d2c)@rcqls Magnificent!

rcqls

[15:17](#msg5c77fb9b47276019e992c986)Thanks @rebolek and @toomasv !

[15:38](#msg5c7800868a7def0752ef5f7d)@rebolek a quick question, do you happen to you that just adding a « print » makes your program working when failing otherwise ? It is the case for me with picosheet.red …. It remids me last time when you told me that your app was failing and 1 minute after it was working….

[15:40](#msg5c7801024a65f7547340295e)`recycle/off` fix the issue too!

rebolek

[16:00](#msg5c7805a2d2d62067b71f701e)@rcqls I usually have lot of `print`s in my code, but I found that really small seemingly random changes (like print) can make it working.

rcqls

[16:07](#msg5c780745e8ea1437378d2a20)When you have time, test picosheet.red with the last commit… Maybe it is my docker container which is unstable after a long run.

[16:27](#msg5c780c074a65f7547340717f)Restarting my docker container is ok now. So maybe some memory leaks that only have bad impact after long run…

## Friday 1st March, 2019

qtxie

[01:42](#msg5c788e0d65ffa019ea68c8f9)@rcqls Cool! Great progress! :+1: Seems we'll have a usable GTK backend soon. ;-)

rcqls

[03:18](#msg5c78a488608c6f37363eeb5b)@qtxie Yep, the step of finalization with a better care about freeing object is coming soon. I think now that the next step is to provide a more robust draw dialect implementation and I am reading cairo documentation more linearly. Hope you are making progress in red too… I really would like to know how far is red to make its compiler in red/red-system (i.e. a bootstrapped red) above all if you are preparing IO. Also one of my main activity is generally to connect language like R (and Julia) to a master language (it was ruby from now but I want to migrate to Red ) and 64bits is generally required (at least for macOS). After stabilization of red-GTK, I will give a try to connect R to red. BTW, I finally decided to only send one PR by simply fetching the official red/GTK and adding all the files I developed. So no history in this PR but it is not really helpful. It would still be in my `rcqls/red:GTK-dev` branch.

[10:55](#msg5c790fb02ca5ec54745bcfa6)In order to increase the development of red/GTK for testing gtk stuff without to wait for long compilation of `console-view` (as I used to do), I finally wrote a very simple plugin for red/system which only gathers the two main files that plug gtk stuff inside red. I create a repo `https://github.com/rcqls/gtk.reds`. Red/system is just amazing since it is so simple to generate binary for any platform from one platform.

[11:05](#msg5c7911e0e8ea1437379419cd)I forgot to mention that this tool is useable on Windows too. However, I could not find a gtk3 library for macOS running on x86 mode. If somebody know how to find it, I am really interested. Eventhough, this tool is certainly more interesting for linux-like user.

[11:36](#msg5c7919564a65f75473474f22)I also confirm that a dead simple gtk example fails in archlinux. If the issue come from the red/system side, it would be easier to check with the `gtk.reds` plugin. I checked and it fails just before gtk\_init. My bet is that the issue comes from the archlinux side maybe a setting in the dbus setting.

## Tuesday 5th March, 2019

rebolek

[16:51](#msg5c7ea90ce1446a6ebe89066d)@rcqls I wonder... GTK version doesn't need Linux, right? It needs system with GTK (I believe you wrote you have running it on macOS). So it could theoretically work on BSD+GTK, right?

rcqls

[17:01](#msg5c7eab71de3a6e64c0e3fd8d)@rebolek In theory, you are right since GTK is Multiplatform. After it depends of what’s tool you are talking about: red or the last gtk.reds red-system plugin? Even if I guess that you already know it, I recall it: for red, if BSD is recognized as Linux platform everything would be good… In theory, GTK could be used in any OS provided the gtk library for x86 is available. Currently for developing red/GTK, my workflow is cross-compilation on macOS and execution on docker running linux from my terminal. For gtk.reds, it does not depend on OS whenever you have the gtk library for x86.

[17:07](#msg5c7eacc7d2d62067b74ae6cd)And I can’t run on macOS since gtk3 seems not to be provided for i386 mode.

rebolek

[17:46](#msg5c7eb6080966d912042a1d78)BSD is recognized as its own platform, so if I understand it correctly, it's just a matter of modifying few ifs/switches. It's just an idea that I'd like to check with a VM.

rcqls

[17:53](#msg5c7eb7a50966d912042a281c)@rebolek Very quickly, I would try to add in `system/config.r` something like that first :

```
BSD-GTK [
        OS:                     ‘Linux
        format:         'ELF
        type:           'exe
        dynamic-linker: "/usr/libexec/ld-elf.so.1"
        syscall: 'BSD
        target: 'IA-32
]
```

[17:54](#msg5c7eb7de2ca5ec5474806b2c)But what you proposed is what to do but more complex at first...

rebolek

[17:55](#msg5c7eb7f8e1446a6ebe89731b)@rcqls I'll run some tests and let you know. Don't waste your time on it.

rcqls

[17:55](#msg5c7eb82ccbebcf784a4506e3)I can’t test it so I can’t waste my time….

rebolek

[17:56](#msg5c7eb84865ffa019ea910902)Great then ;)

rcqls

[17:57](#msg5c7eb86db1503b3d708558b1)BTW, for windows I think I’ll try the same trick …. but it is much more less certain since it is well-known that Windows is not a Unix….

rebolek

[17:59](#msg5c7eb90335c01307537dbba5)The reason why I'm asking is that I have new piece of hardware and by new I mean really old Asus EEE 901. I was looking for some lightweight Linux to put on it but almost everything is 64bit nowadays, so I think if BSD can fit on it. But I haven't installed anything yet, it's just theoretical question right now.

rcqls

[18:02](#msg5c7eb9b2de3a6e64c0e4663e)That’s really weird that no more x86 distrib is maintained. I guess Alpine is ok for such computer but from now, it badly does not work for Red/GTK. Good luck!

rebolek

[18:05](#msg5c7eba792ca5ec5474807f77)There are some x86 distros, but mostly Arch-based, so not really useful for Red/GTK. I probably should try plain Debian.

[18:06](#msg5c7ebab9e8ea143737b8dc74)But I was thinking why not try BSD and help with getting Red up to date on another platform.

rcqls

[18:10](#msg5c7ebb854a65f754736c3c02)BTW, I used to play with Puppy Linux… And good idea for BSD contribution.

Oldes

[19:41](#msg5c7ed0ed4a65f754736cce39)What about lmde? It has 32bit version https://linuxmint.com/download\_lmde.php

[19:46](#msg5c7ed1fa8a7def07521c0111)Ah.. you are looking for bsd.

rebolek

[19:51](#msg5c7ed3402ca5ec54748133e6)@Oldes no, I'm looking at bsd as an alternative to Linux. Thank's for the Mint link btw, I take a look at it. There's another limitation besides 32bit and that's 4GB storage. That rules out 32bit distros I found already.

rcqls

[19:53](#msg5c7ed3a22ca5ec54748136a6)@rebolek BodhiLinux Legacy (it is 32bit) was my previous VM when I was developping Red/GTK before using docker.

rebolek

[19:56](#msg5c7ed471b1503b3d708616a5)Thanks, I probably missed it on distrowatch, their search is suboptimal and finding distro manually is time-consuming. But if BSD would be a viable option, I would love to try it.

## Thursday 7th March, 2019

rcqls

[07:00](#msg5c80c18fd3b35423cb7a6427)@rebolek I was checking the `system/config.r` file and there is cleverly a `GUI-engine` option to specify `GTK` option instead of `native`. So I will try soon to add `WinGTK` target and test it. I think it is more difficult than BSD… A second part is the image management. BTW, for windows, it is not clear that GTK will work for Windows directly for this reason.

rebolek

[07:07](#msg5c80c318b4b6ef7bc86c5015)@rcqls Interesting, thanks. I haven't got time yet to test it, I guess I should be able to do it over weekend.

## Friday 15th March, 2019

rcqls

[16:18](#msg5c8bd054eca34208c6ec228b)@rebolek Did you know that cross-compiling red script (for me from macOS) for RPi is the way to generate a binary on ODROID (and I guess RPi too)? I tried the regular way to download rebol Linux ARM (which works in console mode). But trying to compile `console.red` and `console-view.red` generates binaries that fail with a runtime error. I tried to compile with debug mode and I had an access violation in line 1307 of file runtime/datatypes/objects.reds…. Weird! Maybe I miss something but I guess @dockimbel should know if this is an expected error. The good news is that you tried to cross-compile console.red to get rpi-gui and it was a good attempt since now we know that cross-compilation is really powerful!

[16:22](#msg5c8bd136350f2f346ca36b3c)@Respectech So in order to get binaries working on ODROID I think you should try to cross-compile console-view from windows with target `-t RPi`. From macOS, it is working.

[16:27](#msg5c8bd27c85ba5b30a11ea1a0)@rebolek So adding `rpi-gui-dev` (which is console-view in your naming convention) could be useful for people wanting to test my repo `rcqls/GTK-dev`. Pretty recent `console-view` for RPi (or ODROID) is available on my server `https://toltex.u-ga.fr/users/RCqls/Red/RPI/console-view` but it is not automatic as you do.

[17:28](#msg5c8be0d9f8066c18ce52dd26)Thanks to @Respectech, I can now test all the rcqls/red:GTK-dev stuff on ODROID and the overall is pretty good even better than in my installation on mac via docker-red. In particular code/Scripts/particles.red is working properly when it was not on docker. Resizing is working better too. But not yet perfect of course… but useable for testing….

greggirwin

[18:30](#msg5c8bef5ff5841318cdf60c57)@rcqls cross compiling is the way to go right now, though it's also good to track errors.

rebolek

[19:48](#msg5c8c01a18aa66959b617894c)@rcqls thanks for info, I'll add automated builds of your branch during the weekend, both for x86 and ARM.

rcqls

[19:53](#msg5c8c02cc6a3d2e230dce2f34)Many thanks @rebolek ! @greggirwin thanks for the info! Bootstraping is something I really hope the sooner.

## Saturday 16th March, 2019

rcqls

[10:22](#msg5c8cce72dfc69a1454a23f17)I bought long time ago a rapsberry pi 1 model B. After installing a raspbian lite and downloaded `console-view` (cross-compiled for for RPi), it seems that everything is working. Everything is tested with `ssh -Y` connection. Good news! P.S.: As a reminder, I only needed to do: `ln -s libcrypto.so.1.0.2 libcrypto.so.1.0.0`

dockimbel

[13:20](#msg5c8cf81efa5b721a1f9b95cd)@rcqls Rebol2 on Linux/ARM is not stable enough to be used (it's just an experimental version IIRC), so cross-compilation is the way to go.

rcqls

[13:23](#msg5c8cf8bf3dd8171149fe5590)@dockimbel Thanks! Good to know it.

## Sunday 17th March, 2019

rcqls

[17:23](#msg5c8e829cf3dbbd230c702705)Since I am now aware of the power of red/system, I just started a efl.reds plugin (EFL is the GTK for Enlightenment window manager). EFL is a possible alternative of GTK. Of course, this is just experimental… It is C-based so it is a possible red candidate for red/View. The good news is that I quickly had a window with a button showing. The button callback on click event is working. I always thought that in some sense Enlightenment and Red have the same spirit.

Oldes

[22:22](#msg5c8ec8b7a21ce51a2078e8e8)Looks like not everybody likes EFL https://what.thedailywtf.com/topic/15001/enlightened

## Monday 18th March, 2019

rcqls

[05:52](#msg5c8f3229dfc69a1454b13487)@Oldes Thanks for the link. However, this blog is pretty old. The development seems to be still active eventhough it is started 25years ago. The goal is not to be used as a self content tool but to be compliant to red/view. There is now many plugins also using ffi tool. Also, some parts of GTK are difficult to master to be red/view compliant. But thanks for the warning, from now it is just experimental and I don’t plan to invest a lot in this plugin. The documentation is pretty complete now (it was bad before). The elf.reds plugin could be easily compared with gtk.reds plugin which helps me a lot to develop red/GTK branch. Compilation in gtk.reds (or elf.reds) lasts at most 2 secondes when in the red/GTK branch I often need to recompile console-view.red which lasts around 1 minute because unfortunately `-r` mode is required.

rebolek

[14:06](#msg5c8fa5d26a3d2e230de4ac08)@rcqls I've started migration of my build server, so adding your branch will be postponed for few days.

guaracy

[15:09](#msg5c8fb4ac49fdaa0d81d5a814)@rcqls i think tizen has chosen efl for the ui  
https://developer.tizen.org

rcqls

[16:25](#msg5c8fc6949d9cc8114adf828e)@guaracy Indeed, it is mentionned in the Enlightenment website. I think that fact boosted the developement of EFL.

[16:26](#msg5c8fc6acfa5b721a1fad3dc6)@rebolek Great!

## Tuesday 19th March, 2019

rebolek

[14:08](#msg5c90f7e0a21ce51a20876114)@rcqls btw, GTK-dev now seems much more stable, I haven't got a crash yet, great work!

rcqls

[14:23](#msg5c90fb78fa5b721a1fb56238)@rebolek Good news! Thanks!

greggirwin

[20:26](#msg5c91508e3dd81711491a8bcb)Go @rcqls, go!

rcqls

[20:32](#msg5c9151eb0d7190505730d6c2)Thanks @greggirwin and go go the Red team!

## Wednesday 20th March, 2019

rebolek

[06:58](#msg5c91e4b23dd81711491e2584)There are still crashes with complex layouts, but it's certainly more stable.

rcqls

[07:08](#msg5c91e6fd9d9cc8114aede006)It is certainly not stable yet since for instance adding two lines of code (that mostly do nothing except to print some info) in the `do-events` function makes the example of Hex-pave.red working. So I think that the event loop is something difficult to master… not only leaks of memory. I am trying to work on that…

rebolek

[07:11](#msg5c91e79c9d9cc8114aede3eb)It's certainly much better than it was! I had crashes when trying to view a layout for second time, so I had to restart console each time, but that'đ gone now. The only crash I've seenwith recent versions is with Gritter client, but that's doing very complex layouts with custom rich text.

rcqls

[07:14](#msg5c91e843d0133e21e5e3e424)Good news indeed! Richtext is for sure not stable…. I stopped development on it but I know that there is some issue on this object… Thanks for the feedback @rebolek !

rebolek

[07:17](#msg5c91e927dfc69a1454c3973b)I am using custom rich text in Gritter, because it was written before Rich text was implemented in Red. But now that we have Rich text in GTK version too, I'm going to rewrite it as it's certainly going to be faster. So expect some reports soon :-)

rcqls

[07:22](#msg5c91ea3c9d9cc8114aedf3c5)Ah Ok! Is your gritter available for testing?

rebolek

[07:23](#msg5c91ea5f2fb6800d804cc99f)https://github.com/rebolek/gritter

rcqls

[07:23](#msg5c91ea710d7190505734975f)Thanks!

rebolek

[07:23](#msg5c91ea7ff3dbbd230c86cd5c)You will need Gitter token, you can get one at https://developer.gitter.im/apps

[07:24](#msg5c91eaa3d0133e21e5e3f57a)create file `%options.red` that will contain your token as `hash!`: `#abcd1234...`

[07:24](#msg5c91eab0fa5b721a1fbbb7f2)then it should work

rcqls

[07:27](#msg5c91eb748126720abc113d80)Is it supposed to work on macOS too?

rebolek

[07:28](#msg5c91eb81fa5b721a1fbbbce5)It should.

rcqls

[07:29](#msg5c91ebdbf3dbbd230c86d903)Ok! So I made a mistake since I have this output on both macOS and linux:

```
Redquire: init
Redquire: load-list
Redquire: load-package json
Redquire: download-package json
Redquire: load-package http-tools
Redquire: download-package http-tools
Redquire: load-package json
*** Script Error: first does not allow map! for its s argument
*** Where: first
*** Stack: first
```

rebolek

[07:30](#msg5c91ec172f6ded0abb11a952)Thanks for the report, I must check it with clean repo, I probably have something downloaded already that' s not working now.

rcqls

[07:31](#msg5c91ec3cdfc69a1454c3a8bd)Ok! I need to go working now! Thanks…

rebolek

[10:56](#msg5c921c508aa66959b63f0947)@rcqls I've made some updates to Gritter, nothing substantial. I've seen the same error once, but was not able to reproduce it on second try. There's also another very annoying error, `*** Script Error: path reply/2/Content-Type is not valid for char! type`that goes away every time I want to investigate it. I'll add `probe` and it's gone.

rcqls

[12:10](#msg5c922daf8aa66959b63f7dca)@rebolek My bad! I was a silly boy since I preprended `hash!:` to the token in the `options.red`. Now I have both in macOS and Linux an `Runtime error 1: access violation` just after selecting a room in the text-list. BTW, very interesting tool! P.S.: I made a `git pull`

rebolek

[12:11](#msg5c922e06fa5b721a1fbd90b9)Ah, OK :) In macOS it crashes too? Interesting. I wonder if it's GC or View related. I should try it in Windows too, once I get to Win machine, I haven't tried it fora long time.

rcqls

[12:15](#msg5c922ee19d9cc8114aefdeac)@rebolek Oups I tried to git clone your gritter repo on my windows VB but I get a fatal early EOF… Needs to download the zip file.

## Wednesday 27th March, 2019

rebolek

[11:30](#msg5c9b5ebfe820b6470b7035cd)@rcqls see this example:

```
view [base draw [translate 0x0 [pen red line 0x0 50x50] translate 10x0 [pen red line 0x0 50x50]]]
```

Second line ignores pen.

rcqls

[11:34](#msg5c9b5fc42fb6800d808c2cc1)@rebolek Right! Thanks! I mainly did `gtk.reds` to debug this stuff more easily….

abdllhygt

[17:11](#msg5c9baedd5636de703def0678)Hey!

[17:14](#msg5c9baf8f8126720abc527b30)How can i install/active gtk.red on linux?

rcqls

[18:20](#msg5c9bbf0036704f6edde21864)@rebolek About your last issue, I tried to find a better fix but maybe the current one is the best one (maybe `cairo_set_source_rgba` is required even if already initialized after a `cairo_stroke`). BTW, colors on image are temporarily unstable on GTK-dev since I'm trying to do better job. BTW, you were right this morniong about platform dependencies on `make image!`. It was different on Linux. Now it is the same but a lot of stuff needs to be done. I am trying to have redCV working in a better way…

rebolek

[19:08](#msg5c9bca428126720abc534348)@rcqls thanks for update, keep up the great work!

rcqls

[21:41](#msg5c9bedf86a9761361b116e43)A priori the color issue related to images seems to be fixed at least it is much better than before. Understanding little endian was the key!

## Thursday 28th March, 2019

endo64

[06:48](#msg5c9c6e371f98a87112b22ef4)@abdllhygt You can checkout or download the GTK branch (https://github.com/red/red/tree/GTK) and compile it manually.

loziniak

[09:38](#msg5c9c96235349305a4c8166ea)@rebolek Is it intentional, that your automated builds build only console binary? It's not possible to compile things with it, or even run `linux-cli-190328 --help`. Do you think it would be a big task to build full Red binary, as in official builds: https://www.red-lang.org/p/download.html ?

9214

[09:40](#msg5c9c968d8df8b02f0472eb1f)@loziniak such big task would require Rebol SDK and encapper to which @rebolek can't possibly have any access, since it has been taken off the shelves since a long while.

rebolek

[09:40](#msg5c9c96967160b4228529d3d8)@loziniak yes, that's intentional and yes, that would be big task.

9214

[09:40](#msg5c9c969d1f98a87112b3522b):mouse:

rebolek

[09:41](#msg5c9c96b8a100047111d16c5b)@9214 actually I do have access, I own SDK license, but it would still be big task.

9214

[09:41](#msg5c9c96cb6a9761361b15d18b)Oh, I didn't know that. Cool!

rebolek

[09:42](#msg5c9c96f51f98a87112b35467)(if I could find the key, that's different problem :smirk: )

loziniak

[09:42](#msg5c9c9717aee5b449f3a8cf5a)I see, thanks for info.

9214

[09:42](#msg5c9c97180b3b8749f4d7063d)@loziniak you should use Github repo sources if you want to compile something, details are covered \[here](https://github.com/red/red#running-red-from-the-sources-for-contributors).

rebolek

[09:43](#msg5c9c9735dfcacf510ab22114)@loziniak anyway, building Red with Rebol is really trivial, I don't see the point of having full Red binary.

[09:43](#msg5c9c97448df8b02f0472eff3)see the link that :mouse: posted

9214

[09:43](#msg5c9c975eb7e27d2f05974e4a) :muscle: :mouse:

loziniak

[09:44](#msg5c9c97870b3b8749f4d708df)Indeed, I forgot that everything can be compiled from sources. End of topic :-)

abdllhygt

[09:59](#msg5c9c9b178df8b02f04730aad)@endo64 thanks!

rcqls

[10:06](#msg5c9c9c93b6711251983f7568)@loziniak I did this \[reds](https://github.com/rcqls/reds) bash script to mimic `red` binary. It only requires as usual rebol and source repo...

rebolek

[11:16](#msg5c9cad22e2245b5109c72a20)@rcqls that's nice! btw, there are some minor formatting problems in readme.

rcqls

[12:07](#msg5c9cb8ee08f8e7361a5fcb32)Since I am in love with the styling tools developped by @toomasv, I fixed the issue on the resizing making `fluid.red` from learning repo of @toomasv. Combined with developement of @rebolek, I think it would lead to awesome tools.

[12:08](#msg5c9cb923dfcacf510ab32214)@rebolek Thanks! Formatting problems updated.

toomasv

[14:35](#msg5c9cdbb208f8e7361a60d0e0)@rcqls Thanks for repairing it, but what issue was there?

rcqls

[14:43](#msg5c9cdd775349305a4c8382ed)@toomasv Nothing related to your code as you know. Just the Red/GTK side…..

toomasv

[14:43](#msg5c9cddac6a9761361b17e6ab)Oh! Lucky me and lucky you!

[15:13](#msg5c9ce4b26a9761361b181af5)@rcqls BTW, I was looking at it and there \*was* an issue, which I \[repaired](https://github.com/toomasv/learning/blob/master/styles/fluid4.red) adding the `fluid` style to system styles.

rcqls

[15:23](#msg5c9ce6dc51353e5a4dad0b1f)@toomasv fluid4.red still working for Red/GTK but I did not realized there was an issue…. at least on linux and macOS.

toomasv

[15:53](#msg5c9ceddf51353e5a4dad3b71)It was just a design issue I am afraid several of my repos contain - with much articulated styles it is better not to include these in VID box.

greggirwin

[18:21](#msg5c9d10bee4561321d0530f77)Go @rcqls, go! :^)

## Sunday 31st March, 2019

guaracy

[17:29](#msg5ca0f8f15a83c30a46e9a535)is there any mac user here that can run and take a screenshot of this program?  
https://github.com/guaracy/rcalc/blob/master/src/rcalc.red  
TIA

rcqls

[17:44](#msg5ca0fc98a0790b29c93bbd99)\[!\[Capture d’écran 2019-03-31 à 19.44.04.png](https://files.gitter.im/red/GTK/E9v6/thumb/Capture-d\_ecran-2019-03-31-a-19.44.04.png)](https://files.gitter.im/red/GTK/E9v6/Capture-d\_ecran-2019-03-31-a-19.44.04.png)

[17:46](#msg5ca0fcdea0790b29c93bc11c)@guaracy I guess I need to center text on base soon on Red/Gtk!

greggirwin

[17:57](#msg5ca0ff908148e555b22736b4)Looks nice @guaracy!

PeterWAWood

[23:52](#msg5ca152c60aad63501908b35e)@guaracy There are a few left-facing arrows defined in Unicode that you might find suitable for the "delete" button:

```
>> #"^(2B05)"
== #"⬅"
>> #"^(2906)"
== #"⤆"
```

[23:55](#msg5ca15361f851ee043d3e13bc)There is also a single character "del" but it my be a little small:

```
>> #"^(2421)"
== #"␡"
```

[23:56](#msg5ca153a3759abc043c4560fd)... and as far as I know it is only available in English :frowning:

## Monday 1st April, 2019

guaracy

[03:22](#msg5ca183dea0790b29c93f239a)Thanks @rcqls .  
Thanks @PeterWAWood . I think i'll use the char #"^(232B)".

PeterWAWood

[04:44](#msg5ca1971593fb4a7dc2b3b595):thumbsup:

## Tuesday 2nd April, 2019

rebolek

[08:17](#msg5ca31aaab34ccd69e74f7085)@rcqls see this code:

```
view [panel blue [text "a"] panel green [text "b"]]
```

In `GTK` branch I see two colorless panels with "a" and "b"  
In `GTK-dev` branch, I see one green panel with "b"

rcqls

[08:33](#msg5ca31e523ebbdc55b349fe25)@rebolek Thanks to provide this minimal example. I realized this too and alread tried to fix this bug that I already met in the explore.red developped by @toomasv. But it was without any success. It was also a consequence of your last discussion in `red/gui-branch`. I’ll work on that soon… I guess (and pretty sure) that putting transparency you could see both color.

[08:35](#msg5ca31ed98148e555b2359ced)`view [panel 255.0.0.128 [text "a"] panel 0.255.0.128 [text "b"]]`

rebolek

[08:37](#msg5ca31f2e8148e555b2359f03)interesting, thanks!

loziniak

[10:55](#msg5ca33fb4a0790b29c94b0cd7)Hi! This code does not work under linux/GTK (rebolek's nigtly from yesterday) for me:  
`view [backdrop 0.0.0]`. Instead black background I get default system color. Under Windows (wine, console-view.exe from 8 feb), background is black.

[11:00](#msg5ca340c5759abc043c5288f6)It also does not work for text: `view [text "test" yellow]`

rcqls

[11:04](#msg5ca341afb34ccd69e7507e57)Both examples work on `rcqls/GTK-dev`...

loziniak

[11:25](#msg5ca3468f8148e555b236b12e)confirmed. perhaps @rebolek compiles from other branch?

rcqls

[11:26](#msg5ca346c83ebbdc55b34b0fa4)From `red/GTK`...

rebolek

[12:09](#msg5ca350f25a83c30a46f9a669)@loziniak @rcqls yes, `red/GTK` for now. I was migrating build server from one machine to other, that's almost done, building works, I just need to solve some https certificates problems (I believe. Server is accessible over IP address, but not with name) and once everything is ready, I'll add building of `rcqls/GTK-dev` branch.

rcqls

[14:27](#msg5ca371678148e555b237e157)@rebolek Thanks again for the minimal example of this morning. It helps me a lot to focus on the problem and fix it since it was something related to gtk stuff difficult to guess. By using `gtk.reds` project I could reproduce the same problem and then fix it in 2 hours when I would be discouraged to find the solution otherwise. Example given in gui-branch mostly works now too ….

[14:32](#msg5ca372818148e555b237ebe2)EmptyCore.red is working better and explore.red is not fixed completely since background now hide the text-list….

rebolek

[14:57](#msg5ca37857016a930a454ee53d)@rcqls you're welcome. I was working on fix for the example from GUI room and it was still strange, so I needed to minimize the code to see, if it's GTK problem or problem with my code. I would love to do some automated GUI testing, that would be possible for simple examples with `base`, but how to it for multiplatform OS-based GUI...that I don't know.

rcqls

[15:14](#msg5ca37c6c93fb4a7dc2c0ca1a)I followed your discussion on the GUI room and by testing the example of @toomasv I recognized the bug that I was tracking. With your minimal example it was even simpler. Automated gui testing would be awesome above all for me since I never know when a fix could imply a regression. My only way is to play with examples in tests, code, community repo and contributors….

[15:22](#msg5ca37e2fa0790b29c94ce2ab)As I told you, this fix imply now issues in another examples…. need to find another solution...

rebolek

[15:30](#msg5ca380028148e555b2384936)I can imagine testing things like `base` and `panel`, stuff that is OS-independent. And @hiiamboris has something like that I believe (I haven't tested it yet, unfortunately).

hiiamboris

[15:36](#msg5ca38175759abc043c545132)Everything you can get a snapshot of with `to-image` can be tested. Combine it with cross platform KB/mouse input synthesis and you can even test interactive part of the GUI (which really sucks right now).

rebolek

[15:37](#msg5ca381c8759abc043c5453c4)@hiiamboris as I wrote, this can work for `base`, but I can't imagine testing `button` that way. Not only it seems different on every platform, but it can look very different on same platform also.

hiiamboris

[15:38](#msg5ca381dff851ee043d4d0bc1)For multiple platforms support just have a set of testable parameters for each platform, what's the problem?

rebolek

[15:39](#msg5ca382317ecbdc29caea4190)What testable parameters? What if button slightly truncates your text, centers it improperly or something like that?

hiiamboris

[15:41](#msg5ca3829b31aec969e83e9d6c)So what? Truncation can be detected by comparing glyph boxes to what is expected. Centering is already kinda tested in base-test. Keep in mind that even base is rendered by totally different typesetters with different fonts.

[15:41](#msg5ca382c0f851ee043d4d14a5)My point is, if you can detect something is off with your eyes, surely the code can do that too ☻

rebolek

[15:42](#msg5ca382fa1f6e900d5ec7f12f)Of course it can, it's easy to setup on one machine, but much harder to do multiplatform, accounting for different GUI settings on each platform, that's my point.

[15:44](#msg5ca38353bd70a40d5fe3bbb8)Eyes have no problem comparing for example normal GUI with dark-mode GUI, doing it in code is different beast.

hiiamboris

[15:46](#msg5ca383e6759abc043c546319)Base-test accounts for OS color scheme.  
On GUI settings I agree. Currently we have W8.1-like, and some Mac and Linux test environments, while every other platform and various user-defined configurations are left off. TDD has its' limits of course.

rcqls

[17:41](#msg5ca39ee21f6e900d5ec8c87d)The solution was hopefully good but by accident this was disabled for base element. Now it is ok… And as a bonus, explore.red of @toomas is much better...

[17:43](#msg5ca39f2b25686a7dc3c42ac6)\[!\[Capture d’écran 2019-04-02 à 19.41.04.png](https://files.gitter.im/red/GTK/fAWG/thumb/Capture-d\_ecran-2019-04-02-a-19.41.04.png)](https://files.gitter.im/red/GTK/fAWG/Capture-d\_ecran-2019-04-02-a-19.41.04.png)

rebolek

[17:44](#msg5ca39f6f3ebbdc55b34d9fcb):clap:

rcqls

[17:45](#msg5ca39fd73ebbdc55b34da1a8):smile:

toomasv

[19:11](#msg5ca3b3d61f6e900d5ec95d78)@rcqls :+1:

## Thursday 4th April, 2019

greggirwin

[19:44](#msg5ca65e9631aec969e851895c)Woohoo!

## Sunday 14th April, 2019

loziniak

[00:05](#msg5cb2792c25686a7dc328348c)Hi! In \*rcqls/GTK-dev* build from 31.03 With this code I get a resizable window (without `/flags [] 'resize`). Also `origin 0x0` does not work in Windows (wine). In GTK it works, but gets reset when resizing.

```
view [
	on-resizing [
		xmenu/size/y: face/size/y
	]
	xmenu: panel 100.100.100 [
		origin 0x0
		button "test"
	]
]
```

rcqls

[04:40](#msg5cb2b9abbd70a40d5f47f395)Thanks for reporting it….

greggirwin

[16:42](#msg5cb362df8148e555b2a42a21)@loziniak can you post a screenshot of it not working on Wine Windows? Seems fine here on Win10 (not Wine).

## Monday 15th April, 2019

loziniak

[21:58](#msg5cb4fe86759abc043cc9b2fb)\[!\[obraz.png](https://files.gitter.im/red/GTK/jzm0/thumb/obraz.png)](https://files.gitter.im/red/GTK/jzm0/obraz.png)

[21:59](#msg5cb4feba016a930a45c6a411)@greggirwin upper one is Linux, bottom one is on Wine.

greggirwin

[22:11](#msg5cb5017d759abc043cc9c264)You're setting the panel height in `on-resizing`, so the bottom one, under Wine, is correct.

[22:11](#msg5cb50197a84e0c501a3983af)The Linux version seems incorrect there.

loziniak

[22:37](#msg5cb50799bd70a40d5f56e280)But panel's origin is set on creation.

greggirwin

[22:54](#msg5cb50bb593fb4a7dc236481a)And resizing happens after that.

```
view [
    on-resizing [
print 'resizing
        xmenu/size/y: face/size/y
    ]
    xmenu: panel 100.100.100 [
        origin 0x0
        button "test"
    ]
    do [print 'creating]
]
```

loziniak

[23:01](#msg5cb50d398148e555b2af6263)You missed my point. I wanted to bring attention to the fact that origin is set wrong on bottom (Wine) image in my opinion.

[23:03](#msg5cb50dd1016a930a45c6fd21)And even if Linux one is set to 0x0 at the beginning, it gets back to 10x10 when resizing, for no understandable reason.

greggirwin

[23:29](#msg5cb513ea20fbe911eec06657)I must be missing something. Do you want the `panel` to be at 0x0 or the `button` to be at 0x0?

loziniak

[23:30](#msg5cb5142e8148e555b2af8c20)I want panel to be at 0x0

[23:31](#msg5cb514491f6e900d5e3c836c)But I figured it out - what I needed was `view/tight`.

greggirwin

[23:31](#msg5cb5145525686a7dc33941d2)Then you need to set the origin for the `layout`. What you have now sets the origin for things \*inside* the panel.

[23:33](#msg5cb514c593fb4a7dc2367b69)

```
view [
    on-resizing [
        xmenu/size/y: face/size/y
    ]
    origin 0x0
    xmenu: panel 100.100.100 [
        button "test"
    ]
]
```

loziniak

[23:36](#msg5cb5157025686a7dc33948ed)Thank you.

greggirwin

[23:37](#msg5cb5159d759abc043cca4856)Happy to help. :^)

loziniak

[23:50](#msg5cb518babd70a40d5f57519c)I'm reading this guide to creating own styles: http://red.qyz.cz/writing-style.html . It is describing a case, where we start with `base` and create everything from scratch. Is there a way to start with some existing facet, eg. `button` and just add to it, for example draw a line on button's border in it's `redraw` function?

## Tuesday 16th April, 2019

greggirwin

[00:08](#msg5cb51cf9b34ccd69e7c51ee0)If you start from `button`, you're using a native widget and can't draw on it. If you start from `base`, you can do anything you want.

loziniak

[00:10](#msg5cb51d88bd70a40d5f576cce)Yes, but I don't want to re-invent the wheel.

[00:13](#msg5cb51e2d31aec969e8b103db)So a `field` also cannot be styled?

[00:15](#msg5cb51ea0a0790b29c9c2eb13)Do I have to re-program it from scratch - drawing letters on keyboard events etc?

greggirwin

[00:18](#msg5cb51f47b34ccd69e7c52ad8)You can't style native widgets, but check out what @toomasv has done with the `rich-text` style.

loziniak

[00:24](#msg5cb520b220fbe911eec0b48e)You mean this? https://github.com/toomasv/learning/tree/master/snippets/rich-text

greggirwin

[00:33](#msg5cb522e51f6e900d5e3ce2f4)Yes, he may have some gists as well.

loziniak

[00:35](#msg5cb523361f6e900d5e3ce571)I was thinking more about styling input widget (border, paddings etc.), than styling text inside widget.

[00:35](#msg5cb523560aad6350198e2ceb)So, only reasonable facet to use when writing styles, is `base`?

greggirwin

[00:40](#msg5cb52483a84e0c501a3a5c54)Yes, for now. @rebolek and @hiiamboris will probably chime in, as they've done the most in that area.

toomasv

[04:14](#msg5cb556bb25686a7dc33ad09a)@loziniak Actually, at least on Windows you can kind of draw on button, e.g.:

```
view compose/deep [
    button "OK" 50x25 with [
        image: (draw 50x25 [circle 25x12 10])
    ][unview]
]
```

[04:19](#msg5cb557e1a84e0c501a3b8c9b)\[!\[image.png](https://files.gitter.im/red/GTK/whCr/thumb/image.png)](https://files.gitter.im/red/GTK/whCr/image.png)

[04:39](#msg5cb55c958148e555b2b14ff8)I don't know if this works in GTK though.

hiiamboris

[08:00](#msg5cb58b981f6e900d5e3f6616)Yes, AFAIK `draw` and `image` facets are processed for every face out there. There is absolutely no trouble in painting over a button or anything at least in Windows on API level, but in Red so far some parts might not work (like bare `draw` with a button). You just can't un-draw the native part ☺

[08:05](#msg5cb58caf93fb4a7dc2399557)I'm using `base` when I don't like not how the native control looks, but rather how buggy it is working.

greggirwin

[15:52](#msg5cb5fa3925686a7dc33f651d)Nice workaround @toomasv. That can be useful, I think, as the modern flat look may not require visible changes when clicked, etc. In the end, it's as much work to use `base` if you need full control and more visible interaction. This is where @rebolek may be the most help, with his work and docs on creating styles from scratch. Once we have a template for people to use, it will be easier. Getting an effect pipeline in place will be nice, too, for things like a disabled look and nice visuals. R2 had an `extend` effect, which let you create very small image resources that it would "stretch" at runtime. Just create the borders you want, and a solid or gradient center, and you can do great stuff. @rgchris was the king at creating those images.

pekr

[16:11](#msg5cb5fec3b489bb6ed7739bf2)Yes, those "capsule" looks. The great times of Rebol/IOS :-)

rebolek

[16:16](#msg5cb5fffb97dcb371d8c1f4e7)Extend was great for 90's style buttons, just like shadow was the defining look of 00's. 10's with their flat look are ending soon, who know what effect will be the theme of 20's?

pekr

[16:19](#msg5cb600884b4cb471d907f190)Well, even for flat look, you need a visual response to clicks, etc.

rebolek

[16:20](#msg5cb600b58790b0307eaf719d)Certainly.

pekr

[16:21](#msg5cb6010e4b4cb471d907f5f2)Good stress test would be to do some button simple style using draw. Is that already possible? I mean - all event types are there for draw elements? Well, maybe the discussion belongs to the gui group ....

rebolek

[16:21](#msg5cb60120a4ef097471ab44b4)Right, let's move there.

## Saturday 20th April, 2019

rcqls

[15:30](#msg5cbb3b23375bac7470d78088)@toomasv Almost there… Still a weird bug I am fighting occurring at the very first time when tree is expanded (edge is always above eventhough the order is updated in the graph pane). The temporary trick to make thing workng is to reverse twice the graph pane… But good news when this bug would be fixed I know that the main result would be there….

[15:31](#msg5cbb3b3a3d78aa6c03663d71)\[!\[Capture d’écran 2019-04-20 à 17.23.42.png](https://files.gitter.im/red/GTK/QbWn/thumb/Capture-d\_ecran-2019-04-20-a-17.23.42.png)](https://files.gitter.im/red/GTK/QbWn/Capture-d\_ecran-2019-04-20-a-17.23.42.png)

toomasv

[15:46](#msg5cbb3ef23d78aa6c03665890)@rcqls Fantastic! It seems text is positioned a bit differently on token-boxes?  
BTW There is \[new version](https://github.com/toomasv/ast/blob/master/ast.red). I wonder if this works as well. It speeds up expanding longer code.

rcqls

[16:03](#msg5cbb42e6e416b84519afd691)@toomasv Thanks for noticing this new version! This version fixes the bug I had…. If I brave enough I will try to create a minimal example from your old version to reproduce the bug. But thanks to you (and your new version), it could be done later…. As you say, this version is more reactive. The not perfect positionning is something I know… I have to test now the details of your ast script. I guess that some smaller issues will occur. Thanks for your excellent job that motivates me to improve Linux/GTK…

toomasv

[16:05](#msg5cbb432f4b4cb471d92b41d1)Thanks, @rcqls ! Ah, `info.red` is also renewed.

rcqls

[16:17](#msg5cbb46043d78aa6c03668c5e)@toomasv I do `git pull` so I guess I have your new `info.red` too! I tried to compile a test code with your ast but `default?` is not defined and I don’t know where it is in my repo that I « grepped ».

toomasv

[16:35](#msg5cbb4a3f8790b0307ed282f2)@rcqls Corrected. (Delete `default?` line in `colorize`)

rcqls

[16:40](#msg5cbb4b618790b0307ed28939)@toomasv It compiles now but it fails at execution (maybe because I included badly `environment/console/help.red` to have help-string.

[16:40](#msg5cbb4b7097dcb371d8e5020f)But no emergency….

toomasv

[16:44](#msg5cbb4c838446a6023e49f205)@rcqls Uploaded new fix - include colors directly.

[16:46](#msg5cbb4cf9375bac7470d7f071)I haven't worked on compiling yet. There may be more problems

rcqls

[16:48](#msg5cbb4d551cd0b8307d445aab)@toomasv Don’t worry, as I said, there is no emergency… I was just curious to see if this excellent tools could be provided as a simple binary.

toomasv

[16:49](#msg5cbb4d7e8446a6023e49f6b5):+1:

[17:42](#msg5cbb5a1a6a84d76ed8c72b98)@rcqls I am curious -- do edge menu items work as expected?

rcqls

[17:47](#msg5cbb5b2e5b3f941aa5634c37)\[!\[Capture d’écran 2019-04-20 à 19.46.51.png](https://files.gitter.im/red/GTK/sbag/thumb/Capture-d\_ecran-2019-04-20-a-19.46.51.png)](https://files.gitter.im/red/GTK/sbag/Capture-d\_ecran-2019-04-20-a-19.46.51.png)

[17:47](#msg5cbb5b4d8790b0307ed2fe6d)@toomasv It seems so? I added a point and dragged the point ….

toomasv

[17:49](#msg5cbb5ba9990feb4518d463dc)Sorry, I mean adding node to edge from edge-menu and from node menu to detach or remove it?

rcqls

[17:54](#msg5cbb5cc4a4ef097471cf4444)I have to learn your tool first since I spent a lot of time debugging. But I’ll tell you soon…. P.S.: your animation demo is no more on Gitter….

toomasv

[17:56](#msg5cbb5d66b489bb6ed7979923)Should be back now.

rcqls

[18:13](#msg5cbb614e6a84d76ed8c75b35)Can’t see it… (The requested URL /images/Graph/parse-tree.gif was not found on this server)

toomasv

[18:21](#msg5cbb631a3d78aa6c0367542d)Reloded gitter?

rcqls

[18:24](#msg5cbb63d5375bac7470d88b2a)Same thing after closing and reopenning Gitter… What about putting this demo on your github account?

[18:33](#msg5cbb65de8790b0307ed34085)@toomasv `ctrl-dragging from a node and releasing mouse over canvas` does not seem to work for macOS at all and on Linux releasing on canvas does not create a new node eventhough the edge is created.

[18:42](#msg5cbb6806e416b84519b0c5af)Of course this is probably bugs coming from these OS GUI implementations, above all the Linux one’s!

[18:44](#msg5cbb6880b489bb6ed797e63d)I am already amazed to see it working in such a way when I se all the dynamic tricks you used in your development…. It’s kind of magic!

toomasv

[18:47](#msg5cbb6927990feb4518d4c04e)OK, thank you! l wrestled long to get it working on Windows. Probably differences in OS code.

rcqls

[18:50](#msg5cbb6a09e416b84519b0d354)I have a working VBox with Win7… I’ll try to get GTK on par with Win7

toomasv

[18:57](#msg5cbb6b8f990feb4518d4d167)Thanks!

rcqls

[19:09](#msg5cbb6e5b6a84d76ed8c7b58e)@toomasv Sorry It works on Linux/GTK when keeping ctrl down…. It creates edge and node!

[19:09](#msg5cbb6e7c375bac7470d8d254)More tests tomorrow!

toomasv

[22:33](#msg5cbb9e3c990feb4518d61b9f):+1:

## Thursday 25th April, 2019

rcqls

[11:34](#msg5cc19b348446a6023e739507)Some news about GTK (rcqls/GTK-dev branch):  
\* para started  
\* improvement in management of view/no-wait  
\* z-order  
\* hidden widget working at initialization  
\* OS-image/clone fixed (used in image copy)  
\* RED\_GTK\_STYLES environment variable preset to a gtk.css file changes application style  
\* buttons are now more compact and fit better…

rebolek

[11:35](#msg5cc19b694b4cb471d95510e7):clap:

pekr

[11:36](#msg5cc19ba35b3f941aa58c6ac5)That's really great!

rcqls

[11:40](#msg5cc19c944b4cb471d9551b3d)\[!\[Capture d’écran 2019-04-25 à 13.38.50.png](https://files.gitter.im/red/GTK/vUQT/thumb/Capture-d\_ecran-2019-04-25-a-13.38.50.png)](https://files.gitter.im/red/GTK/vUQT/Capture-d\_ecran-2019-04-25-a-13.38.50.png)

[11:41](#msg5cc19cdca4ef097471f85baa)Thanks @rebolek and @pekr! This is an example with Yosemite style found at \[https://www.gnome-look.org](https://www.gnome-look.org)

[11:44](#msg5cc19da697dcb371d80f1bfa)\[!\[Capture d’écran 2019-04-25 à 13.43.27.png](https://files.gitter.im/red/GTK/n7t0/thumb/Capture-d\_ecran-2019-04-25-a-13.43.27.png)](https://files.gitter.im/red/GTK/n7t0/Capture-d\_ecran-2019-04-25-a-13.43.27.png)

[11:45](#msg5cc19deea4ef097471f863e7)Another example just to show how it is easy to change theme (only RED\_GTK\_STYLES environment variable changed)

pekr

[11:48](#msg5cc19e7a990feb4518fd9e88)@rcqls so what is actually missing to be on par with the Win/Mac View ports?

rebolek

[11:51](#msg5cc19f5b97dcb371d80f268e)Mainly stability fixes, IMO.

rcqls

[11:53](#msg5cc19fc7a4ef097471f86f88)@pekr Diificult to say… but camera is to develop, rich-text and draw need to be improved (at least draw shape sub dialect). And of course stability fixes as mentionned by @rebolek. However macOS backend is not so stable too. …

[11:57](#msg5cc1a0bb4b4cb471d95538dc)The good news for me is that I am closer and closer to my main objective to have a first good overall of GUI on Linux (not perfect but you can play with). As an objective, scripts on repo red/code and red/community are working (with a few exceptions I guess).

endo64

[12:16](#msg5cc1a51f2e2caa1aa6b81757)Great work @rcqls !

rcqls

[12:17](#msg5cc1a5698790b0307efc60b1)Thanks @endo64 !

toomasv

[12:31](#msg5cc1a8ac6a84d76ed8f131f9)@rcqls Bravo! :clap:

rcqls

[12:34](#msg5cc1a959e416b84519da5b81)Thanks @toomasv and your makedoc (easy-VID-rt.red) is working now pretty well on linux (except som few details of course). But the good news, one can learn red GUI with this tools that you revisited….

ldci

[12:52](#msg5cc1ad8f1cd0b8307d6e6889)@rcqls Superb:) BTW redCV update is here : https://github.com/ldci/redCV

rcqls

[13:22](#msg5cc1b4918790b0307efcc248)@ldci Great! I’ll try to make some improvements to have redCV working better on Linux. Don’t know yet if `image/clone` was infirectly used in redCV…. (BTW, I have already redCV git repo on my computer only need to git pull).

greggirwin

[17:31](#msg5cc1eef72e2caa1aa6ba4186)Thanks for the continued progress and updates @rcqls. Great stuff.

rcqls

[17:32](#msg5cc1ef2b5b3f941aa58ed1fd)@greggirwin Thanks!

dander

[18:37](#msg5cc1fe61990feb4518006626)@rcqls great job! It will be interesting to see how more Linux enthusiasts may be drawn to Red from this work. Incidentally, I wanted to test it out using WSL on Windows with an X-server application, but unfortunately discovered that WSL does not support (and has no plans for) running 32-bit Linux assemblies :(

rcqls

[18:46](#msg5cc200a0b4700e023dd085c2)@dander Thanks! Too bad for WSL… But are you sure about the double architecture (32bits running in 64bits) as it is on a Linux 64bits? If you have a link about this news, I would be interested just out of curiosity. I guess that you have already tried this 64bits install:

```
dpkg --add-architecture i386
apt-get update
apt-get install libc6:i386 libcurl4:i386
```

dander

[18:54](#msg5cc2024ba4ef097471fb46c8)@rcqls this seems like the clearest indication: https://wpdev.uservoice.com/forums/266908-command-prompt-console-windows-subsystem-for-l/suggestions/13377507-please-enable-wsl-to-run-32-bit-elf-binaries  
Just looking things up again, I did run across \[this reference](https://github.com/Microsoft/WSL/issues/390#issuecomment-480627111) to using qemu-user, which I'm not familiar with. Maybe that would be a viable workaround...

rcqls

[19:01](#msg5cc20406b489bb6ed7c46ec8)@dander Thanks for the links… It seems to confirm what you said. qemu is mostly like VirtualBox. The last one is easier to use. I think that Vagrant is a good tools to create i(n a similar way docker does) a Vagrant File in order to build a VirtualBox for testing GTK. I’ll try to do it.

dander

[19:08](#msg5cc205973b6cb0686a517e57)Okay, I think Docker is fine in general. I wouldn't want to derail you from your other activities, but if you think that would be useful, it's probably more realistic than piping the UI an X server in Windows. \[Hyper-V support](https://www.hanselman.com/blog/UsingEnhancedModeUbuntu1804ForHyperVOnWindows10.aspx) has also gotten a bit better for running Ubuntu. I haven't tried with VirtualBox for a while, so I don't know what its support is like for graphical acceleration

rcqls

[19:11](#msg5cc20659990feb451800a013)@dander I’ll need to create a VirtualBox via Vagrant in order to test future development on camera (not accessible via docker). Remember that Iam currently working on macOS…

[21:27](#msg5cc2262b4b4cb471d958f41a)\[!\[Capture d’écran 2019-04-25 à 23.19.43.png](https://files.gitter.im/red/GTK/k3Y1/thumb/Capture-d\_ecran-2019-04-25-a-23.19.43.png)](https://files.gitter.im/red/GTK/k3Y1/Capture-d\_ecran-2019-04-25-a-23.19.43.png)

[21:27](#msg5cc22634b489bb6ed7c56aad)@ldci Linux is closer to redCV … Not everything tested but Conversion seems to work too.

## Friday 26th April, 2019

rcqls

[05:52](#msg5cc29cb3b489bb6ed7c85253)Testing further redCV examples… it seems that everything is fine now… except video sruff depending on camera.

ldci

[11:27](#msg5cc2eb268446a6023e7c98fe)@rcqls Great news. I think you can also test opencv: libs for linux are included. Regards

rcqls

[11:54](#msg5cc2f16c1cd0b8307d77238a)@ldci Which file for example? BTW i added some comment on the compilation of redCV script at the end of the README of this project \[https://github.com/rcqls/reds](https://github.com/rcqls/reds) that makes easier to compile red script from red source repository.

[11:57](#msg5cc2f21ae416b84519e3482e)@ldci sorry I misunderstood your message….

ldci

[11:59](#msg5cc2f28e2e2caa1aa6c10989)@rcqls : For opencv https://github.com/ldci/OpenCV3-red/DLLs/Linux/...

rcqls

[11:59](#msg5cc2f2a3e416b84519e34ca1)@ldci Already there!

ldci

[12:01](#msg5cc2f3132e2caa1aa6c10ea7)@rcqls Ok: you can test /samples\_gu.red/

rcqls

[12:01](#msg5cc2f32fe416b84519e351be)@ldci Thanks! I will do...

ldci

[12:02](#msg5cc2f36eb4700e023dd6c508)@Rcql I'll test on virtual box ASAP

rcqls

[12:18](#msg5cc2f728b4700e023dd6e286)@ldci just to let you know that there is some missing dependencies:

```
...
	libjpeg.so.8 => /usr/lib/i386-linux-gnu/libjpeg.so.8 (0xf51f3000)
	libpng12.so.0 => not found
	libtiff.so.5 => /usr/lib/i386-linux-gnu/libtiff.so.5 (0xf5174000)
	libjasper.so.1 => not found
	libgtk-x11-2.0.so.0 => /usr/lib/i386-linux-gnu/libgtk-x11-2.0.so.0 (0xf4c7f000)
	libgdk-x11-2.0.so.0 => /usr/lib/i386-linux-gnu/libgdk-x11-2.0.so.0 (0xf4bbe000)
	libdc1394.so.22 => not found
	libavcodec.so.54 => not found
	libavformat.so.54 => not found
	libavutil.so.52 => not found
	libswscale.so.2 => not found
...
```

The problem is also that I have `libpng16.so.16.34.0` installed…. So maybe it is easier for me to idrectly install opencv in my docker container. BTW,, if you are on macOS instead of VB you can also try my project \[https://github.com/rcqls/docker-red-gtk](https://github.com/rcqls/docker-red-gtk) which combined with the `reds` project provide workflow :  
\* crosscompile on macOS  
\* run on lInux

You can also have this workflow with VirtualBox…

ldci

[13:38](#msg5cc309ea375bac74700be313)@rcqls Yes for OpenCV (compiled a long time ago) there are lib dependencies. Th best way is to use a fresh openCV (2 or 3 branch) and to compile in 32-bit the libs. Then update paths according your OS. I made test under VB. Compilation is OK but a lot of pointer errors. Nevertheless GUI is OK.

rcqls

[13:41](#msg5cc30a702e2caa1aa6c1cdf6)@ldci Could you please point me the samples that does not work well with Red/GTK?

[13:42](#msg5cc30ac4375bac74700be8b6)I guess that your plugin is not comptabible with opencv4…

ldci

[13:47](#msg5cc30c00375bac74700bf406)@rcqls Oups, I was talking about redCV for te samples. I'll test ASAP all samples . For OpenCV4 you're right. OpenCV4 is 100% C++ code now .

rcqls

[13:49](#msg5cc30c5d3d78aa6c039b3722)@ldci Yes I understood that you were talking about redCV. Still interested on samples with pointer errors since I can’t remember to have this issue.

[23:01](#msg5cc38db33b6cb0686a5c0412)@dander and others willing to test red/GTK inside VirtualBox (via Vagrant), see \[https://github.com/rcqls/vagrant-red-gtk](https://github.com/rcqls/vagrant-red-gtk).

dander

[23:13](#msg5cc3909897dcb371d81cbfad)@rcqls nice! I'll try to give it a look over the weekend

## Saturday 27th April, 2019

rcqls

[04:45](#msg5cc3de7e2e2caa1aa6c74dc6)@dander Only tested on macOS… The red-gtk-dev vbox is from now only useable on command line via `vagrant ssh` and it works well on macOS. Don’t know if you’ll need to adapt vagrantfile for windows ssh connection. Hope it works as is on windows too since it is also the goal. I did not find more recent ubuntu linux i3!6 box. Maybe I’ll try to create more vagrantfiles with 64bits ubuntu/debian box.

[07:06](#msg5cc3ff672e2caa1aa6c81d6f)@dander I found a Debian-9.6 more recent and which seems lighter too.

## Sunday 28th April, 2019

rcqls

[19:01](#msg5cc5f89f8790b0307e194883)Even if Red/GTK is still in development , I think it is pretty useable now and I prepared a \[`red-gtk`](https://toltex.u-ga.fr/users/RCqls/Red/red-gtk) binary to complete the `console-view`. The `red-gtk` binary provides compilation of red and reds script without the need of compilation from source

[20:21](#msg5cc60b64375bac74701f9daa)BTW, improvements on image making `redbox` and `retris` (almost) available on Linux...

[20:22](#msg5cc60b6f8790b0307e19c967)\[!\[Capture d’écran 2019-04-28 à 22.18.03.png](https://files.gitter.im/red/GTK/TGpt/thumb/Capture-d\_ecran-2019-04-28-a-22.18.03.png)](https://files.gitter.im/red/GTK/TGpt/Capture-d\_ecran-2019-04-28-a-22.18.03.png)

[20:22](#msg5cc60b743b6cb0686a6c6513)\[!\[Capture d’écran 2019-04-28 à 22.20.01.png](https://files.gitter.im/red/GTK/jfiQ/thumb/Capture-d\_ecran-2019-04-28-a-22.20.01.png)](https://files.gitter.im/red/GTK/jfiQ/Capture-d\_ecran-2019-04-28-a-22.20.01.png)

greggirwin

[21:52](#msg5cc620b7375bac7470202228)Excellent!

## Monday 29th April, 2019

toomasv

[03:06](#msg5cc66a1e4b4cb471d97591f6)@rcqls :+1:

Oldes

[15:50](#msg5cc71d48b489bb6ed7e6b85e)@rcqls as a complete newbie in the GTK land, after a little bit reviewing your code and some GTK documentation, is there any reason why you don't use \[GtkFixed container](https://developer.gnome.org/gtk3/stable/GtkFixed.html)?

[15:54](#msg5cc71e272e2caa1aa6dc6a03)@rcqls you are using \[GtkLayout](https://developer.gnome.org/gtk3/stable/GtkLayout.html), right?

[15:57](#msg5cc71ece5b3f941aa5b13cde)Ok... I see it now: \_GtkLayout, which shares the ability to perform fixed positioning of child widgets and additionally adds custom drawing and scrollability._

[15:57](#msg5cc71ee11cd0b8307d92ed2a)That explains the main reason.

dander

[16:05](#msg5cc720b42e2caa1aa6dc7b91)@rcqls I tried using your Vagrant setup, but had some trouble. It got so far as trying to SSH into the box, but timed out. It might just be a problem with the setup of VirtualBox/Vagrant on my system though. The VirtualBox manager interface was even hanging. I'll circle back on it again later. I didn't have a ton of time for fiddling with it

rcqls

[23:22](#msg5cc7872d8446a6023e9b5ff8)@Oldes You made the history of the evolution of Red/GTK starting with GtkFixed for longtime as container and then realizing the more flexible GtkLayout that I think I started to use when developping rich-text. Then I realized that it was also useable for base and panel.

[23:29](#msg5cc788dde416b8451902074f)@dander Too bad for ssh communication and I had this doubt for windows. An alternative is to add all the heavy linux stuff in the VBox to have a GNOME installed. But I think that `vagrant ssh` is a really nice feature. Can’t test on Windows…. But I am pretty sure there is a slight change to apply to make it working. Thanks for giving a try!

dander

[23:32](#msg5cc789883b6cb0686a76bc77)@rcqls I think it should be possible to get working. Windows comes with Open SSH preinstalled now, and even offers SSH as a mechanism for Powershell remoting. I'll definitely try to play around with it some more when I can

rcqls

[23:36](#msg5cc78a84375bac747029e571)@dander There is no rush! :thumbsup:

## Tuesday 30th April, 2019

ldci

[09:16](#msg5cc81259375bac74702d7b0c)@rcqls tesseract and red under redGTK: https://drive.google.com/file/d/1InydcCchKj4P5rNwt32KbeQtY0\_pbZPb/view?usp=sharing

greggirwin

[17:52](#msg5cc88b6f375bac747030fcf0)Wow!

ldci

[20:12](#msg5cc8ac32a4ef097471286250)@greggirwin Red is really fantastic :)

## Thursday 2nd May, 2019

rcqls

[14:04](#msg5ccaf908e416b8451919f0e9)I updated the \[wiki page about GTK binding](https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development) by adding the `red-gtk` binary link and info about the requirements for linux/GTK.

guaracy

[14:49](#msg5ccb0387990feb45183d99e5)Thanks @rcqls. I think \[red-gtk](https://toltex.u-ga.fr/users/RCqls/Red/red-gtk) was updated too. Will be update allways? Can i use it instead of console-view?

rcqls

[14:57](#msg5ccb054e5b3f941aa5ccd98e)@guaracy When changes are significant I’ll update `red-gtk` (I have a script that do that in less than 30 sec). Let's notice that `console-view` binary from my website is more unstable since it is updated at every compilation of new development (which can introduce bad regressions) when `red-gtk` is not automated (and then more stable eventhough not perfect yet). `red-gtk` provides compilation of red and R/S scripts when `console-view` don’t. Also like the `red` binary, the console is compiled at the first use of `red-gtk` allowing it to be used as the console.

## Thursday 9th May, 2019

rcqls

[06:26](#msg5cd3c807e7f42160fa5a17df)@toomasv Thank to your experimental example on toggle buttons, I fixed an issue of copying image in some special case never met before. Now, it works eventhough it is not perfect because of rounded corners and get-size font not perfectly recognized (but I already know this issue).

toomasv

[06:35](#msg5cd3ca480824230a7703520f)@rcqls Hooray!

giesse

[19:17](#msg5cd47ce50f381d0a768a4e29)anyone here familiar enough with https://appimage.org/ to create one for Red GTK?

rcqls

[19:24](#msg5cd47e6f6fd7c11cd88d59c1)@giesse Interesting! Long time ago when I was exclusively a linux user, I was interested in such kind of project (don’t know if it was exactly this one)…

dander

[19:33](#msg5cd4807bda34620ff9133c28)@giesse that really is quite cool. I'll need to look into this a bit more when I have some time

rcqls

[19:36](#msg5cd48122f251e60ffa53862f)After a quick reading (notably this page \[https://docs.appimage.org/packaging-guide/manual.html#ref-manual](https://docs.appimage.org/packaging-guide/manual.html#ref-manual)), I think it is easy to pack into an appimage the gtk dependencies beside the red-gtk binary.

## Friday 10th May, 2019

giesse

[05:04](#msg5cd506400824230a770c6984)For the record, there are three competing "standards" for this:

https://flatpak.org/  
https://snapcraft.io/  
and the one I posted https://appimage.org/

(I bet there are even more, those are the well known ones). AFAIK AppImage is the most independent, flatpak is a RedHat/Fedora thing and Snap is a Ubuntu thing. (All three should work on all distributions.) I also am under the impression that AppImage is the easiest to work with, but I haven't looked at them closely enough.

pepdiz\_twitter

[09:22](#msg5cd542ebf52a23751609337e)hello all

[09:23](#msg5cd54315e7f42160fa64a3fd)I'm just starting to use red ( I come from rebol 2) and I think the job getting done is amazing

[09:23](#msg5cd5432cbdc3b64fcf20196a)Is there the appropiate place to discuss bugs or code?

[09:24](#msg5cd5433379d700509947bb93)is here, i mean

PierreChTux\_twitter

[09:28](#msg5cd544218fcdb05d47af050e)@giesse not familiar with, but that definitely would be a very useful thing.

&lt;dream&gt;I'd just like to be able to `apt install red-lang` on the Debian servers I use. All dependencies solved. Same for Red Hat or any other distro, of course.&lt;/dream&gt;

[09:30](#msg5cd544a1252dbb7515311350)&gt; Is there the appropiate place to discuss bugs or code?

I suppose so, yes. For less informal discussions, github issues etc. would be more appropriate, I guess.

toomasv

[11:11](#msg5cd55c4b5a887e1cd9c323c0)@pepdiz\_twitter Welcome! Discussion of bugs in red/bugs. But see also https://gitter.im/red/home

giesse

[18:35](#msg5cd5c465252dbb751534dd4e)@PierreChTux\_twitter creating a .deb package is easy (I've done plenty of that). Creating a PPA for Ubuntu is also easy. Convincing Debian to have it in their default repositories is a different matter. Being limited to 32bit only is the main issue; otherwise there wouldn't be much in terms of dependencies (especially on servers when you don't care about the GTK).

PierreChTux\_twitter

[22:33](#msg5cd5fc39bdc3b64fcf2574de)@giesse "Convincing Debian to have it in their default repositories is a different matter." OH YES!

## Tuesday 14th May, 2019

rcqls

[08:48](#msg5cda80d1f251e60ffa7c1191)Before integration on red/GTK, I would appreciate testers on the binary \[gtkcam](https://toltex.u-ga.fr/users/RCqls/Red/gtkcam) made in red/system (via gtk.reds project). This binary is a first prototype of camera in the red/linux world. It works in a virtualbox on my macos using my macbook webcam. Camera on red/system relies on gstreamer (and indirectly on v4l2). I have chosen `gstreamer` since it provides a lot of multimedia very quickly. From now, additional dependency is `libgstreamer-1.0.so.0`. On my Debian virtual box, I installed the following packages (even though, the two or three first should be enough):

```
apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-pulseaudio
```

Thanks for advance for feedback in real linux box with webcam.

[19:50](#msg5cdb1c066fd7c11cd8b9fd55)@dander Just updated the `vagrant-red-gtk` project. The vagrant files (bento-???) include the dependencies on gstreamer to make camera stuff available.

dander

[20:07](#msg5cdb200bf52a23751630f12c)@rcqls cool! I'll try it out when I get a chance, though I still suspect I may need to uninstall Hyper-V first

rcqls

[20:12](#msg5cdb21346fd7c11cd8ba2282)@dander I quickly checked what you meant and I did not know this issue (also found this \[link](https://marcofranssen.nl/switch-between-hyper-v-and-virtualbox-on-windows/). )

[20:19](#msg5cdb22c2da34620ff94054ac)@dander Reading about vagrant, is it possible to use Hyper-V instead of virtualbox as provider even though there is some limitations with Hyper-V. Can’t test but it is maybe an alternative to adapt the vagrant files.

dander

[20:23](#msg5cdb23dada34620ff9405e24)@rcqls nice link! hopefully I will be able to follow up with both of those options

## Wednesday 15th May, 2019

nodrygo

[06:15](#msg5cdbae8e5a1d435d4643d9ba)hello on Linux Minit19 (ubuntu)  
sudo apt-get install libgstreamer1.0-0:i386 (the only choice)  
get those messages  
`(gtkcam:11999): GStreamer-CRITICAL **: 08:12:38.397: gst_bin_add_many: assertion 'GST_IS_ELEMENT (element_1)' failed (gtkcam:11999): GStreamer-CRITICAL **: 08:12:38.397: gst_element_link_pads_full: assertion 'GST_IS_ELEMENT (src)' failed (gtkcam:11999): GStreamer-CRITICAL **: 08:12:38.397: gst_element_link_pads_full: assertion 'GST_IS_ELEMENT (src)' failed (gtkcam:11999): GLib-GObject-CRITICAL **: 08:12:38.414: g_object_get: assertion 'G_IS_OBJECT (object)' failed (gtkcam:11999): Gtk-CRITICAL **: 08:12:38.414: gtk_widget_set_size_request: assertion 'GTK_IS_WIDGET (widget)' failed (gtkcam:11999): Gtk-CRITICAL **: 08:12:38.414: gtk_container_add: assertion 'GTK_IS_WIDGET (widget)' failed (gtkcam:11999): Gtk-CRITICAL **: 08:12:38.414: gtk_widget_show: assertion 'GTK_IS_WIDGET (widget)' failed`  
may be gtkcam release problem ?

rcqls

[06:20](#msg5cdbafa0252dbb75155c66f3)@nodrygo Thanks for the feedback… It seems that you don’t have the plugins installed for v4l2 which is required for camera. Could you output please `apt search gstreamer`? What it is true, I have to provide better messages output when plugins are not installed.

[09:39](#msg5cdbde596fd7c11cd8bf0477)@nodrygo I confirm your issue since I have installed a linuxmint19 vbox. V4l2src does not work for gstreamer when it does on Debian. Weird! Also gtksink is not recognized …. Maybe it is a pb of old version. Need to check.

## Friday 17th May, 2019

rcqls

[17:42](#msg5cdef298ef853135c8d92049)@nodrygo After finding other alternatives without any convincing success, I tried again to understand why gtkcam was not working on recent linux installation. In fact `v4l2src` has to be enable with `export GST_V4L2_USE_LIBV4L2=1` in the `.bash_profile` (for instance). But it is not enough, `gtksink` is now supposed to be in `libgstreamer-plugins-bad` when it was before in `libgstreamer-plugins-good`. However iin ubuntu based distribution, it is in `gstreamer1.0-gtk3`, so `sudo apt install gstreamer1.0-gtk3` is required. In my VBox with linuxmint, it works now.

## Saturday 18th May, 2019

nodrygo

[06:48](#msg5cdfaaa95b63ea22b3c6abe0)@rcqls yes better thanks now the cam windows open but nothing is displayed and some errors remain  
not really important for me but if that help  
`(gtkcam:310): GStreamer-CRITICAL **: 08:44:55.844: gst_bin_add_many: assertion 'GST_IS_ELEMENT (element_1)' failed (gtkcam:310): GStreamer-CRITICAL **: 08:44:55.844: gst_element_link_pads_full: assertion 'GST_IS_ELEMENT (src)' failed (gtkcam:310): GStreamer-CRITICAL **: 08:44:55.844: gst_element_link_pads_full: assertion 'GST_IS_ELEMENT (src)' failed`

rcqls

[07:28](#msg5cdfb419ad024978c6e7267d)@nodrygo Thanks again for the feedback! Could you try `gst-launch-1.0 v4l2src ! videoconvert ! gtksink` ?

nodrygo

[09:33](#msg5cdfd181d22ba766a2b934b3)@rcqls I do not know these commands  
what should this do ?  
because nothing happens and after a while  
Bus error (core dumped)

trying only ~$ gst-launch-1.0 v4l2src  
Erreur du bus (core dumped)

probably a problem from my Linux installation ?

rcqls

[10:20](#msg5cdfdc5d6366992a94dbf080)@nodrygo just copy paste `gst-launch-1.0 v4l2src ! videoconvert ! gtksink` or `gst-launch-1.0 v4l2src ! gtksink`… Ok, indeed, it looks like your camera is not recognized by your Linux. The command is supposed to launch the webcam.

nodrygo

[10:46](#msg5cdfe26d63dea422b4a2c13a)@rcqls you're right I just launched 'cheese' mode 64B and does not work  
a priori a hardware problem :-(  
so can't help you anymore

rcqls

[10:49](#msg5cdfe34f83ae782aee8b8a1f)@nodrygo Thanks again! Hope you solve your linux installation to have your webcam working. BTW, that’s right, `gst-launch-1.0 v4l2src ! videoconvert ! gtksink` could be tested in 64bits mode too after installing it (of course).

## Monday 20th May, 2019

rcqls

[12:53](#msg5ce2a32eef853135c8f19a66)\[!\[Capture d’écran 2019-05-20 à 14.51.36.png](https://files.gitter.im/red/GTK/u9Ui/thumb/Capture-d\_ecran-2019-05-20-a-14.51.36.png)](https://files.gitter.im/red/GTK/u9Ui/Capture-d\_ecran-2019-05-20-a-14.51.36.png)

rebolek

[12:54](#msg5ce2a3770ec37966a1a00eea)Nice!

rcqls

[12:54](#msg5ce2a384d22ba766a2cc1844)First proto of red/GTK with camera…. Since it is experimental it is activated only if`export RED_GTK_CAMERA=YES`. I’ll push it in `rcqls/red:GTK-dev` soon.

[12:58](#msg5ce2a4679404bf2aed7b3854)@rebolek :thumbsup:

nodrygo

[13:05](#msg5ce2a62c0ec37966a1a027cf)@rcqls congratulations

toomasv

[13:07](#msg5ce2a6870ac9852a950d5d92)@rcqls :clap: :tada:

greggirwin

[13:09](#msg5ce2a6ec879f4478c7af7ccb)Hey, my family used to have a kneeling chair. :^)

rcqls

[13:10](#msg5ce2a729509b1035c77ed8be)@nodrygo @toomasv Thanks! But a lot of test are required notably on linux….

[13:10](#msg5ce2a739ad024978c6faa76c)@greggirwin :smile:

toomasv

[13:12](#msg5ce2a7c1ef853135c8f1bf33)@greggirwin I had similar one for many years on one of my old work-places. Super good for indefinitely long sitting-work.

rcqls

[13:55](#msg5ce2b1e583ae782aee9e13df)Notes for new testers for the experimental red binary \[red-gtk](https://toltex.u-ga.fr/users/RCqls/Red/red-gtk) with camera (only one camera from now supposed to be at the device `/dev/video0`):

\* Config: inside `.bah_profile` (or equivalent):

```
export RED_GTK_CAMERA=YES
export GST_V4L2_USE_LIBV4L2=1
```

\* Additional requirements: (here it is illustrated with )

```
# for gstreamer installation 
apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good 
# optional installation for further
apt-get install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-pulseaudio

#  In case plugin gtksink is not already installed in standard plugins above: 
apt-get install gstreamer1.0-gtk3

# for detection of webcam 
 apt-get install  libgudev-1.0-0
```

\* preliminary test to apply before : `gst-launch-1.0 v4l2src ! videoconvert ! gtksink` which launchs a camera viewer. Normally if this test passes camera is supposed to work inside red.

\* If you test `red/tests/view-test.red` debug mode needs to be deactivated (issue nothing related to camera).

[14:02](#msg5ce2b38c63dea422b4b59310)Just as a comment, snapshot is already implemented in red/system… only integration in red is to be done.

rebolek

[14:03](#msg5ce2b3ad9d64e537bcdeff03)I would love to try it with camera on my rPi, when I get some time.

rcqls

[14:04](#msg5ce2b3fb509b1035c77f38bd)@rebolek Which distrib do you use?

rebolek

[14:04](#msg5ce2b40b509b1035c77f38f9)on rPi? raspbian.

rcqls

[14:05](#msg5ce2b41d7c363c75a7122c39)ok so based on debian

rebolek

[14:05](#msg5ce2b4240ac9852a950dcb31)yes

rcqls

[14:06](#msg5ce2b47a509b1035c77f3c7b)Do you remember the version… I have tested debian-9.6 on VBox

rebolek

[14:09](#msg5ce2b50263dea422b4b5a306)I don't, I can check it later, but I've reinstalled the box like 2-3 months ago, so some recent version.

rcqls

[14:10](#msg5ce2b562509b1035c77f43b9)Ok so good news…. You could easily try the preliminary test when installation is done.

rebolek

[14:20](#msg5ce2b7c9ef853135c8f23d64)Cool.

## Tuesday 21st May, 2019

Respectech

[20:51](#msg5ce464cd75d9a575a61fe1a6)@ldci @rcqls I am wanting to use Red for a project that requires stereo vision and depth calculations. I see that RedCV has some functions defined for this purpose, but I'm not sure how to use it. Are there any ideas? I hope to use an ODROID-N2 with 2x USB3.0 cameras (Debian-based ARM).

rcqls

[22:07](#msg5ce476ab75d9a575a6205c2d)@Respectech Camera is an early development… you can try to install the dependencies mentionned just above to test: `gst-launch-1.0 v4l2src ! videoconvert ! gtksink` as a first set.

PierreChTux\_twitter

[22:23](#msg5ce47a4fef853135c8fe7791)It seems like I've succeeded to make @rcqls 's red-gtk operate my webcam on my \*real* GNU/Linux box.

rcqls

[22:24](#msg5ce47a829d64e537bceb5917)@PierreChTux\_twitter :clap: :thumbsup:

PierreChTux\_twitter

[22:28](#msg5ce47b9c63dea422b4c1e7d9)Here's a summary of tonight's adventure:

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

...

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
 # Test worked: I saw my face.  But 32 bits packages were necessary:


  # root@latitude: ~        < 2019_05_21__23:45:37 >
apt install libgstreamer1.0-0:i386 gstreamer1.0-plugins-base:i386 gstreamer1.0-plugins-good:i386 gstreamer1.0-tools:i386 gstreamer1.0-x:i386 gstreamer1.0-pulseaudio:i386 gstreamer1.0-gtk3:i386 libmjpegutils-2.1-0:i386 libmpeg2encpp-2.1-0:i386 libmplex2-2.1-0:i386
...

  # pierre@latitude: ~        < 2019_05_21__23:47:35 >
./gtkcam
```

[22:29](#msg5ce47bc5879f4478c7bc6849)And here's the output:

[22:29](#msg5ce47be6b313d7231406f568)https://files.gitter.im/red/red/France/Sjtw/image.png

[22:36](#msg5ce47d7563dea422b4c1f339)Next step: test red-gtk; again, here's the story:

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
GTK VERSION: 3.24.5
Experimental camera initialized!
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> 

  # pierre@latitude: ~        < 2019_05_22__00:00:17 >
cd dev/red_rcqls/tests

  # pierre@latitude: ~/dev/red_rcqls/tests        < 2019_05_22__00:33:08 >
vi_bkp_diff view-test.red 
6c6
< system/view/debug?: yes
---
> system/view/debug?: no

  # pierre@latitude: ~/dev/red_rcqls/tests        < 2019_05_22__00:33:19 >
~/red-gtk view-test.red 
GTK VERSION: 3.24.5
Experimental camera initialized!
 Type: window Style: none Offset: none Size: 1100x800 Text: "Red View"
     Type: button Style: none Offset: 10x10 Size: 60x40 Text: "Hi"
     Type: button Style: none Offset: 100x10 Size: 60x40 Text: "Hello"
     Type: button Style: none Offset: 180x10 Size: 60x40 Text: "Change"
     Type: check Style: none Offset: 300x270 Size: 80x24 Text: "Debug?"
     Type: check Style: none Offset: 300x300 Size: 80x24 Text: "Big/small font"
...
```

[22:37](#msg5ce47d928f019114ae93c954)A click on the drop-down list in the middle of the screen, choose my /dev/video0, and voilà:

[22:37](#msg5ce47d9a9404bf2aed882738)\[!\[image.png](https://files.gitter.im/red/GTK/cVdA/thumb/image.png)](https://files.gitter.im/red/GTK/cVdA/image.png)

Respectech

[22:38](#msg5ce47dd075d9a575a6208b95)Great work! I hope to start testing today or tomorrow.

PierreChTux\_twitter

[22:38](#msg5ce47dee75d9a575a6208bcc)I'm just amazed by the great work on Red! I hadn't done any View for a very long time...

[22:39](#msg5ce47e1ab313d72314070511)I should have said that I'm running a Debian Buster (10) GNU/Linux on a 64 bit architecture.

[22:39](#msg5ce47e3d8f019114ae93cd8f)@Respectech please do! On your ODROID?

[22:40](#msg5ce47e516366992a94fbabee)I've dreamed of these small powerful machines for years...

Respectech

[22:42](#msg5ce47ee0b313d72314070aa1)@PierreChTux\_twitter Yes. I will be trying on an ODROID-N2 running Ubuntu ARM.

PierreChTux\_twitter

[22:43](#msg5ce47ef47c363c75a71e95a2)@Respectech have fun!

rcqls

[22:44](#msg5ce47f6863dea422b4c201be)@Respectech Unfortunately I am not able to test camera on ODROID…. Also I guess that `red-gtk` for ODROID is not possible but `console-view` would be buildable for ARM by cross-compilation. If `gst-launch` above is working for you I would be able a try to crosscompile a console-view for ODROID. But before, `gst-launch` would be the first step to test after completing gstreamer installation.

Respectech

[22:52](#msg5ce4813263dea422b4c20a12)@rcqls Is there a reason you are not able to test a camera on ODROID?

rcqls

[22:54](#msg5ce481989d64e537bceb8329)@Respectech Very simple answer: my only camera is integrated on my macbook laptop…

[22:58](#msg5ce482ae9404bf2aed884be3)If you have a good reference of camera that I can buy useable both on ODROID and on my macbook, it could be good since I have also to test multicamera devices in my VBox.

Respectech

[23:06](#msg5ce4846a879f4478c7bca1e2)@rcqls Are you still at the same address?

[23:11](#msg5ce48596ecdf942b4c225a65)I will send you a 720p USB webcam that should work on single board computers like ODROID and on your other computers.

rcqls

[23:13](#msg5ce48634d22ba766a2d9612c)@Respectech You’re very generous and indeed I am still at the same address. This gift would clearly help me to develop red/GTK camera stuff on ODROID.

## Wednesday 22nd May, 2019

Respectech

[00:57](#msg5ce49e8a8f019114ae948e5b)OK. It will be on its way to you tomorrow. :-) You are very generous with your time and development talents.

[00:59](#msg5ce49efe6366992a94fc64a6)By the way, I recently had someone apply for a position in person here (ameriDroid) who graduated from ESIEA Level 3 and IIA Institute of Applied Computing in Laval, France. Are you familiar with those programs?

rcqls

[04:51](#msg5ce4d5490ac9852a951c5566) @Respectech I have no idea about this Institute and then on those programs.

Respectech

[17:24](#msg5ce585d8879f4478c7c37217)@rcqls Laval must have a lot of educational institutions!

greggirwin

[18:52](#msg5ce59a8313e9854e334b9e69)Team Red can also help with sponsoring hardware through AmeriDroid.

Respectech

[19:16](#msg5ce5a002ef853135c8061fe7)Great!

[19:18](#msg5ce5a071ef853135c8062233)Our shipping department just delivered my R&amp;D equipment so I can get started on my attempts to get dual USB3 cameras capturing using Red, and then hopefully using RedCV to parse those images for distance calculations.

## Thursday 23th May, 2019

ldci

[05:55](#msg5ce635c0879f4478c7c80fd3)@Respectech RedCV does not support yet stereo vision but supports several cameras. Probably the best for you is openCV binding

Respectech

[21:00](#msg5ce709fa9d64e537bcfd0c61)@ldci OpenCV binding? Where do I find that?

greggirwin

[21:25](#msg5ce70fe5ad024978c6197589)https://github.com/ldci/OpenCV3-red

## Sunday 2nd June, 2019

rcqls

[07:00](#msg5cf374165de053468bfafab0)@Respectech I just received the usb camera. Quickly tested on macOS but since I am leaving for 1 week to attend a workshop I could not test the camera on ODROID. Thank you again and I’ll tell you when I give a try on ODROID.

[07:03](#msg5cf374ae5de053468bfb0025)Quickly tested on Linux too and it works!

[09:13](#msg5cf393399b50f639356b18fb)@Respectech Finally before leaving I made a quick test and camera is working on ODROID. However `view-test.red` is not working. Only a simple test I have prepared on my red-tests repo is working from now. The link of the binary console-odroid (in fact RPi arch) is \[here](https://cqls.dyndoc.fr/users/RCqls/Red/console-odroid). Dependencies are mostly the same than for linuxmint….

## Tuesday 4th June, 2019

Respectech

[18:20](#msg5cf6b6884dfb4240047c5fc3)@rcqls That's good news, and sounds like some success!

## Saturday 8th June, 2019

gavr123456789\_gitlab

[05:34](#msg5cfb48e9faac6439345cab10)Hello dears! I come from Qt world and am extremely interested in GUI development, so I have 2 questions.  
1\) What do you think about the Vala language, its usability and overall prospects, it seems that now it is the closest to GTK language after C.  
2\) On the official website in the Roadmap section says that GTK3 Backend is ready for 10%, how much this information is updated and accurate? And what happens when GTK 4 comes out?

rebolek

[08:31](#msg5cfb725782c2dc79a56ee305)@gavr123456789\_gitlab hello! 10% is certainly not accurate, GTK branch is very usable.

rcqls

[08:32](#msg5cfb728ab76eac527ac20acd)Hi @gavr123456789\_gitlab, personally I don’t know Vala language (I just read the doc to have an overall). the roadmap is maintained by the Red Team and it is supposed to represent the red/GTK branch. Currently, I think it is closer than 50%. There is also a development branch rcqls/GTK-dev which is IMHO closer to 80% (the last work being camera integration based on gstreamer). See \[Wiki Red/GTK page](https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development) for further information even though I need to add on this page the dependencies for camera.

[08:57](#msg5cfb789282c2dc79a56f06c3)I just added notes given in this room about dependencies for camera stuff in the Red/GTK Wiki page.

## Tuesday 25th June, 2019

dockimbel

[17:17](#msg5d12571ad1f909166197ba95)FYI, the red/GTK branch has been updated to latest commit in master.

rcqls

[17:24](#msg5d1258c187ca0b48c4966d57)@dockimbel Good news! Thanks

## Monday 1st July, 2019

qtxie

[16:01](#msg5d1a2e43aa095d404cf5df73)I tried the GTK branch on Ubuntu mate on RPi 3. I cannot run the console-view and got this error:

```
qt@dkPI3:~$ ./console-view 
GTK VERSION: 3.22.30
No protocol specified
Unable to init server: Could not connect: Connection refused

(console-view:7416): Gtk-WARNING **: 16:52:17.431: cannot open display: :0
```

[16:01](#msg5d1a2e60a8b20942babdc440)If I run it with `sudo ./console-view`, then works fine.

[16:14](#msg5d1a316d2be6a2404d0214ad)Does it work on GTK3 3.14.13? or should I need to install some libraries? I got this error when running the console-view on an old Ubuntu system.

```
./console-view: symbol lookup error: ./console-view: undefined symbol: gtk_menu_popup_at_pointer
```

[16:15](#msg5d1a318f189e7b4ff04a9b7e)

```
$ dpkg-query -W libgtk-3-bin
libgtk-3-bin	3.14.13-0ubuntu1
```

rcqls

[16:29](#msg5d1a34fd2be6a2404d023789)@qtxie I only tested on ONDROID and it was ok. Your message seems to mean that DISPLAY is not well configured. BTW, thanks for merging the PR.

qtxie

[17:41](#msg5d1a45b5189e7b4ff04b6267)@rcqls Great work! Maybe my account doesn't have the right to run GTK.

giesse

[19:17](#msg5d1a5c549cbde24b2f57b349)@qtxie can you start any other GUI program from that same terminal?

rcqls

[19:56](#msg5d1a6566aa095d404cf7f9e9)@giesse I bet (like you) that the answer will be NO. Otherwise, it is weird….

dockimbel

[22:03](#msg5d1a832b8dff05627bab34ec)@giesse We can launch Firefox from that same terminal.

## Tuesday 2nd July, 2019

rcqls

[03:35](#msg5d1ad10af0f22f6645f8dba0)@qtxie Almost sure, but as mentioned in the error message, menu requires a more recent version of GTK3. Hope you could update your old ubuntu. Otherwise, we need to update red/GTK code and deal with pretty old GTK3 version (by deactivating menu).

[03:36](#msg5d1ad15b26206b667c6e3c57)Adaptation of `xhost +` should solve the issue about display.

giesse

[06:06](#msg5d1af45784e3391a5abaf50c)@dockimbel it's weird because there's nothing special about GTK vs. any other library connecting to X - so it's either a configuration issue or something else special about the Red process; any other GTK based program you can try? like `gnome-calculator` or anything like that; if yes and it works, check with `ldd` if it's linking to the same libs as Red; if they're the same then I don't know what it could be :)

[06:07](#msg5d1af49b26206b667c6f6efa)I guess it could be an AppArmor / LinuxSE thing but I doubt it would be enabled by default on a RaspberryPi distro?

rebolek

[06:08](#msg5d1af4f40ee3c30b1d6b0a22)I haven't try with rPI yet, but I can't run Red/GTK on Manjaro. It runs fine on Ubuntu.

rcqls

[06:56](#msg5d1b001fb1b66b7203bb5196)@rebolek Manjaro is a Archlinux-based distrib so it is related to the unresolved issue on Archlinux. Right?

rebolek

[08:15](#msg5d1b129d84e3391a5abc1793)@rcqls Right. (sent from my Gritter client :D)

rcqls

[08:26](#msg5d1b152484cbda1764b20dd2)@rebolek Gritter client on red/GTK?

rebolek

[08:26](#msg5d1b154e84cbda1764b20f4f)@rcqls Yes.

rcqls

[08:31](#msg5d1b165b84e3391a5abc38d8)@rebolek Excellent! I’ll give a try since I see that there is some update in your gritter repo...

[08:35](#msg5d1b173799847a1a59d9fc27)@rebolek guess what I am using to send this message!

[08:37](#msg5d1b17c1f0f22f6645fb5f48)BTW I had an access violation on macOS but I guess you already know that.  
Also, maybe I need to update my red for macOS

rebolek

[08:40](#msg5d1b188326206b667c70be33)@rcqls great! I did some updates, but nothing important. It needs some more serious updates, like marking messages read and proper refresh.

[08:41](#msg5d1b18a3be7a46664451d5e2)But now that it works fine on GTK, I can work on it much easily.

rcqls

[08:42](#msg5d1b1902cd7934667dc0487a)@rebolek I’ll try to compile it but `*** Compilation Error: undefined word ask`. I guess some include files are required. BTW, Great Job!

rebolek

[08:43](#msg5d1b193184e3391a5abc4f42)@rcqls Thanks! `ask` is needed only for inputting Gitter token, I can replace it with View dialog.

rcqls

[08:46](#msg5d1b19e35ce02535b007e054)@rebolek :thumbsup:

rebolek

[08:48](#msg5d1b1a6b6658420b1cdacace)@rcqls done, now it shouldn't require `ask`

rcqls

[08:54](#msg5d1b1bb926206b667c70db6f)@rebolek It works a bit better on macOS after updating to red-latest (since the window opens) but there is still access violation very quickly when playing with it. Ask is solved but I have now: `*** Compilation Error: undefined word input-gitter-token`.

rebolek

[08:55](#msg5d1b1beb0ee3c30b1d6c77f9) @rcqls Hm, I should probably defined `input-gitter-token` before using it :D

[08:55](#msg5d1b1c1ab8926b674fc7a43a)Fixed.

[08:56](#msg5d1b1c3d5ce02535b007f580)I'll take a look at MacOS, but it's probably some issue with macos View version.

rcqls

[09:03](#msg5d1b1def6658420b1cdaea07)@rebolek Could you please add `Needs: View` in order to compile…. Of course I can do it by myself

[09:04](#msg5d1b1e302e3f431763584362)`*** Compilation Error: undefined word make-fonts` (inside `rich-text.red`) ….

[09:11](#msg5d1b1fcb07bf5635af0f3749)@rebolek I guess more work is needed to compile because of your redquire that I guess is loaded by internet…. I replaced all the `do` with `#include` but ….

rebolek

[10:32](#msg5d1b32a6cd7934667dc1377f)@rcqls yeah, `redquire`... I never tried to compile it, so thanks for the testing. I guess I should try it and fix all these problems.

[10:33](#msg5d1b32efb8926b674fc87557)`Needs` field added, but I have to think about `redquire`, how to make it work with compiler.

rcqls

[11:19](#msg5d1b3db784e3391a5abd9bce)@rebolek stats folder is not directly part of gritter. So I guess there is only 1 redquire which can then maybe be replaced with a `#include`...

rebolek

[11:46](#msg5d1b43f9b8926b674fc91dee)@rcqls theoretically yes, but that means moving `http-tools`there. I need to think about it.

rcqls

[12:02](#msg5d1b47e35ce02535b0098758)@rebolek It would be lovely to have gritter as a simple binary that looks like a real application.

rebolek

[12:03](#msg5d1b481ee0cad967508f0858)@rcqls I agree, but it still needs some improvements before it makes sense to distribute it as standalone app.

rcqls

[12:04](#msg5d1b486499847a1a59dbcf66)@rebolek I understand that but it could be at least as a first prototype.

qtxie

[14:34](#msg5d1b6b8d84e3391a5abf4f4b)@giesse OK. I think it's my account's problem. I cannot run any GTK based program without sudo.

rcqls

[16:07](#msg5d1b81336658420b1cde9b86)@qtxie `xhost +` does not work for you?

qtxie

[16:26](#msg5d1b85b9cd7934667dc456e1)@rcqls I haven't try. What is `xhost +`?

rcqls

[16:42](#msg5d1b896199847a1a59de43d7)@qtxie to give access to x11. After this command, you should be able to run GTK based program as a regular user.

giesse

[18:35](#msg5d1ba3fb6658420b1cdfe548)@rcqls that turns off access control entirely though - there should be a better way of doing it :) but I guess it would confirm that it's an access control issue and not something else.

rcqls

[18:52](#msg5d1ba7f226206b667c76238c)@giesse I agree with you that there is better solution but it is the most usual solution for solving this issue. Also at some point I was not sure to do exactly the same thing on the ODROID.

## Wednesday 3th July, 2019

dumblob

[10:48](#msg5d1c87e92e3f431763652707)@rebolek @rcqls the working GTK backend works on 32bit Manjaro, but not 64bit Manjaro, right? Because the issue was just with the 64bit version...

rcqls

[14:21](#msg5d1cb9cfbe7a46664460d7ea)@dumblob Thanks! I was about to test the 32bit manjaro inside a docker container. No more need to do now.

qtxie

[14:22](#msg5d1cba2584cbda1764c134f2)I think the crashes on Archlinux is caused by that Archlinux needs 16 bytes stack alignment when calling a function, while Red only guarantee 8 bytes alignment.

dumblob

[15:51](#msg5d1ccf185ce02535b017e676)@qtxie sound like a lead - but I'm absolutely certain it has nothing to do with Arch linux, but rather with the stack alignment of the loaded libs (in this case GTK and its dependencies) as 16 byte alignment seems to be required by e.g. SSE* instructions in those libs etc. - see https://stackoverflow.com/a/10256252

Any suggestion how could I check (i.e. how to do advanced debugging of Red without having Rebol license) whether the GTK libs alignment is the root cause of such crashes? I mean something more sane and faster then recompiling all GTK libs with its dependencies with -mpreferred-stack-boundary=2 argument to gcc (this would anyway be just trial-end-error check whether Red crashes or not, but wouldn't help us much further with debugging).

[15:55](#msg5d1ccff1e0cad967509d45dd)@qtxie btw System V ABI (https://stackoverflow.com/questions/18133812/where-is-the-x86-64-system-v-abi-documented ) mandates 16 byte stack alignment, so any other alignment is actually expected to fail on basically ALL existing non-Windows systems in the world :-(

dockimbel

[16:09](#msg5d1cd3506658420b1ceabd4d)@dumblob  
&gt; without having Rebol license

Why would you need a Rebol license for \_any_ debugging task? The Rebol license is only used to enable "encapping" of Rebol interpreter with user code (the Red toolchain code in our case) for easing \_distribution\_. We \_never_ use the encapped version for any debugging work in the Red team.

[16:36](#msg5d1cd99484e3391a5acc94ce)https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-on-i386-and-x86-6

[16:36](#msg5d1cd9a0be7a466644621cb3)&gt; Modern versions of the i386 System V ABI (used on Linux) require 16-byte alignment of %esp before a call, like the x86-64 System V ABI has always required. Callees are allowed to assume that and use SSE 16-byte loads/stores that fault on unaligned. But historically, Linux only required 4-byte stack alignment, so it took extra work to reserve naturally-aligned space even for an 8-byte double or something.

&gt; Some other modern 32-bit systems still don't require more than 4 byte stack alignment.

[16:40](#msg5d1cda7799847a1a59ea581b)According to the above, it seems that only "some modern" Linux distros implements the 16 byte stack alignment requirement.

[16:41](#msg5d1cdacc99847a1a59ea5adb)So, we need to add a 16 byte stack aligned Linux compilation target to `%config.r`.

[17:06](#msg5d1ce0a899847a1a59ea9530)We just did a test with adding `stack-align-16?: yes` entry in `Linux` target in `%config.r` file on an ArchLinux instance, and the GTK backend then seems to work fine, no segfault on calling `view`.

[17:42](#msg5d1ce8eb2e3f43176368ce88)Changes pushed on GTK branch, enjoy!

dumblob

[17:47](#msg5d1cea370ee3c30b1d7d6d11)@dockimbel @qtxie awesome, thank you for tracking it down!

Regarding debugging, I'm afraid there is no release of debug console and I would need to recompile console myself and I always thought that's being done with (licensed) Rebol (didn't check, but thought console is compiled using Rebol 2, which is not open source compared to Rebol 3)

qtxie

[18:53](#msg5d1cf9b35ce02535b0197656)@dumblob You don't need a license to use Rebol. https://github.com/red/red#running-red-from-the-sources-for-contributors  
Also you can compile the debug console with `-d`.  
GUI console:

```
> red.exe -d
```

Or CLI console:

```
> red.exe --cli -d
```

dumblob

[20:40](#msg5d1d12bab8926b674fd9b852)@qtxie yeah, that must have been some confusion on my side as since I first read it, I understood it as Rebol 2 (closed source) and not Rebol 3 (open source) and since then didn't pay any attention to it :-(

Thanks for clarification.

rcqls

[22:28](#msg5d1d2bf1be7a46664465150d)@dockimbel @qtxie Nice! Just tested in some Archlinux docker container! :thumbsup:

loziniak

[23:13](#msg5d1d36b384e3391a5acfc057)Works for me also on actual Arch install. Lovely!

[23:39](#msg5d1d3cc099847a1a59edcccd)Is resizing implemented? My fluid layout utility https://github.com/robotix-pl/resize-deep does not work as expected.

greggirwin

[23:42](#msg5d1d3d4b84e3391a5acff7cb)Do you get the basic resize/ing events?

loziniak

[23:55](#msg5d1d4086e0cad96750a14526)No. `Red [Needs: 'View] view/flags [on-resize [print "resize"] button "test"] 'resize` does not print anything.

[23:57](#msg5d1d4104b8926b674fdb4077)Ok, I get `resizing` events. But not `resize`.

## Thursday 4th July, 2019

rcqls

[02:17](#msg5d1d61c9f0f22f6645103a3e)@loziniak Yes, Ihave already tested your resize-deep tools. `on-resizing` instead of `on-resize` works for me. I have tried to implement `on-resize` with `configure-event` but nothing perfect yet….

rebolek

[06:50](#msg5d1da1cb0ee3c30b1d8368a7)@qtxie After updating to latest GTK commit (with 16bit align), I can no longer run Gritter on Ubuntu, I get

```
free(): invalid pointer
[1]    8827 abort (core dumped)  ./console-view-latests
```

rcqls

[07:13](#msg5d1da71f07bf5635af263d17)@rebolek @qtxie I confirmed the issue and the error is from time to time the following one:

```
*** Script Error: PARSE - matching by datatype not supported for any-string! input
*** Where: parse
*** Stack: layout layout
```

[07:30](#msg5d1dab3184e3391a5ad373e4)@qtxie Trying to find some other scripts not working after the 16align commit:

\* `red/tests/gtk3/view-test.red`  
\* `code/Scripts/mandelbrot.red`

[08:18](#msg5d1db64dbe7a466644697abf)* code/Showcase/ballots/ballots.red  
The two last seem related to image issues when the first one is like gritter issue

dockimbel

[08:30](#msg5d1db92184e3391a5ad3f5be)@rebolek Are you using `malloc/free` in Gritter?

rebolek

[08:31](#msg5d1db94f0ee3c30b1d8432ee)@dockimbel no, it's pure Red, no R/S code.

[08:32](#msg5d1db9af99847a1a59f1cfd0)It opens windows for a split of second and then crashes.

[08:33](#msg5d1db9cdb8926b674fdf171c)IMO it's GTK related, I will try debug build.

[08:36](#msg5d1dba8199847a1a59f1d6db)Hm, it doesn't report anything interesting.

rcqls

[08:38](#msg5d1dbb05be7a46664469a6f0)@dockimbel `red/tests/gtk3/view-test.red` seems to have the same issue, I try to find a minimal example….

dockimbel

[08:39](#msg5d1dbb2a07bf5635af26f453)@rcqls Do you pass any struct by value when calling GTK API? Any variadic calls?

rcqls

[08:51](#msg5d1dbe0e26206b667c88ab8d)@dockimbel Yes for both struct by value and variadic. For struct by value there is some in the file `handlers.reds`.

## Friday 5th July, 2019

rcqls

[05:29](#msg5d1ee04e923dae65d521f128)@dockimbel @qtxie @rebolek Trying to find a minimal example to reproduce the error:

```
Red[Needs: View]
f: make font! [name: "Arial" size: 120]	
view [base 140x140 draw [font f text 10x10 "A"]]
```

All the examples I found (`gritter.red` is one of them) using `make font!` fail with the same error message:

```
free(): invalid pointer
Aborted
```

I’ll try to investigate what is the culprit in the code….

[06:57](#msg5d1ef4dfdd0b530e409e33f0)Found the first issue when `make font!` related to `cairo_font_options_destroy`. Commenting the related line makes all the code working. However I need to fix it. There is another bug on `image` that does not show anymore.

[07:02](#msg5d1ef5f2923dae65d522adb8)Done! `cairo_font_options_destroy` argument was badly declared.

[07:10](#msg5d1ef7f1ccfbb80e413f7f74)Try to propose a PR ASAP.

[07:21](#msg5d1efa80b5d39c1bfef4ebc2)Done!

qtxie

[14:47](#msg5d1f62fc07d71829adb953ae)@rcqls Thanks. Does it fix the crash on Ubuntu?

[14:48](#msg5d1f633ec5f3c329aeedc5e7)BTW, Does `view-test.red` work? I got a crash when running it on ArchLinux.

[14:49](#msg5d1f636cdd0b530e40a21564)

```
*** Runtime Error 1: access violation
*** in file: /home/qt/dev/red/runtime/datatypes/block.reds
*** at line: 92
***
***   stack: red/block/rs-clear 0814CAF4h
***   stack: gui/get-event-flags 09A046D4h
***   stack: event/eval-path 09A046D4h F524D69Ch 00000000h F524D588h false
***   stack: red/actions/eval-path 09A046D4h F524D69Ch 00000000h F524D588h false
***   stack: red/interpreter/eval-path F524D69Ch F524D598h F524D598h false false true false
***   stack: red/interpreter/eval-expression F524D598h F524D598h false true false
***   stack: red/interpreter/eval-arguments F534F450h F524D588h F524D598h 00000000h 00000000h
***   stack: red/interpreter/eval-code F534F450h F524D588h F524D598h true 00000000h 00000000h F534F450h
***   stack: red/interpreter/eval-expression F524D588h F524D598h false true false
***   stack: red/interpreter/eval-next F524D578h F524D598h true
***   stack: red/natives/reduce* false 1
***   stack: red/natives/do-print false true
***   stack: red/natives/print* false
***   stack: red/interpreter/eval-arguments F534FBF0h F524D4C4h F524D4C4h 00000000h 00000000h
***   stack: red/interpreter/eval-code F534FBF0h F524D4B4h F524D4C4h false 00000000h 00000000h F534FBF0h
***   stack: red/interpreter/eval-expression F524D4B4h F524D4C4h false false false
***   stack: red/interpreter/eval 09A04704h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments F534EFF0h F524D1B8h F524D1C8h 00000000h 00000000h
***   stack: red/interpreter/eval-code F534EFF0h F524D188h F524D1C8h false 00000000h 00000000h F534EFF0h
***   stack: red/interpreter/eval-expression F524D188h F524D1C8h false false false
***   stack: red/interpreter/eval F524D114h true
***   stack: red/interpreter/eval-function 09A046B4h F524D114h
***   stack: red/_function/call 09A046B4h F7F4813Ch
***   stack: red/interpreter/eval-code 09A046B4h F51D7E30h F51D7E30h false 00000000h 00000000h 09A04624h
***   stack: red/interpreter/eval-expression F51D7E10h F51D7E30h false false false
***   stack: red/interpreter/eval 09A046A4h true
***   stack: red/natives/try* true 0
***   stack: do-safe
***   stack: ctx400~awake F7F481A4h
***   stack: gui/make-event 09B35308h 2 25
***   stack: gui/combo-selection-changed 09B35308h F498A978h
```

rcqls

[15:34](#msg5d1f6e0cce3d0458f2b57557)@qtxie the `view-test.red` is inside `tests/gtk3`. I just found a fix for image issue and I’ll send a PR in a few minutes. After this PR, everything is working fine now.

[15:38](#msg5d1f6ee1a0a38158f1a88a4f)@rebolek `gritter` is back!

[15:47](#msg5d1f7121b682244d4989a94e)@qtxie It works both on ubuntu and archlinux...

qtxie

[16:03](#msg5d1f74b7076ffa65b0536b39)@rcqls Cool! :sunglasses:

[16:15](#msg5d1f77a6ce3d0458f2b5d6e6)The `view-test.red` is inside `test/gtk3` works. :smiley:

[16:18](#msg5d1f7838b682244d4989efba)When I typing in the `field` which shows `unicode supported` in the view-test window, the window crashes...

[16:18](#msg5d1f7855b5d39c1bfef96396)It also crashes when I click the `Change` button...

rcqls

[17:52](#msg5d1f8e5c923dae65d528109b)@qtxie The `unicode supported` issue is known for me. Clicking on `Change` button works for me both inside my docker archlinux and ubuntu containers.

[17:58](#msg5d1f8fa811bfea0b67ace351)Of course, I guess that another issues have been introduced after the 16align PR.... People are welcome to catch them.  
The good news with this PR is that bad declaration of FFI functions in R/S lead now to errors.

## Saturday 6th July, 2019

rcqls

[08:14](#msg5d20584c83f2a2270ec0286e)@qtxie Here the function `set-text`adapted from macOS to update text that only fails with unicode characters.  
`unicode/load-utf8-buffer` is more precisely the line where the error occurs. I spent lot of time to try to fix it but without any success.  
I'll appreciate help from the Red Team since I am not sure wheither it is a bug related to Linux.

```
set-text: func [
	obj		[handle!]
	ctx		[node!]
	text	[c-string!]
	/local
		size [integer!]
		str	 [red-string!]
		face [red-object!]
		out	 [c-string!]
][
	size: length? text
	if size >= 0 [
		str: as red-string! get-node-facet ctx FACE_OBJ_TEXT
		if TYPE_OF(str) <> TYPE_STRING [
			string/make-at as red-value! str size UCS-2
		]
		if size = 0 [
			string/rs-reset str
			exit
		]
		;; TODO: bug with unicode characters just below
		unicode/load-utf8-buffer text size GET_BUFFER(str) null yes
		face: push-face obj
		if TYPE_OF(face) = TYPE_OBJECT [
			ownership/bind as red-value! str face _text
		]
		stack/pop 1
	]
]
```

qtxie

[08:25](#msg5d205b0b9bb34a3cf31d2e45)@rcqls What's the contents of the `text` ? Are you sure it's UTF-8 string?

rcqls

[08:27](#msg5d205b6d98a9ec58b6c4f8db)@qtxie Simply the text you are typing inside the field retrieved as a `c-string!`. There is no bug when no unicode is initially set. But the weird point is that when text contains only regular characters (i.e. replacing all unicode characters), it fails too…

[08:36](#msg5d205daa631d3433ba351d8e)@qtxie the goal of set-text is in particular to update the content of `str` with the content of `text`...

PierreChTux\_twitter

[17:49](#msg5d20df1cae10eb58bd732fe4)Hi guys, is anyone around using a GNU/Linux Devuan 64 bits?

rcqls

[17:54](#msg5d20e06565711117b7a25fc9)@PierreChTux\_twitter No but reading the homepage, it seems that it is a Debian-based distribution (without systemd). Do you have trouble to play with red ?

PierreChTux\_twitter

[17:55](#msg5d20e074b2a6596c1a20cb51)Yes, I do...

rcqls

[17:55](#msg5d20e0923c4c1423e48b2934)What's wrong compared with Debian?

PierreChTux\_twitter

[17:55](#msg5d20e09598a9ec58b6c8876e)After 15 years of Debian, I just switched to Devuan (sick and tired of systemd), and I have a dependency hell...

[17:56](#msg5d20e0bb8193ce270f347c4e)I can't install at-spi2-core:i386

[17:56](#msg5d20e0dd631d3433ba38a022)I was dreaming that someone else, a bit rebel, would also be on Devuan.

[17:57](#msg5d20e104b0887b1c1b4f19e1)I'm on Beowulf version, which is the testing.

[17:57](#msg5d20e122b2a6596c1a20d060)Everything runs smoothly, except those 32 bit libraries for Red/GTK...

rcqls

[17:58](#msg5d20e1329ae1500d0fa2e6a4)If I have time, I will try to install a devuan docker container...

PierreChTux\_twitter

[17:58](#msg5d20e144ed8ed058b595165a)Thanks!

rcqls

[17:59](#msg5d20e16a3c4c1423e48b2936)Why don't you use 'Stretch' since ''Beowulf corresponds to the next Debian release (Buster)?

PierreChTux\_twitter

[17:59](#msg5d20e19fb2a6596c1a20d384)I was on Debian testing (Buster), and it's not a good idea to downgrade a Debian. I've already done a few Frankendebians...

[18:00](#msg5d20e1a9b2a6596c1a20d3f4)This is my main machine.

[18:01](#msg5d20e1e8ff78641c1ca1a31d)At the moment, I'm "playing" with attitude, trying to find a suitable combination of packages allowing me to install those 32bit libraries.

rcqls

[18:01](#msg5d20e1f0459e5435e20453dd)Buster is supposed to be released today BTW! And `at-spi2-core:i386` was ok on Buster?

PierreChTux\_twitter

[18:02](#msg5d20e219fadb0544802f0630)Yes, everything was working fine, I was even able to make my webcam work properly in Red, remember? ;-)

rcqls

[18:03](#msg5d20e265459e5435e20453df)Do you have message errors when installing its dependency?

PierreChTux\_twitter

[18:03](#msg5d20e27aed8ed058b5951ebe)Plenty!

[18:03](#msg5d20e28bed8ed058b5951f36)I'll cancel my aptitude, and try to run plain apt

[18:04](#msg5d20e2c4fadb0544802f0ae7)

```
# root@latitude: ~        < 2019_07_06__20:04:01 >
apt install libgtk-3-bin:i386
Lecture des listes de paquets... Fait
Construction de l'arbre des dépendances       
Lecture des informations d'état... Fait
Certains paquets ne peuvent être installés. Ceci peut signifier
que vous avez demandé l'impossible, ou bien, si vous utilisez
la distribution unstable, que certains paquets n'ont pas encore
été créés ou ne sont pas sortis d'Incoming.
L'information suivante devrait vous aider à résoudre la situation : 

Les paquets suivants contiennent des dépendances non satisfaites :
 libgtk-3-bin:i386 : Dépend: libgtk-3-0:i386 (>= 3.24.5-1) mais ne sera pas installé
E: Impossible de corriger les problèmes, des paquets défectueux sont en mode « garder en l'état ».

  # root@latitude: ~        < 2019_07_06__20:04:12 >
```

[18:05](#msg5d20e2fd98a9ec58b6c89584)When I walk down the dependency tree, I systematically stumble upon impossibilities.

[18:06](#msg5d20e31b32132d6c1bb3ec28)And aptitude (who is far more clever than me at dealing with dependencies) cannot find a solution, either.

[18:07](#msg5d20e3469bb34a3cf3210c5a)No worries, I'll keep on fighting. I was just wondering whether someone else was enduring similar issues, or had better luck than me.

rcqls

[18:07](#msg5d20e35d65711117b7a25fcc)What version of libgtk-3 is already installed? Don't see at-spi2-core:i386 BTW

[18:09](#msg5d20e3f20bc73848cbc78713)When directly installing libgtk-3-0:i386 what is the error message?

PierreChTux\_twitter

[18:11](#msg5d20e4668193ce270f34942f)

```
# root@latitude: ~        < 2019_07_06__20:11:03 >
dpkg --list 'libgtk-3*'
Souhait=inconnU/Installé/suppRimé/Purgé/H=à garder
| État=Non/Installé/fichier-Config/dépaqUeté/échec-conFig/H=semi-installé/W=attend-traitement-déclenchements
|/ Err?=(aucune)/besoin Réinstallation (État,Err: majuscule=mauvais)
||/ Nom                Version      Architecture Description
+++-==================-============-============-===========================================================
ii  libgtk-3-0:amd64   3.24.5-1     amd64        GTK+ graphical user interface library
rc  libgtk-3-0:i386    3.24.5-1     i386         GTK+ graphical user interface library
ii  libgtk-3-bin       3.24.5-1     amd64        programs for the GTK+ graphical user interface library
ii  libgtk-3-common    3.24.5-1     all          common files for the GTK+ graphical user interface library
ii  libgtk-3-dev:amd64 3.24.5-1     amd64        development files for the GTK+ library
ii  libgtk-3-doc       3.24.5-1     all          documentation for the GTK+ graphical user interface library
```

[18:12](#msg5d20e48b83f2a2270ec3f992)

```
# root@latitude: ~        < 2019_07_06__20:12:03 >
apt install  libgtk-3-0:i386
Lecture des listes de paquets... Fait
Construction de l'arbre des dépendances       
Lecture des informations d'état... Fait
Certains paquets ne peuvent être installés. Ceci peut signifier
que vous avez demandé l'impossible, ou bien, si vous utilisez
la distribution unstable, que certains paquets n'ont pas encore
été créés ou ne sont pas sortis d'Incoming.
L'information suivante devrait vous aider à résoudre la situation : 

Les paquets suivants contiennent des dépendances non satisfaites :
 libgtk-3-0:i386 : Dépend: libatk-bridge2.0-0:i386 (>= 2.5.3) mais ne sera pas installé
                   Dépend: libcups2:i386 (>= 1.6.0) mais ne sera pas installé
E: Impossible de corriger les problèmes, des paquets défectueux sont en mode « garder en l'état ».

  # root@latitude: ~        < 2019_07_06__20:12:09 >
```

[18:12](#msg5d20e49798a9ec58b6c8a168)(I answered following the same order as your questions)

[18:14](#msg5d20e50a8193ce270f349760)I did a `dpkg --get-selections > something` before switching to Devuan: I did the same again, I'm browsing through the `diff`, see what I can try.

rcqls

[18:30](#msg5d20e8e365711117b7a25fd5)What is weird is that normally you should not have i386 stuff installed? If there is only red to instal in i386 mode you should uninstall everything in this mode...

PierreChTux\_twitter

[18:31](#msg5d20e9199a8a5d3cf4aa0849)On Debian Buster, I had to install these 32bit libraries and dependencies, just for Red.

[18:32](#msg5d20e92251d87058bef2fdc4)Okay, I'll try to get rid of them.

rcqls

[18:35](#msg5d20e9ec95e4122da5c220e6)Here the dependencies I need for Debian Sid in i386:

```
apt-get install  libc6 libcurl4
apt-get install  libelementary1
apt-get install  dbus-x11
```

PierreChTux\_twitter

[18:41](#msg5d20eb5a631d3433ba38e1f9)You mean, on a i386 machine? Or :i386 packages on a 64 bits machine?

rcqls

[18:45](#msg5d20ec533c4c1423e48b294d)The first one... The adaptation is obvious by adding `:i386` on 64 bits machine...

PierreChTux\_twitter

[18:45](#msg5d20ec5e51d87058bef312a5)OK

[18:46](#msg5d20ec7ab0887b1c1b4f68de)(just wanted to make sure before screwing everything up once again...)

[18:47](#msg5d20ecdfb0887b1c1b4f6ad5)

```
# root@latitude: ~        < 2019_07_06__20:47:33 >
apt install libc6:i386 libcurl4:i386 libelementary1:i386 dbus-x11:i386
Lecture des listes de paquets... Fait
Construction de l'arbre des dépendances       
Lecture des informations d'état... Fait
Certains paquets ne peuvent être installés. Ceci peut signifier
que vous avez demandé l'impossible, ou bien, si vous utilisez
la distribution unstable, que certains paquets n'ont pas encore
été créés ou ne sont pas sortis d'Incoming.
L'information suivante devrait vous aider à résoudre la situation : 

Les paquets suivants contiennent des dépendances non satisfaites :
 dbus-x11:i386 : Dépend: libdbus-1-3:i386 (= 1.12.12-1+devuan2) mais ne sera pas installé
 libelementary1:i386 : Dépend: libecore-con1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libecore-drm2-1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libecore-evas1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libecore-fb1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libecore-file1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libecore-imf1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libecore-input1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libecore-wl2-1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libecore-x1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libecore1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libedje1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libeeze1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libefreet1a:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libeio1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libelocation1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libemotion1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libethumb-client1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libethumb1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
                       Dépend: libevas1:i386 (>= 1.21.1-0~eo) mais ne sera pas installé
E: Impossible de corriger les problèmes, des paquets défectueux sont en mode « garder en l'état ».

  # root@latitude: ~        < 2019_07_06__20:47:39 >
```

rcqls

[18:48](#msg5d20ece065711117b7a25fd7)If you install only `:i3!6` packages it is safe I hope

PierreChTux\_twitter

[18:48](#msg5d20ecf2b0887b1c1b4f6bbe)I've just tried: see above...

rcqls

[18:48](#msg5d20ed1a65711117b7a25fd9)`apt search libelementary1:i386` ?

PierreChTux\_twitter

[18:49](#msg5d20ed2c8193ce270f34caa1)By the way: I've removed all i386 packages, prior to apt install.

[18:49](#msg5d20ed5232132d6c1bb4371c)Good guess: it returns que dalle:

```
# root@latitude: ~        < 2019_07_06__20:47:39 >
apt search libelementary1:i386
En train de trier... Fait
Recherche en texte intégral... Fait

  # root@latitude: ~        < 2019_07_06__20:49:22 >
```

rcqls

[18:50](#msg5d20ed72459e5435e20453f0)And ? Nothing to install?

PierreChTux\_twitter

[18:50](#msg5d20ed7db50ac233b9e097be)No... Strange.

[18:50](#msg5d20ed868193ce270f34cccc)I'm having a look in aptitude.

[18:51](#msg5d20edab51d87058bef31b6b)Strange! It is listed by aptitude...

[18:51](#msg5d20edc6fadb0544802f52ff)

```
p     libelementary1                                                                       <aucun>        1.21.1-5
p     libelementary1:i386                                                                  <aucun>        1.21.1-5
```

rcqls

[18:52](#msg5d20edd00bc73848cbc78721)install with aptitude then? `:i386`

PierreChTux\_twitter

[18:52](#msg5d20edebff78641c1ca1f7a8)aptitudes complains \*a lot\*.

rcqls

[18:53](#msg5d20ee2b0116445c79e7b8fd)I think your Devuan install is not well done....

PierreChTux\_twitter

[18:54](#msg5d20ee65ff78641c1ca1fb9c)It's not an installation from scratch: it is simply the Buster, with a few changes in sources.list, remove packages related to systemd, and finished.

[18:55](#msg5d20ee91ff78641c1ca1fbe5)Maybe some libraries aren't ported yet to Devuan; after all, I'm in testing.

[18:55](#msg5d20eeaded8ed058b595771e)Changing Debian to Devuan took me about 3 minutes.

[18:56](#msg5d20eed8fadb0544802f5bec)Time for dinner. I'll come back later. Thanks for the help!

rcqls

[18:56](#msg5d20eedc65711117b7a25fe0)When I was on Linux everyday, a distribution for me could be reinstalled from scratch at any time (what I called junk distribution) since rolling distribution is a kind of dream.

[18:56](#msg5d20eee665711117b7a25fe2)Bon appétit!

PierreChTux\_twitter

[18:57](#msg5d20ef1db50ac233b9e0a293)I'm using the same "rolling" Debian since... 8 years, I think. I even changed the hard drive from one machine to another. Debian is incredibly unbreakable.

[18:58](#msg5d20ef39b50ac233b9e0a30e)Except for that pesky systemd which drove me totally nuts. Hence my migration to Devuan.

rcqls

[18:59](#msg5d20ef96459e5435e20453fa)it is what I mean... in theory rolling distribution is good but when you have a trouble sometimes you are very often just stuck....

## Sunday 7th July, 2019

rebolek

[06:18](#msg5d218e9ac74a8b447f835449)@rcqls I'm sending this from Manjaro. Great work!

rcqls

[07:04](#msg5d2199931db58049cc2e4262)@rebolek Great news! I was incredibly surprised to fix the two issues so quickly since the two kind of errors (error failure and image not showing) are far from being my favorite... but I certainly received the help from Universe. The good news is that came from two bad declarations from my part that were weirdly running without 16align. For sure, Red and Red/System are amazing!

dockimbel

[10:23](#msg5d21c8378193ce270f3a6bdf)@rebolek Great! Any screenshot of Gritter/GTK?

rcqls

[11:11](#msg5d21d3519ae1500d0fa2e7d1)\[!\[Capture d’écran 2019-07-07 à 13.07.57.png](https://files.gitter.im/red/GTK/aJud/thumb/Capture-d\_ecran-2019-07-07-a-13.07.57.png)](https://files.gitter.im/red/GTK/aJud/Capture-d\_ecran-2019-07-07-a-13.07.57.png)

dockimbel

[11:26](#msg5d21d6fcc74a8b447f852b39)Looks quite good already. How fast is the chat window scrolling?

rcqls

[12:47](#msg5d21e9d50bc73848cbc78826)The chat window scrolling looks normally fast but only useable for now with the left scroller. But I@rebolek would give better comments. Is it working on Windows? On macOS, there is access violation when playing with gritter after the window is first shown.

dockimbel

[12:50](#msg5d21ea8dfadb054480359602)@rcqls The `view-test.red` app crashes on clicking the `[Change]` button. Do you know what's wrong there?

rcqls

[12:52](#msg5d21eb03459e5435e204550c)@dockimbel As mentionnes to @qtxie I don't have the issue on my docker containers. What is the version of GTK and what is your distribution?

dockimbel

[12:54](#msg5d21eb7eb0887b1c1b55dfe3)@qtxie will answer that, we tested on a Linux image on his computer.

rcqls

[12:56](#msg5d21ec14459e5435e2045511)@dockimbel Tested again on Archlinux and Ubuntu, and everything is fine for `Change` button that does a lot of thing when clicking it.

[13:02](#msg5d21ed4f1db58049cc2e427b)Everything is fine too on a linuxmint virtua box.

toomasv

[13:04](#msg5d21edcbb0887b1c1b55ed0d)ON W10 it opens and reads in chats of some room, but on changing rooms gives error msg:

```
*** Script Error: json has no value
*** Where: post-data
*** Stack: do-file do-events do-actor do-safe
```

and keeps reloading data.

```
>> about
Red 0.6.4 for Windows built 5-Jul-2019/19:00:59+03:00 commit #446550a
```

rcqls

[13:10](#msg5d21ef5f459e5435e2045521)@toomasv Thanks! It is the same on macOS. The message on W10 is more meaningful than on macOS:

```
*** Runtime Error 1: access violation
*** at: 9EC40514h
```

But I guess that @rebolek is aware of that .

PierreChTux\_twitter

[15:11](#msg5d220bb151d87058befa5da0)@rcqls HOURRAH! At last, I'm able to run Red with GTK again! After three full hours of battle with aptitude!

[15:15](#msg5d220c76ae10eb58bd7afb80)Note to Devuan users who have switched from Debian Buster to Devuan Beowulf (equivalent versions): it seems that the Devuan repositories are a little bit behind the Debian ones (which is understandable), at least as far as 32bit libs are concerned.  
Therefore, one must manually "downgrade" a few dozens of packages (and apt \*hates* that) before getting back to Pure Pleasure of Red GTK.

rcqls

[15:57](#msg5d2216681db58049cc2e42b1)@PierreChTux\_twitter Congrats! Could you please write here the few lines to install dependencies for Debian buster and Devuan beowulf? I have in mind to create a bash script to install dependencies for most OS running Red/GTK.

endo64

[17:07](#msg5d2226b6ae10eb58bd7bb075)You can also create a dedicated wiki page for these information: https://github.com/red/red/wiki

rcqls

[17:43](#msg5d222f2965711117b7a2617b)@endo64 There is already a dedicated page initiated by @loziniak about GTK bindings.

rebolek

[20:37](#msg5d2257f1b2a6596c1a2a7cd9)@rcqls @toomasv I'm currently rewriting Gritter API, switching from my JSON codec to Red one, so things may break during rewrite. I know I should be doing it in separate branch, but Gritter is not that used, so... :-)

It should work just fine on Windows (when the dependencies are solved), but the macOS problem shouldn't be caused by it. Access violation shouldn't be caused by Red code.

## Monday 8th July, 2019

PierreChTux\_twitter

[13:52](#msg5d234ab826a152537e4a96ac)@rcqls  
&gt; @PierreChTux\_twitter Congrats! Could you please write here the few lines to install dependencies for Debian buster and Devuan beowulf? I have in mind to create a bash script to install dependencies for most OS running Red/GTK.

Oh dear... Tracking the necessary packages among the hundreds (yes, hundreds) packages that I've hacked seems quite irrealistic.

The point is: starting from a pure Devuan installation should be no problem; but migrating from a Debian testing was what caused my deep trouble, IMHO.

I may install a Devuan from scratch, at some point in the future: I'll think about that and I'll write that in the wiki.

rcqls

[13:58](#msg5d234be926a152537e4aa098)@PierreChTux\_twitter OK no problem then.... Script is more useful IMHO... Above all with camera stuff coming with gstreamer.

PierreChTux\_twitter

[14:00](#msg5d234c78273f6558f9a3f003)@rcqls Yes, I noticed your love for scripts: way to go! Writing the script in the wiki is acceptable, right?

rcqls

[14:06](#msg5d234dd30b07314d5025214d)Putting a link is good too !

qtxie

[14:21](#msg5d235186905e046c048d9c3c)@rcqls The crashes on clicking `Change` button is an assert failed (In debug mode). I merged master branch into GTK branch, it's fixed now.

rcqls

[14:27](#msg5d2352c721d64247ed0c4d93)@qtxie Excellent! I was not in debug mode indeed... I.llThanks! Have you any idea about Unicode... I guess you are busy but this one is too much for me! Expert required....

qtxie

[14:51](#msg5d2358750dfa502d15fcb70a)@rcqls I pushed a fix for the Unicode issue.

rcqls

[15:37](#msg5d2363280b07314d5025cd5e)@qtxie Marvellous! I"ll check that when I am at Hotel since I am in the workshop `useR Toulouse`.

[16:59](#msg5d2376578b257547eefa48fd)@qtxie Just tested unicode and it works! I'll check the fix later! You're a Master!

[17:09](#msg5d2378df3b186e65696be9fb)@qtxie Unicode issue seemed to be unrelated to GTK. I can't see the part of code solving the Change issue but all these updates seem to solve the issue of `recycle/off` required to make `view-test.red` working. Great stabilization of the code! Nice!!!!

## Tuesday 9th July, 2019

rcqls

[01:26](#msg5d23ed4ef867ec1687d571cc)@qtxie One of my goal was to compile gui-console on linux. Currently, it compiles but

```
--== Red 0.6.4 ==--
Type HELP for starting information.


*** Runtime Error 1: access violation
*** at: 0812C996h
```

Since you are in top form to fix GTK expert issues, I was wondering if you should have a quick look to see if this error is related to:

1\. red redirection issue on linux  
1\. or simply the GTK part code....

I have some expectation about 1).

[01:48](#msg5d23f264f5dd1457424fc7b8)@rebolek A quick comment about gritter: I don't know why my `gitter` client does not show properly for the las few days (only the electron-based application). Do yon think `gritter` and `gitter` client could interact together? I don't think so but `gitter` client starets to get messy (bad layout: the textarea for typing the message is located almost on top and no more at the bottom) few days after I tested `gritter`. But to be clear, I don't think it is related but maybe you have a better understanding. BTW, I have to use gitter inside the browser since the electron-based client is too messy. Everything is fine on gitter mobile too. Really weird and I have already try to reinstall `gitter` several times. We really need `gritter` :smile:

qtxie

[05:17](#msg5d242378f827ad6676d3b261)@rcqls No other error messages when the console crashes?

rcqls

[05:19](#msg5d2423fa72d4092b1aadb70b)@qtxie Only warning GTK ones that I don't think they are related to the access violation:

```
(console-gui:1614): Gdk-CRITICAL **: 01:18:36.795: gdk_window_get_display: assertion 'GDK_IS_WINDOW (window)' failed

(console-gui:1614): Gdk-CRITICAL **: 01:18:36.798: gdk_cursor_new_from_name: assertion 'GDK_IS_DISPLAY (display)' failed
set cursor: 09E3F348

(console-gui:1614): Gdk-CRITICAL **: 01:18:36.800: gdk_window_get_display: assertion 'GDK_IS_WINDOW (window)' failed

(console-gui:1614): Gdk-CRITICAL **: 01:18:36.800: gdk_cursor_new_from_name: assertion 'GDK_IS_DISPLAY (display)' failed
```

[05:23](#msg5d2424eff827ad6676d3bc45)With debug mode:

```
*** Runtime Error 1: access violation
*** in file: /Users/rcqls/Github/red/modules/view/backends/gtk3/draw.reds
*** at line: 142
***
***   stack: gui/OS-draw-pen 00000000h 0 false false
***   stack: check-pen 00000000h 098400C4h F48934E8h F4893528h F48934E8h 1618 true
***   stack: parse-draw 00000000h 098400C4h true
***   stack: gui/OS-draw-face 00000000h 098400C4h
***   stack: ctx408~draw-face 098400B4h 098400C4h
***   stack: ctx559~paint F4A23120h
***   stack: ctx539~on-drawing F4A232F0h
***   stack: red/_function/call 0983FFB4h F4A232F0h
***   stack: red/interpreter/eval-code 0983FFB4h F488541Ch F488541Ch false 00000000h 00000000h 0983FF14h
***   stack: red/interpreter/eval-expression F48853FCh F488541Ch false false false
***   stack: red/interpreter/eval 0983FFA4h true
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments F4AE4414h F48853D8h F48853D8h 00000000h 00000000h
***   stack: red/interpreter/eval-code F4AE4414h F48853C8h F48853D8h false 00000000h 00000000h F4AE4414h
***   stack: red/interpreter/eval-expression F48853C8h F48853D8h false false false
***   stack: red/interpreter/eval 0983FF84h true
***   stack: red/natives/try* true 0
***   stack: do-safe
***   stack: do-actor
***   stack: ctx400~awake F4A267F8h
***   stack: gui/make-event 09A17240h 0 34
***   stack: gui/base-draw 09A17240h 099BAC00h F4A23314h
```

[05:25](#msg5d24252c72d4092b1aadbfa4)So it seems to be related to draw.... I should compile in debug mode before!

qtxie

[05:26](#msg5d242586270d2b1bfa6471cc)@rcqls Did you use debug mode? If in debug mode, usually this means the error happens in OS API. In this case, Red cannot give more details of the error.

rcqls

[05:27](#msg5d2425cfacab0914d8d590b2)The last error message is by adding `-d` (what I. call debug mode)....

qtxie

[05:28](#msg5d242600d0e06b6675711939)@rcqls Ok. Always use -d when you doing develpment, it's very useful.

rcqls

[05:30](#msg5d24266072d4092b1aadc785)I use to do it but not always....

[05:39](#msg5d2428a7cdb70805c962df9c)Here it is pretty clear: it is inside draw-face function `as draw-ctx! int/value` returns null with `int: as red-integer! (object/get-values face) + gui/FACE_OBJ_DRAW`.

[06:42](#msg5d24374e0c8daa1686b070c9)@qtxie Tell me if you want to have a look first. As the developper of gui-console.red, I guess you're more able to understand the problem. If you guess it is related to GTK, I can then have a deeper look.

qtxie

[07:07](#msg5d243d28d0e06b667571b526)@rcqls The gui-console uses some uncommon used features. For example,`on-drawing` event, `scroller`, etc. Maybe them haven't been implemented in the GTK backend.

rcqls

[07:20](#msg5d24405a98934d15a7236f0f)@qtxie Ok! Thank you for this, it is already good information for me. But could you please be more complete about the possible features not developed in GTK backend.... It is surprising so that's everything is compiling!

qtxie

[07:24](#msg5d244119bea9f357412101c7)@rcqls Red is a dynamic language, the compiler cannot check everything. Actually many things the compiler cannot check.

[07:26](#msg5d2441a998934d15a72377f8)I haven't check the code. Looks like the error above caused by missing on-drawing event.

rcqls

[07:28](#msg5d244202f867ec1687d7a82e)@qtxie It's surprising in compilation mode since a binary is created. What's you meant is that parts of code are executed after dynamically in interpreted mode. It sounds weird for me.

[07:28](#msg5d24421bcdb70805c9639a71)Ok, I'll check the `on-drawing` event

qtxie

[07:31](#msg5d2442eff827ad6676d48b9d)@rcqls &gt; What's you meant is that parts of code are executed after dynamically in interpreted mode.

Yes. The compilation mode does not compile everything, it only compiles what it can be.

rcqls

[07:33](#msg5d24433c72d4092b1aae8fa6)@qtxie Ok, it's really informative. I did not know that! It Is then as if red will eval parts of code (not compiled) dynamically.

qtxie

[07:38](#msg5d24445bbea9f35741211681)@rcqls Yes. This is where the JIT helps. When some parts of code have been interpreted many times, the JIT will be triggered to achieve better performance.

rcqls

[07:39](#msg5d2444a8f5dd14574251da6f)@qtxie Excellent introduction to JIT principle (like `Julia` is already).

[07:48](#msg5d2446ce58c6811bf978dc26)@qtxie Actually, I don't know language that works like red in compile mode with automatic parts of code evaluated at runtime.

9214

[08:31](#msg5d2450fceab1bd15a82ad6cd)@rcqls \[page 30 and further](http://venge.net/graydon/talks/CompilerTalk-2019.pdf) might be of interest to you. Though, this room is certainly not the place to discuss any of that.

rcqls

[08:35](#msg5d2451e90c8c4114d9fac9a2)@9214 Many thanks for this link. It is a discussion in a way to understand why `gui-console.red` compiles properly but not running even though some missing GTK parts of code is not implemented.

9214

[08:46](#msg5d24546b17cc7b05ca99c056)@rcqls yes, I get that. I rather meant that if you want to discuss any topics in this presentation, then we should move elsewhere, to keep your work here uninterrupted.

rcqls

[09:03](#msg5d24586017cc7b05ca99d8e1)@9214 Ok! I misunderstood you and you're right.... I'll check this presentation later.

dumblob

[09:11](#msg5d245a48b0027d2b199d64bb)@9214 @dockimbel maybe it's the right time to propose an automated fuzzer (), which will test also the otherwise inaccessible "dynamic" parts of code without writing thousands of complex unit tests and maintaining them. Such fuzzer would run automatically for all symbols in a library, etc.

dockimbel

[10:17](#msg5d2469bb72d4092b1aafa463)@dumblob Your description is too vague. You last sentence seems to address a different language than Red.

dumblob

[12:39](#msg5d248b0972d4092b1ab088ce)@dockimbel fortunately not at all :) If a language is so dynamic, that it's either impossible or costly (in terms of writing too many unit tests) to do enough ahead-of-time more formal checks (at least type checking which in homoiconic languages boils down also to value checking and therefore is kind of infeasible), then one of the easiest options is to fuzz inputs of each "functional" symbol (e.g. something which either takes some input or reads/writes global state - e.g. a function or routine) - in this case we have GTK "library" (with library I mean a set of functional symbols and data like constants etc. serving all together the same purpose - build a UI on non-Windows and non-macOS systems) and need to ensure it's fully functional, so we'll loop over functional symbols, try to run them (therefore fuzzing - https://en.wikipedia.org/wiki/Fuzzing and its prominent member https://en.wikipedia.org/wiki/American\_fuzzy\_lop\_(fuzzer) ) and observe what happens - using this method you can discover whole classes of hidden issues (like the ones above in the discussion)

qtxie

[14:27](#msg5d24a46beab1bd15a82d36f1)@dumblob Sounds like a nice tools. 🤓

[14:32](#msg5d24a58d270d2b1bfa67e2db)But I don't know how to implement it. 🙈

GaryMiller

[14:48](#msg5d24a92c0c8daa1686b3b409)@qtxie Actually pypy has been doing that runtime compilation/optimization with Python for many years. It typically runs most Python code around 20 times faster than Python 2.7 after a second to warm up, although the newer versions that run newer Python versions after 3.0 are not as heavily optimized yet and don't give you anywhere near that much speed up yet. Languages like Python are not quite as dynamic as Red so a similar approach with Red might not deliver so dramatic a speed up. Multi-threading is an area that is still very under exploited in most languages. Python was always hampered by a Global Interpreter Lock (GIL) that made true multi-threading difficult to implement without slowing down single threaded code. So it was never truly supported by their grand patriarch Guido Van Rossum. Not sure if Red would have that same type of limitation or not internally that would make multi-threading difficult.

9214

[14:56](#msg5d24ab170c8daa1686b3c498)@GaryMiller PyPy uses RPython partial evaluation framework. How is this related to fuzz-testing?

GaryMiller

[15:19](#msg5d24b07cf5dd14574254dd99)It was a referring back to the earlier JIT Red compilation conversation, nothing to do with Fuzz testing sorry.

9214

[15:28](#msg5d24b2b3f5dd14574254efe1)@GaryMiller Red doesn't have JIT (yet). Static compiler determines what is code and what is data, then "unrolls" code to a set of runtime calls, and converts data to Redbin format. Strictly speaking, this approach supports only statically compiled subset of a language: for most users, this is all the language they know, but sometimes that's not enough. So, to bypass current compiler limitations (that is, until JIT is implemented) you can either explicitly wrap dynamic parts into interpreter call (`do [...]`) or use encapping mode, which basically just pack everything into Redbin and feds it to interpreter.

dockimbel

[15:57](#msg5d24b95b270d2b1bfa687ed6)@dumblob I am familliar with fuzzy and monkey testing technics. What I can't make sense of is `an automated fuzzer (), which will test also the otherwise inaccessible "dynamic" parts of code`.

&gt; "functional" symbol (e.g. something which either takes some input or reads/writes global state - e.g. a function or routine)

`"functional" symbol` is not a concept in Redbol languages. All values are anonymous, including functions. You can reference other values directly using one word or several words, or indirectly using path accessors, actions or natives.

&gt; in this case we have GTK "library" (with library I mean a set of functional symbols and data like constants etc. serving all together the same purpose - build a UI on non-Windows and non-macOS systems

I don't know what you are talking about. Where are all those GTK "functional symbols" in Red? There is not a single GTK function or GTK constant in Red. Those are only part of the backend written in Red/System, lying at low-level and totally abstracted away by View engine.

9214

[16:01](#msg5d24ba6f270d2b1bfa688620)@dumblob a more sensible (and interesting) approach might be to utilize our \["null" testing backend](https://github.com/red/red/tree/master/modules/view/backends/test) together with genetic algorithms or somesuch.

dockimbel

[16:02](#msg5d24baa4f827ad6676d80325)Fuzzy testing is a feature that I would like to have integrated in a Red IDE, working along with live coding features.

dander

[16:38](#msg5d24c2fc58c6811bf97c66c3)property-based testing is quite interesting as well

rebolek

[16:57](#msg5d24c75d72d4092b1ab25370)@rcqls it's a strange coincidence, but nothing more. Gritter uses just API calls to server and in no way interacts with any other software.

[16:57](#msg5d24c78b72d4092b1ab254f0)e.g it doesn't steal Firefox cookies like certain Slack client :joy:

dockimbel

[17:05](#msg5d24c943cdb70805c9676d28)@rebolek I don't see vhat vou mean...

rebolek

[17:07](#msg5d24c9d017cc7b05ca9d1194)@dockimbel perhaps I should put more voltage into my message...!

dockimbel

[17:13](#msg5d24cb3398934d15a72770d3)@rebolek I didn't want to push you to revolt, but now that you're talking about it...

rebolek

[17:23](#msg5d24cd8072d4092b1ab2841d)@dockimbel few interesting facts about Gritter:

\* it can receive ~100k messages/second which should go to ~1.2Mmsg/s once x64 version is mature enough  
\* it can close itself in less than a second  
\* speed is within ~5% of IRC  
\* JSON to Red translation  
\* Safety: no emojis, no GIFs, no trolling  
\* Powerful UI and so on of course

9214

[17:24](#msg5d24cdc80c8daa1686b4cfea)&gt; no GIFs

Not hot! (Should we move to chit-chat perhaps?)

rebolek

[17:32](#msg5d24cfc7cdb70805c9679fcf)Right, ve are ovv-topic.

rcqls

[20:31](#msg5d24f9a5f5dd14574256faca)@rebolek thanks for the confirmation of bad coincidence!

## Wednesday 10th July, 2019

dumblob

[13:23](#msg5d25e6ec0c8daa1686bcac28)@dockimbel

&gt;What I can't make sense of is `an automated fuzzer (), which will test also the otherwise inaccessible "dynamic" parts of code`

The `()` is a typo. `"dynamic" parts of code` are those which can't be statically compiled (because there is some homoiconic manipulation).

&gt;`"functional" symbol` is not a concept in Redbol languages. All values are anonymous, including functions. You can reference other values directly using one word or several words, or indirectly using path accessors, actions or natives.

If I understand it correctly, then it's very sad that Re(d)bol world does want to stand out and therefore \*\*strictly refuses\** the worldwide standard/common terms and tries to create even its own "slang" for the same thing.

But really, a `symbol` is the most general term from parsing (https://en.wikipedia.org/wiki/Parsing ) and corresponding formalism (https://en.wikipedia.org/wiki/Symbol\_(formal) ). A `functional` symbol is a symbol which refers to \*something taking an input and producing some output\*. Nothing more, nothing less.

&gt;I don't know what you are talking about. Where are all those GTK "functional symbols" in Red? There is not a single GTK function or GTK constant in Red.

This sounds to me kind of like a contradiction to the rest:

&gt;Those are only part of the backend written in Red/System, lying at low-level and totally abstracted away by View engine.

Yes, exactly - there is an implementation of bindings and we don't know whether this library of functional symbols making up a GTK bindings backend does work or not. We can't statically check it, we can't write thousands of unit tests (like you did in the \["null" (unit) testing backend](https://github.com/red/red/tree/master/modules/view/backends/test ) which @9214 mentioned), so let's try some automated methods - e.g. fuzzy testing.

Since I mentioned fuzzy testing for the first time, I didn't want to convey any other information than just this dead simple last sentence. Don't know why we're discussing some Re(d)bol slang and other pretty unrelated stuff. Sorry if that caused someone feel uncomfortable - that was certainly not my goal.

9214

[14:20](#msg5d25f4430c8c4114d9068127)&gt; it's very sad that Re(d)bol world does want to stand out...

There's a lot of red-herring flying around here. Words are symbolic values, which consist of two parts: \*symbol* (its "spelling") and \*binding* (its "meaning"). They are first-class citizens of the language, commonly used as substitute for variables, or keys in key/value structures, or just a filler to drive DSL interpreters / parsers. Words provide a level of indirection when accessing over values in Red, and, contrary to your claim, they are nothing like formal symbols - the closest thing that matches words, I think, are \[fexpr](https://en.wikipedia.org/wiki/Fexpr)'s operands. And, believe me, "words" are called like that for a good reason, because they resemble how words in natural language can have same spelling (symbol), but different meanings (binding).

&gt; This sounds to me kind of like a contradiction to the rest

You seems to be confused about the relation between Red and Red/System. Red/System is a C-level language used to implement Red's runtime. Historically, it's a totally separated part of a toolchain. So, there are really no GTK "functional symbols" in Red - they are all part of View backend, written in Red/System, all abstracted away by a single `view` function in Red runtime.

Red, on the other hand, is a high-level language, which is also its own data format, which it also shares with Red/System. What that means that you \*can* manipulate Red/System scripts as data (which includes `word!` values, the ones you call "symbols"), but, to do any kind of fuzz-testing, these Red/System scripts need to be statically compiled, and what needs to be fuzzed in such case is the native code or library calls.

dockimbel

[14:32](#msg5d25f6e5eab1bd15a8370125)@dumblob  
&gt; The () is a typo. "dynamic" parts of code are those which can't be statically compiled (because there is some homoiconic manipulation).

That still doesn't tell me how fuzzy testing related to compiler's output (which contains statically compiled parts and expressions that are resolved at runtime).

&gt; If I understand it correctly, then it's very sad that Re(d)bol world does want to stand out and therefore strictly refuses the worldwide standard/common terms and tries to create even its own "slang" for the same thing.

Straw-man.

&gt; Don't know why we're discussing some Re(d)bol slang and other pretty unrelated stuff. Sorry if that caused someone feel uncomfortable - that was certainly not my goal.

I'm not a native english speaker, but that sounds like a passive-aggressive sentence, with contempt towards our work.

Why not try to understand how Red works rather than resorting immediately to condescendence and misplaced arguments from authority?

9214

[14:40](#msg5d25f8d5eab1bd15a8371003)So, since GTK backend is abstracted away, and static compilation makes fuzzing a terribly slow and bulky solution, the way to go is to craft "payloads" (`block!`s of View dialect) which contain "functional symbols" (`word!` and any other values), using automated "null" backend. This can uncork many hidden bugs, and can potentially scale up to general-purpose Red code.

Or you can manipulate Red/System script in GTK backend as data from Red level, searching for "gadgets" (in ROP parlance) and compiling them, but that's more-or-less the same as fuzzing library calls directly, and looks more like exploiting than testing. Though, this, in turn, can help discover bugs in R/S compiler.

## Monday 15th July, 2019

rcqls

[15:45](#msg5d2c9faa7dbfff3242b1f4e6)@qtxie No more crash when running `gui-console`. Now I need to understand what it needs to be drawn.... Lot of work remaining but it is more fun to not have failures.

qtxie

[16:42](#msg5d2cacdcd14e297762d81a72)@rcqls Great! :+1:

rcqls

[16:46](#msg5d2cade6d14e297762d82267)\[!\[Capture d’écran 2019-07-15 à 18.45.49.png](https://files.gitter.im/red/GTK/rWzr/thumb/Capture-d\_ecran-2019-07-15-a-18.45.49.png)](https://files.gitter.im/red/GTK/rWzr/Capture-d\_ecran-2019-07-15-a-18.45.49.png)

qtxie

[16:47](#msg5d2cae0e3b41924785c4924b)The gui-console draws a rich-text on the face in on-drawing event.

rcqls

[16:47](#msg5d2cae327dbfff3242b271d5)@qtxie Maybe with this screenshot, it is better to understand the issue.

[16:49](#msg5d2caeb54f7f9e219cfba289)@qtxie Ok since rich-text is not perfect maybe it is the explanation.... I thought also that it could be a cursor issue since if I remember well the cursor is blue by default.

qtxie

[16:50](#msg5d2caed87dbfff3242b278f0)The cursor is just a base face which uses a timer to make it blink.

rcqls

[16:50](#msg5d2caef354d3383937110491)Ok thanks!

[17:06](#msg5d2cb2af3be99c4786563da0)@qtxie Is the gui-console working on macOS? I have an access violation when running it and after compiling it with latest red/master....

qtxie

[17:09](#msg5d2cb3313596f56f8ce37f48)@rcqls I haven't tried since a while. I remember it has some issues last time I tried.

rcqls

[17:17](#msg5d2cb52c7dbfff3242b2b147)@qtxie Ok! I simply wanted to compare it with the GTK version.... So `gui-console` is not a priority!

qtxie

[17:45](#msg5d2cbbb57dbfff3242b2e13f)@rcqls I'll check it when we start doing 0.6.5 release. I think the menu in the gui-console doesn't work on macOS last time I checked.

## Tuesday 16th July, 2019

rcqls

[11:09](#msg5d2db0773b41924785cbba3a)@qtxie Indeed, when developing menu for GTK, I noticed that menu for macOS was not completed.

qtxie

[13:21](#msg5d2dcf5bf4fe9439711ac104)The menu in gui-console doesn't show at all. It works before...

## Thursday 18th July, 2019

rcqls

[08:26](#msg5d302d21b74a8716e274693e)\[!\[Capture d’écran 2019-07-18 à 10.23.52.png](https://files.gitter.im/red/GTK/aKyb/thumb/Capture-d\_ecran-2019-07-18-a-10.23.52.png)](https://files.gitter.im/red/GTK/aKyb/Capture-d\_ecran-2019-07-18-a-10.23.52.png)

[08:26](#msg5d302d287dbfff3242cc0943)@qtxie Deactivating `tips!`, console-gui looks better even though it does not work from now!

qtxie

[08:55](#msg5d30340001621760bcd68e6e)@rcqls Nice! :+1:

rcqls

[13:55](#msg5d307a6cb74a8716e276912e)@qtxie Is there a red function to only print in the terminal console and not in the gui-console in order to help debugging?

qtxie

[14:43](#msg5d3085ac7dbfff3242ce9352)@rcqls Yes. `debug-print` in gui-console.red

rcqls

[15:18](#msg5d308dc9eab6cd77638f89b8)@qtxie Thanks! I missed that!

[15:21](#msg5d308e8601621760bcd91a8c)I realize that I have read everything except the very beginning which is very clear (debug mode flag)!

## Friday 19th July, 2019

rcqls

[11:11](#msg5d31a5798285d81daa215787)@qtxie Fighting with gui-console to have a first command evaluating. I am asking how to have `exit-ask-loop` ending in such a way to have `eval-command` running. When typing `Enter`, `exit-ask-loop` is executed but nothing is really stopped staying in the `ask` command related to `eval-command`. I see `post-quit-msg` in the other backends but I really don't know what to put inside this function to stop `ask` command. If you have any tips, I will appreciate.

qtxie

[11:20](#msg5d31a790e2d1aa6688d10ba1)@rcqls A new event loop (do-events) is created in `ask`. The `exit-ask-loop` is used to exit the loop. In GTK backend, we need to force `g_main_context_iteration` return false in order to exit the loop. https://github.com/red/red/blob/GTK/modules/view/backends/gtk3/events.reds#L451

rcqls

[11:25](#msg5d31a8abd444310992572ea0)@qtxie Thanks for the quick answer, I have this in mind but was not fully sure. I'll try that!

[11:55](#msg5d31afb8e2d1aa6688d14bd7)@qtxie `exit-loop: exit-loop - 1` inside `post-quit-msg` seems to work! I quickly tested `console-view` and it seems to still work.

[11:55](#msg5d31afcbec5abe7bbc0fa2fe)\[!\[Capture d’écran 2019-07-19 à 13.55.23.png](https://files.gitter.im/red/GTK/NB4E/thumb/Capture-d\_ecran-2019-07-19-a-13.55.23.png)](https://files.gitter.im/red/GTK/NB4E/Capture-d\_ecran-2019-07-19-a-13.55.23.png)

[15:58](#msg5d31e88e8285d81daa2374e7)@qtxie I have proposed a PR corresponding to a first significant improvement to have a version of gui-console useable. Tips, caret and scroller are still missing ....

qtxie

[17:01](#msg5d31f76a985141668730eafa)@rcqls Thanks. :+1: PR merged.

greggirwin

[18:53](#msg5d32118d09580b7bbb6f2329)More great progress!

## Saturday 20th July, 2019

rcqls

[02:36](#msg5d327e1409580b7bbb721a92)@qtxie Thanks for the quick merge! @greggirwin I guess that finalizing gui-console is a good starting point to have red/GTK pretty stable!

greggirwin

[17:51](#msg5d3354bc8fe53b671da8a6c9)Yes, @rcqls. Having the console available is a critical piece IMO.

## Monday 22nd July, 2019

loziniak

[08:24](#msg5d3572ce437a3a13483404a4)@greggirwin I think in Linux world GUI console is less important, because CLI tools are first-class citizens here :-) I would not say it's "critical".

[08:27](#msg5d35737ae2d1aa6688ea9fe3)Although it's great to have it working, as a form of a GTK implementation safeguard.

rcqls

[08:48](#msg5d357842d1cceb1a8d9ec28b)@qtxie I have submitted a PR to have caret and preliminary scrolling. At first, the caret is not well located. Resizing the window fixes that. I did not find yet a solution. If you have an idea, it is welcome!

qtxie

[15:25](#msg5d35d583437a3a134836ed87)@rcqls Great progress! If set the caret/offset moves the caret correctly, it should work fine.

rcqls

[15:44](#msg5d35d9ec8fe53b671db9d04a)@qtxie Not sure but even if the caret/offset is well set at the very beginning the caret don't move staying at position 0. After a resizing it goes to the right position.... I detected issues on &amp; and &gt; characters at input since richtext on gtk relies on XML but I am trying to solve it.

greggirwin

[18:02](#msg5d35fa3dec5abe7bbc2d054f)@loziniak it's critical, which I should have made clear, for consistent cross platform support. Limited resources may mean delays in features, but we want all platforms to be as consistent as possible.

loziniak

[19:16](#msg5d360b8ea0351b1a8c7cf0cc)@greggirwin you're right, I haven't seen it from consistency point of view.

## Sunday 28th July, 2019

loziniak

[20:20](#msg5d3e038cbdfdb22bbb5fc095)Hello! I get following error:

```
% ~/prj/red/linux-gui-190724
GTK VERSION: 3.24.8
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> view [panel [] on-down [append face/pane layout/only [text "aaa"]]]

(linux-gui-190724:16004): Gtk-WARNING **: 22:15:31.443: Attempting to add a widget with type GtkLabel to a container of type GtkLayout, but the widget is already inside a container of type GtkEventBox, please remove the widget from its existing container first.

(linux-gui-190724:16004): Gtk-CRITICAL **: 22:15:31.447: gtk_layout_move: assertion 'gtk_widget_get_parent (child_widget) == GTK_WIDGET (layout)' failed

(linux-gui-190724:16004): GLib-GObject-WARNING **: 22:15:31.447: instance with invalid (NULL) class pointer

(linux-gui-190724:16004): GLib-GObject-CRITICAL **: 22:15:31.447: g_signal_emit_valist: assertion 'G_TYPE_CHECK_INSTANCE (instance)' failed

(linux-gui-190724:16004): GLib-GObject-CRITICAL **: 22:15:31.448: g_object_set_qdata: assertion 'G_IS_OBJECT (object)' failed

(linux-gui-190724:16004): GLib-GObject-WARNING **: 22:15:31.448: instance with invalid (NULL) class pointer

(linux-gui-190724:16004): GLib-GObject-CRITICAL **: 22:15:31.448: g_signal_handlers_destroy: assertion 'G_TYPE_CHECK_INSTANCE (instance)' failed

(linux-gui-190724:16004): GLib-GObject-WARNING **: 22:15:31.448: instance with invalid (NULL) class pointer

(linux-gui-190724:16004): GLib-GObject-CRITICAL **: 22:15:31.448: g_signal_handlers_destroy: assertion 'G_TYPE_CHECK_INSTANCE (instance)' failed

(linux-gui-190724:16004): GLib-GObject-CRITICAL **: 22:15:31.448: g_object_unref: assertion 'old_ref > 0' failed

(linux-gui-190724:16004): Gtk-CRITICAL **: 22:15:52.427: gtk_container_add: assertion 'GTK_IS_WIDGET (widget)' failed

(linux-gui-190724:16004): Gtk-CRITICAL **: 22:15:52.427: gtk_layout_move: assertion 'GTK_IS_WIDGET (child_widget)' failed

(linux-gui-190724:16004): GLib-GObject-CRITICAL **: 22:15:52.427: g_object_unref: assertion 'G_IS_OBJECT (object)' failed
```

[20:23](#msg5d3e0426b2f4075cb81b63bf)Under Wine this code works as expected.

rcqls

[20:26](#msg5d3e04dca9200c24281451ae)@loziniak Bug confirmed! Feature not yet considered and never seen in all the examples I have seen....

## Monday 29th July, 2019

loziniak

[11:17](#msg5d3ed5d984536e27e06b6a16)Haha that's what a sick mind is able to create :-)

## Tuesday 30th July, 2019

rcqls

[03:22](#msg5d3fb811840e2871806da7ea)@loziniak After reading more carefully the error message and testing that ,by replacing in your example, `text` by `button` everything was fine, I realized that I added this feature longtime ago when considering `update-z-order` used in the `view-test.red`. I renamed it `change-pane` (that's why I couldn't remember this feature) vhich is more explicit. I also updated it to fix your issue but it is still in the last PR I have submitted but nit yet accepted.... You can test it to `rcqls/red:GTK`.

## Wednesday 31st July, 2019

rcqls

[15:49](#msg5d41b88b5367476cc986efce)Some advances on gui-console which is mostly useable. The known issues that I am working

\* Selection is not properly handled because of the escaped characters `&`, `<`, `>`.... . Soon I'll propose a function to escape only `&` and `<` which are the only characters needed to escape. For selection `caret-to-offset` needs to be improved for GTK.  
\* Minor issue: When changing font the font color become black.

[15:50](#msg5d41b8b14ba6af0b02646e54)\[!\[Capture d’écran 2019-07-31 à 17.35.44.png](https://files.gitter.im/red/GTK/nmlH/thumb/Capture-d\_ecran-2019-07-31-a-17.35.44.png)](https://files.gitter.im/red/GTK/nmlH/Capture-d\_ecran-2019-07-31-a-17.35.44.png)

## Thursday 1st August, 2019

greggirwin

[00:39](#msg5d4234c19a02440b03356231):+1:

## Friday 2nd August, 2019

rcqls

[05:11](#msg5d43c5fbee80d76164d2c2b7)FYI Minor issue fixed and function to escape only `&` and `<` written in `red/system`. As a direct consequence, selection is much more useable even though not perfect yet :  
\* does not work only on the gui-console if selected text contains these 2 characters . It will be fixed after some update of `caret-to-offset`.  
\* minor bug hiding the end of text when selecting

If you want to try it without compiling from source (`rcqls/red:GTK` since PR not yet accepted), here a link \[gui-console](https://cqls.dyndoc.fr/users/RCqls/Red/gui-console).

[12:32](#msg5d442d77e939ab2447e24ed8)Minor bug fixed and syntax highlighting activated for fun :smile: (same link to test)

[12:33](#msg5d442d8e4635976e04189dac)\[!\[Capture d’écran 2019-08-02 à 14.30.58.png](https://files.gitter.im/red/GTK/8iaM/thumb/Capture-d\_ecran-2019-08-02-a-14.30.58.png)](https://files.gitter.im/red/GTK/8iaM/Capture-d\_ecran-2019-08-02-a-14.30.58.png)

toomasv

[13:01](#msg5d44341eee80d76164d5fd99):clap:

rcqls

[13:12](#msg5d4436a87a151629e10e6677)Thanks @toomasv. There is still an issue on selection with &amp; and &lt; characters but it is not a common use case and I have a solution in mind. Your `makedoc/easy-VID-rt.red` is very helpful to test `rich-text` widget in combination now with the `gui-console`.

[15:58](#msg5d445db3757b7b19c84214a5)@toomasv Just a quick question, when testing `makedoc/easy-VID-rt.red` on my VB win7, there is no scroller like in GTK. Do you confirm it?

pekr

[16:15](#msg5d4461994b8ca519c9d20fd5)btw, why is there a problem with escape chars? Is there any low lovel difference to the implementation between Win and Linux i that regard?

toomasv

[17:15](#msg5d446fb0d7fc954750e94dc5)@rcqls Yes, no scroller - each page is meant to be max panel height.

rcqls

[17:32](#msg5d4473a526e273244604724d)@pekr Yes I think so there is a difference (but not sure) since GTK relies on xml.

[17:32](#msg5d4473be4b8ca519c9d2996e)@toomasv Thanks for the confirmation.

toomasv

[17:33](#msg5d4473d975c7976e0316ec06):+1:

greggirwin

[17:54](#msg5d4478daee80d76164d81477)@rcqls, more great progress. Thanks for dealing with all those details.

rcqls

[18:37](#msg5d448301e939ab2447e51417)@greggirwin i am very close to some version very similar to the windows" one. I even changed my mind when testing highlighting to solve the remaining issue in a very elegant way (my hope). At the moment it is already useful. Actually I was not very motivated but readline/history syntax highlighting and running a script selected from dialog is already nice convenience.

greggirwin

[18:42](#msg5d4484294635976e041b64b7):+1:

## Saturday 3th August, 2019

rcqls

[08:36](#msg5d45478eee80d76164dd73a7)Everything planned is fine now. I found a solution even simpler and then more elegant than the one I had in mind.

## Sunday 4th August, 2019

abdllhygt

[13:19](#msg5d46db50475c0a0febf9ef60)hi!

[13:20](#msg5d46dbaea96def4751b6dda3)i downloaded `red-GTK` and builded, but;

```
>> view[]
*** Script Error: view has no value
*** Where: catch
*** Stack:
```

rcqls

[13:24](#msg5d46dc914635976e042b2418)@abdllhygt the`console.red` script to compile needs `Needs: 'View`. You should compile `console-view.red` instead. You can also directly use the `gui-console`binary (see link above).

abdllhygt

[13:27](#msg5d46dd4775c7976e03274f00)@rcqls thank you!

## Thursday 8th August, 2019

loziniak

[15:02](#msg5d4c396ebb5364334cf63364)Hi! Is `no-border` flag implemented in GTK?

rcqls

[15:33](#msg5d4c40d51db76d0ffe985ac0)I did it very recently...

## Saturday 10th August, 2019

rebolek

[09:58](#msg5d4e95477d56bc60802ac0cc)@rcqls what is required for GUI-console?

```
sony➜~/code/red(GTK-dev✗)» ./gui-console                                [11:59:12]
GTK VERSION: 3.24.10

*** Runtime Error 32: segmentation fault
*** at: F7582628h
```

rcqls

[10:00](#msg5d4e95b21db76d0ffea8eec6)@rebolek Normally nothing more is required!

rebolek

[10:00](#msg5d4e95d61db76d0ffea8f000)@rcqls I'll try debug build to see if I can get more info.

rcqls

[10:01](#msg5d4e95f653490e334dc80dbc)Are you using the `gui-console` binary or are you compiling from source?

rebolek

[10:01](#msg5d4e9601bb5364334c072a1e)compiling from source

[10:01](#msg5d4e960bbeba830fff696c06)on GTK-dev branch

rcqls

[10:02](#msg5d4e961dc87a0963e746598e)Ah no it's GTK branch!

rebolek

[10:02](#msg5d4e962dbb5364334c072d07)Ah, thanks, I'll try again and let you know!

rcqls

[10:03](#msg5d4e965690bba62a124e933b)My GTK-dev is stopped since now almost everything is on the official repo `red/GTK`

[10:03](#msg5d4e96791dadc42a1145cf13)There is only one PR not yet accepted....

rebolek

[10:03](#msg5d4e967cbeba830fff696f66)I had some troubles building it on `GTK` so I tried to switch to `GTK-dev`

rcqls

[10:04](#msg5d4e96957d56bc60802ac97e)Are you on manjaro?

rebolek

[10:04](#msg5d4e969aa4efe3718dd961b5)Yes

rcqls

[10:05](#msg5d4e96e22612bb718c41375b)I try to run `gui-console` on my archlinux container then...

rebolek

[10:06](#msg5d4e9708a4efe3718dd96491)I'm compiling gui-console on GTK branch right now, so just wait a minute...

rcqls

[10:07](#msg5d4e9768beba830fff697596)It works on Archlinux!

[10:14](#msg5d4e990cbfd2887f53c2d9e2)BTW, my gtk version is older than yours: `GTK VERSION: 3.24.2`

[10:17](#msg5d4e99cd029a51607f6b723e)Also `ctrl+wheel` is zooming font in `gui-console` (added recently by @qtxie).

## Sunday 11st August, 2019

rebolek

[05:02](#msg5d4fa1811dadc42a114cd685)@rcqls I've got this in console, but don't see any window:

```
sony➜~/code/red(GTK✗)» ./gui-console                                    [12:04:34]
GTK VERSION: 3.24.10

(gui-console:23725): Gdk-CRITICAL **: 12:08:51.772: gdk_window_get_display: assertion 'GDK_IS_WINDOW (window)' failed

(gui-console:23725): Gdk-CRITICAL **: 12:08:51.772: gdk_cursor_new_from_name: assertion 'GDK_IS_DISPLAY (display)' failed

(gui-console:23725): Gdk-CRITICAL **: 12:08:51.773: gdk_window_get_display: assertion 'GDK_IS_WINDOW (window)' failed

(gui-console:23725): Gdk-CRITICAL **: 12:08:51.773: gdk_cursor_new_from_name: assertion 'GDK_IS_DISPLAY (display)' failed
--== Red 0.6.4 ==-- 
Type HELP for starting information.
```

rcqls

[06:02](#msg5d4faf8ed03a7c63e6086b3f)@rebolek It is really weird. Are you sure the window is not open and hidden by any another windows? My last PR (rcqls/red:GTK) removes theses messages but I don't think they are fatal.

[06:11](#msg5d4fb19ebb5364334c0e8af0)@rebolek Have you tried to download \[gui-console](https://cqls.dyndoc.fr/users/RCqls/Red/gui-console)? I hope you are compiling in release `-r` mode since `-u` and `-c` works now at compilation but not at execution time.

[06:31](#msg5d4fb6242612bb718c48c310)@rebolek What about compiling `console-view.red` in release mode from my GTK branch and then execute `tests/cursor.red` which is supposed to work from this morning....

[06:36](#msg5d4fb782029a51607f72ea30)No more warnings after my last commit (and PR)....

[08:05](#msg5d4fcc5053490e334dd05b50)After cross compiling `gui-console.red` for odroid (RPi target), it works on odroid... (Except the wheeling....)

[08:09](#msg5d4fcd1d90bba62a1256b314)`test/cursor.red` is working too.

rebolek

[08:19](#msg5d4fcf874e17537f52100fa2)@rcqls I tried to download gui-console, same result. There's a brief flash before output is written to console, so it looks that some window is probably trying to open. I am using i3 windows manager.

rcqls

[09:18](#msg5d4fdd562612bb718c49d796)@rebolek Do you have several monitors? These lines in the launch function inside `gui-console.red`

```
svs: system/view/screens/1
svs/pane: next svs/pane
```

maybe could be an explanation since I don't really understand them. BTW what about `tests/cursor.red`, is it working after compiling it?

[09:19](#msg5d4fdd9a029a51607f73f956)`i3 window manager` could also be an explanation.....

[09:45](#msg5d4fe3ac53490e334dd0f274)@qtxie Just tested a bit `gui-console` on Odroid and :  
\* command line mostly work except `help` and `what` that work once but then no more instruction is validated by enter key.  
\* `wheel` is not responding whereas it is working on browser (and tested on macOS with the same mouse). Good news `ctrl+arrows` work (not on macOS since these shortcuts are intercepted by the system first).  
\* when quitting the `gui-console` everything is fine but when closing the window there is a fail: `Runtime Error 95: no CATCH for THROW`.

I have also tried to compile directly `gui-console` and `console-view` which create binaries but fail at execution (related to `objects.reds` when compiled in debug mode).

[10:46](#msg5d4ff1fc5178a724766a610b)but this was already mentioned by @dockimbel.

rebolek

[18:30](#msg5d505ebd53490e334dd4587f)@rcqls right, I suspect it has something to do with it, OTOH I don't have any problems opening other windows from Red.

loziniak

[18:36](#msg5d506012c87a0963e75262b8)Hi! I've downloaded \[gui-console](https://cqls.dyndoc.fr/users/RCqls/Red/gui-console) and tested a little under my Arch installation. It runs, but:  
1\. After running `?` command with no arguments I cannot run any other command, Enter key does not have effect. Scrolling a mouse wheel over a console window kinda releases frozen events, and unsuccessful commands are run. The same with `help` command.  
2\. Mouse wheel scrolls in unusual direction over the console text - scrolling up does not scroll text down, as in other GTK apps, but in opposite direction.  
3\. Menu font is bigger than in other GTK apps (mousepad, xfce4-terminal, gparted)

rcqls

[18:51](#msg5d5063c4bb5364334c136252)@loziniak Thanks for the feedback. Point 1 looks like the issue observed on Odroid. However I cannot reproduce this issue on my docker container with archlinux. Could you please provide your version of GTK. I have noticed the version on Odroid was different.

Point 2 is something I did not pay attention because I am on macOS and I never know the direction of the wheeling.

Point 3 is something difficult to master from now but I have fixed a default font. Really happy to have font changing on RichText.

loziniak

[18:53](#msg5d506425c87a0963e752815c)@rcqls `GTK VERSION: 3.24.8`

rcqls

[19:02](#msg5d50665453490e334dd48c03)@loziniak Thanks! I don't think it is related to that since mine is `3.24.2`

## Tuesday 20th August, 2019

luis-rj

[22:16](#msg5d5c7152c508da44c352df8d)Are there Red binary available for linux-ar? (Raspberry PI)

Respectech

[22:28](#msg5d5c74247e160727e07db1f3)If I remember correctly, you need to compile for the Linux-ARM target to run on Raspberry Pi or other Linux ARM systems (ODROID, Pine64, etc.).

## Wednesday 21st August, 2019

rcqls

[07:53](#msg5d5cf8858e8dde63d80eed5f)@luis-rj You only need to cross-compile `red/GTK` branch with target `RPi` or maybe `linux-ARM` (depending on the model but not sure) as mentionned by @Respectech. I can provide binaries on my server if you ask for it.

luis-rj

[16:39](#msg5d5d73cbd45f7c26fa0cd555)@Respectech Thanks!

[16:46](#msg5d5d755d86c1a96ad50ed491)@rcqls I would be grateful if you you can provide me an Red binary for RPi.

## Thursday 22nd August, 2019

rcqls

[00:26](#msg5d5de12379229b63d99a9372)@luis-rj Here it is:  
\* \[console-view-rpi](https://cqls.dyndoc.fr/users/RCqls/Red/console-view-rpi)  
\* \[console-view-arm](https://cqls.dyndoc.fr/users/RCqls/Red/console-view-arm)  
And for testing:  
\* \[gui-console-rpi](https://cqls.dyndoc.fr/users/RCqls/Red/gui-console-rpi)  
\* \[gui-console-arm](https://cqls.dyndoc.fr/users/RCqls/Red/gui-console-arm)

greggirwin

[00:29](#msg5d5de1fa7d3c163641199b49)Thanks for making those available @rcqls !

rcqls

[00:32](#msg5d5de2a5c508da44c35c7890)@greggirwin Hope it can help for testing Red/GTK on Raspberry Pi 👍

luis-rj

[17:18](#msg5d5ece69d45f7c26fa167669)@rcqls Thanks !!  
I plan to try it on Raspberry over the weekend

rcqls

[18:23](#msg5d5edd895ba4a84f697103f0)@luis-rj Don’t forget to install dependencies and `chmod u+x`.

luis-rj

[22:27](#msg5d5f16bfd45f7c26fa187afe)Raspbian is 32 bits. Needs dependencies ?

[22:51](#msg5d5f1c7a7e160727e08fbd5b)@rcqls I have different problems with your versions. In the demo video at redlang.org the version is 3.22.30 ...

[22:53](#msg5d5f1cd7b059db27dfc2ccdb)@rcqls Can you build binaries from 3.22.30 version ?

## Friday 23th August, 2019

rcqls

[00:39](#msg5d5f35d45ba4a84f6973921c)@luis-rj Normally there is no build binaries dependencies on GTK version...

## Wednesday 4th September, 2019

loziniak

[13:24](#msg5d6fbaf1b20700597713f9c6)@rebolek your build server is down already for a few weeks. do you need any help with that? or just some time?

[13:30](#msg5d6fbc646d7c672b45b1fb0f)@rcqls is any development taking place in your `GTK-dev` branch, or is it moved to official `GTK` branch entirely? It seems to be the most up to date branch.

[13:55](#msg5d6fc2391a16fc3887443339)I found an answer to my branch question \[in recent posts](https://gitter.im/red/GTK?at=5d4e965690bba62a124e933b). I'll update wiki page.

rcqls

[14:21](#msg5d6fc878dc5bb2549de59aec)@loziniak `red/red:GTK`is the official branch now since @bitbegin is now contributing too. So `rcqls/red:GTK` is very often synchroniezd with the official `red:GTK` branch. My `GTK-dev` is still there since there is the camera development which require a lot of dependencies that’s why I did not merge this work inside the official branch.

## Thursday 5th September, 2019

rebolek

[13:58](#msg5d7114a350508949d3df976f)@loziniak I know. Thanks for offer, I just need to get some money to pay the VPS and it will run again :)

## Friday 6th September, 2019

loziniak

[10:19](#msg5d7232a2a08e2b4bd2991aec)@rebolek I have an option of a \[cheap VPS](https://tiktalik.com/en/). What are minimum specs? I could donate a 1GB/1GHz/20GB instance for the purpose.

[12:48](#msg5d7255a1a08e2b4bd29a29da)Hi! In GTK `text` face is not clickable. Compare effects of running this code on Windows and Linux (latest github version):

```
view [text "click me" white [print "CLICKED"]]
```

[13:12](#msg5d725b46ae44a841248eb7a4)Oh, and my app just crashed. I cannot provide source code, but perhaps you'll be able to track the problem?

```
(console-view:6157): GLib-GObject-CRITICAL **: 15:05:33.538: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed

(console-view:6157): Gtk-CRITICAL **: 15:05:33.538: gtk_widget_set_size_request: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:6157): Gtk-CRITICAL **: 15:05:33.538: gtk_widget_queue_resize: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:6157): Gtk-CRITICAL **: 15:05:33.538: gtk_widget_queue_draw: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:6157): Gtk-CRITICAL **: 15:05:33.538: gtk_widget_show_all: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:6157): Gtk-CRITICAL **: 15:05:33.539: gtk_widget_grab_focus: assertion 'GTK_IS_WIDGET (widget)' failed

(console-view:6157): GLib-GObject-CRITICAL **: 15:05:33.539: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed

*** Runtime Error 1: access violation
*** in file: red-github/modules/view/backends/gtk3/gui.reds
*** at line: 1618
***
***   stack: gui/OS-show-window 141493808
***   stack: gui/OS-refresh-window 141493808
***   stack: ctx408~refresh-window 08501BC4h
***   stack: show
***   stack: show
***   stack: show
***   stack: red/_function/call 085016B4h F7F0E884h
***   stack: red/interpreter/eval-code 085016B4h F541CBA8h F541CBA8h false 00000000h 00000000h F3C18D38h
***   stack: red/interpreter/eval-expression F541CB98h F541CBA8h false false false
***   stack: red/interpreter/eval 085016A4h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments F3C18078h F541C984h F541C984h 00000000h 00000000h
***   stack: red/interpreter/eval-code F3C18078h F541C954h F541C984h false 00000000h 00000000h F3C18078h
***   stack: red/interpreter/eval-expression F541C954h F541C984h false false false
***   stack: red/interpreter/eval 08501664h true
***   stack: red/natives/either* false
***   stack: red/interpreter/eval-arguments F3C18A78h F541B634h F541B634h 00000000h 00000000h
***   stack: red/interpreter/eval-code F3C18A78h F541B604h F541B634h false 00000000h 00000000h F3C18A78h
***   stack: red/interpreter/eval-expression F541B604h F541B634h false false false
***   stack: red/interpreter/eval 08501634h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments F3C18078h F541B1D4h F541B1D4h 00000000h 00000000h
***   stack: red/interpreter/eval-code F3C18078h F541B1A4h F541B1D4h false 00000000h 00000000h F3C18078h
***   stack: red/interpreter/eval-expression F541B1A4h F541B1D4h false false false
***   stack: red/interpreter/eval F541B0F0h true
***   stack: red/interpreter/eval-function F541B098h F541B0F0h
***   stack: red/_function/call F541B098h F7EF4F48h
***   stack: red/object/fire-on-set 08501544h F3B58898h 08501584h 08501574h
***   stack: red/object/eval-path 08501544h F3B58898h 08501574h F3B58574h false
***   stack: red/actions/eval-path 08501544h F3B58898h 08501574h F3B58574h false
***   stack: red/interpreter/eval-path F3B58898h F3B58594h F3B58684h true true false false
***   stack: red/interpreter/eval-expression F3B58594h F3B58684h false false false
***   stack: red/interpreter/eval F3B58400h true
***   stack: red/interpreter/eval-function 08501514h F3B58400h
***   stack: red/_function/call 08501514h F7F0E884h
***   stack: red/interpreter/eval-code 08501514h F540FCBCh F540FCBCh false 00000000h 00000000h F3C20308h
***   stack: red/interpreter/eval-expression F540FC9Ch F540FCBCh false false false
***   stack: red/interpreter/eval F540FC28h true
***   stack: red/interpreter/eval-function 085014E4h F540FC28h
***   stack: red/_function/call 085014E4h F7EF9984h
```

[13:23](#msg5d725dc6b3e2fc579363947d)Next thing. @rcqls recently spoke about working on `no-border` in GTK. In my case this code still makes fields with borders:

```
view [field no-border field no-border]
```

[14:05](#msg5d7267c7c593902720230514)&gt; Oh, and my app just crashed. I cannot provide source code, but perhaps \[...]

This crash occurs when settting panel's size, like that: `panel-face/size: 200x200`.

## Saturday 7th September, 2019

rcqls

[07:13](#msg5d73587eb3e2fc57936a7367)@loziniak As a true linux user (that’s I am not since I am on macOS ), have you planned to contribute in the development of `red:GTK` branch. I think that all what you mentionned could be fixed by small PR. My original goal was only to propose a first useable version to be improved by community since., as mentionned by @dockimbel very often, the `red:GTK` branch development is a community effort. Now I think it is time to enlarge the community….

loziniak

[19:37](#msg5d7406f82f93ab5a15223bea)@rcqls I'd love to! I'm not fluent in Linux low level internals and I don't know GTK, but I'll be happy to learn if my time allows for that. Do you have some suggestions what to read at the beginning? Is GTK's official dev documentation OK to dive-in fast? Are there any docs about View backend implementation in general? What about bug tracking, perhaps a `GTK` tag in red/red repo for GTK-related bugs/prs?

rcqls

[22:52](#msg5d7434a754e7c649d4a6e9dd)@loziniak Except the official documentations on red (the red/view part notably) and red/system, I have discovered the red/view from source and slowly adapt the macOS and windows backends to the GTK backend. The workflow is to read the official gtk documentation and update in the `modules/view/backends/gtk3` folder the related reds files (main ones are gui.reds, gtk.reds, events.reds and handlers.reds).

## Sunday 8th September, 2019

Oldes

[20:28](#msg5d75646c54e7c649d4aea7e9)@loziniak be warned that there are unfortunately almost no comments in Red sources so it may be long and tough reading to understand it.

## Tuesday 10th September, 2019

loziniak

[13:51](#msg5d77aa4ab9abfa4bd383193d)@Oldes thanks! I've already noticed that. Red code's readability is certainly what makes this task easier.

[13:51](#msg5d77aa5ec38d634123ccdeb1)@rcqls and what about issue tracking?

## Thursday 19th September, 2019

loziniak

[18:49](#msg5d83cdb4be709e39d158971e)I suppose https://github.com/red/view/issues is the right place now :-)

## Sunday 22nd September, 2019

Oldes

[20:23](#msg5d87d853e45b6d47323bd088)@loziniak 404

greggirwin

[21:01](#msg5d87e131a7a5cc47333adf70)The submodule change has been deferred for the time being.

## Tuesday 24th September, 2019

MartenH

[07:43](#msg5d89c919ab4244767bf62ca9)Hi, I would like checkout the GTK work and I can't really locate any guide for it. Followed https://github.com/red/red/ (Running Red from the sources (for contributors)) but on the GTK branch.. installing a lot of i386 libs later... and running ./rebol just gives me "\** User Error: Bad face in screen pane!  
\** Near: size-text self". Maybe I'm doing this all wrong?!

rebolek

[07:49](#msg5d89ca8c8521b34d9180129c)@MartenH `User Error: Bad face in screen pane!` is a font problem, see http://rebol.com/article/0545.html

loziniak

[08:14](#msg5d89d070b9f8210ed5df6f9d)@MartenH here you'll find some information: https://github.com/red/red/wiki/\[NOTES]-Gtk-Bindings-Development

[08:26](#msg5d89d338ab4244767bf6748f)If you spot any missing pieces there, let us know so we can improve it. Or do it by yourself if you like :-)

MartenH

[09:04](#msg5d89dc232438b53a640a12a2)Thanks @rebolek and @loziniak. I'm still on the missing font problem, installing msfonts did not really help...lets see what I can figure out.

endo64

[10:57](#msg5d89f69d42a6b94520465331)@MartenH Check this one also: https://www.rebolforum.com/index.cgi?f=printtopic&amp;topicnumber=282&amp;archiveflag=archive

[10:59](#msg5d89f714c7ec2e2208e221d9)And this: https://stackoverflow.com/questions/24488331/how-to-start-the-rebol2-view-console-on-a-server/24496293#24496293

iNode

[11:02](#msg5d89f7d042a6b94520465aac)FYI: On the page https://github.com/red/red/wiki/\[NOTES]-Gtk-Bindings-Development  
Link https://rebolek.com/builds/ is broken or service is down.

rebolek

[11:03](#msg5d89f7ec8521b34d91815940)@iNode I know about it. I hope to get it back soon.

## Wednesday 25th September, 2019

loziniak

[09:59](#msg5d8b3a975c966b58fb71928f)@iNode info corrected, thanks.

iNode

[14:45](#msg5d8b7d965c966b58fb7383f5)You're welcome. And thank you for support. :-)

## Friday 27th September, 2019

SmackMacDougal

[15:06](#msg5d8e2581fcb47b627fd4e68d)Hey gang! Backgrounder:

1\. I'm new(ish) to Linux.  
2\. Running a distro (antiX 17.4.1) based on Debian 9 (Stretch), i.e., uses the Debian repo

Is there a line-by-line instruction to pull the exact libs needed for GTK and then compile Red from REBOL? Is this it? \[Running Red from the sources (for contributors)](https://github.com/red/red/tree/GTK)?

On a side note: Isn't the REBOLish way of "nothing to install" more inline with AppImage? If so, why is there not one already built for Red with GTK for one-click download from red-lang.org?

[15:12](#msg5d8e26de086a72719e72227e)OK. I have answered Q1 for myself from here: \[rcqls/reds](https://github.com/rcqls/reds/blob/master/README-RedGTK.md)

[15:46](#msg5d8e2eedc45b6e14e6d80f25)OK, I am following along \[Compilation (32-bit Linux)](https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development)

\- 1. DONE: (https://github.com/rcqls/reds/blob/master/README-RedGTK.md)  
Does this install : Install 32-bit dependencies: at-spi2-core, libgtk-3-bin ? The directions are unclear.  
\- DONE: Download code: git clone -b GTK https://github.com/rcqls/red.git  
\- DONE: wget http://www.rebol.com/downloads/v278/rebol-core-278-4-3.tar.gz &amp;&amp; tar xzvf rebol-core-278-4-3.tar.gz &amp;&amp; cp releases/rebol-core/rebol red/  
\- DONE: cd red  
\- DONE: Edit environment/console/CLI/console.red, and add Needs: View line inside Red \[] block.

But this fails:

```
root@antix1:/home/demo/red# echo 'Rebol[] do/args %red.r "-r %environment/console/CLI/console.red"' | rebol +q -s
bash: rebol: command not found
```

A `ls` shows the REBOL executable is there. I ran a `./rebol` and can see it is the core version `REBOL/Core 2.7.8.4.3 (6-Jan-2011)`

[15:55](#msg5d8e30e366c8b4512229385b)Could I not do this:

```
./rebol
>> do/args %red.r "-r %environment/console/CLI/console.red"
```

rebolek

[15:58](#msg5d8e31a9c45b6e14e6d82419)@SmackMacDougal that's what I do all the time. It doesn't work for you?

SmackMacDougal

[15:58](#msg5d8e31be0e829f6047383c70)No, it does not work for me.

[15:59](#msg5d8e31e9462ada512309dcf8)Does it need to be ./rebol in that terminal command?

[16:00](#msg5d8e3209d97d8e3549c167e4)As in:

```
'Rebol[] do/args %red.r "-r %environment/console/CLI/console.red"' | ./rebol +q -s
```

and not

```
'Rebol[] do/args %red.r "-r %environment/console/CLI/console.red"' | rebol +q -s
```

rebolek

[16:00](#msg5d8e3211290b8c354ae6c347)You can't run rebol? Maybe it needs to set executable bit? Yes, it's `./rebol`

SmackMacDougal

[16:00](#msg5d8e3225deb6da63d7bac81e)OK, so the cut and paste from the instruction page is what caused the error.

rebolek

[16:00](#msg5d8e322a290b8c354ae6c48c)and then `do/args %red.r "-r %environment/console/CLI/console.red"` in Rebol console. That's how I do it.

[16:02](#msg5d8e328ceb1eff63d6350498)So let's try this. Run `./rebol`. What happens?

SmackMacDougal

[16:02](#msg5d8e328c47de0a719d1eb789)Yeah, I launched REBOL. That's how I am doing it as well. It is compiling as I type.

rebolek

[16:02](#msg5d8e32ac47de0a719d1eb83b)Ah, great :)

SmackMacDougal

[16:02](#msg5d8e32b173dd29627ec12ce6)It's the shell statement per the instruction page that is in error.

[16:04](#msg5d8e3322bf625112c0ef3b59)I'm excited to try Red on this new Linux "no-install" install. I'm hoping to do some cool things with Red for scripting Linux stuff. That is how I intend to learn Linux shell commands, by making Red GUIs for some stuff.

[16:12](#msg5d8e34fedeb6da63d7bae30c)I see that it fails on some of the reaction tests, which then causes the GUI not to work

rebolek

[16:20](#msg5d8e36e2fb131014e7f95144)I think that GUI in itself should work even when some of the tests fail. I can run GUI on Ubuntu and Manjaro.

SmackMacDougal

[16:36](#msg5d8e3a9cd97d8e3549c1b151)Cool. This laptop has antiX 17.4.1 based on Debian 9 (Stretch). It's one of those "remastering" live USB distros like Puppy or Knoppix. The makers must have used Debian as a base to layer their detection scripts and other needed bash scripts.

A Mickeysoft update to Win 10 put the laptop into a coma. That prompted me for an alternative. I've tried Linux-based OSes in the past on PCs but either I was not ready for those or those were not truly ready for PC hardware at the time (1996-2002). Now. most devices seem to have drivers / support.

RAM usage is way down and performance is way up. I acknowledge I have much to learn, but with a good base of experience, it is merely a matter of acquiring habits.

loziniak

[17:02](#msg5d8e40b0d97d8e3549c1e5ef)@SmackMacDougal good luck!

SmackMacDougal

[17:04](#msg5d8e4110bf625112c0efabb9)@loziniak Thanks! I'm hoping to take Linux commands and wrap those with Red GUIs to help others use Linux in a safer, easier manner. Doing so, that should help me learn Linux commands.

gavr123456789\_gitlab

[22:42](#msg5d8e903efcb47b627fd8393b)Do I understand correctly that Red has 2 syntax? just Red which has dynamic features and Red-System which does not have them, has static typing and compiles? Are there Red and Red-System performance benchmarks anywhere? Or just how are they compared to other languages?

greggirwin

[22:45](#msg5d8e9107fcb47b627fd83e65)Red has only one syntax. Red/System is a dialect (embedded DSL) of Red, so shares its syntax.

No benchmarks. Red is high level, so comparable to Python, et al, while R/S is C-level, non-optimized, and 2-6x slower than C.

gavr123456789\_gitlab

[22:52](#msg5d8e92b27fe6a605d1405555)@greggirwin Thank you for the prompt response, about 2-6 times slower si sounds sad, but the optimization will be added, i think(now it seems that a good practice is to generate C code to obtain speeds close to C and benefits such as a simple binding of C libraries, so do Vala, nim, Vlang)

So I can write on Red-System and Red in the same file?  
PS most here scares me now is the inability to read the language without knowledge of the number of arguments https://youtu.be/4ZbGJemrLFw

9214

[22:59](#msg5d8e944f66c8b451222bfdf8)@gavr123456789\_gitlab we don't plan on introducing GCC dependency any time soon. Yes, you can mix Red and R/S, read up documentation and wiki examples. As for reading code: this comes with practice, and depends on how well-named your functions are; the secret red sauce are dialects, which most often are declarative and don't even have function and arguments as concepts.

gavr123456789\_gitlab

[23:20](#msg5d8e9933fb131014e7fc17e2)Okey, here I agree

## Thursday 10th October, 2019

SmackMacDougal

[06:51](#msg5d9ed4ed9735874673299ad2)Hey all. A month ago, @toomasv showed me \[some nifty Red](https://gitter.im/red/help/archives/2019/09/11?at=5d7957e332e48c5df27ad48a) to help me think about autocomplete. That script ran fine under Windows 10.

I tried it under a Linux OS where I have installed Red/GTK 3.22.11.

The same code from Toomas paints the container, but that is about it. The drop down field does not work as a drop down nor does Toomas' Red expressions work for autocomplete.

Is there a status document that reveals what faces work for Red/GTK on Linux?

I had hoped to use Red to write a bunch of GUI apps for config and cli tools on Linux.

Should I re-schedule that project or write the code in REBOL 2.7.8 or Atronix R3?

bitbegin

[07:00](#msg5d9ed706940b4c2fc0a86eca)

```
view [drop-down data ["1" "2"]]
```

?

rebolek

[07:15](#msg5d9edaa6045925467226331d)This simple dropdown works for me on Linux, Toomas' example not. If I have time, I'll take a look at it, probably some feature is not implemented yet under Linux.

toomasv

[08:33](#msg5d9eeced464b432fc1f084bd)Here's how it works on W10 (with little \[make-up](https://gist.github.com/toomasv/66761977ce1347d238d1a621c7e994b2)):  
\[!\[autoselect](https://toomasv.red/images/Styles/autoselect.gif)](https://toomasv.red/images/Styles/autoselect.gif)

rcqls

[10:35](#msg5d9f095c3220922ffb5fca10)@toomasv example does not seem to work on macOS too even if it fails differently and only at the end. In red/GTK it seems that on-change or on-enter is not available yet on dropdown. IMHO we clearly need minimal examples to test every features of red/view to be compared on each platform. This could be a community effort and it is not easy to organize.

rebolek

[17:37](#msg5d9f6c685173c33ca1a19617)Comparing Red to Rebol is not fair. Rebol was written in C, Red is written in Red/System. That's a whole new toolchain, Rebol didn't have to deal with it. Rebol 1 was out, fine, but the speed and usability were...meh. It wasn't until at least 2.3 when Rebol was usable. GUI was out relatively soon (and much limited compared to original ideas), but non-native. Red chose a different approach that takes more time but integrates better.  
And don't get me started on numerous times when Carl disappeared in a cave for a few months and no one knew what's going on and if there ever will be another release.

[17:38](#msg5d9f6c90fcf7602cc56718eb)Things like `call` were paid features, etc, etc, ...

[17:38](#msg5d9f6cafe8de6f3ca073e56a)Anyway, we're off-topic, this is more suited for chit-chat.

9214

[18:08](#msg5d9f738d0e67130aae4c09b7)&gt; the pace is way too slow

I guess you can accelerate it by channeling all the energy you spend on talking.

## Friday 11st October, 2019

loziniak

[12:10](#msg5da0712289acff6ff5d87fec)@SmackMacDougal you can \[file an issue](https://github.com/red/red/issues) about this. I prefix issues that relate to GTK branch with `GTK:` \[like that](https://github.com/red/red/issues/4039)

## Tuesday 15th October, 2019

loziniak

[00:41](#msg5da515a289acff6ff5f8b1be)I've probably found a bug when compiling a script with latest GTK branch.

```
Red [File: %a.red Needs: 'View]
print "s"
```

`echo 'Rebol[] do/args %~/red-github/red.r "-d -c %a.red"' | ~/rebol +q -s`

```
Target: Linux 

Compiling to native code...
*** Compilation Error: unknown path root variable: red/collector 
*** in file: %/work/a.red 
*** at line: 206 
*** near: [
    red/collector/active?: true 
    get-event-type: func [
        evt [red-event!] 
        return: [cell!]
    ] [
        as cell! switch evt/type [
            EVT_TIME [_time] 
            EVT_DRAWING [_drawing] 
            EVT_SCROLL [_scroll] 
            EVT_LEFT_DOWN [_down] 
            EVT_LEFT_UP [_up] 
            EVT_MIDDLE_DOWN [_mid-down] 
            EVT_MIDDLE_UP [_mid-up] 
...
```

[00:42](#msg5da5160df88b526fb93d4346)Compiles fine on `master` branch

[00:44](#msg5da5167f39d0c70757aeafb4)Merging `master` into `GTK` does not help

bitbegin

[01:01](#msg5da51a5c4afd703a4edf6834)you should use `-r` instead of `-c` first

loziniak

[01:02](#msg5da51aab57c2517c6a0d0a3e)Ah right, I still have old LibRedRT.

[01:06](#msg5da51b7e39d0c70757aed1ed)Seems ok now.

[01:10](#msg5da51c6a4afd703a4edf73c4)... or not:

```
...using libRedRT built on 15-Oct-2019/3:06:53+2:00
...compilation time : 1740 ms

Target: Linux 

Compiling to native code...
*** Compilation Error: undefined symbol: red/unicode/utf8-next-char 
*** in file: %/home/devel/prj/red/gtk/red-github/modules/view/backends/gtk3/text-box.reds 
*** in function: exec/gui/utf8-to-bytes
*** at line: 47 
*** near: [unicode/utf8-next-char end]
```

[01:12](#msg5da51ce88e2e9a7c6bfc30c0)↑↑↑ it was for `-c` with new libRedRT.

[01:13](#msg5da51d2539e2ef28ade33bc6)with `-r` it's OK.

bitbegin

[01:54](#msg5da526d7c87a1d28acafbad3)i make a PR to fix this issue

## Thursday 17th October, 2019

loziniak

[12:15](#msg5da85b4857c2517c6a246809)Hey! Maybe GTK branch commits could be tracked here, in the right panel of this chat?

[14:11](#msg5da8769239d0c70757c6e08c)@bitbegin I made a PR, which fixed it for me: https://github.com/red/red/pull/4090

[14:36](#msg5da87c70870fa33a4d0bda74)There is another problem with `-c` compilation. Following code works only with `-r`, and when compiled with `-c -u` it does not respond to clicking the button:

```
Red [Needs: 'View]
view [
	button "test" [print "test"]
]
```

Compiled under Linux Arch using latest `GTK` branch sources with patch from PR 4090.

greggirwin

[18:05](#msg5da8ad5c1e314c0467277b0d)Maybe @x8x can look at the webhook real quick @loziniak.

x8x

[23:13](#msg5da8f5956186fe62ff3c1348)@greggirwin I don't have access to do that.

## Tuesday 22nd October, 2019

loziniak

[11:51](#msg5daeed3114d55a37855550d7)@greggirwin @x8x Any news on that? Should I file a bug report?

x8x

[12:50](#msg5daefb24b86c9f37f9e2751b)@loziniak I don't think that's a bug or an issue, just someone with access to Red gitter account can do that, in the meantime you can follow GTK branch progress here https://progress.red-lang.org/

rcqls

[12:53](#msg5daefbbd7477946badacba1d)@x8x I can’t see he GTK branch in this link but I can see it on the github repo of course!

x8x

[12:56](#msg5daefc61f6db7f4f856fb071)@rcqls weeks starts on Mondays and there was no activity this week, just click last week and you can see a GTK tab.

rcqls

[12:56](#msg5daefc779825bd6baca9e92f)@x8x Thanks!

x8x

[12:58](#msg5daefcf405b41f6ef212e143)I pinged someone with access to Red gitter account, let see.. :smiley:

loziniak

[14:52](#msg5daf17c03d669b28a0b7fd80)I don't understand how this could be not an issue... Generally buttons are meant to respond to clicks. For me an issue/bug is every state different from the desired one.

[14:57](#msg5daf18c410bd4128a13fc631)Ok, I got it now. We are talking about two different things. I was asking about filing an issue about \[button](https://gitter.im/red/GTK?at=5da87c70870fa33a4d0bda74), and you are telling there's no need to file an issue about \[tracking GTK branch in gitter](https://gitter.im/red/GTK?at=5da85b4857c2517c6a246809).

[14:58](#msg5daf1925fb4dab784ae61296)That's good case where issue tracking overperforms chat in means of clarity :-)

x8x

[15:01](#msg5daf19dc61efab50c0d646fd)@loziniak Correct! sorry for the confusion.. ;-)

loziniak

[15:02](#msg5daf1a032f8a034357b8a026)I think I confused myself the most!

## Thursday 24th October, 2019

x8x

[20:42](#msg5db20cbb05b41f6ef212e3d8)Maybe that's useful to some, we do build binaries for every commit in every branch, for GTK Linux that would be https://static.red-lang.org/dl/branch/GTK/linux/red-latest

## Monday 28th October, 2019

loziniak

[12:26](#msg5db6de7cf26ea4729d0e05be)@x8x tried it and it gives me `face! has no value` or `path system/view/debug?: is not valid for none! type` errors. Is it possible that console is compiled without `view` support for GTK branch?

[12:35](#msg5db6e07ca03ae1584f23ea00)

```
>> system/build/config/modules
== []
>> print system/build/git
branch: "GTK"
tag: #v0.6.4
ahead: 1051
date: 28-Oct-2019/9:24:16+01:00
commit: #2fbd3a7fcd696f54ace5560a0f83c83da8d9c7a6
message: "FIX: GTK: compiling error."
```

bitbegin

[13:49](#msg5db6f205e469ef43587d31af)@loziniak i can't reproduce #4039, did you compile the gui-console with the latest code?

loziniak

[14:08](#msg5db6f6549825bd6bace30e4f)yes

bitbegin

[14:09](#msg5db6f68d7477946bade5d158)which gtk version?

loziniak

[14:09](#msg5db6f690ef84ab3786b1e3db)

```
$ ~/prj/red/gtk/red-github/console-view 
GTK VERSION: 3.24.10
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> probe system/build/date
28-Oct-2019/10:37:45+01:00
== 28-Oct-2019/10:37:45+01:00
```

bitbegin

[14:10](#msg5db6f6da2a6494729c54e64d)

```
panel1: make face! [
	type: 'panel

	contents: [
		below
		text "Panel 1" 
		button "Switch" [
			print "1 -> 2"
			remove find window/pane panel1
			append window/pane panel2
		]
	]
]

panel2: make face! [
	type: 'panel

	contents: [
		below
		text "Panel 2"
		button "Switch" [
			print "2 -> 1"
			remove find window/pane panel2
			append window/pane panel1
		]
	]
]

window: layout []
append window/pane layout/parent panel1/contents panel1 none
layout/parent panel2/contents panel2 none

view window
```

[14:10](#msg5db6f6df14d55a37858f20fd)this script?

loziniak

[14:12](#msg5db6f748f26ea4729d0ec63c)I've even copy-pasted it now from your post and it crashes.

[14:12](#msg5db6f75ce886fb5aa20e998c)wonder what's going on...

bitbegin

[14:13](#msg5db6f77b3d669b28a0f05394)you can send the gui-console to me

loziniak

[14:13](#msg5db6f7803d669b28a0f053a1)sure

bitbegin

[14:15](#msg5db6f8037477946bade5db35)\[gui-console](https://files.gitter.im/red/GTK/HdKU/gui-console)

[14:15](#msg5db6f81a7477946bade5db50)this is what i used, you can try

loziniak

[14:16](#msg5db6f85810bd4128a178024e)sent it to your email.

[14:19](#msg5db6f8e09c398215099d0d7b)ok, you're using \*gui-console\*, I'm using \*cli-console\*.

[14:19](#msg5db6f8fbe469ef43587d6063)it works for me with your gui-console. I'll try to compile it myself

[14:19](#msg5db6f903e469ef43587d6077)from the same sources as cli-console

[14:28](#msg5db6fb082f8a034357f10465)Strange. When I compiled \*gui-console* by myself, instead of crash the button just disappears an I'm left with empty window. No error messages.

bitbegin

[14:29](#msg5db6fb49a03ae1584f24aeef)

[14:29](#msg5db6fb4f9c398215099d207e)

```
./rebol -qws red.r -r -d environment/console/GUI/gui-console.red
```

[14:29](#msg5db6fb649c398215099d2187)compiled like this?

loziniak

[14:31](#msg5db6fbd62f8a034357f10873)no, like this: `echo 'Rebol[] do/args %~/prj/red/gtk/red-github/red.r "-d -r %~/prj/red/gtk/red-github/environment/console/GUI/gui-console.red"' | ~/prj/red/gtk/rebol +q -s`

[14:32](#msg5db6fbfe9c398215099d2823)maybe it's because of `-d` switch

[14:32](#msg5db6fc0bf26ea4729d0eea32)I'll try without

[14:33](#msg5db6fc469c398215099d2aab)but no, I see you have it also.

bitbegin

[14:42](#msg5db6fe4bef84ab3786b21c57)please send me your new gui-console

loziniak

[14:44](#msg5db6feba9c398215099d3e83)sent

bitbegin

[14:50](#msg5db7002210bd4128a1783698)strange, the button disappear with your console, when i compiled console-view.red and gui-console.red, the script both worked

loziniak

[14:52](#msg5db70091e1c5e91508ed8192)maybe the sources version then?

bitbegin

[14:52](#msg5db70098e469ef43587d906c)can you put rebol to red-github folder, then run `./rebol -qws red.r -r -d environment/console/GUI/gui-console.red` to test it again?

loziniak

[14:52](#msg5db700b22f8a034357f12bd9)

```
$ git log --oneline | head
2fbd3a7fc FIX: GTK: compiling error.
f04488cda Merge pull request #4105 from loziniak/GTK
390da1d5b Merge branch 'GTK' into GTK
cbd6f8fad Merge pull request #4107 from bitbegin/refactor
6806c931b Merge remote-tracking branch 'origin/GTK' into draw
704353eea FIX: window no need connect `key event` as it be done by `view`
95178e734 FIX: change face offset issues
4915e8ff1 FIX: slider data
2228bdbd0 CHORE: whitespace cleaning
c24d0f483 FEAT: field's no-border flag
```

[14:52](#msg5db700bb2a6494729c552e01)ok

[15:03](#msg5db703277477946bade61f32)effect is the same

[15:15](#msg5db7061f3d669b28a0f0bd6c)@rcqls can you check how you reproduce this in docker container with `gui-console`?

rcqls

[21:47](#msg5db762092a6494729c5806b2)@loziniak @bitbegin I tested the code for `gui-console` compiled from GTK branch and the binary provided by @bitbegin and I have the same results: it works for @bitbegin binary and it fails for the binary compiled from GTK branch … @bitbegin are you sure to compile the binary from the last GTK branch taking into account the last commits?

[22:16](#msg5db768ba9c39821509a0611a)The sizes of binaries differ `4940004` for @bitbegin’s binary and `4942028` for latest GTK (compiled in debug mode).

[22:44](#msg5db76f619c39821509a08b44)@bitbegin BTW, `easy-VID-rt.red`in the `makedoc` repo of @toomasv is not working anymore. It was one of my favorite red tests. As mentioned before, `styles/shrinkable.red` in the `learning` repo of @toomasv is not working properly.

snotbubble

[23:17](#msg5db7771c10bd4128a17bb306)having problems with a couple of things that were working last year in windows:  
1\. the drop-down list doesn't change when the top list selection changes.  
2\. the top list selection-highlight doesn't show when its set by the drop-down list event, its /selection returns the correct index.

sorry for the long example.

```
Red [needs: view]

renderdata: function [] [
    print["          renderdata: ... "]
    o: copy []
    foreach r sampledata [
        rr: copy/deep r
        append o rejoin [
            pad rr/1 10
            pad rr/2 10
            pad rr/3 10
        ]
    ]
    o
]


sampledata: [["one" "fn1" "100"] ["two" "fn2" "200"] ["three" "fn3" "300"]]
fndata: ["fn1" "fn2" "fn3"]
amsetting: true

view [
    Title "test"
    across
    text "tl" 20x20 right
    tl: text-list data renderdata
    on-change[
		amsetting: false
		print["tl on-change triggered..."]
        row: pick sampledata tl/selected
		tf/text: row/1
		td/selected: index? find fndata row/2
		amsetting: true
    ]
    return
    text "tf" 20x20 right
    tf: field
    on-change[
		if amsetting [
			print["tf on-change triggered..."]
			x: tl/selected
			sampledata/:x/1: tf/text
			tl/data: renderdata
			tl/selected: x
		]
    ]
    return
    text "td" 20x20 right
    td: drop-down data fndata select 1
    on-change [
		if amsetting [
			print["td on-change triggered..."]
			x: tl/selected
			sampledata/:x/2: td/text
			tl/data: renderdata
			tl/selected: x
			print[ "tl/selected should be: " tl/selected ]
		]
    ]
]
```

## Tuesday 29th October, 2019

bitbegin

[01:33](#msg5db796df9825bd6bace791ac)@rcqls a little change in my local code, i thought it was not related with issue. Anyway, i will fix these issues

rcqls

[05:59](#msg5db7d54c9c39821509a332e2)@bitbegin Actually, except the gui-console, any code with rich-text is not working now failing with an access violation.

[06:34](#msg5db7dd89e469ef4358836e65) huge commit (bfbcb5035e4d78f4ebe27816977ae126e2c32823 `FEAT: code refactoring for font and draw`) makes all the rich-text examples not working anymore. Hope it helps!

## Wednesday 30th October, 2019

loziniak

[14:48](#msg5db9a2d12a6494729c683e11)Hi!  
Following code produces hanging window in `console-view`:

```
view compose [image (draw 10x10 [circle 10x10 5])]
```

Can anybody reproduce? In `gui-console` it shows ok.

[14:51](#msg5db9a36ca3f0b17849b71364)When I change `draw` size argument from `10x10` to `20x20`, I get a responsive window in `console-view` also.

[14:55](#msg5db9a46a2f8a034357044bf5)Also, surprisingly, this code hangs:

```
view compose [image (draw 20x20 [])]
```

while this is responsive:

```
view compose [image (draw 10x10 [])]
```

rcqls

[15:26](#msg5db9aba22f8a0343570487b4)With the last GTK branch (almost fixing the rich-text issue), the three examples behave the same for me (hanging at the second try). I guess @bitbegin is working on something related to that ….

pekr

[15:34](#msg5db9ad8a2a6494729c689603)Guys, the pace you work on GTK, it might be sooner more complete than OS-X version, right? :-)

loziniak

[15:39](#msg5db9aecc7477946badf96a98)@pekr hopefully! I'm going to compile my work for macOS too, so probably will do extensive testing also for that platform in the future.  
@rcqls good point – everything is about first/second run. It hangs second time even with empty `view []`.

## Thursday 31st October, 2019

rcqls

[11:28](#msg5dbac56cf26ea4729d2ac732)@loziniak Thanks to the great job done by @bitbegin, I have just tested your issue and it is then fixed (not yet on the GTK branch but soon I guess)! I am just waiting for the fixes of the two last issues on `rich-text` (which is already better but not perfect) and on `toomasv/learning/styles/shrinkable.red`. :clap: @bitbegin !

bitbegin

[11:50](#msg5dbaca99a03ae1584f40381c)@rcqls what's the two issues on `rich-text` ?

[11:53](#msg5dbacb49ef84ab3786cdcc8c)i think #4039 can be closed

loziniak

[12:33](#msg5dbad4932a6494729c71017c)Closed. Works for me as well. Thanks @bitbegin, fantastic work!

rcqls

[12:48](#msg5dbad82e9825bd6bacff0a58)@bitbegin Only one issue on `richtext` which is seen with `toomasv/makedoc/easy-VID-rt.red` and one on `toomasv/learning/styles/shrinkable.red`. The following is not complete!

[12:49](#msg5dbad8509825bd6bacff0b30)\[!\[Capture d’écran 2019-10-31 à 13.46.53.png](https://files.gitter.im/red/GTK/EjO9/thumb/Capture-d-ecran-2019-10-31-a-13.46.53.png)](https://files.gitter.im/red/GTK/EjO9/Capture-d-ecran-2019-10-31-a-13.46.53.png)

bitbegin

[12:54](#msg5dbad99f2a6494729c7124f1)you mean para not work?

rcqls

[12:57](#msg5dbada36e1c5e9150809838f)The two tests were working before…Idon’t think it is a para issue since when I did that, I did not start any work on para. Just test the two scripts on Mac or Windows and linux…. It was one of my challenge to make them working!

bitbegin

[12:59](#msg5dbadacea03ae1584f40bdd9)\[!\[image.png](https://files.gitter.im/red/GTK/j1o7/thumb/image.png)](https://files.gitter.im/red/GTK/j1o7/image.png)

rcqls

[13:00](#msg5dbadaf27477946bad0221c5)This script does not work too

```
Red[Needs: View]
view compose/deep [
    rich-text 200x200 draw [
        text 10x10 (rt1: rtd-layout ["Some^/" b "text^/" /b "here"] rt1/size: 50x80 rt1)
        text 100x90 (rt2: rtd-layout [red "Other^/" b "text^/" /b "there"] rt1/size: 50x80 rt2)
        pen gold box 90x80 160x180
    ]
]
```

bitbegin

[13:01](#msg5dbadb293d669b28a00c81cf)ok

loziniak

[13:04](#msg5dbadbf7fb4dab784a3aa292)Is this line necessary?  
https://github.com/red/red/blob/GTK/modules/view/backends/gtk3/gui.reds#L1596

[13:05](#msg5dbadc092f8a0343570dbcc2)It makes a window stay on top by default

rcqls

[13:09](#msg5dbadd14fb4dab784a3aafae)@bitbegin don’t forget this one too `toomasv/learning/styles/shrinkable.red`. Last time, you told me it was easy to fix!

bitbegin

[13:12](#msg5dbadda77477946bad023817)last time fixed, now exists again. event propagate issue

[13:12](#msg5dbaddc3a3f0b17849c0431d)@loziniak shouldn't the show-window be on top?

loziniak

[13:12](#msg5dbaddd8ef84ab3786ce618b)@bitbegin I think a window manager takes care of this.

[13:13](#msg5dbaddf2f26ea4729d2b86e4)it should be on top, but not stay on top.

bitbegin

[13:15](#msg5dbade67fb4dab784a3ab8a6)i found that i can't set the window get focus/active when run `view []` second time, don't know why.

loziniak

[13:20](#msg5dbadf80e1c5e9150809ae75)I commented out this line and it works ok for me

[13:22](#msg5dbae03014d55a3785abce10)Wait, there is indeed some strange behavior. Every couple executions of this: `view [button "abc" field "test"]`, a button doesn't get a focus. Like about one in five executions.

bitbegin

[13:23](#msg5dbae061f26ea4729d2b9b19)remove it will no effective

[13:25](#msg5dbae0bf7477946bad02554b)a good example

loziniak

[13:47](#msg5dbae5fc10bd4128a194b64b)Compiled both with default stay on top and witohut it, the effect is observable in both cases. I'm making a PR which deletes line 1596.

bitbegin

[13:48](#msg5dbae61ee1c5e9150809ee64)ok

## Friday 1st November, 2019

rcqls

[08:23](#msg5dbbeb95ef84ab3786d63994)@bitbegin After your big refactoring, I have tested also the other red codes that were working before (mostly everything on `code` and `community` repos were ok) but now a lot of code don’t work properly. You should try these codes!

[10:38](#msg5dbc0b1a9825bd6bac07f44e)@bitbegin Much better!

[10:40](#msg5dbc0bbb10bd4128a19d24b1)\[!\[Capture d’écran 2019-11-01 à 11.37.32.png](https://files.gitter.im/red/GTK/YfSS/thumb/Capture-d-ecran-2019-11-01-a-11.37.32.png)](https://files.gitter.im/red/GTK/YfSS/Capture-d-ecran-2019-11-01-a-11.37.32.png)

[10:50](#msg5dbc0e037477946bad0b1ec6)BTW, when you click on a grey cell do you have the code executed? (Ctrl+click shows the source code). This is not working and was working before! This is a bigger issue if you don’t have this working! Currently, changing slightly the code of @toomasv makes things working also for GTK backend.

bitbegin

[10:55](#msg5dbc0f3a9c39821509c242bc)i know this issue, this is related to event propagate.

rcqls

[10:56](#msg5dbc0f4ae1c5e915081271a5)Great! I am really happy if you manage to find a solution on that because my attempt to fix that was unfortunately a bit tricky!

bitbegin

[10:58](#msg5dbc0fc09825bd6bac0815d3)`make-event` should return `dispatch` if the widget processed the event, actually it not

rcqls

[10:59](#msg5dbc10172a6494729c7a3203)I think it should be good to have minimal red examples to test these event propagation!

bitbegin

[11:00](#msg5dbc103c2a6494729c7a341a)it's good to refactor `event propagate` use widget `event` signal, but need study

[11:02](#msg5dbc10d67477946bad0b3273)`swt` rewrite some widgets `event propagate`, we also can do this way

rcqls

[11:20](#msg5dbc14f414d55a3785b4b74f)Switching `f-box` and `page-border` provides the click event:

```
…..
             panel page-size [
			origin 0x0
			page-border: box with [
				size: page-size 
				draw: compose [pen gray box 0x0 (page-size - 1)]
			]
			at 0x0 f-box: rich-text page-size white draw []
			on-down [
				parse face/draw [some [
					bx: 'box pair! pair! if (within? event/offset bx/2 sz: bx/3 - bx/2) (
						code: select first find bx object! 'text
						either event/ctrl? [show-edit-box code sz][show-example code]
					)
				|	skip
				]]
			]
		]
….
```

But your last changes on the main loop introduces a new issue: closing the window of the executed example code closes also the main window. Of course, this was working before!

bitbegin

[11:33](#msg5dbc18009825bd6bac085435)gui-console?

rcqls

[11:33](#msg5dbc181da03ae1584f49c860)console-view

[11:37](#msg5dbc18ff3d669b28a015d888)Another point, `easy-VID-rt.red` is really slow now to show the window….

[11:44](#msg5dbc1aa29825bd6bac086a24)with gui-console it seems to work!

[11:48](#msg5dbc1b79fb4dab784a440815)Running the code inside `gui-console` fails because of eol (I guess).

## Saturday 2nd November, 2019

hiiamboris

[22:07](#msg5dbdfe3a9c39821509d079fd)I'm thinking on writing a view testing system, based on my base-self-test.red but extending it far more. I feel like View subsystem evolution is held back by the fear that every change is likely to introduce regressions, as we don't really have it covered well in the test suite. Ideally I'd like every recorded View issue to be testable.

It should be able to  
\- simulate keyboard &amp; mouse (and one day - touch) events  
\- analyze the actually displayed face contents and compare it's properties with facets data

I'd like to make tests facet-oriented (rather than face-oriented). Ideally it will be a set of very high level rules that would describe the properties of every facet and those rules would be checked against that facet appearance on screen with every face that supports it.

Mostly it boils down to checking these conditions:  
\- actors being triggered as expected  
\- events data is filled as expected  
\- facets being changed as expected

And these visual properties:  
\- coloration  
\- geometry (size, scale)  
\- usage of the chosen font (face, style)  
\- proper typesetting (text alignment, absence of clipping, etc)  
\- same set of properties for draw commands (likely an extended set)

Instead of crash-on-first-assertion approach (which leads to simply commenting out the tests in the end), I want to run all the tests on all platforms and:  
\- compute a compliance score that will be 100% if all tests pass their strictest conditions  
\- log/output the non-compliant tests results for further analysis  
\- maybe log the lower level metric values and compare their results across platforms (has to be done manually, but the boon is that this tactic does not require writing any tests at all, as an outlier is immediately known by a deviation in the metric value)

@rcqls As you're working with View more than anyone, what do you think? Would you find it useful? Any particular feature you'd like to see?

## Sunday 3th November, 2019

rcqls

[03:12](#msg5dbe45b69825bd6bac18325e)@hiiamboris I think an automatic testing on red/view as you seem to propose would be a major advance in the red/view development. Technically speaking, I think it is a huge work since you should be able to compare the red/view testing results across platform. Currently I have no idea how to start for creating this wonderful tool since my view would be first to test manually every red/view features one by one (to be comparable on all platforms) which already would be a big advance and a lot of work. I am very curious to see how you would cook this amazing red/view testing tool.

loziniak

[18:04](#msg5dbf169aef84ab3786ece4be)I remember somebody talking about unit tests for view, using `to-image` couple months ago.

## Monday 4th November, 2019

bitbegin

[11:29](#msg5dc00b8314d55a3785d16695)@rcqls`easy-VID-rt.red` work now

rcqls

[12:45](#msg5dc01d702f8a03435733d212)@bitbegin When I click on the code block nothing happens with the original code of @toomasv! So it does not work for me since delegation is not implemented as I did before especially for this use case.

bitbegin

[12:51](#msg5dc01ed52f8a03435733daca)which delegation?

rcqls

[12:53](#msg5dc01f48e469ef4358bf5356)delegation of event ! The goal of the tool is to launch code by clicking a block… Is it working for you?

bitbegin

[12:54](#msg5dc01f71f26ea4729d519274)this file work for me

[12:54](#msg5dc01f7114d55a3785d1f6ce)\[console-view](https://files.gitter.im/red/GTK/tBPq/console-view)

[12:54](#msg5dc01f8d7477946bad2860a2)can you try it ?

[12:54](#msg5dc01fa32f8a03435733e168)\[console-view](https://files.gitter.im/red/GTK/MGem/console-view)

rcqls

[12:56](#msg5dc01ff0e469ef4358bf5959)Yep! I’ll do it right now!

[12:57](#msg5dc020209c39821509df8dc8)BTW, the loading is really slow, I don’t remember is was so slow after my implementation.

[12:58](#msg5dc0208aef84ab3786f46016)It does not work too with your binary and with the original code of @toomasv. I hope you’re not using my modifed code of `easy-VID-rt.red` that I mentionned last time.

bitbegin

[12:59](#msg5dc020bdef84ab3786f4612f)\[!\[easy-vid.gif](https://files.gitter.im/red/GTK/pVoR/thumb/easy-vid.gif)](https://files.gitter.im/red/GTK/pVoR/easy-vid.gif)

[13:00](#msg5dc020ece469ef4358bf63b1)i used the original code

rcqls

[13:00](#msg5dc020ff2a6494729c974445)Could you send me the code of easy-VID-rt.red, please?

bitbegin

[13:01](#msg5dc02132fb4dab784a612834)\[!\[image.png](https://files.gitter.im/red/GTK/Q2vD/thumb/image.png)](https://files.gitter.im/red/GTK/Q2vD/image.png)

[13:01](#msg5dc02138e1c5e915082fee58)i haven't changed the code

[13:03](#msg5dc02184ef84ab3786f4682a)\[easy-VID-rt.red](https://files.gitter.im/red/GTK/Fqii/easy-VID-rt.red)

[13:03](#msg5dc021943d669b28a032e72e)did you compile the latest gtk branch?

rcqls

[13:04](#msg5dc021cc2f8a03435733f2ed)I am using both your binary and I have compiled the last GTK (as usual).

bitbegin

[13:07](#msg5dc0229c9c39821509df9e7d)GTK VERSION: 3.22.30

[13:07](#msg5dc022a7a3f0b17849e618c0)your gtk version?

rcqls

[13:07](#msg5dc022a89c39821509df9efb)Could you tell me what part of your new implementation is supposed to make `easy-VID-rt.red` working ?

bitbegin

[13:09](#msg5dc02321e469ef4358bf7939)https://github.com/red/red/pull/4120/commits/42fc8badfab15176d6cda8b7d6d161c0d0f5e5b8

rcqls

[13:11](#msg5dc023749c39821509dfa725)Thanks…. My GTK version : GTK VERSION: 3.22.30

bitbegin

[13:12](#msg5dc023a87477946bad287d28)if the face/color = none, will not put the widget to last position

[13:13](#msg5dc023f32a6494729c975ba6)it should work

[13:13](#msg5dc023fc2f8a034357340438)ubuntu platform?

rcqls

[13:15](#msg5dc02467e886fb5aa25121d2)Ok! Interesting trick! Do you have any idea about why the loading is so slow (however maybe I am wrong and I need to compare with my old implementation) ?

bitbegin

[13:18](#msg5dc0252210bd4128a1baa197)the loading is good for me, so i don't know how to debug it

rcqls

[13:23](#msg5dc02644e469ef4358bf907d)Ok! It works….

bitbegin

[13:23](#msg5dc02661fb4dab784a614fe4)why?

[13:24](#msg5dc02674f26ea4729d51ca47)not update code ?

rcqls

[13:25](#msg5dc026bd2a6494729c97703d)Everything is working now as you mentioned. I understand the trick and I was surprised it was not working on my container. I restarted my container and it works now… So everything is fine! Great!

bitbegin

[13:28](#msg5dc02763e1c5e91508301ad0)ok, one issue about the background of the `draw box` still need to be fixed

[13:28](#msg5dc02778e1c5e91508301b5a)did you still have loading speed issue?

rcqls

[13:31](#msg5dc0284bef84ab3786f49ffb)The issue about is not major and I have notived that other styles were much better now. I will check later the loading possible issue…. But maybe it is because of cdocker ontainer since I have changed my macOS (mojave now and not Catalina 😉)

[13:33](#msg5dc0288ea03ae1584f67125f)Another possible issue is click followed by ctrl+click…. I need to go and teach now! Have fun!

bitbegin

[13:44](#msg5dc02b232f8a034357343a38)ok, thank you

loziniak

[15:33](#msg5dc044ade469ef4358c07402)Hi! When I run `view []` in \*console-view* on Linux/GTK, the process takes 100% of processor. When I ran \*gui-console* before updating to last changes, without any script it took 30% of processor (Core 2 Duo 1.8 GHz). When I entered `view []` in \*gui-console\*, processor dropped to 0%, but when I closed window created by script, went back to 30%. Now, after compiling with latest sources, \*gui-console* is also at 100% from the start. Can anybody reproduce that?

[15:36](#msg5dc045847477946bad29767b)I also cannot type anything in \*gui-console* window after updating to latest sources.

rcqls

[17:05](#msg5dc05a65e886fb5aa252c6fd)@bitbegin I have checked console-view compiled with my old implementation and loading is still slow. So I guess that it is the update to macOS Mojave the culprit…. So no issue about loading speed!

## Thursday 7th November, 2019

bitbegin

[09:05](#msg5dc3de5d14d55a3785ed1db1)@snotbubble Does the latest version work for you?

[09:06](#msg5dc3de819c39821509fa996a)i find a some issues, maybe should change the source code to :

[09:06](#msg5dc3de8ee886fb5aa26babb1)

```
renderdata: function [] [
    print["          renderdata: ... "]
    o: copy []
    foreach r sampledata [
        rr: copy/deep r
        append o rejoin [
            pad rr/1 10
            pad rr/2 10
            pad rr/3 10
        ]
    ]
    o
]


sampledata: [["one" "fn1" "100"] ["two" "fn2" "200"] ["three" "fn3" "300"]]
fndata: ["fn1" "fn2" "fn3"]
amsetting: true

view [
    Title "test"
    across
    text "tl" 20x20 right
    tl: text-list data renderdata
    on-change[
        amsetting: false
        print["tl on-change triggered..."]
        row: pick sampledata tl/selected
        tf/text: copy row/1
        td/selected: index? find fndata row/2
        amsetting: true
    ]
    return
    text "tf" 20x20 right
    tf: field
    on-change[
        if amsetting [
            print["tf on-change triggered..."]
            x: tl/selected
            sampledata/:x/1: copy tf/text
            tl/data: renderdata
            tl/selected: x
        ]
    ]
    return
    text "td" 20x20 right
    td: drop-down data fndata select 1
    on-change [
        if amsetting [
            print["td on-change triggered..."]
            x: tl/selected
            sampledata/:x/2: copy td/text
            tl/data: renderdata
            tl/selected: x
            print[ "tl/selected should be: " tl/selected ]
        ]
    ]
]
```

rcqls

[17:18](#msg5dc451f3f26ea4729d702b0b)@bitbegin Great job for fixing drag/mouse issue! 👏

[17:21](#msg5dc452b714d55a3785f07a47)In the todolist, there is `code/Showcase/picosheet.red` that was working… Good news, `code/Showcase/livecode.red` has been fixed with your last developement :thumbsup:

## Friday 8th November, 2019

bitbegin

[02:14](#msg5dc4cf9652b73c7cb2db38a6)this example doesn't work on window 10 also.

rcqls

[02:39](#msg5dc4d5786ba2347d2d54cfe4)you’’re right it does not work anymore on macOS too!

## Tuesday 26th November, 2019

rcqls

[08:20](#msg5ddce06832df1245cb926c85)@bitbegin Very good job in draw development! Nice! :clap:

## Wednesday 27th November, 2019

loziniak

[16:37](#msg5ddea65d8e906a1c8d296cfc)yes, fantastic work!

[16:38](#msg5ddea68f9319bb51909e82d7)Do you think \*master* could be merged into \*GTK* from time to time? It will probably make merging \*GTK* into \*master* easier later on.

[16:43](#msg5ddea79d6a85195b9eb6f71d)Also to spot regressions earlier.

[18:11](#msg5ddebc585ac7f22fb51cabaa)I'll try to do a PR with that.

[18:14](#msg5ddebd1bd64a052fb673cf3b)Anyway, I've got some problems when compiling. I get lots of error messages from GTK, which are not present when running my app by interpreter. It looks like that, and is repeated very often – every refresh, switch to other window etc.:

```
(wallet2_r:14959): GdkPixbuf-CRITICAL **: 19:05:55.219: gdk_pixbuf_scale_simple: assertion 'GDK_IS_PIXBUF (src)' failed

(wallet2_r:14959): GdkPixbuf-CRITICAL **: 19:05:55.219: gdk_pixbuf_get_n_channels: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(wallet2_r:14959): GdkPixbuf-CRITICAL **: 19:05:55.219: gdk_pixbuf_get_height: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(wallet2_r:14959): GdkPixbuf-CRITICAL **: 19:05:55.219: gdk_pixbuf_get_width: assertion 'GDK_IS_PIXBUF (pixbuf)' failed

(wallet2_r:14959): GLib-GObject-CRITICAL **: 19:05:55.219: g_object_unref: assertion 'G_IS_OBJECT (object)' failed

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.219: drawing failure for widget 'GtkLayout': invalid value (typically too big) for the size of the input (surface, pattern, etc.)

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.219: drawing failure for widget 'GtkLayout': invalid value (typically too big) for the size of the input (surface, pattern, etc.)

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.219: drawing failure for widget 'GtkLayout': invalid value (typically too big) for the size of the input (surface, pattern, etc.)

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.220: drawing failure for widget 'GtkLayout': invalid value (typically too big) for the size of the input (surface, pattern, etc.)

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.220: drawing failure for widget 'GtkBox': invalid value (typically too big) for the size of the input (surface, pattern, etc.)

(wallet2_r:14959): Gtk-WARNING **: 19:05:55.220: drawing failure for widget 'GtkWindow': invalid value (typically too big) for the size of the input (surface, pattern, etc.)
```

[18:15](#msg5ddebd3505eec2433d90c15d)I compile with `-r` switch.

[18:16](#msg5ddebd6c6a85195b9eb7ac96)With most recent red/GTK sources.

## Thursday 28th November, 2019

bitbegin

[01:27](#msg5ddf2265c3d6795b9fe321e2)i can't reproduced, can you give an example?

endo64

[10:37](#msg5ddfa359d64a052fb67a1d91)&gt; Do you think master could be merged into GTK from time to time?

I think this should be done regularly, once a month at least to get the latest updates &amp; features. Otherwise it could be very difficult to merge back GTK to master, there might be many conflicts.

loziniak

[12:19](#msg5ddfbb6526eeb8518f2fe9a9)@bitbegin I'm working on it  
@endo64 PR is on the way

[12:28](#msg5ddfbd77d75ad3721d17e17f)@bitbegin I just hoped that these errors could be similar for you, that's why I didn't wait for a minimal example.

I'll also try to compile Red's GUI tests and see how they work. Can you perhaps tell which ones are currently working under GTK when interpreted? Thanks!

bitbegin

[12:34](#msg5ddfbeddd64a052fb67ae78b)tests/view-test.red

[12:35](#msg5ddfbf1146397c721c4cc660)but it can't be compiled, you need interpret it

loziniak

[14:34](#msg5ddfdb131659720ca8c11ca6)@bitbegin I did a `system/view/debug?: true` and every set of GTK errors has an accompanying debug line `face> type: panel event> type: drawing offset: none key: none flags: []`

[16:05](#msg5ddff04b9319bb5190a7c7bb)@bitbegin Found a problem. Images were missing. Consider this code:

```
Red [Needs: 'View]
probe draw-commands: reduce [
	'image load %img.png
	10x10 30x30
]
view compose/deep/only [
	base draw (draw-commands)
]
```

When `%img.png` is missing, you get errors. But not from Red saying that file not found, but from GTK saying some strange things about pixbufs. I think there should be some error checking when an image cannot be loaded.

[16:07](#msg5ddff0ba7d00806b130e51a9)In Windows you get an error:

```
*** Access Error: cannot open: %img.png
*** Where: decode
*** Stack: probe load
```

## Friday 29th November, 2019

bitbegin

[02:19](#msg5de08029f65fec1c8e8aebab)you can compare with windows platform to confirm if the extra `debug line` is a bug

[02:19](#msg5de08048d64a052fb6802b99)the `load image` issue have been fixed

loziniak

[09:18](#msg5de0e2656a85195b9ec682a4)Thanks! I didn't write about a debug line because I thought it's a bug, but I thought it could be useful for your debugging. It was just the first thing I've noticed :-)

hiddenman

[18:30](#msg5de163df1659720ca8cc31ad)Hi all. Sorry for disturbing. I want to test experimental "red" with GTK support, but can't find any relevant binary/sources/docs/etc. Just found some news that it already works. Where i can find it? Thank you

[18:31](#msg5de1640ef65fec1c8e914593)&gt; Maybe that's useful to some, we do build binaries for every commit in every branch, for GTK Linux that would be https://static.red-lang.org/dl/branch/GTK/linux/red-latest

just found this link here. is it relevant? thank you

toomasv

[20:32](#msg5de18065c3d6795b9ff3eab1)@hiddenman I'm not using GTK myself but I think \[here](https://rebolek.com/builds/) you can find what you need.

hiddenman

[21:48](#msg5de1922d8e906a1c8d3e9ac4)@toomasv Hi, Thank you. Actually, https://static.red-lang.org/dl/branch/GTK/linux/red-latest worked fine. Btw, what about Android GUI version? Are there any alpha-builds/whatever? I still can't compile to Android with GUI, even with GTK version of the red. Thank you.

loziniak

[23:30](#msg5de1aa25c3d6795b9ff50719)There is an Android branch in Github repo. You can try this.

## Saturday 30th November, 2019

greggirwin

[03:07](#msg5de1dcfbb065c6433c0db928)Android is still quite experimental, but we're happy to get any reports on it.

pekr

[09:22](#msg5de234e25ac7f22fb535162a)62 commits in last 2 days, what a speed of development :-) Could the GTK status be expressed in few words/sentences? Any estimate of how much behind the Windows version is the GTK one?

bitbegin

[10:24](#msg5de2436a8e906a1c8d433510)most of it is for merging master branch

rcqls

[10:25](#msg5de2439508d0c961b7c4d7d7)@bitbegin Great news!

hiddenman

[14:30](#msg5de27d138e906a1c8d44d5a8)&gt; There is an Android branch in Github repo. You can try this.

@greggirwin are there any binaries to test? or i have to build it by myself? i mean Android

Oldes

[14:52](#msg5de2824446397c721c604df8)@hiddenman I don't know any, and I think that it will not be easy to build it too as it was early experiment without any documentation and not maintained quite a long time.. if there was not something done in private.

greggirwin

[18:41](#msg5de2b7d005eec2433dacd820)Cross compiling is the way to go, but it does look like work will need to be done to sync that branch back up. I get an error compiling %red/tests/android/vid.red:

```
Compiling to native code...
*** Warning: OS_TYPE macro in R/S is redefined
*** Compilation Error: invalid path value: image/extract-data
*** in file: %/c/dev/greggirwin/red/tests/android/datatypes/binary.reds
*** in function: red/binary/to
*** at line: 1
*** near: [1030x7
    proto: image/extract-data as red-image! spec EXTRACT_ARGB
]
```

## Monday 2nd December, 2019

lucindamichele

[19:08](#msg5de5611708d0c961b7dafbb0)@pekr "Could the GTK status be expressed in few words/sentences?" +1

rcqls

[19:21](#msg5de5645126eeb8518f57bf67)@pekr @lucindamichele It is difficult to express accurately the status but IMHO it is now very useable and since @bitbegin says that merging to master branch is possibly the next step, I guess it is because the GTK branch is useful enough. Without testing tools, it is diffiicult to compare accurately the three different OS on red/view features.

lucindamichele

[19:25](#msg5de565166a85195b9ee6d2c3)got it. thank you!

pekr

[21:22](#msg5de5809ad75ad3721d40ab1a)@rcqls what kind of linuxes will Red/View run on? I am again starting to experiment with embedded boards, in the past Beagle Bone used Angstrom, now it uses Debian. Is there any special linux flavor used in the embedded area, e.g. fast booting, streamlined etc? In the past there was Damn Small Linux, but not sure about its popularity, etc.

rcqls

[21:44](#msg5de585a0d64a052fb6a3ffef)@pekr I am not an expert at all on embedded board. I only tested the odroid offered by @respectech by cross-compiling the binaries and the tests were mostly Ok. I guess @rebolek will be better to answer your question. The only particular case I know is that it does not work when using alpine Linux (and it is too bad).

## Tuesday 3th December, 2019

rebolek

[15:28](#msg5de67f2f46397c721c7d0ad7)@pekr AFAIK noone reported any distro recently that doesn’t work with Red/View. However, that doesn’t mean there aren’t unsupported distros. Anything that uses `musl` as `libc` won’t work with Red. That means Alpine Linux, OpenWRT and derivates like TurrisOS and probably other distros. That may be a bit unfortunate for your use case as `musl` is heavily used in embedded world for its small size. BSo you need to either choose different distro or wait until Red supports `musl`.

pekr

[15:58](#msg5de68628f65fec1c8eb64a17)Thanks.

loziniak

[16:03](#msg5de687566a85195b9eef7545)Hi! In Linux when I do `on-wheel [print type? event/picked]` I get `float` and in Windows (Wine) I get `integer`. Does it mean it needs fixing?

greggirwin

[16:13](#msg5de6898e55066245985f9930)@bitbegin :point\_up:

loziniak

[16:22](#msg5de68bae46397c721c7d717b)@bitbegin Also scroll event does not propagate – when I scroll the wheel over a `text` that is on the `pane`, `pane`'s event handler is not executed. Unlike in Windows.

## Wednesday 4th December, 2019

bitbegin

[01:48](#msg5de71051d64a052fb6af59b2)@loziniak float! is right

[01:48](#msg5de71069c3d6795b9f1b8925)scroll not be supported

rebolek

[12:53](#msg5de7ac485ac7f22fb55c4e7f)I'm trying View console under GTK, font requestor looks really nice, but the font stays the same, no matter what I select.

pekr

[14:43](#msg5de7c5f8f65fec1c8ebf19c4)@rebolek Is it quite usable on Linux already? Not just functionality, but speed, smoothness of use, etc.?

## Thursday 5th December, 2019

bitbegin

[09:19](#msg5de8cb97d75ad3721d593407)@rebolek fixed

## Friday 6th December, 2019

rebolek

[07:38](#msg5dea0566d64a052fb6c4a7c9)@pekr IMO it’s very good.

[07:38](#msg5dea057508d0c961b7fd0e56)@bitbegin thanks!

## Sunday 8th December, 2019

loziniak

[00:01](#msg5dec3d5fd64a052fb6d46507)@bitbegin so, it's the Windows version that should be fixed to return `float!`? Scroll is not supported – what do you mean? Not supported by Red? Not supported by GTK?

## Tuesday 10th December, 2019

loziniak

[16:14](#msg5defc47732df1245cb1a3e7e)↑↑↑ ?

GaryMiller

[20:11](#msg5deffbec5ac7f22fb598443e)In Windows 10 It does not auto scroll as the associated text window fills up. You can coerce it to kind of work with code as long as text added is only single line. But when you word wrap and text added become 2 or 3 lines at a time it gets out of synch and text become invisible off the bottom of the screen. If you could figure how many lines your text would wrap to you could compensate with code. But I'm still waiting for a Christmas miracle.

## Wednesday 11st December, 2019

bitbegin

[01:43](#msg5df049c70995661eb8c44ce4)@loziniak on win10, i get float!

[01:45](#msg5df04a322bca3016aa5b4d20)gtk3 scroll widget is special, not find a way to support `scroll` feature

loziniak

[13:08](#msg5df0ea66072446515d8a0e14)I'm simulating scroll by moving all faces inside a panel in `on-wheel` handler.

[13:17](#msg5df0ec6355d9392300f0fd9e)@bitbegin This code:

```
view [panel red on-wheel [probe event/picked]]
```

works under GTK and produces floats;  
works under Wine with old build and produces integers;  
works under Wine with new build and produces floats;  
does not work under Windows 7 with new build - produces nothing.

[13:49](#msg5df0f3ee0616d6515e1e7324)And I have another problem. Too strange for a bug report :-)  
I have an app with menu. The problem was that clicking 2nd button fired actions of 2nd and 1st button, clicking 3rd button fired actions for 3rd, 2nd and 1st, and so on. It was with old build of console-view (commit f8d2a3629). So I prepared a minimal code, that had this issue:

```
Red [Needs: 'View]
menu-button-style: [
	default-actor: on-down
	template: [type: 'base size: 100x100]
]
styles: reduce ['menu-button menu-button-style]
window: layout/styles [
	panel [
		below

		menu-button "1" [print "1"] ;prints "1"
		menu-button "22" [print "22"] ;prints "22^/1"
		menu-button "333" [print "333"] ;prints "333^/22^/1"
	]
] styles
view window
```

[13:50](#msg5df0f43d55d9392300f1358e)Next, I pulled fresh changes and built console-view again. But this time my minimal version was fine, but my original code still has this problem.

[13:53](#msg5df0f4e8072446515d8a575f)So, seems like commits from last two weeks fixed a problem for a minimal example, but did not fix it for original code.

[14:19](#msg5df0fafa0616d6515e1ea8b4)Update: adding `space 0x0` gives errors also on current build:

```
Red [Needs: 'View]

menu-button-style: [
	default-actor: on-down
	template: [type: 'base size: 100x100]
]

styles: reduce ['menu-button menu-button-style]

window: layout/styles [
	panel [
		space 0x0 ;-- adding this makes the code misbehave 
		;space 1x1 ;-- this is ok in recent build, but fails on commit f8d2a3629

		below
		menu-button "1" [print "1"]
		menu-button "22" [print "22"]
		menu-button "333" [print "333"]
	]

] styles
view window
```

## Thursday 12nd December, 2019

bitbegin

[00:32](#msg5df18a950616d6515e22ae93)@loziniak you can read `https://doc.red-lang.org/en/view.html#_panel` to check if the event be supported

[00:49](#msg5df18e9de7265623012b0558)@loziniak if the base haven't color, it will be treated as transparent layer. on `windows`, the `333` layer is on top of all these layers, so the other layers will not response `click` event. with `GTK` backend, the top layer will check if it's background layer and then resend the `click` event.

[01:11](#msg5df193c10616d6515e22f69c)anyway, `https://github.com/red/red/pull/4185` will fix the issue

loziniak

[12:13](#msg5df22ef60995661eb8d1c526)Great, thanks!

[12:27](#msg5df2321b0995661eb8d1df81)@bitbegin It will be fantastic, when scrolling panes will be implemented. I await this patiently, and will happily help if possible. But as I also read in docs, `wheel` event is officially supported, so I base on that. It's good that it's finally settled what type on-wheel's `picked` will return. Is Windows 7 supported by Red?

## Tuesday 17th December, 2019

lucindamichele

[04:47](#msg5df85dfc0dc628523e4c1460)&gt; But as I also read in docs, `wheel` event is officially supported, so I base on that.  
Oh wow. I initially read that as "whee" with a 1 on the end, and I thought, how cool is that?! Been staring at the screen too long. :)

loziniak

[15:41](#msg5df8f7297ce7ea1e359e4f25)That would make Red a perfect language for kindergarten programming classes!

[15:46](#msg5df8f859ac14cc652c9d64db)Can anybody confirm, that after release-compiling this code and clicking a button we get `*** Runtime error 98: assertion failed`?

```
Red [Needs: 'View]
a: make face! [
	type: 'base color: red size: 20x20
	showw: function [
		parent [object!]
		offs [pair!]
	] [
		self/offset: offs
		self/parent: parent
		append parent/pane self
	]
]

view [
	panel 500x500 [
		button "show a" [a/showw face/parent 30x30]
	]
]
```

[15:47](#msg5df8f879e47fb31eb7caeb7d)When interpreted, it runs fine.

[15:47](#msg5df8f88b2bca3016aa97484e)Do I have error in this code?

[15:52](#msg5df8f9a30dc628523e5068aa)Full error message:

```
*** Runtime Error 98: assertion failed
*** in file: XXXred/gtk/red-github/runtime/datatypes/object.reds
*** at line: 384
***
***   stack: red/object/fire-on-set 00000062h 080951FEh 00000000h FFE69840h
***   stack: red/object/fire-on-set F54FBFB0h 091DCF94h 091E43E4h 091E43D4h
***   stack: red/object/fire-on-set* 091DDF24h 091DCF94h
***   stack: ctx||458~showw F7EE3C8Ch
***   stack: red/_function/call 091E43A4h F7EE3C8Ch
***   stack: red/interpreter/eval-code 091E43A4h F531C788h F531C788h false F531C758h F531C7B0h F54FA000h
***   stack: red/interpreter/eval-path F531C7B0h F531C768h F531C788h false false false false
***   stack: red/interpreter/eval-expression F531C768h F531C788h false false false
***   stack: red/interpreter/eval F531C6F0h true
***   stack: red/interpreter/eval-function 091E4374h F531C6F0h
***   stack: red/_function/call 091E4374h F7EE4428h
***   stack: red/interpreter/eval-code 091E4374h F5284A38h F5284A38h false 00000000h 00000000h 091E42D4h
***   stack: red/interpreter/eval-expression F5284A18h F5284A38h false false false
***   stack: red/interpreter/eval 091E4364h true
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments F54F94C0h F52849F0h F52849F0h 00000000h 00000000h
***   stack: red/interpreter/eval-code F54F94C0h F52849E0h F52849F0h false 00000000h 00000000h F54F94C0h
***   stack: red/interpreter/eval-expression F52849E0h F52849F0h false false false
***   stack: red/interpreter/eval 091E4344h true
***   stack: red/natives/try* true 0
***   stack: do-safe
***   stack: do-actor
***   stack: ctx||403~awake F7EEFC68h
***   stack: gui/make-event 093A7100h 0 9
***   stack: gui/button-clicked 093A7100h 093A7100h
```

## Wednesday 18th December, 2019

bitbegin

[01:38](#msg5df982fec6ce6027ebdddecd)@loziniak if you compile it on win10, you will get same issue,
