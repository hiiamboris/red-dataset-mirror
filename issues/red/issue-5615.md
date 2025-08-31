
#5615: static compile is slow compared to other options
================================================================================
Issue is closed, was reported by 3052 and has 12 comment(s).
<https://github.com/red/red/issues/5615>



using this file:

~~~
Red [
   Title: "Simple hello world script"
]
print "Hello World!"
~~~

I get this result:

~~~
> red-toolchain-066 -r hello.red
-=== Red Compiler 0.6.6 ===-

Compiling hello.red ...
...compilation time : 846 ms

Target: MSDOS

Compiling to native code...
...compilation time : 36461 ms
...global words     : 17151 (52.14%)
...linking time     : 103 ms
...output file size : 972288 bytes
...output file      : hello.exe
~~~

compare with Go language:

~~~go
package main

import "fmt"

func main() {
   fmt.Println("hello world")
}
~~~

result:

~~~
> Measure-Command { go build hello.go }
TotalSeconds      : 0.1576472
~~~

so Red is taking 36 seconds, and Go is taking 0.2 seconds. note I am interested in compiling a single self contained executable, which both commands do




Comments:
--------------------------------------------------------------------------------

On 2025-05-20T23:09:29Z, greggirwin, commented:
<https://github.com/red/red/issues/5615#issuecomment-2896031015>

    I'm going to close this ticket, as it's not an "issue" per se. Just a known state of affairs.
    
    This is also why Red has a dev mode option, so you don't need to recompile the runtime constantly, only when you're ready for release.

--------------------------------------------------------------------------------

On 2025-05-20T23:38:02Z, 3052, commented:
<https://github.com/red/red/issues/5615#issuecomment-2896065210>

    > This is also why Red has a dev mode option, so you don't need to recompile the runtime constantly, only when you're ready for release.
    
    fair enough, but you have ignored the fact that the Go example above produces a "release" executable as well. the difference is that the Go compiler does not recompile the entire standard library each time, while Red does. if this is not a glaring issue I dont know what is, but suit yourself.

--------------------------------------------------------------------------------

On 2025-05-21T01:38:17Z, greggirwin, commented:
<https://github.com/red/red/issues/5615#issuecomment-2896214120>

    It is simply the current state of things. Modular compilation is one of our goals. We all want fast. :^) Langs are hard to compare, unless they are _very_ similar. Is it a glaring issue that Go doesn't have a built-in GUI system, or many other features Red has? I don't think so. I'm not saying those contribute to compile times, just that they are very different languages, with different goals, built by different teams, at different stages of maturity.

--------------------------------------------------------------------------------

On 2025-05-21T02:28:50Z, greggirwin, commented:
<https://github.com/red/red/issues/5615#issuecomment-2896285072>

    I didn't deflect. I said I didn't think that was an issue for Go. You can stop reading after the first three sentences in my response where I acknowledge what you reported, or you can disagree with other things I said. I'm happy being done with this for now.

--------------------------------------------------------------------------------

On 2025-05-22T18:26:11Z, gurzgri, commented:
<https://github.com/red/red/issues/5615#issuecomment-2902185298>

    @3052 Other than @greggirwin I'm not a member of the Red team, but following this thread I really like to chime in, because this issue really took a somewhat unfortunate course:
    
    The *current* compiler being slow indeed is a none issue — but is so only because the compiler and linker are currently written in Rebol. This is going to change with Red targeting release 1.0 and Red being self-hosted with a compiler written entirely in Red itself. The current compiler will be thrown away. Just because of this there will be no performance optimzations for that one.
    
    Usually Gregg is a master in communication and I was really surprised that he omitted pointing out that the current compiler is just provisional. He might just have had a bad day :^)  So please don't take this issue being closed as an offence.

--------------------------------------------------------------------------------

On 2025-05-22T19:10:46Z, 3052, commented:
<https://github.com/red/red/issues/5615#issuecomment-2902287282>

    @gurzgri thanks for the reply, yes that is helpful information. to be honest it seems like @greggirwin  is really insecure in the Red software, and unwilling to confront shortcomings of Red. nothing wrong with saying "yes, this is a problem, we are working on it" or "yes, this is a problem, but we do not have the manpower to fix it any time soon". it seems he prefer to just ignore the problem or pretend it does not exist. this might be fine for him, but to me this is a serious problem and bad enough that I will just avoid Red for any number of other languages with decent compile times, such as Go/C/Rust/D/C#, even Zig is faster.

