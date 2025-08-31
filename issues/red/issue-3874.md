
#3874: Ask "" crashes when not getting characters piped to stdin
================================================================================
Issue is closed, was reported by loziniak and has 14 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3874>

**Describe the bug**
Following script:
```
Red [File: %adapter.red]
#include %red-github/environment/console/CLI/input.red
arg-str: ask ""
print arg-str
```
crashes with "access violation" message on Linux and Windows:
```
Z:\adapter_test>adapter.exe

*** Runtime Error 1: access violation
*** at: 0041F70Dh
```

**To reproduce**
Compile the script with `-r` option and execute.

**Expected behavior**
Version of the script using `read-stdin` function compiles and executes as expected under both Windows and Linux:
```
Red [File: %adapter.red]
#include %red-github/environment/console/CLI/input.red
input: copy #{}
until [
	buff: copy #{}
	read-stdin buff 10
	append input buff
	0 >= length? buff
]
print to string! input
```

**Platform version (please complete the following information)**
```
(Arch Linux)
Red 0.6.4 for Linux built 25-Mar-2019/12:11:08+02:00 commit #e6c96aa
(Win7)
Red 0.6.4 for Windows built 1-May-2019/20:32:06+02:00 commit #8d712e4
```


Comments:
--------------------------------------------------------------------------------

On 2019-05-13T19:11:31Z, loziniak, commented:
<https://github.com/red/red/issues/3874#issuecomment-491948942>

    Bug is connected with #3872 

--------------------------------------------------------------------------------

On 2019-05-13T19:52:29Z, loziniak, commented:
<https://github.com/red/red/issues/3874#issuecomment-491961923>

    It crashes also with latest version - `red-13may19-973dcd65`

--------------------------------------------------------------------------------

On 2019-05-14T17:50:33Z, loziniak, commented:
<https://github.com/red/red/issues/3874#issuecomment-492340646>

    It still crashes under Linux, when using `red-14may19-587a64a9`.

--------------------------------------------------------------------------------

On 2019-05-14T19:32:56Z, qtxie, commented:
<https://github.com/red/red/issues/3874#issuecomment-492378149>

    @loziniak Hmm, I missed it. Will fix it on Linux soon.

--------------------------------------------------------------------------------

On 2019-05-15T12:50:29Z, qtxie, commented:
<https://github.com/red/red/issues/3874#issuecomment-492640787>

    It works fine on Ubuntu Linux. I'll try to run it on Arch Linux in the next days.

--------------------------------------------------------------------------------

On 2019-05-17T15:50:11Z, qtxie, commented:
<https://github.com/red/red/issues/3874#issuecomment-493503319>

    I still cannot reproduce the crashes under Linux. Does anyone has the same issue?

--------------------------------------------------------------------------------

On 2019-06-08T23:28:38Z, loziniak, commented:
<https://github.com/red/red/issues/3874#issuecomment-500172849>

    Under Arch it works ok with `red-08jun19-1b68168a`

