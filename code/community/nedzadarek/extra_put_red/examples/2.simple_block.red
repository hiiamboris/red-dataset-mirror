Red [
  info: "see main folder"
]
do %../extra_put.red

view/no-wait extra[
  b: base red
  extra [
    val 42
  ]
  ; we can modify block too
  extra-put [
    a 999
  ]
]


print ["b/extra: " newline b/extra]
