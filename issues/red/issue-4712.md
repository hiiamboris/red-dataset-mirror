
#4712: write/info on url crashing when compiled
================================================================================
Issue is closed, was reported by loziniak and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4712>

([Gitter red/bugs report](https://gitter.im/red/bugs?at=5f9fe5ae8a236947ba7dbc58))

I get some strange results when compiling script with `write/info` under **Linux**, using latest build (`red-02nov20-3147cac13 -c -d write_test.red`, compilation with `-r` always gives same results). When I compile this:

```
probe 7
write/info https://google.pl/ [GET]
```
the result is:
```
./write_test                                        
7

*** Runtime Error 1: access violation
*** at: F7E537D1h
```
But when compiling this:
```
write/info https://google.pl/ [GET]
```
i get:
```
./write_test                                        
*** Access Error: invalid UTF-8 encoding: #{EA706E61}
*** Where: write
*** Stack:
```
Sometimes also when I change url, results change. For example compiling this:
```
write/info https://quitter.pl/ [GET]
```
results in clean run:
```
./write_test
```
Generally the behaviour is very erratic.

When running with interpreter, I get no errors in any case.

**Platform version**
```
$ red-02nov20-3147cac13 
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> about
Red 0.6.4 for Linux built 2-Nov-2020/8:10:44+01:00 commit #3147cac
```



