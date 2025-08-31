# Cached functions with "series in the function" feature.

**Gist ID:** 4ce55ee8efc9ab5bfddecca764bf386d
**Created:** 2018-07-03T14:01:51Z
**Last updated:** 2018-07-03T14:34:23Z

## File: `cached-function.red`

```Red
Red [
  author: "Nędza Darek"
  license: {
    Just mention me/link to gist/github.
  }
  version: 0.0.1
]
; not cached:
long-fact: func [
  n 
  /local
][
  if n = 0 [return 1]
  wait 1
  n * long-fact (n - 1)
]
delta-time [long-fact 5]
; 0:00:05.059
delta-time [long-fact 5]
; 0:00:05.079

; cached:
long-fact-with-local: func [
  n 
  /local
  persistent
  value
][
  persistent: #()
  if n = 0 [return 1]
  either value: persistent/(to-string n) [
    return value
  ][
    wait 1
    persistent/(to-string n): n * long-fact-with-local (n - 1)
  ]
  
]
delta-time [long-fact-with-local 5]
; 0:00:05.069
delta-time [long-fact-with-local 5]
; 0:00:00


; cached with serializing cache to a word and clearing cache
long-fact-with-my-local: func [
  n 
  /return-cache
  /clear-cache
  /local
  value
  persistent
  /my-local
  persistent*
][
  persistent: #()
  if clear-cache [return clear persistent]
  if my-local [
    foreach key keys-of persistent* [
      persistent/:key: persistent*/:key
    ]
  ]
  if n = 0 [return 1]
  either value: persistent/(to-string n) [
    return value
  ][
    wait 1
    persistent/(to-string n): n * long-fact-with-my-local (n - 1)
  ]
  either return-cache [
    return persistent
  ][
    persistent/(to-string n)
  ]
]
persistent: #(
        "1" 1
        "2" 2
        "3" 6
        "4" 24
        "5" 120
        "6" 720
) 
delta-time [long-fact-with-my-local/my-local 5 persistent]
persistent: copy long-fact-with-my-local/return-cache 10
; clearing cache:
; just give random number `n` - it's not used:
long-fact-with-my-local/clear-cache 10

delta-time [long-fact-with-my-local/my-local 10 persistent]
; == 0:00:00
long-fact-with-my-local/my-local 10 persistent
; == 3628800
```

## Comments

### @nedzadarek on 2018-07-03T14:34:23Z

As noted by Rebolek: https://gitter.im/red/help?at=5b3b88459b82c6701b9ee3ad
I don't need to convert keys to strings. 


