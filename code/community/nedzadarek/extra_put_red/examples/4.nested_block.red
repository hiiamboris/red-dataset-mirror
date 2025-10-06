Red [
  info: "see main folder"
]
do %../extra_put.red

; nesting works with the `block!` too
view/no-wait extra[
  b: base red  extra [eee 111] extra-put [a 42]
  p: panel [base blue base yellow]
  p: panel [b2: base purple extra-put [answer 42]]
]
print ["b/extra: " b/extra]
print ["b2/extra: " b2/extra]
