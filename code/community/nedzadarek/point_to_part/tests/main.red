Red [
  author: "Nędza Darek"
  license: %license.md
]

do %_helpers.red
do %../main.red

arr: [1 2 3 4 5 6]
skip-value: 1
length-value: 3
rea: point-to-part arr skip-value length-value

print ">>>>> Creation: "
assert 1 [rea/skip-value]
assert 3 [rea/length-value]
assert [1 2 3 4 5 6] [rea/origin]
assert [2 3 4] [rea/part]

print ">>>>> Origin change: "
rea/origin/2: 22
assert 1 [rea/skip-value]
assert 3 [rea/length-value]
assert [1 22 3 4 5 6] [rea/origin]
assert [22 3 4] [rea/part]

print ">>>>> Part change: "
rea/part/2: 33
assert 1 [rea/skip-value]
assert 3 [rea/length-value]
assert [1 22 33 4 5 6] [rea/origin]
assert [22 33 4] [rea/part]

print ">>>>>> Setting words: "
rea-arr: is [rea/origin]
assert [1 22 33 4 5 6] [rea-arr]
rea-part: is [rea/part]
assert [22 33 4] [rea-part]

print ">>>>>> Changing words: "
rea-arr/4: 44
assert [1 22 33 44 5 6] [rea-arr]
assert [1 22 33 44 5 6] [rea/origin]
rea-part/1: 2222
assert [2222 33 44] [rea-part]
assert [2222 33 44] [rea/part]

print ">>>>>> Setting words to the new value: "
part1: is [rea/part]
part1: set-part [0 1 0]
assert [0 1 0] [rea-part]
assert [0 1 0] [rea/part]
assert [1 0 1 0 5 6] [rea/origin ]
