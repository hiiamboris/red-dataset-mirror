# 

**Gist ID:** 90ac7ff36cc570b8b3b3d68bf1fbdc6e
**Created:** 2017-12-09T12:54:09Z
**Last updated:** 2017-12-09T13:12:45Z

## File: `d82017AoC.red`

```Red
Red []
;data: load %day8.input ; real data
data: [b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10]

regs: copy [] m: 0 !=: :<>
inc: func ['value step][set value (get value) + step]
dec: func ['value step][set value (get value) - step]
task1: yes ; test task1 answer: 1 task2 answer: 10
until [
	prg: take/part data 3
	unless find regs prg/1 [append regs prg/1 set prg/1 0]
	move prg next prg
	unless task1 [append prg compose [m: max m (prg/2)]] 
	data: insert/only skip data 4 prg
	tail? data
] do head data
either task1 [
	sort/compare regs func [a b][(get a) > (get b)]
	probe reduce [first regs get first regs]
][m]

```

## Comments

No comments.
