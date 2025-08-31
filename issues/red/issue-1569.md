
#1569: Multiline paren! and map! in console
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/1569>

As in Rebol, the following can be entered into the console over multiple lines:

```
red>> [ab
[    cd]
== [ab cd]
```

```
red>> {ab
{    cd}
== "ab^/cd"
```

```
red>> #{ab
{    cd}
== #{ABCD}
```

Unfortunately, parenthesis don't yet work this way (unless they're wrapped in a block):

```
red>> (ab
*** Syntax error: missing ) at (ab
*** Where: do
```

This is particularly regrettable for `map!` which is more likely to be broken into multiple lines, and whose molded form spans multiple lines by default:

```
red>> #(a b c d e f g h i j)
== #(
    a: b
    c: d
    e: f
    g: h
    i: j
)
red>> #(
*** Syntax error: invalid issue! at #(
*** Where: do
```



