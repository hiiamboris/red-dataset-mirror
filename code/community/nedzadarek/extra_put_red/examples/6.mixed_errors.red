Red [
  info: "see main folder"
]
do %../extra_put.red

; you cannnot (at the mmoment) mix `block!` with the `map!` with one extra
layout  extra[b: base red  extra [eee 42] extra-put #(a: 42)] print ["b/extra: " b/extra "^/###"] ; mixed: block + map ; ERROR
layout  extra[b: base red  extra #(eee: 42) extra-put [a 42]] print ["b/extra: " b/extra "^/###"] ; mixed: map + block ; ERROR
