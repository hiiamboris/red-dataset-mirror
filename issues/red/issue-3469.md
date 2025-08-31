
#3469: RANDOM doesn't use date part of date! seeds
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
<https://github.com/red/red/issues/3469>

See #3252 and https://github.com/red/red/commit/0cedc0175e7c1c06c6f7eb0afde311ac0619881b#r29708454

### Expected behavior

Random values should be different for different date values even if the time part of the date is same:

```
d1: 2018-01-01/01:02:03
d2: 2018-02-02/01:02:03
r1: random/seed d1 random 100
r2: random/seed d2 random 100

r1 <> r2 ; generally
```

### Actual behavior

```
d1: 2018-01-01/01:02:03
d2: 2018-02-02/01:02:03
r1: random/seed d1 random 100
r2: random/seed d2 random 100

r1 = r2 ;always
```

### Steps to reproduce the problem

Execute code above.

### Red and platform version
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.1 ahead: 2947 date: 12-Jul-2018/9:38:02 commit: #503728e44084936c3c9f73cb4d704481e0c3d3a1 ]
PLATFORM: [ name: "Windows 8" OS: 'Windows arch: 'x86-64 version: 6.2.0 build: 9200 ]
```


