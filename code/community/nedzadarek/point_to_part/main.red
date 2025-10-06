Red [
  author: "Nędza Darek"
  license: %license.md
]
point-to-part: func [
  _origin [series!]
  _skip-value [integer!]
  _length-value [integer!]
  /local rea
][
  rea: make deep-reactor! [
    skip-value: _skip-value
    length-value: _length-value
    origin: _origin

    part: is [
      copy/part (skip origin skip-value) length-value
    ]
    react/later [
      remove/part (skip self/origin self/skip-value) self/length-value
      insert (skip self/origin self/skip-value) self/part
      self/length-value: length? self/part
      self/origin: head self/origin
    ]
  ]

  return rea
]
set-part: make op! func [
  word
  block [series!]
  /local
][
  reaction: first react?/target system/words to-word word
  set reaction block
]
