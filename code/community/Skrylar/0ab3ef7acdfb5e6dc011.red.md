# 

**Gist ID:** 0ab3ef7acdfb5e6dc011
**Created:** 2015-11-24T05:41:13Z
**Last updated:** 2015-11-24T08:01:07Z

## File: `genalg.red`

```Red
Red []

random/seed 1337

; produces a series of chromosomes within [0, dna] of each supplied maximum
make-dna-strand: func[dna
   /local dna-length result][
   dna-length: length? dna
   result: make block! dna-length
   foreach chromosome dna [
      append result random chromosome
   ]
   return result
]

make-population: func[dna size
   /local dna-length result][
   result: make block! size
   repeat strand size [
      append/only result make-dna-strand dna
   ]
   return result
]

score-population: func[population score
   /local result][
   result: make block! (length? population) * 2
   foreach strand population [
      append result score strand
      append/only result strand
   ]
   return result
]

score-strand: func[dna][
   return (first dna) * (second dna) * (third dna) * (fourth dna)
]

; mutate X number of chromosomes
cgp-mutation: func[dna strand mutations
   /local mutation chrom][
   repeat mutation mutations [
      chrom: random length? dna
      poke strand chrom random pick dna chrom
   ]
   return strand
]

; make `children` copies of `strand` parent, then mutate children
cgp-breed-and-mutate: func[dna strand children
   /local strands result][
   strands: (length? dna) + 1
   result: make block! strands
   append/only result strand
   repeat child children [
      append/only result cgp-mutation dna copy/deep strand 1
   ]
   return result
]

; best result found so far
best-score: 0
best: []

; using laplace's method of succession, until we are 95% confident a
; better solution cannot be found; probably not the optimal mechanism,
; but its easy!
successes: 0.0
trials: 0.0
p: 0.0

; create parameters and initial population
dna: [5 10 30 40]
population: make-population dna 5

until [
   population: score-population population :score-strand
   sort/reverse/skip population 2
   if (first population) > best-score [
      best-score: first population
      best: second population
      prin "Best score: "
      prin best-score
      prin " Best genes: "
      probe best
      successes: successes + 1.0
   ]
   trials: trials + 1.0
   p: ((1.0 + successes) / (2.0 + trials))
   ;probe population
   population: cgp-breed-and-mutate dna second population 4
   ; print information about BUTTS
   prin "-- Generation "
   prin trials
   print " complete."
   ; stop when we are 95% certain there will not be a better solution
   p < 0.05
]

```

## Comments

No comments.
