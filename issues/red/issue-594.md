
#594: PARSE's END does not stop evaluation
================================================================================
Issue is closed, was reported by kealist and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/594>

In the example below, I believe there is a bug in how PARSE handles END.  The code in parenthesis should not be evaluated unless it is at the end of the input.

```
letter: charset [#"a" - #"z" #"A" - #"Z"]

rule: [
    some [
        "end" end (print "end")|
        letter
    ]
]

print parse "blahendslkjsfdend" rule
```

Results in:

```
end
end
true
```

In Rebol 2, the result is:

```
end
true
```

Red's PARSE-TRACE shows this:

```
  match: [["end" end (print "end") | letter]]
  input: "endslkjsfdend"
  -->
    match: ["end" end (print "end") | letter]
    input: "endslkjsfdend"
    ==> matched
    match: [end (print "end") | letter]
    input: "slkjsfdend"
    ==> not matched
    match: [(print "end") | letter]
    input: "slkjsfdend"
end
    match: [letter]
    input: "endslkjsfdend"
    ==> matched
```



Comments:
--------------------------------------------------------------------------------

On 2013-12-05T11:26:17Z, dockimbel, commented:
<https://github.com/red/red/issues/594#issuecomment-29890183>

    Good catch!

