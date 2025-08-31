
#2274: change action corrupt string
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2274>

```
str: "我ab/cd"
rule: [
    any [ change #"^H"        "\b"
        | change #"^(0C)"    "\f"
        | change #"^/"        "\n"
        | change #"/"        "-"
        | skip
    ]
]
parse str rule
probe str
== "我ab-搀^@"
```



