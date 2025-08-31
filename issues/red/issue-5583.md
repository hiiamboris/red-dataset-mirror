
#5583: Unlogical progression
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 14 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5583>

**Describe the bug**

Using a similar test than the previous one, I have removed `deep` from `copy` to not saturate the memory, reusing the same series. In only 50 rounds, the memory is totally eaten.

**To reproduce**
```
Run this code:

Print (stats / 1024)
x: copy []
y: copy []
append/only x y
append/only y x
z: reduce [x y] 
dt [
	loop 50 [
		append z/1/1/1 copy "hello"
		Print ["appended hello: " (stats / 1024)]

		append z/2/1/1 copy "world"
		Print ["appended world: " (stats / 1024)]

		append z copy z
		Print ["Copying Z: " (stats / 1024)]
	]
] 
Print (stats / 1024)
```

error:

```
2987.234375
appended hello:  2988.65625
appended world:  2988.96875
Copying Z:  2989.328125
appended hello:  2989.671875
appended world:  2990.015625
Copying Z:  2990.46875
appended hello:  2990.7265625
appended world:  2990.984375
Copying Z:  2991.625
appended hello:  2992.03125
appended world:  2992.4375
Copying Z:  2993.453125
appended hello:  2993.7109375
appended world:  2993.96875
Copying Z:  2995.734375
appended hello:  2995.9921875
appended world:  2996.25
Copying Z:  2999.515625
appended hello:  2999.7734375
appended world:  3000.03125
Copying Z:  3006.296875
appended hello:  3008.1171875
appended world:  3008.6484375
Copying Z:  3020.9140625
appended hello:  3021.171875
appended world:  3021.4296875
Copying Z:  3045.6953125
appended hello:  3045.953125
appended world:  3046.2109375
Copying Z:  3094.4765625
appended hello:  3094.734375
appended world:  3094.9921875
Copying Z:  3076.91796875
appended hello:  3077.17578125
appended world:  3077.43359375
Copying Z:  3205.1796875
appended hello:  3205.4375
appended world:  3205.6953125
Copying Z:  3589.9609375
appended hello:  3590.21875
appended world:  3590.4765625
Copying Z:  4358.7421875
appended hello:  4359
appended world:  4361.77734375
Copying Z:  4997.96484375
appended hello:  4998.74609375
appended world:  4999.52734375
Copying Z:  7046.7265625
appended hello:  7046.984375
appended world:  7047.2421875
Copying Z:  11142.98828125
appended hello:  11143.24609375
appended world:  11143.50390625
Copying Z:  19335.25
appended hello:  19335.5078125
appended world:  19335.765625
Copying Z:  35719.51171875
appended hello:  35719.76953125
appended world:  35720.02734375
Copying Z:  68487.7734375
appended hello:  68488.03125
appended world:  68488.2890625
Copying Z:  134024.03515625
appended hello:  134024.29296875
appended world:  134024.55078125
Copying Z:  265096.296875
appended hello:  265096.5546875
appended world:  265096.8125
Copying Z:  527240.55859375
appended hello:  527240.81640625
appended world:  527241.07421875
Copying Z:  1051528.8203125
appended hello:  1051529.078125
appended world:  1051529.3359375
Copying Z:  2100105.08203125
appended hello:  2100105.33984375
appended world:  2100105.69921875
*** Internal Error: not enough memory
*** Where: copy
*** Near : append z copy z Print ["Copying Z: " (stats)]
*** Stack: dt
```


**Platform version**
;-----------RED & PLATFORM VERSION----------- 
;RED: [ branch: "master" tag: #v0.6.5 ahead: 374 date: 10-Jan-2025/11:17:29 commit: #68f6dd532a4cd9c53fa68656805bc59390a6ab42 ]
;PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
;--------------------------------------------



Comments:
--------------------------------------------------------------------------------

On 2025-01-12T18:53:31Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5583#issuecomment-2585878406>

    Same error with strings, isong a simplified series and just 20 rounds:
    
    ```
    Print (stats / 1024)
    x: "a"
    y: "b"
    append/only x y
    append/only y x
    z: reduce [x y] 
    print dt [
    	loop 20 [
    		append z/1 rejoin ["hello" z/2]
    		append z/2 rejoin ["world" z/1]
    	]
    ] 
    ```

--------------------------------------------------------------------------------

On 2025-01-12T18:59:37Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5583#issuecomment-2585879983>

    Last check, with very simply series: appending contexts:
    
    ```
    Print (stats / 1024)
    x: context [a: 22 aa: none]
    y: context [b: 33 bb: none]
    
    x/aa: y
    y/bb: x
    x: reduce x y
    z: reduce [x y] 
    dt [
    	loop 15 [
    		append z reduce z
    		append z reduce z
    	]
    ] 
    ```
    
    Here 15 round are enough. 
    
    The cross reference of elements and series causes the system to escalate memory usage
    

--------------------------------------------------------------------------------

On 2025-01-12T19:52:20Z, dockimbel, commented:
<https://github.com/red/red/issues/5583#issuecomment-2585894962>

    ```
    >> x: copy []
    == []
    >> y: copy []
    == []
    >> append/only x y
    == [[]]
    >> append/only y x
    == [[[...]]]
    >> z: reduce [x y] 
    == [[[[...]]] [[[...]]]]
    >> append z/1/1/1 copy "hello"
    == [[[...]] "hello"]
    >> z
    == [[[[...]] "hello"] [[[...] "hello"]]]
    >> append z/2/1/1 copy "world"
    == [[[...] "hello"] "world"]
    >> append z copy z
    == [[[[...] "world"] "hello"] [[[...] "hello"] "world"] [[[...] "world"] "hello"] [[[...] "hello...
    ```
    
    I don't think your understand what you're doing there... You are saturating the memory by multiplying the amount of storage space by 4 at least on each loop...
    
    Please first post in red/bugs group and wait for approval there before posting a ticket here.

--------------------------------------------------------------------------------

On 2025-01-12T20:12:02Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5583#issuecomment-2585900568>

    
    Doc, please tale a look at the latest test. I takes just 15 rounds to saturate. It is really improbable it is caused from my code.
    
    EDIT: forget about this, it is double append, so the progression is at 30 and even 100 bytes take 50GB!

--------------------------------------------------------------------------------

On 2025-01-12T21:06:50Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5583#issuecomment-2585916601>

    About "knowing what I am doing". I am cross referencing the pointers to the series buffers on purpose but I admit I have made a matematical mistake: I have understimated to the power of progression and at 50th round, even doubling 100 bytes the results are huge:
    
    ![image](https://github.com/user-attachments/assets/302643a1-2bd4-414f-8b07-3fe441ae79ce)

--------------------------------------------------------------------------------

On 2025-01-12T21:12:57Z, dockimbel, commented:
<https://github.com/red/red/issues/5583#issuecomment-2585918360>

    > Doc, please tale a look at the latest test. I takes just 15 rounds to saturate. It is really improbable it is caused from my code.
    
    ```
    	loop 15 [
    		append z reduce z
    		append z reduce z
    	]
    ```
    
    On each loop, you are again multiplying the storage space by 4. So 4^15 = 1073741824, multiplied by the storage space used by `z` before entering the loop... QED

--------------------------------------------------------------------------------

On 2025-01-12T21:15:57Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5583#issuecomment-2585919238>

    I have now done my math as you can see in the previous messages. 
    
    I apologize again, I have understimated the progression, it is a long time I don't mentally calculate one! :-(
    

