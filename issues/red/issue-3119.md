
#3119: Problems of random number in compiled program
================================================================================
Issue is closed, was reported by harry75369 and has 10 comment(s).
<https://github.com/red/red/issues/3119>

When you compile the following program and execute it 100 times, it will print random numbers very close to each other.
```
Red []

random/seed (to integer! now)
print (random 1.0)
```

Compile and run:
```
red-063 -c test.r
for i in `seq 100`; do ./test; done
```

Get:
```
0.2441021847744017
0.2441021847744017
0.2460552580869083
0.2460552580869083
0.2460552580869083
0.2460552580869083
0.2460552580869083
0.2460552580869083
0.2362289187667095
0.2362289187667095
0.2362289187667095
0.2362289187667095
...
```

Expected: more randomized output

Version: Red 0.6.3, Mac



Comments:
--------------------------------------------------------------------------------

On 2017-11-27T12:42:45Z, meijeru, commented:
<https://github.com/red/red/issues/3119#issuecomment-347170846>

    Isn't this because each subsequent value of the seed (`to integer! now`) is close to the previous one? Your test consists of re-starting the program 100 times, instead of executing the call to `random`, without the `seed`, a100 times.

--------------------------------------------------------------------------------

On 2017-11-27T17:09:26Z, greggirwin, commented:
<https://github.com/red/red/issues/3119#issuecomment-347251908>

    This is based on an old Rebol version:
    ```
    randomize: func [
    	"Reseed the random number generator."
    	/with seed "date, time, and integer values are used directly; others are converted."
    ][
    	random/seed either find [date! time! integer!] type?/word seed [seed] [
    		to-integer checksum form any [seed now/precise] 'sha1
    	]
    ]
    ```
    It was based on empirical research, but we have inside info now, into how Red works, so should be able to simplify it a bit I imagine.

--------------------------------------------------------------------------------

On 2017-11-27T20:42:55Z, rebolek, commented:
<https://github.com/red/red/issues/3119#issuecomment-347321550>

    @meijeru I think that random function that would give similar results for similar seed values would be very very bad and insecure random function.

--------------------------------------------------------------------------------

On 2017-11-28T09:27:55Z, meijeru, commented:
<https://github.com/red/red/issues/3119#issuecomment-347463712>

    I thought that was the idea of a seed isn't it? If you want a different result use a different seed. See also [this Wikipedia article](https://en.wikipedia.org/wiki/Random_seed). There is no implication that a minor difference in seed should give a large difference in first random number generated. On the contrary!

--------------------------------------------------------------------------------

On 2017-11-29T05:10:54Z, harry75369, commented:
<https://github.com/red/red/issues/3119#issuecomment-347754943>

    Similar behavior in C program. My mistake, sorry. Please close this issue, thanks.
    
    However, the random number generator does has potential problem. Please look into https://github.com/red/red/issues/3123

