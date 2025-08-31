
#3412: Stuck on "Compiling to native code"
================================================================================
Issue is closed, was reported by ghost and has 33 comment(s).
<https://github.com/red/red/issues/3412>

Running either one of these hangs on the final step, while peaking the CPU core
in use. Must use Ctrl + C to stop:

~~~red
$ cat hello.red
Red [
   Title: "Simple hello world script"
]
print "Hello World!"
~~~

~~~
$ red-063 -r hello.red
-=== Red Compiler 0.6.3 ===-

Compiling C:\hello.red ...
...compilation time : 1534 ms

Target: MSDOS

Compiling to native code...
~~~

~~~
$ red-063 -c hello.red
-=== Red Compiler 0.6.3 ===-

Compiling C:\hello.red ...
Compiling libRedRT...
...compilation time : 2543 ms

Compiling to native code...
~~~


Comments:
--------------------------------------------------------------------------------

On 2018-06-09T02:39:02Z, ghost, commented:
<https://github.com/red/red/issues/3412#issuecomment-395933683>

    Ok so the compiler is working, its just incredibly slow:
    
    <pre>
    $ time red-063 -r hello.red
    -=== Red Compiler 0.6.3 ===-
    
    Compiling C:\hello.red ...
    ...compilation time : 1373 ms
    
    Target: MSDOS
    
    Compiling to native code...
    ...compilation time : <b>38735 ms</b>
    ...linking time     : 250 ms
    ...output file size : 595968 bytes
    ...output file      : C:\hello.exe
    </pre>
    
    Compare with GCC:
    
    <pre>
    $ cat hello.c
    #include <stdio.h>
    int main() {
      puts("hello world");
    }
    
    $ time x86_64-w64-mingw32-gcc hello.c
    
    real    <b>0m0.234s</b>
    user    0m0.076s
    sys     0m0.106s
    </pre>

--------------------------------------------------------------------------------

On 2018-06-09T03:21:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3412#issuecomment-395936048>

    The first time you compiled the program, the Red runtime was compiled and saved. Subsequently compiles will be much faster.
    
    This is done to make it easier to provide a binary which does not need a complicated installation script. 

--------------------------------------------------------------------------------

On 2018-06-09T03:34:08Z, ghost, commented:
<https://github.com/red/red/issues/3412#issuecomment-395936556>

    @PeterWAWood are you certain of this - I am not seeing any "Red runtime" being compiled or saved, unless it is hidden or in another folder - do I need to be using some other option so that the Red Runtime is not compiled every time?

--------------------------------------------------------------------------------

On 2018-06-09T03:37:07Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3412#issuecomment-395936665>

    For completeness, these are the timings I got on a second compile of your program:
    ```text
    time rebol -qws ../../Red/red/red.r hello.red
    ...
    ...using libRedRT built on 9-Jun-2018/11:29:29+8:00
    ...compilation time : 25 ms
    
    Compiling to native code...
    ...compilation time : 1213 ms
    ...linking time     : 52 ms
    ...output file size : 77824 bytes
    
    real	0m1.384s
    user	0m1.319s
    sys	0m0.022s
    ``` 
    
    The current compiler is a throw-away bootstrap compiler at the Alpha stage. It shouldn't be expected that it will be as fast as GCC.

--------------------------------------------------------------------------------

On 2018-06-09T03:42:42Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3412#issuecomment-395936869>

    The `-r` option compiles the runtime and includes it in the executable. Use the `-c` option to use the libRedRT runtime. (If the compiler doesn't find a libRedRT in the source directory, it will compile that first before compiling the program).

--------------------------------------------------------------------------------

On 2018-06-09T03:46:38Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3412#issuecomment-395937020>

    Please could you ask such questions in the [Red Help Chat Room](https://gitter.im/red/help) or on the [Red Mailing List](https://groups.google.com/forum/#!forum/red-lang) next time you have questions about Red. 

--------------------------------------------------------------------------------

On 2018-06-09T03:52:23Z, ghost, commented:
<https://github.com/red/red/issues/3412#issuecomment-395937257>

    @PeterWAWood ok it is working for me now - however some problems:
    
    if i use `-r` it makes a static build (like i want), but doesnt leave the static
    library behind - so it has to be compiled each time
    
    if i use `-c` it makes a shared build (like i dont want), but it leaves the
    shared library behind - so it does not need to be compiled each time
    
    can i use some option to resolve this

--------------------------------------------------------------------------------

On 2018-06-09T04:38:09Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3412#issuecomment-395939105>

    Please ask this question in either the Red Help Chat Room or on the Red Mailing List.

--------------------------------------------------------------------------------

On 2018-06-09T08:33:15Z, dockimbel, commented:
<https://github.com/red/red/issues/3412#issuecomment-395951364>

    @svnpenn 
    > Compare with GCC:
    
    You are comparing apples with oranges, Red is a very high-level language, while C is a very low-level language. The work done by the compiler is very different in both cases, not even mentioning that the whole Red standard library is recompiled each time if you insist on using the release mode for every compilation job. If you want to have a closer point of comparison, you should try with a Red/System program (Red's low-level dialect):
    ```
    Red/System [
       Title: "Simple hello world script"
    ]
    print "Hello World!"
    ```
    Save it as `hello.reds`, try to compile it and see the results. It's not as fast as gcc, but close enough. Given that Red/System compiler is entirely written in Rebol, which is a purely interpreted language (while gcc is written in C), the results are really decent actually.

--------------------------------------------------------------------------------

On 2018-06-09T13:48:44Z, endo64, commented:
<https://github.com/red/red/issues/3412#issuecomment-395970852>

    @svnpenn Please ask your questions on Gitter, in https://gitter.im/red/red/system or https://gitter.im/red/red or other related rooms.

--------------------------------------------------------------------------------

On 2018-06-09T14:15:18Z, 9214, commented:
<https://github.com/red/red/issues/3412#issuecomment-395972511>

    @svnpenn 
    
    1. I suggest you to read up on what is [Red](https://www.red-lang.org/p/about.html), what is [Red/System](https://static.red-lang.org/red-system-specs.html), and how one is [related to the other](https://github.com/red/red#red-programming-language) (the last paragraph).
    
    2. What do you mean by 'Red Static Library'? Runtime library? If your goal is to minimize compilation times, then re-read @PeterWAWood's answer. Another question is why you need to compile your program each time if Red is also an interpretive language, and, apparently, you don't use any R/S routines in your code.
    
    And please, stop utilizing bug tracker for Q/A sessions. It was suggested to you multiple times to use Gitter chat for discussions. Either [`/help`](http://gitter.im/red/help) or [`/welcome`](https://gitter.im/red/red/welcome) room will do.

--------------------------------------------------------------------------------

On 2018-06-09T14:22:38Z, ghost, commented:
<https://github.com/red/red/issues/3412#issuecomment-395973197>

    @9214 thanks for the help - Red Static Library is a simple concept - for example
    normally with `-c` the Red Shared Library is created - `libRedRT.dll` - the Red
    Static Library would be `libRedRT.a` or similar - this would be built once then
    it would be linked as needed saving the need to compile it every time
    
    also i see youve now added a 4th chat location:
    
    1. http://gitter.im/red/help
    2. http://gitter.im/red/red
    3. http://gitter.im/red/red/system
    4. http://gitter.im/red/red/welcome
    
    perhaps if this could be narrowed to a single suggestion based on the issue i am
    having here - i would use that suggestion - thanks again

--------------------------------------------------------------------------------

On 2018-06-09T14:26:24Z, 9214, commented:
<https://github.com/red/red/issues/3412#issuecomment-395973523>

    @svnpenn you already asked your first question in [`/help`](http://gitter.im/red/help) room some time ago, so, I highly suggest to move all further discussions there rather than continuing them here.

--------------------------------------------------------------------------------

On 2021-07-16T23:58:06Z, 9214, commented:
<https://github.com/red/red/issues/3412#issuecomment-881776812>

    @89z, aka @cup, aka @svnpenn, aka [Steven Penny](https://stackoverflow.com/users/1002260/steven-penny): nothing has changed since the team's [latest](https://github.com/red/red/issues/3417#issuecomment-396671976) encounter with you. If you want feature request to be implemented promptly and swiftly, just ask nicely and help with what you can afford.

--------------------------------------------------------------------------------

On 2021-07-17T00:25:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3412#issuecomment-881783259>

    @89x, please be civil. @9214 isn't stalking you. You're dredging up old (closed) tickets in what seems like an effort to pick a fight. When you say "All that would have to be done...", you make it sound like it's something really easy to do. If it were, we would have done it. But it also hasn't been a priority.

--------------------------------------------------------------------------------

On 2021-07-17T00:43:32Z, 9214, commented:
<https://github.com/red/red/issues/3412#issuecomment-881786328>

    @89z I am sorry if I made an impression of stalking you, which isn't the case. Your HN post had a recognizable polemic, and your *public* HN profile linked to a SO user with a familiar avatar and nickname. I merely connected the dots in my memory.
    
    If your only interest in this ticket doesn't amount to contributing and discussing development in a constructive manner, perhaps it's time to lock the thread for good. 

