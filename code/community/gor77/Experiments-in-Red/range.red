; create range operator in Red
; should work with both numbers and characters
; range is inclusive on both start and end
; third argument is used for step, it can be both positive and negative
; compatible with current bitset syntax for range [#"A" - #"Z"], but also can be used without a dash 
; examples:  
;           ..[2 100 2]  - create block of even numbers up to 100
;           ..[#"A" #"Z"] - create block of all characters from english alphabet

Red []

..: function [block] [
    
    range: copy []
    count: 0
    replace block '- []
    
    start: first block
    end: second block
    step: third block
    
    ;if (second block) = '- [end: third block step: fourth block]
    
    if not step 
    [
        case [
                start <= end  [step: 1]
                start > end  [step: -1]
             ]   
    ]
    
    if zero? step [return block] ; would empty block or error be better option to return
    
    steps: to-integer ((to-integer end) - (to-integer start) / step)

    while [count <= steps] [
    element: count * step + start
    if char? start  [element: to-char element]  
    append range element
    count: count + 1
    ]
range    
]

