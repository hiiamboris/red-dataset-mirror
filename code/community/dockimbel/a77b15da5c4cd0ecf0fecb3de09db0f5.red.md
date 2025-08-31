# Simple linked text widgets using reactive framework

**Gist ID:** a77b15da5c4cd0ecf0fecb3de09db0f5
**Created:** 2016-07-05T06:06:47Z
**Last updated:** 2016-08-05T17:35:31Z

## File: `secret-field.red`

```Red
Red []

cur-rec: object [
    name: none
    secret: none
]

view [
    text "Name" f-name: field "" return
    text "Secret" f-secret: text "" 400 font-size 7 return
    react [
      ;-- f-secret/text string is referenced by cur-rec/secret, so we need to avoid replacing it
    	clear f-secret/text
    	append f-secret/text enbase/base (checksum f-name/text 'sha256) 16
    ]
    do [
    	cur-rec/name: f-name/text
    	cur-rec/secret: f-secret/text
    ]
]


```

## Comments

No comments.
