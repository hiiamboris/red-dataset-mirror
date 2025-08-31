
#2068: If the length of a tuple > 8, passing it to a routine as a value of any-type! will corrupt its data
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2068>

The whole code is as following. It's a bit long. The problem started from the "append-item" routine. if the length of a tuple > 8, passing it to a routine as a value of any-type! will corrupt its data. such as 1.2.3.4.5.6.7.8.9.10 will be corrupted into 1.2.3.4.5.6.7.8.10.0 in my case. the last two elements are changed.

``` Red
Red [ ]

#system [
    item-file: "items.bin" 

    write-item: func [
        value [ Red-value! ]
        /local
            p4 [ int-ptr! ]
            dt [ integer! ]
            length [ integer! ]
    ] [
        p4: as int-ptr! value
        dt: p4/1 and 000000FFh
        length: p4/1 and 00780000h  ; for tuple!
        switch dt [
            TYPE_LOGIC
            TYPE_INTEGER
            TYPE_FLOAT [
                simple-io/write-file item-file as byte-ptr! value 16 true true false        
            ]

            TYPE_TUPLE [
                p4/1: p4/1 or length
                simple-io/write-file item-file as byte-ptr! value 16 true true false        
            ]

        ]
    ]   

    read-item: func [
        idx [ integer! ] 
        return: [ Red-value! ]
        /local
            file [integer!]
            buffer [ byte-ptr! ]
            p4     [ int-ptr! ]
    ] [
        file: simple-io/open-file item-file simple-io/RIO_READ false
        simple-io/seek-file file idx * 16
        buffer: allocate 16
        simple-io/read-buffer file buffer 20
        p4: as int-ptr! buffer
        simple-io/close-file file
        as red-value! buffer
    ]   

]

append-item: routine [
    value   [any-type!]
] [
    ; dump-hex4 as int-ptr! value 
    ; and find that the tuple data HAS BEEN CHANGED here. ********
    write-item value
]

read-item-at: routine [
    idx [integer!]
    return: [any-type!]
    /local ret
] [
    ret: read-item idx
    SET_RETURN(ret)
]

append-item 1.2.3.4.5.6.7.8.9.10

print [ "write 1.2.3.4.5.6.7.8.9.10 " ]
print [ "read " read-item-at 0 ]
```

After running the code, I got:

``` Red
write 1.2.3.4.5.6.7.8.9.10 
read 1.2.3.4.5.6.7.8.10.0
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-24T03:43:19Z, qtxie, commented:
<https://github.com/red/red/issues/2068#issuecomment-228251455>

    The compiler doesn't generate correct code for tuple!.
    
    ```
    Red []
    print 1.2.3.4.5.6.7.8.9.10                       ;@@ output: 1.2.3.4.5.6.7.8.10.0
    ```
    
    Another issue is that the interpreter support maximum 12 items  in tuple!, while the compiler only support 10.

--------------------------------------------------------------------------------

On 2016-08-31T05:10:28Z, rebolek, commented:
<https://github.com/red/red/issues/2068#issuecomment-243660057>

    Tested with latest sources and I can still see the problem:
    
    When you compile
    
    ```
    a: 1.2.3.4.5.6.7.8.9.10
    print a
    a: 1.2.3.4.5.6.7.8.9.10.11.12
    print a
    ```
    
    the output is:
    
    ```
    1.2.3.4.5.6.7.8.7.8
    1.2.3.4.5.6.7.8.9.10.11.12
    ```

