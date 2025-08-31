
#2865: ROUND/TO not working correctly on some time! values
================================================================================
Issue is closed, was reported by dockimbel and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2865>

Observed:
```
>> round/to to-time 1499276522.274 .001
== 416465:42:02.27399987
```
Expected:
```
== 416465:42:02.274
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-10T09:44:20Z, qtxie, commented:
<https://github.com/red/red/issues/2865#issuecomment-314057804>

    I think we need to change the internal data structure of time! in order to fix this kind of issue.
    ```
    Red/System []
    
    #define GET_SECONDS(time) (time / 1e9 // 60.0)
    	
    a: 1.499276522274e+018
    
    t1: 2.273999872035347
    t2: 2.274
    
    probe GET_SECONDS(a)			;-- print second
    
    a1: (a / 1e9 - t1) * 1e9		;-- remove second from time
    probe GET_SECONDS(a1)
    
    a2: (a1 / 1e9 + t2) * 1e9		;-- add new second
    probe GET_SECONDS(a2)
    
    probe a = a2				;-- ??
    ```
    
    Output:
    ```
    2.273999872035347
    0.0
    2.273999872035347
    true
    ```

--------------------------------------------------------------------------------

On 2017-07-11T01:39:10Z, x8x, commented:
<https://github.com/red/red/issues/2865#issuecomment-314297894>

    Not sure it's related ;-)
    ```
      1-Jan-1970 + to-time 1499736590.785912
    ;   11-Jul-2017/1:29:50.7859121
    ```

--------------------------------------------------------------------------------

On 2017-07-11T11:49:29Z, x8x, commented:
<https://github.com/red/red/issues/2865#issuecomment-314419336>

    this is off by 1 second:
    ```
      to integer! 5-Jul-2017/23:59:59.999999
    ;   1499299199
      ```

