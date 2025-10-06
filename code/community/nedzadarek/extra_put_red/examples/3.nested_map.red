Red [
  info: "see main folder"
]
do %../extra_put.red

; we can use `extra-put` in nested blocks
view/no-wait extra[
  b: base red  extra #(fff: 100) extra-put #(a: 42)
  p: panel [base blue base yellow]
  ; like this:
  p: panel [b2: base purple extra-put #(answer: 42)]
]
print ["b/extra: " b/extra]
print "####"
print ["b2/extra: " b2/extra]
