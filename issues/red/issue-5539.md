
#5539: [Linux, regression] Pasted into console text becomes messed up
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5539>

**Describe the bug**

I don't know how this works, but in previous versions of CLI console on Linux I could just right-click in the terminal to let it paste the content from the clipboard. With the new builds the text is intermixed with some garbage data, and it's nearly impossible to paste anything useful anymore:

<img width=400 src=https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/Utnifxg.png />

**To reproduce**

I don't get this behavior from console exe downloaded from the site, only from custom built.

Build the linux CLI console with `rebol -qs --do "do/args %red.r {-r -t linux environment\console\CLI\console.red}"`, then run it and try pasting some multiline text into it, e.g.:
```
print "AAA"
print "BBB"
print "CCC"
print "DDD"
```
Result is on the screenshot above.

**Expected behavior**

Correctly pasted text.

**Platform version**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.5 ahead: 186 date: 6-Sep-2024/10:31:12 commit: #f5c9214f6b545dc7aa7a551ac57851f86f8fd5ec ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.153 build: "#1 SMP Fri Mar 29 23:14:13 UTC 2024" ]
--------------------------------------------
```


