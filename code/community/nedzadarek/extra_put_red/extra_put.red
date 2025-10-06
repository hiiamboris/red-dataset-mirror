Red [
  title: "extra put"
  author: "Nędza Darek"
  license: %license.txt
]
extra: func [series /local m bl] [

  replace/all/deep series [
    'extra-put set m map!
  ] does [
    compose/deep [
      with [
        if none? extra [extra: copy make map! []]
        extend extra (m)
      ]
    ]
  ]

bls: copy []
  replace/all/deep series [
    'extra-put set bl block!
  ] does [
    compose/deep/only [
      with [
        if none? extra [extra: copy make block! []]
        append extra (bl)
      ]
    ]
  ]
  return series

]
