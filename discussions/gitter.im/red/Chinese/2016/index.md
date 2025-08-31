# Archived messages from: [gitter.im/red/red/Chinese](/gitter.im/red/red/Chinese/) from year: 2016

## Friday 8th January, 2016

rexhit

[07:12](#msg568f61467668d00a4ab45c84)新人冒个泡。

[07:12](#msg568f6151ee13050b38a254aa)之前用过一点rebol

[07:12](#msg568f61750712a5b63b4c3cd6)后来发现这门语言：）

[08:05](#msg568f6db687cb99b53b87e440)red的parse语言中，如何实现类似于正则表达式元字符\\b的功能？

[08:09](#msg568f6ea987cb99b53b87e452)即识别“词”与“非词”的分界处，但同时又不“占领”这个位置。

mogucpp

[08:10](#msg568f6ee0d739f50a360266da)这里不太及时,加qq群吧,那边回复挺快的

qtxie

[08:10](#msg568f6ef508e3bca07d9b43e3)欢迎~

mogucpp

[08:10](#msg568f6efbee13050b38a255d7)427900172

rexhit

[08:11](#msg568f6f330712a5b63b4c3de4)谢谢，已经加了：）

[08:11](#msg568f6f45d739f50a360266e0)@qtxie 谢谢

qtxie

[09:04](#msg568f7ba808e3bca07d9b440d)@rexhit 这是个简单的例子

[09:05](#msg568f7bc508e3bca07d9b440f)delimiter: charset " ^-^/^M"  
word: "is"  
match: \[delimiter s: word e: delimiter (probe copy/part s e)]  
parse "This island is beautiful" \[opt match any \[match | skip]]

rexhit

[09:44](#msg568f850d8fdd3c0c382d73a7)谢谢，我研究一下

## Monday 11st January, 2016

liuhuancom

[08:35](#msg5693694dee13050b38a2c9e2)hello

JiaChen-Zeng

[09:06](#msg5693707a8fdd3c0c382de6cb)nihao

qtxie

[09:22](#msg569374422910c4617b705041)hello~

dockimbel

[09:29](#msg569375df0712a5b63b4cafeb)你好 ;)

## Friday 22nd January, 2016

bitbegin

[02:59](#msg56a19af9a03e28ad1ae02cd2)master编译出来的console.exe不能使用吧

qtxie

[04:01](#msg56a1a9a4c391361d48ec905a)可以啊

## Monday 25th January, 2016

bitbegin

[11:05](#msg56a60181c54bc2bf180bdbd5)Red \[Needs: 'View]

[11:06](#msg56a6019e586242210adf5b13)win: layout \[size: 1100x806]

[11:06](#msg56a601c18fbaf4220af927e6)win/pane: reduce [  
tab-panel: make face! [  
type: 'tab-panel offset: 0 size: 1100x806  
data: [  
"untitled"  
]  
pane: reduce [  
make face! [  
type: 'panel  
pane: reduce [  
text-area: make face! [  
type: 'area text: "" offset: 0 size: 1100x800  
]  
]  
]  
]  
]  
]

view win

[11:07](#msg56a601fc586242210adf5b22)编译的结果和console下显示不同

qtxie

[11:54](#msg56a60cf984cccde9258ae905)`offset: 0`应该设置成`offset: 0x0`.

[11:56](#msg56a60d5d84cccde9258ae90a)offset只接受Pair! 和 none。目前代码里少了这部分的检查。

## Friday 29th January, 2016

bitbegin

[04:10](#msg56aae64f8fbaf4220afa028c)gui-console是使用 environment/console/gui-console.red编译的么？我怎么编译出来的没法使用

qtxie

[05:31](#msg56aaf928c54bc2bf180cb98b)编译的命令行里需要加`-t Windows`

## Thursday 4th February, 2016

Oldes

[08:18](#msg56b309501191fcc8353b8bd3)Unlucky Colors for upcomming Monkey zodiac: red, black, grey, dark coffee - wouldn't it be a problem? :-)

## Friday 5th February, 2016

bitbegin

[08:27](#msg56b45cef5cc201794d498ea8)关闭 modal &amp; popup 窗口，父窗口最小化了

qtxie

[10:34](#msg56b47a9b9988594d700be4cf)我这里测试没有最小化，但是父窗口没有激活。

## Tuesday 22nd March, 2016

rexhit

[03:22](#msg56f0ba878ea88c6726738f13)请问有用red或rebol写的xml parser吗？就是把xml格式的文件转换成object!的函数库。

qtxie

[04:05](#msg56f0c47dab8cc6f071f9ec2d)Rebol内置了解析xml的函数http://www.rebol.com/docs/words/wparse-xml.html

[04:06](#msg56f0c4abc0d1b40a431f8d6b)如果要更强大的xml parser，这里还有http://www.rebol.org/search.r?find=xml&amp;form=yes

rexhit

[11:19](#msg56f12a28590ecaef713a8c0c)@qtxie 多谢！但rebol3好像没有parse-xml这个函数？而且rebol.org给出的都是用于rebol2的库？因为我要分析汉语，所以可能只能用rebol3。不知rebol3是否有成形的库或函数？

qtxie

[11:25](#msg56f12b9d585e688e68367f40)rebol2的版本在rebol3下应该也能用的

[11:27](#msg56f12c3450729b203be73b31)不过rebol3下没有`parse/all`, rebol2代码里的`parse/all`直接改成`parse`就行。

rexhit

[11:34](#msg56f12daf590ecaef713a8cf1)好的，明白了，多谢

[11:34](#msg56f12dd3ab8cc6f071fa00ad)我找个脚本试试看：）

qtxie

[11:42](#msg56f12fb450729b203be73b44)还有一个不一样的是Rebol2和Rebol3的bitset!的格式不一样

[11:43](#msg56f12fc7585e688e68367f4e)Rebol2：  
&gt;&gt; charset "0123456789"  
\== make bitset! #{  
000000000000FF03000000000000000000000000000000000000000000000000  
}

[11:43](#msg56f12fd8136f047a1ea35e70)Rebol3：  
&gt;&gt; charset "0123456789"  
\== make bitset! #{000000000000FFC0}

[11:44](#msg56f1300b50729b203be73b46)所以如果代码里直接用make bitset! #{.....}，要转换一下格式

rexhit

[11:47](#msg56f130e58ea88c672673a60e)这个有点高端，貌似我目前不会碰到：）

## Wednesday 30th March, 2016

fangqian

[08:39](#msg56fb90b2bbffcc665faa75a7)终于找到一个可以说中文的chat-room了

qtxie

[08:41](#msg56fb91277c18711013e662e1)欢迎~ :clap:

## Thursday 14th April, 2016

tomzcn

[07:20](#msg570f44a64c2125fc3f023e12)deflang.org 又一个rebol

qtxie

[08:07](#msg570f4fbf30a23db340afb89f)国产编程语言？

[08:10](#msg570f506b30a23db340afb8a4)看了下，是一门对元编程支持的比较好的静态语言。跟Lisp和Rebol这样的动态语言不是一类的。

## Friday 15th April, 2016

tomzcn

[01:01](#msg57103d633ddb73ba105c3a63)很多语言都是能解释，能编译的，不能按这个分动态静态。deflang也是不用事先声明类型的，是系统自己判断的。rebol本身也是能编译为exe文件的。lisp也是能编译的。

[01:02](#msg57103daf5cd40114649b6fd2)deflang也是函数调用不需要括号，也是没有括号的lisp。和rebol非常像。deflang多了数据类型定义，另外，是c++实现的。

[01:06](#msg57103e84b30cfa0f384b90a7)哦，你的意思是变量赋值一个类型后就不能变为另一个类型了，这叫动态语言。我看来，这个动态语言特性没什么意义，现在都提倡赋值后就不再变了，更别说改类型了。

qtxie

[02:24](#msg571050df548df1be102d1161)其实我想表达的只是deflang并不是rebol类的语言。粗鲁的看了下deflang的文档，并没有看到类似rebol的`do`或者lisp的`eval`的东西（可能是我疏忽了，如果有，请指正），而rebol中一个核心概念是\[Homoiconic](http://en.wikipedia.org/wiki/Homoiconicity)，通俗的讲就是 “数据即代码，代码即数据”。

[02:28](#msg571051b25ed5a4fd3fe32bce)你可以在运行时像操作数据一样操作代码，然后运行它。比如这样：

[02:28](#msg571051b33ddb73ba105c3d58)

[02:28](#msg571051c24c2125fc3f028ab2)

```
code: [print "Rebol"]
replace code "Rebol" "Red"
do code
```

JenniferLee520

[05:34](#msg57107d733ddb73ba105c44a8)甚至可以 replace code 'print 'prin ，或者 replace code 'print "Red"

tomzcn

[06:44](#msg57108dde3ddb73ba105c47df)哦。deflang可能不实现eval。deflang有宏。你说的动态生成代码，ruby也比较拿手。deflang的函数模板不知道是不是有这个功能。宏也能代码处理。运行时的代码生成，我猜测用宏能实现。我没怎么用过宏。

## Thursday 2nd June, 2016

tomzcn

[02:54](#msg574f9ffff44fde236e52a2e8)qtxie, 推荐一个很动态的语言：iolanguage。iolanguage甚至能调用根本不存在的方法。比如对象o1没有hehe的方法，却能调用hehe方法。有一个默认的处理函数，比如打印hehe。iolanguage的惰性参数也实现了宏。

qtxie

[03:32](#msg574fa8c5454cb2be095131fa)看到过这门语言，《七周七语言》里还专门介绍过。

## Thursday 30th June, 2016

JenniferLee520

[01:40](#msg5774787c971717155490a912)0.6.1 今天凌晨 release。响应式编程很吸引人。

[01:42](#msg577479001ac8bd1a4d9b0c4c)可惜现在这些GUI功能只有Windows的使用者才能享用，希望Mac版本快点出来。谢谢！

[01:43](#msg57747957971717155490ad07)看到Trello上面写的Mac版进度，基本上已经完成一半了。

qtxie

[02:12](#msg57748006bb1de91c54af95da)预计0.6.2会有一个可用的Mac版本。;-)

tomzcn

[04:49](#msg5774a4cb8441a8124d92993d)reactor编程感觉是lazy编程的另一端。lazy是从结果出发，把相关表达式都计算一遍。reactor是从赋值出发，把相关结果都计算出来。

## Wednesday 20th July, 2016

tomzcn

[03:38](#msg578ef24f9f35137e67e27969)eve就是把prolog扩展了一下。

qtxie

[05:05](#msg578f069b9f35137e67e33ead)还没有详细了解这个项目，prolog挺不错的

## Thursday 21st July, 2016

tomzcn

[02:34](#msg579034ae0720fd587ab42dfe)eve扩展后，从list进步到dictory，并且能用来编网站程序了。

## Wednesday 31st August, 2016

HairyRabbit

[10:30](#msg57c6b1a88635a5ba6c846821)-.- ?

qtxie

[10:53](#msg57c6b7274a07bdea7f4b40c3)^-^

HairyRabbit

[11:09](#msg57c6bad6c251522d6695d014)

## Thursday 1st September, 2016

HairyRabbit

[03:50](#msg57c7a58c29ee4a67058270a7)被蘑蘑安利，决定入坑，正在看文档中 -.-

qtxie

[03:52](#msg57c7a5f66efec7117c9b2868)欢迎~ 欢迎~ 热烈欢迎!

HairyRabbit

[03:53](#msg57c7a63829ee4a670582727d)view层和elm的好像~ 233，react也有点类似呢，
