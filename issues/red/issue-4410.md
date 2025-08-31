
#4410: `red` is unexplicably slow when invoked with a headerless script from CLI
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4410>

**Describe the bug**

More than 10000 times slower than `do`!
Sometimes I by mistake forget to include the header, or run Red on a file that's not a Red script, and it almost hangs.

**To reproduce**

I have created a few test scripts:
```
write %0.red {1 1 1}
write %1.red append/dup {} {11111 11111^/} 1000
write %2.red append/dup {} {qqqqq qqqqq^/} 1000
write %3.red append/dup {} {ыыыыы ыыыыы^/} 1000
write %4.red append/dup {Red []^/} {ыыыыы ыыыыы^/} 1000
```
`0.red` - tiny, for baseline estimation
`1.red` - normal size, no header, only digits
`2.red` - same size, only letters (words)
`3.red` - same char count, but chars are unicode letters (words)
`4.red` - same as `3.red` but with a header `Red []`

Now I run them with `do`:
```
0.0 ms	[attempt [do %0.red]]
0.0 ms	[attempt [do %1.red]]
0.0 ms	[attempt [do %2.red]]
1.00 ms	[attempt [do %3.red]]
118 ms	[attempt [do %4.red]]
```
As you can see, headerless scripts return almost instantly with an error.

Now I run them with `call`:
```
263 ms	[call/wait "red --cli 0.red"]
4698 ms	[call/wait "red --cli 1.red"]
7964 ms	[call/wait "red --cli 2.red"]
49408 ms[call/wait "red --cli 3.red"]
372 ms	[call/wait "red --cli 4.red"]
```

Steps to reproduce the behavior:

You need `clock` mezz:
```
clock: function [
	"Display execution time of CODE"
	code [block!]
	/times n [integer!] "Repeat N times (default: once)"
	/local r
][
	t1: now/precise
	set/any 'r loop any [n 1] code
	t2: now/precise
	parse form 1e3 * to float! difference t2 t1 [0 3 [opt #"." skip] opt [to #"."] a:]
	print [head clear a "ms^-" mold/flat code]
	:r
]
```
Then:
```
clock [attempt [do %0.red]] ()
clock [attempt [do %1.red]] ()
clock [attempt [do %2.red]] ()
clock [attempt [do %3.red]] ()
clock [attempt [do %4.red]] ()

clock [call/wait "red --cli 0.red"] ()
clock [call/wait "red --cli 1.red"] ()
clock [call/wait "red --cli 2.red"] ()
clock [call/wait "red --cli 3.red"] ()
clock [call/wait "red --cli 4.red"] ()
```

R2 is not the culprit here, as I get the same timings from `console`, even from the fast-lexer branch.

**Expected behavior**

Reasonable timings, near the baseline `0.red` (will depend on OS and hardware).

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
(including fast-lexer)
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-25T22:53:03Z, dockimbel, commented:
<https://github.com/red/red/issues/4410#issuecomment-619451150>

    Please don't use `red --cli` when you want to invoke the Red CLI console from another app. Just call directly the CLI console executable (in the Red cache folder, or compile one in the working folder). `red --cli` is just a handy shortcut when wanting to invoke the CLI console from the shell command-line.
    
    Red.exe is a R2-encapped binary with a non-standard booting sequence that often does not play well when called by third-party apps. When Red.exe is used to invoke the console, it acts as a proxy by sub-calling the right console executable. Just avoid the overhead and possible trouble by calling the console exe directly in such cases.
    
    Another aspect to check: do you get the same behavior by using `call` from Red and from R2?

--------------------------------------------------------------------------------

On 2020-04-26T10:59:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4410#issuecomment-619529626>

    @dockimbel as I wrote above ☻:
    > R2 is not the culprit here, as I get the **same timings from `console`**, even from the fast-lexer branch
    
    As to
    > Another aspect to check: do you get the same behavior by using call from Red and from R2?
    
    Yes, same thing.

--------------------------------------------------------------------------------

On 2020-04-28T15:43:20Z, dockimbel, commented:
<https://github.com/red/red/issues/4410#issuecomment-620687102>

    Using `do` I get:
    ```
    0.0 ms	[attempt [do %0.red]]
    0.0 ms	[attempt [do %1.red]]
    0.0 ms	[attempt [do %2.red]]
    1.00 ms	[attempt [do %3.red]]
    5.00 ms	[attempt [do %4.red]]
    ```
    
    I can reproduce the lagging using a freshly compiled CLI console from `fast-lexer` branch, launched from shell:
    ```
    > console tests/3.red
    ```

--------------------------------------------------------------------------------

On 2020-04-28T17:45:13Z, dockimbel, commented:
<https://github.com/red/red/issues/4410#issuecomment-620756693>

    This case was an interesting Parse pitfall. Before the fix, the console script loading code was using a rule for finding the `Red` header before loading the argument script using the following pattern:
    ```
    some [to "Red" ... | skip]
    ```
    This is used to pass through invalid "Red" patterns until the right one is found or the input end is reached. But in the worse case, the whole input file is parsed in O(n^2) (even O(n^3) if the `"Red"` header is not included), as `to` is already a linear search that fails and backtracks for every character in the input, leaving it to `skip` to advance, and ultimately resulting in big slowdowns.
    
    The fix just consists in removing `to` and leaving `skip` only for input advancement when no match is found (resulting in a O(n) search).
    
    
    

--------------------------------------------------------------------------------

On 2020-04-28T17:46:09Z, dockimbel, commented:
<https://github.com/red/red/issues/4410#issuecomment-620757182>

    Note: the fix commit is in `fast-lexer` branch.

