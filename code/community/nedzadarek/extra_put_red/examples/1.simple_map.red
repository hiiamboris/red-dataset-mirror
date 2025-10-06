Red [
  info: "see main folder"
]
do %../extra_put.red ; import `extra` function

; `extra` takes view's block and the `extra` changes it
view/no-wait extra[
  b: base red
  ; we will make `extra` non empty; `extra` is built-in
  extra #(
    val: 100
  )
  ; `extra-put` will add key `a` and value `42`
  extra-put #(
    a: 42
  )
]
print ["b/extra: " newline b/extra]
