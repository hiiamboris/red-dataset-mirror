Original URL: <http://helpin.red/OSinterface.html>

# OS interface

* * *

* * *

### native! call        [Red Wiki](https://github.com/red/red/wiki/%5BDOC%5D-Reference-Call)                [Red-by-example](http://www.red-by-example.org/#call)                [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-call-executes-a-shell-command-or-executable-file.)

Executes a shell command. In most cases, is the same as writing to the command prompt (CLI), but there are a few quirks.

The following code opens Windows Explorer:

&gt;&gt; call "explorer.exe"  
\== 11272                        ; this is the number of the process opened.

This also works:

&gt;&gt; str: "explorer.exe"  
\== "explorer.exe"

&gt;&gt; call str  
\== 11916

However, the following code creates the process, but does not open Notepad on screen:

&gt;&gt; call "notepad.exe"  
\== 4180

If you want a behavior more similar to typing a command on the shell, you must use the refinement /shell:

&gt;&gt; call/shell "notepad.exe"                ;opens notepad on screen  
\== 6524

Generate a beep (tone, duration). Must have Powershell installed.

 &gt;&gt; call "powershell \[console]::beep(1000,500)"

 == 1088

Other refinements:

 /wait

Runs command and waits until the command you executed is finished to continue. Be careful: If you use /wait on a command that you can't finish (like call "notepad.exe" above), Red will wait... and wait.. indefinetly.

 /input - we provide a string! a file! or a binary!, which will be redirected to stdin.

I don't understand this one. Seems as the same as simply call , as we provide string or a file anyway.

 /output

We provide a a string! a file! or a binary! which will receive the redirected stdout from the command. Note that the output is appended.

The following code will create a text file with the shell output for "dir" (a list of files and folders from current path):

&gt;&gt; call/output "dir" %mycall.txt  
\== 0

This will create a (long) string with the results from "dir":

&gt;&gt; a: ""  
\== ""

&gt;&gt; call/output "dir" a  
\== 0

&gt;&gt; a  
\== { Volume in drive C has no label.^/ Volume Serial Number is BC5 ;...

 /show

Force the display of system's shell window (Windows only). Your script will run with windows command prompt open.

&gt;&gt; call/shell/show "notepad.exe"  
\== 12372

I believe this will have some use in the future, when Red allows using the /console option from the GUI console. Maybe.

/console

Runs command with I/O redirected to console (CLI console only at present, does not work with Red's normal GUI console).

Open Red on system console, as explained [here](http://helpin.red/Helloworld-runandcompile.html#consolerunning), then, using the /console refinement on call, you the cmd output on the same console as Red:

C:\\Users\\André\\Documents\\RedIDE&gt;red-063.exe --cli  

--== Red 0.6.3 ==--                                

Type HELP for starting information.                

&gt;&gt; call/console "echo hello world"                 

hello world                                        

== 0                                                

&gt;&gt;

### native! write-clipboard &amp;  read-clipboard

Writes to and reads from the OS clipboard:

&gt;&gt; write-clipboard "You could paste this somewhere you find useful"  
\== true

&gt;&gt; print read-clipboard  
You could paste this somewhere you find useful

[&lt; Previous topic](http://helpin.red/Reactiveprogramming.html)                                                                                          [Next topic &gt;](http://helpin.red/IO.html)
