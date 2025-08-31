
#1882: Using insert,remove and collect/keep extensions with Parse function gives erroneous result 
================================================================================
Issue is closed, was reported by Zamlox and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1882>

```
red>> a: "X"
== "X"
red>> digit: charset "0123456789"
== make bitset! #{000000000000FFC0}
red>> content: "a&&1&&2&&3m"
== "a&&1&&2&&3m"
red>>  block: copy [] parse content [collect into block any [remove keep ["&&" some digit] (probe head block) insert (a) | skip]]
["&&1"]
["&&1"]
["&&1"]
== true
red>> content
== {aXX^G^@^@^@^@^@^@^@d+?^@^@^@^@^@X^G^@^@^@^@^@^@^@d+?^@^@^@^@^@^G^@^@^@^@^@^@^@X+?^@^@^@^@^@m}
```

Also the content of 'head block' displayed is not correct. it should be:

```
["&&1"]
["&&1" "&&2"]
["&&1" "&&2" "&&3"]
```



