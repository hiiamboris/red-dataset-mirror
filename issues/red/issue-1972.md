
#1972: Red speed of this script is far below Rebol
================================================================================
Issue is closed, was reported by vdsfr and has 10 comment(s).
<https://github.com/red/red/issues/1972>

```
 Red [ ]
; rebol[]
;
; subject: execution time Red
; Question: Why is Red so slow
;
; note: It's not about how to improve the code
;
;; execution times
;  rebol:     3   seconds
;  red:      13   seconds 
;  compiled: 10   seconds

p-mod: func [
  ;  title: "Compute a nonnegative remainder of A divided by B."
  ;  [catch]
    a [number!  ]
    b [number!   ] "Must be nonzero."
    /local r
][
    all [negative? r: a // b r: r + b]
   ; a: abs a
    a: load skip p-to-string a
    either all [a + r = (a + b) positive? r + r - b] [r - b] [r]
]

;--
p-to-integer: func [value][to integer! :value]
;--
p-to-string: func [value][to string! :value]
;--
 p-rejoin: func [
    block [block!] "Values to reduce and join"
   ][
    if empty? block: reduce block [return block]
    append either series? first block [copy first block] [
        form first block
    ] next block
]
;--
 add-digs: func [digs [block!]][
     out-digs: copy []

     ; convert to integer
     nbrs: ""
     foreach dig digs [  
          nbrs:  p-rejoin [nbrs dig]
      ]
      ; increment
      int-nbr: p-to-integer nbrs
      int-nbr: int-nbr + 1
      if (p-mod int-nbr 10) = 0 [int-nbr: int-nbr + 1]

      ; convert back to block
      foreach el p-to-string int-nbr [
          append out-digs p-to-integer ( el - 48)
      ]
    out-digs
]
digs: [ 1 2 3 4 5]
loop 87654 [
    digs: add-digs digs
]
print mold digs
 halt
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-05T12:08:26Z, dockimbel, commented:
<https://github.com/red/red/issues/1972#issuecomment-223809663>

    First of all, I rewrote the title of your ticket as you are _wrongly_ drawing a general conclusion from _one very specific_ test. I warn people against micro-benchmarking especially because of that.
    
    You Red code above is slower than Rebol because it relies on `load` which implementation in Red is currently done at high-level (for simplicity and flexibility), while Rebol's implementation is done at low-level using a very optimized algorithm. Remove that dependency, and you'll see your Red code perform the same or faster than Rebol. (`to` is not officially supported in Red, the current implementation is partial and relies on `load` internally).
    
    We will provide in the future an alternative `load` implementation that will perform at the same speed as Rebol's one. In the meantime, don't use it in any intensive loading task (like loading millions of values) or in any benchmark.
    
    Also remember that this is just version 0.6.0 of Red, optimizing execution speed is not the current concern, we will improve it for 1.0, though the optimization layers will come only with 2.0.

--------------------------------------------------------------------------------

On 2016-06-05T12:45:44Z, vdsfr, commented:
<https://github.com/red/red/issues/1972#issuecomment-223811156>

    commented out the line (see below)  to avoid 'load.
    The compiled version execution time went from 13 to 7 seconds.
    I suppose that there are one or more high-level implementations involved  that will be improved over time?
    
    if (p-mod int-nbr 10) = 0 [int-nbr: int-nbr + 1]

--------------------------------------------------------------------------------

On 2016-06-05T15:07:45Z, dockimbel, commented:
<https://github.com/red/red/issues/1972#issuecomment-223818253>

    `to integer!` is calling `load` internally.
    
    `negative?`, `positive?`, `series?`, `first` are, for now, defined as mezzanine functions in Red, while they are natives in Rebol (difference in speed is big between mezz and natives).
    
    I will post a version of your code tomorrow, replacing all those functions by native equivalents, so that the test is more fair. 

--------------------------------------------------------------------------------

On 2016-06-06T08:59:54Z, dockimbel, commented:
<https://github.com/red/red/issues/1972#issuecomment-223903970>

    The following code replaces the mezzanines with alternative native functions (though still not as good as making the mezzanines native):
    
    ```
     Red [ ]
     rebol[]
    ;
    ; subject: execution time Red
    ; Question: Why is Red so slow
    ;
    ; note: It's not about how to improve the code
    ;
    ;; execution times
    ;  rebol:     3   seconds
    ;  red:      13   seconds 
    ;  compiled: 10   seconds
    
    to-integer: func [s][
        either string! = type? s [
            system/lexer/make-number s tail s integer!
        ][
            0 + s               ;-- char! case
        ]
    ]
    
    p-mod: func [
      ;  title: "Compute a nonnegative remainder of A divided by B."
      ;  [catch]
        a [number!  ]
        b [number!   ] "Must be nonzero."
        /local r
    ][
        all [(r: a // b) < 0 r: r + b]
        a: absolute a
        ;a: load skip p-to-string a
        either all [a + r = (a + b) r + r - b > 0] [r - b] [r]
    ]
    
    ;--
    p-to-integer: func [value][to-integer :value]
    ;p-to-integer: func [value][to integer! :value]
    ;--
    p-to-string: func [value][to string! :value]
    ;--
     p-rejoin: func [
        block [block!] "Values to reduce and join"
       ][
        if empty? block: reduce block [return block]
        append either series! = type? pick block 1 [copy pick block 1] [
            form pick block 1
        ] next block
    ]
    ;--
     add-digs: func [digs [block!]][
         out-digs: copy []
    
         ; convert to integer
         nbrs: ""
         foreach dig digs [  
              nbrs:  p-rejoin [nbrs dig]
          ]
          ; increment
          int-nbr: p-to-integer nbrs
          int-nbr: int-nbr + 1
          if (p-mod int-nbr 10) = 0 [int-nbr: int-nbr + 1]
    
          ; convert back to block
          foreach el p-to-string int-nbr [
              append out-digs p-to-integer ( el - 48)
          ]
        out-digs
    ]
    digs: [ 1 2 3 4 5]
    loop 87654 [
        digs: add-digs digs
    ]
    print mold digs
     halt
    ```
    
    It performs as well as Rebol here.

--------------------------------------------------------------------------------

On 2016-06-06T09:03:15Z, dockimbel, commented:
<https://github.com/red/red/issues/1972#issuecomment-223904676>

    I'm closing this ticket as it's anyway irrevelant for now. Performance tuning should be done in 0.9.x releases, while full optimization will be implemented in 2.0.
    
    Also, before 1.0, we plan to provide an alternative code generator for Red that will offer some significant speed gains (though, that's all I can disclose for now).

