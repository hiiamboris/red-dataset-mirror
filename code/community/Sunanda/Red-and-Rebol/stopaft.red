Rebol []
;; Red []   ;; <--- May need to be uncommented for Red

;;    Author: Sunanda
;;    Version: 0.0.4 November 2023
;;    Tested: R2, R3, Red -- seems to work with all three

;; ===========================================
;; Define options and global control structure
;; ===========================================
stopaft: make object! [

expression-cache: copy []
active?: true
language: none
        
          ;; cache the system 'DO native:
sysdo: either none?  get/any in system 'words [
           language: 'R3
           get in system/contexts/lib 'do     ;; R3
         ][
           language: either object? system/build ['Red]['R2]
           get in system/words 'do            ;; R2 and Red
         ]

;;  ==========
    do: func [
;;  ==========
    threshold [integer! pair!]
    expression [block!]
    /local
    counter
    cache-ptr
    expo
    rec
    mrec
][
    if not active? [exit]  ;; We're a NO-OPERATION today

    



    ;; Sanitize threshold value (negatives --> 0)
	;; ------------------------------------------
	
    if integer? threshold [threshold: to-pair reduce [1 threshold]]
    threshold: max threshold 0x0
    threshold/2: threshold/1 + threshold/2 - 1

    
	;; Find existing expression in cache
    ;; ---------------------------------

    counter: none
    mrec: none  ;; matched expresssion rec
    foreach rec expression-cache [
        if same? expression rec/cached-expression [mrec: rec break]
    ]


    ;; New expression? cache it
    ;; ------------------------

    if none? mrec [
        mrec: make object! compose/deep [
            threshold: (threshold)
            cached-expression: expression
            hits: 0  ;; how many times this stopaft/do encountered
            runs: 0  ;; how many times we've executed the expression
        ]
        append expression-cache mrec
    ]

    ;; Run the expression, if it is still live
    ;; ---------------------------------------

    mrec/hits: mrec/hits + 1
    if all [mrec/hits >= mrec/threshold/1 mrec/hits <= mrec/threshold/2] [
        mrec/runs: mrec/runs + 1
        return sysdo mrec/cached-expression
    ]
]

;;  ======================================
reset: does [clear expression-cache true]

on: does  [active?: true]
off: does [active?: false]


;; ==========================================
pad*: func [
   str [string! number!]
   len [integer!]
][
      ;; Not all languages in the Redbol world 
      ;; have the same built-in PAD function
   
   str: copy form str
   while [(length? head str) < len] [insert str " "]
   return str
   ]   
;; ============================================  





;;  ============
    show: func [
;;  ============
    /local rec
][
    print rejoin [pad* "Hit" 9 pad* "Run" 9 "  Expression"]
    foreach rec expression-cache [
        print rejoin [pad* rec/hits 9 pad* rec/runs 9 "  [" rec/cached-expression "]"]
    ]
    exit
]

]  ;; stopaft object


;; =======================
;; A test suite, of sorts:
;; =======================

;;  ================
    test-run: func [ n [integer!]
;;  ================
    /local zzz 
][
  
    do %stopaft.red
    print "stopaft/test-run started"
    zzz: does [print "    ZZZ: should see this message for n = [1 2 3 3 4 4 5 6 7]"]
    repeat n n [
    print ["Loop " n]
        stopaft/do 4    [zzz]  ;; a zzz
        stopaft/do 9x3  [print "    BBB: should see this message for n = [9 10 11]"]
        stopaft/do 2    [print "    AAA: should see this message for n = [1 2]"]
        stopaft/do 3x5   [zzz]  ;; a different invocation of zzz     
        stopaft/do 5x10 [print "    CCC: should see this message for n = [5 6 7 8 9 10 11 12 13 14]"]
        stopaft/do 30x6 [print "    EEE: should not see this message"]
        stopaft/do 0    [print "    FFF: should not see this message"]
    ]
    print [newline newline "Run statistics..... (stopaft/show)"]
    stopaft/show
    print "stopaft/test-run completed"
]

