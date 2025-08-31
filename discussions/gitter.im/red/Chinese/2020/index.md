# Archived messages from: [gitter.im/red/red/Chinese](/gitter.im/red/red/Chinese/) from year: 2020

## Wednesday 8th January, 2020

liangliangsun

[02:24](#msg5e153d51a74ac853776fb753)Red 还要多少年能1.0 -\_-||，谁知道 .

qtxie

[11:17](#msg5e15ba3ba1e1504901221047)这个没人知道吧。。。

## Wednesday 18th March, 2020

alexkuang0

[01:16](#msg5e71765a5062e96f714945e1)macOS Catalina 运行不了。想自己编译发现编译依赖的rebol也提示bad CPU type in executable

bitbegin

[01:20](#msg5e717754b00d7a3a2cc42c9b)10.15的不支持了

[01:23](#msg5e7178039c3610628e8fe05e)要等64bit的工具链

## Monday 20th April, 2020

viest

[06:23](#msg5e9d3feaa1284c4f20a47141)red 是不是发了币之后，就没有之后了

qtxie

[23:07](#msg5e9e2b18a1284c4f20a88963)应该还有

## Sunday 10th May, 2020

dalecgu

[19:00](#msg5eb84f547975db7ebff842ea)\[!\[image.png](https://files.gitter.im/red/red/Chinese/86ff/thumb/image.png)](https://files.gitter.im/red/red/Chinese/86ff/image.png)

[19:05](#msg5eb8505d0b23797ec075105c)windows下编译tests包里的例子，drop-list在选择时会崩溃，请问是什么原因？应该怎么去调试呢？

## Monday 11st May, 2020

bitbegin

[01:42](#msg5eb8ad749f0c955d7db8fa0b)用 -r -d 编译，然后可以看到crashed 时候的调用栈情况

dalecgu

[06:24](#msg5eb8ef885cd4fe50a301f1aa)\[!\[image.png](https://files.gitter.im/red/red/Chinese/FG7M/thumb/image.png)](https://files.gitter.im/red/red/Chinese/FG7M/image.png)

[06:24](#msg5eb8ef9422f9c45c2a8235d9)@bitbegin 学到了~

[09:56](#msg5eb921648c044c191492f58f)用最新的dailybuild编译是ok的

## Monday 7th September, 2020

flw-cn

[05:17](#msg5f55c251a5788a3c29db2def)现在有 catalina 可用的 red 吗？

[05:17](#msg5f55c26fa5788a3c29db2e74)catalina 不支持 32 位程序

bitbegin

[07:01](#msg5f55dae0ec534f584fea2d26)还没有

flw-cn

[08:30](#msg5f55ef97ec534f584fea6a93)哦，可以自己编译出来吗？

bitbegin

[08:30](#msg5f55efb349148b41c99c67d4)不能的

flw-cn

[08:30](#msg5f55efc136e6f709fd2c0b62)好惨。

[08:31](#msg5f55efcd5580fa092b4d9aba)我好像永远地失去了 red

bitbegin

[08:31](#msg5f55eff1d4f0f55ebb09058f)只能等了

flw-cn

[08:31](#msg5f55efff59ac794e02f1ba1d)Linux 好像还可以吧，不行就先用 Docker 了。

bitbegin

[08:32](#msg5f55f01bd4f0f55ebb090608)那可以的

flw-cn

[08:33](#msg5f55f0439566774dfe5c23aa)感谢！

[08:33](#msg5f55f04b89cf2d584ba1df3c)我试试 Docker

[08:37](#msg5f55f12fec534f584fea6fdb)$ ./red  
zsh: no such file or directory: ./red

[08:37](#msg5f55f138c3aa024ef9c930ba)为什么会报这个错。

[08:37](#msg5f55f13eddc2d041c0f351ca)核对了一下，sha 是对的

[08:37](#msg5f55f146ec534f584fea6fe4)$ sha256sum red  
5a8fa68c2fd5c84c855e26369391d825a13d8ac456ac534b1569139c65880a92 red

bitbegin

[08:37](#msg5f55f158ddc2d041c0f351d9)chmod +x ?

flw-cn

[08:37](#msg5f55f16159ac794e02f1bd74)加过了

[08:38](#msg5f55f17adfaaed4ef53746ac)

```
$ ll
total 1.5M
-rwxrwxr-x 1 flw flw 1.5M Sep  7 16:34 red
```

bitbegin

[08:38](#msg5f55f194d4f0f55ebb090a0a)下载的是不是linux下的镜像？

flw-cn

[08:39](#msg5f55f1b55580fa092b4d9f3c)是的

[08:39](#msg5f55f1b7dfaaed4ef537479c)\[!\[image.png](https://files.gitter.im/5673b28a16b6c7089cbf2657/ndwR/thumb/image.png)](https://files.gitter.im/5673b28a16b6c7089cbf2657/ndwR/image.png)

bitbegin

[08:39](#msg5f55f1d69bad075eac0304cb)哦，那可能你没有按照i386的架构

flw-cn

[08:40](#msg5f55f1e6dfaaed4ef5374812)哦

[08:40](#msg5f55f1fea5788a3c29dbb3a7)是不是缺什么东西

[08:40](#msg5f55f20c9566774dfe5c2868)哦，看到了

[08:40](#msg5f55f21089cf2d584ba1e586)下面有说明

[08:45](#msg5f55f33aa5788a3c29dbb74c)好了，感谢！

[08:46](#msg5f55f34ac3aa024ef9c935bf)1.5M，真牛啊

[08:48](#msg5f55f3c3765d633c54dcf2bc)

```
$ ./red --cli
/home/flw/.red/console-2020-9-5-14505: error while loading shared libraries: libgtk-3.so.0: cannot open shared object file: No such file or directory
```

[08:48](#msg5f55f3cb49a1df0a12d3405a)gtk 没有还不行

bitbegin

[08:48](#msg5f55f3e859ac794e02f1c67b)sudo apt install at-spi2-core #for Error retrieving accessibility bus address: org.freedesktop.DBus.Error.ServiceUnknown: The name org.a11y.Bus was not provided by any .service files

sudo apt-get install libgtk-3-bin:i386  
sudo apt-get install librsvg2-common:i386  
sudo apt install libcanberra-gtk-module:i386 libcanberra-gtk3-module:i386  
sudo apt install at-spi2-core:i386

[08:48](#msg5f55f3f4ec534f584fea7732)gtk 依赖的有点多

flw-cn

[08:49](#msg5f55f3ff36e6f709fd2c17b5)嗯，我记得以前的版本是不依赖 gtk 的

bitbegin

[08:49](#msg5f55f419c3aa024ef9c937fd)那要自己编译一个了

flw-cn

[08:49](#msg5f55f42da5788a3c29dbbd3b)嗯，我研究研究，现在用到了 GTK 的哪些东西？

## Monday 21st September, 2020

liuxingyulee

[20:50](#msg5f69122dd993b837e07af4dc)请问下我写了段red代码, debug的时候报错,  
"\** Script Error: foreach does not allow map! for its series argument  
\*\** Where: do  
\*\** Stack: do-file "

[20:51](#msg5f69124bdf4af236f920ec48)这段代码是修改来自之前可用的代码, 这段应该是可以用的

[21:17](#msg5f691874aaff36059b4a977a)在win上编译到exe文件时,报错  
\*\** near: \[load-json config-data]

qtxie

[23:00](#msg5f6930721c5b0d210ac20c93)&gt; 请问下我写了段red代码, debug的时候报错,  
&gt; "\** Script Error: foreach does not allow map! for its series argument  
&gt; \*\** Where: do  
&gt; \*\** Stack: do-file "

你用的是nightly build吗？

[23:00](#msg5f69307e1c5b0d210ac20cb1)

```
>> m: #(a: 1 b: 2)
== #(
    a: 1
    b: 2
)
>> foreach [k v] m [print [k v]]
a 1
b 2
```

## Tuesday 22nd September, 2020

liuxingyulee

[00:28](#msg5f69454b417bf140aa0535c0)@qtxie 你好, 请问怎么分别是否是 nightly build?

[00:31](#msg5f6945d3f41f4105e4cc1a4d)

```
>> m: #(a: 1 b: 2)
== #(
    a: 1
    b: 2
)
>> foreach [k v] m [print [k v]]
*** Script Error: foreach does not allow map! for its series argument
*** Where: foreach
*** Stack:
```

[00:32](#msg5f694605b39cb873c07588f6)看起来像是

[00:32](#msg5f69460e5efe9467b109e885)遇到foreach就出错了

[00:52](#msg5f694ad1b39cb873c0759130)请问是我是用的red版本的问题吗

qtxie

[22:54](#msg5f6a80a1b8a99f45199ed47a)有个命令可以查看的，我忘记了。应该是你的版本太旧了。这是最新版的连接：https://static.red-lang.org/dl/auto/win/red-latest.exe

[22:55](#msg5f6a80e01c5b0d210ac563eb)如果你能打开https://www.red-lang.org/p/download.html ，选择 下载 `Automated builds, master branch` 里面的Red。

## Thursday 24th September, 2020

liuxingyulee

[16:53](#msg5f6ccf14e1dd7c195492395c)@qtxie 谢谢

[17:27](#msg5f6cd70b4002c640b5e4a724)我试了下, automated builds确实可以执行, 我再进一步看看能否编译.

[21:55](#msg5f6d15c86e85e0058c52b30e)也编译成功了, @qtxie 十分感谢.
