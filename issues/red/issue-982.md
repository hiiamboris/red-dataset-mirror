
#982: Unicode crashes Android.
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/982>

In code based on eval.red, the following line crashes the app:

```
java-do [x/setText {Χαῖρε, κόσμε!}]
```

Where `x` is a TextView or EditText, and `{Χαῖρε, κόσμε!}` is an example of a string containing non-ASCII characters. The encoding of the source code is UTF-8.

Likewise, in code based on vid.red, any one of the following lines crashes the app:

```
text {Χαῖρε, κόσμε!}
field {Χαῖρε, κόσμε!}
button {Χαῖρε, κόσμε!}
check {Χαῖρε, κόσμε!}
```

Also, although the user can enter non-ASCII unicode text into an EditText, Red doesn't seem to be able to handle it or copy it to another TextView. Examples:
If the user submits `{Χαῖρε, κόσμε!}` in eval, it outputs a single `=` and no delimiter_, instead of the expected `== "Χαῖρε, κόσμε!"` with a delimiter_.
Example submitted 3 times:

```
{Χαῖρε, κόσμε!}
```

Expected:

```
== "Χαῖρε, κόσμε!"
== "Χαῖρε, κόσμε!"
== "Χαῖρε, κόσμε!"
```

Result:

```
===
```

If the user submits `length? {Χαῖρε, κόσμε!}` in eval, it crashes.

So far, I've only tested to confirm these issues apply to both Hebrew and Greek, text but I assume they are true for any text which includes non-ASCII characters.

Same results when tested on:
Android 2.3.4 on a Sony Ericsson Xperia Mini Pro (SK17i).
Android x86 4.4-r1 in VirtualBox in Windows XP.

*For some reason, eval delimits consequtive outputs with 2 spaces when running on the Xperia, but with new-lines (which I assume is expected) when running in VirtualBox.
Example submitted 3 times:

```
{Hello, World!}
```

Xperia:

```
== "Hello, World!"  == "Hello, World!"  == "Hello, World!"
```

VirtualBox:

```
== "Hello, World!"
== "Hello, World!"
== "Hello, World!"
```



Comments:
--------------------------------------------------------------------------------

On 2014-11-11T07:47:25Z, dockimbel, commented:
<https://github.com/red/red/issues/982#issuecomment-62512850>

    Thank you for your deep testing. IIRC, we are missing some encoding/decoding routines for dealing with Java strings, the current support in the bridge is very limited.

--------------------------------------------------------------------------------

On 2019-08-28T14:08:05Z, dockimbel, commented:
<https://github.com/red/red/issues/982#issuecomment-525762055>

    I am closing those Android-related tickets, as the Android support has been deeply changed since then, and the old Android API binding code replaced.

