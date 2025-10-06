Red [
  info: "see main folder"
]
do %../extra_put.red

; we can of course mix `block!` and `map!`  within one layout:
view/no-wait extra[
  b: base red  extra [eee 111] extra-put [a 42]
  b2: base red  extra #(fasd: 123) extra-put #(eqw: 1299)
]
print ["b/extra: " b/extra] 
print ["b2/extra: " b2/extra]
