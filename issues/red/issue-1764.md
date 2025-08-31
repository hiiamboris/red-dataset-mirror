
#1764: Console crashes when using `ll` or `ls` or `dir` with a number or a word symbol as argument.
================================================================================
Issue is closed, was reported by ghost and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1764>

```
red>> ll 'a
```

or

```
red>> ll 1
```

or

```
red>> ls 1
```

or

```
red>> ls 'a
```

or

```
red>> dir 1
```

or

```
red>> dir 'd
```

Gives -

```
*** Error: arguments stack overflow!


*** Runtime Error 1: access violation
*** at: 0042C8C9h
```



