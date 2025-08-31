
#2129: Compilation of Red header is case sensitive
================================================================================
Issue is closed, was reported by retsyo and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2129>

I am using red-22jul16-291cf88.exe and red-22jul16-291cf88.zip on win7 64 bits. 
for the simple red file
[hello.red]
red[]
print "hello"
[/hello.red]

"R:\red>red-22jul16-291cf88.exe hello.red" prints hello as expected

however
[quote]
R:\red>red-22jul16-291cf88.exe -c hello.red

-=== Red Compiler 0.6.1 ===-

Compiling R:\red\hello.red ...
**\* Syntax Error: Invalid Red program
**\* line: 1
**\* at: {red[]
print "hello"

}
[/quote]



Comments:
--------------------------------------------------------------------------------

On 2016-07-23T06:32:45Z, dockimbel, commented:
<https://github.com/red/red/issues/2129#issuecomment-234702674>

    The compiler is right, proper Red header is written with a capital letter: `Red`. The console is not enforcing that, so it needs to be fixed.
    
    There are two reasons for this stricter policy for the header:
    1. This header is used to locate the beginning of Red code when embedded in text, XML or HTML file. Starting it with a capital reduces the risks of wrongly identifying it.
    2. Red is a name in this context, so grammar rules apply, so it doesn't look like a color label.

