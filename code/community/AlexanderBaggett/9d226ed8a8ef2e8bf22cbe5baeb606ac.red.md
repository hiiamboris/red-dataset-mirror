# 

**Gist ID:** 9d226ed8a8ef2e8bf22cbe5baeb606ac
**Created:** 2017-05-19T19:27:39Z
**Last updated:** 2017-05-19T19:27:40Z

## File: `Printhelpfunctions.red`

```Red
Red []

get-api-data: function [][
    collect/into [
        foreach w sort words-of system/words [
            if all [word? w any-function? get/any :w][
                a: ""
                append a "-------------"
                append a newline
                append a w
                append a newline
                append a fetch-help w
                append a newline 
                append a "-------------"
                append a newline 
                keep a
            ]
        ]
    ] copy ""
]
write %api_data.txt get-api-data
```

## Comments

No comments.
