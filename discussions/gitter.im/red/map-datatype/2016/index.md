# Archived messages from: [gitter.im/red/red/map-datatype](/gitter.im/red/red/map-datatype/) from year: 2016

## Saturday 13th February, 2016

rebolek

[06:27](#msg56beccc61fbcdac17897e2e6)

```
collect [foreach v [1 2 3 4 5] [keep v + 1]]
```

[06:28](#msg56beccf44dfe1fa71ffc803b)Let’s hope mapeach will get implemented soon, so you can write `mapeach v [1 2 3 4 5] [v + 1]`

[06:43](#msg56bed08c0295dc53403df612)Oh sorry, wrong group!

## Tuesday 20th September, 2016

rebolek

[14:57](#msg57e14e52c6200b334093a255)Is this expected behavior for map! comparison?

```
red>> equal? #(a 1 A 2) #(a 1 A 2)
== false
red>> strict-equal? #(a 1 A 2) #(a 1 A 2)
== true
```

[14:59](#msg57e14ec9eb59cb592abddd65)I understand that `equal?` is case-insensitive and `strict-equal?` case-sensitive:

```
red>> equal? #(a 1) #(A 1)
== true
red>> strict-equal? #(a 1) #(A 1)
== false
```

[15:00](#msg57e14ef714a554de7e8dcb01)But comparing two \*\*same\** case-sensitive maps with `equal?` should return `true` IMO.

greggirwin

[15:45](#msg57e15992c3e7045a30655ef1)It looks like a bug to me, having to do with duplicate keys that differ only by case.

```
red>> equal? #(a 1 B 2) #(a 1 B 2)
== true
```

rebolek

[15:46](#msg57e159ba14a554de7e8dccc0)I report it and we’ll see ;)

[16:24](#msg57e162a2c2287b924ff73abe)@greggirwin can you please check something for me?

greggirwin

[16:24](#msg57e162b5c3e7045a306587c4)Sure.

rebolek

[16:24](#msg57e162c1c2287b924ff73ac3)This is with gui-console built from latest source:

```
red>> m: #(a 1 b 2)
== #(
    a: 1
    b: 2
)
red>> keys-of m 
== [a b]
red>> m/a: none
== none
red>> keys-of m 
== []
```

[16:24](#msg57e162dac2287b924ff73ac5)I want to be sure there’s no problem with my setup before reporting.

[16:25](#msg57e1630fa3c0cb1b6a21bfef)btw:

```
red>> m
== #(
    b: 2
)
```

greggirwin

[16:26](#msg57e16322df21a75730124105)Confirmed. Interesting. I noted that `b` is still in `m` as well.

rebolek

[16:26](#msg57e1632ed66f1a7967e1e804)Thanks.

greggirwin

[16:27](#msg57e1636433c63ba01a1aae97)

```
red>> m: #(a 1 b 2)
== #(
    a: 1
    b: 2
)
red>> m/b: none
== none
red>> m
== #(
    a: 1
)
red>> keys-of m
== [a]
```

rebolek

[16:27](#msg57e16376a3c0cb1b6a21bff2)Interesting.

greggirwin

[16:28](#msg57e163a0aabc89857fba78b4)Seems to clear to the tail.

```
red>> m: #(a 1 b 2 c 3)
== #(
    a: 1
    b: 2
    c: 3
)
red>> m/b: none
== none
red>> m
== #(
    a: 1
    c: 3
)
red>> keys-of m
== [a]
```

rebolek

[16:29](#msg57e163e1c2287b924ff73aff)Thanks, this will help to locate the bug easier, I believe.

greggirwin

[16:29](#msg57e163fd27a8458f7f2eed90)Ah, not that simple either.

```
red>> m: #(a 1 b 2 c 3 d 4)
== #(
    a: 1
    b: 2
    c: 3
    d: 4
)
red>> m/b: none
== none
red>> keys-of m
== [a c]
```

[16:31](#msg57e1644cc3e7045a30658d71)Clears back 1 from the tail?

```
red>> m: #(a 1 b 2 c 3 d 4 e 5)
== #(
    a: 1
    b: 2
    c: 3
    d: 4
    e: 5
)
red>> m/b: none
== none
red>> keys-of m
== [a c d]
```

rebolek

[16:31](#msg57e16466d66f1a7967e1e818)

```
red>> m: #(a 1 b 2 c 3 d 4 e 5 f 6)
== #(
    a: 1
    b: 2
    c: 3
    d: 4
    e: 5
    f: 6
)
red>> m/b: none
== none
red>> keys-of m
== [a c d e]
```

It removes all even keys, IMO.

[16:31](#msg57e16477d66f1a7967e1e81a)No, wrong, `d` is there.

[16:33](#msg57e164c6c2287b924ff73b17)So the last key it seems.

[16:36](#msg57e16587d66f1a7967e1e84f)https://github.com/red/red/issues/2234

greggirwin

[16:38](#msg57e165f3c8af41d45f2fd25c)Looks good.

rebolek

[16:38](#msg57e165fdc2287b924ff73b47)Thanks for help.
