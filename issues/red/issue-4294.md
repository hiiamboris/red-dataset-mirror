
#4294: CRASH in OS-image/get-data
================================================================================
Issue is closed, was reported by hiiamboris and has 16 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4294>

**Describe the bug**

`OS-image/get-data` doesn't have any zero handle checks:
https://github.com/red/red/blob/7d01c85e84c208e6b64544bde295e90733eb21c0/runtime/platform/image-gdiplus.reds#L306-L317

and usually receives the result of `OS-image/lock-bitmap-fmt` which in case of any error returns *zero*:
https://github.com/red/red/blob/7d01c85e84c208e6b64544bde295e90733eb21c0/runtime/platform/image-gdiplus.reds#L266-L280

In effect, when image is empty, I'm having crashes from calling [`image/acquire-buffer`](https://github.com/red/red/blob/7d01c85e84c208e6b64544bde295e90733eb21c0/runtime/datatypes/image.reds#L16) in R/S code, or from using `sort`:
```
i: make image! 0x0
sort reduce [i i]
```
```
*** Runtime Error 1: access violation                                                                    
*** in file: /D/devel/red/red-src/red/runtime/platform/image-gdiplus.reds                                
*** at line: 314                                                                                         
***                                                                                                      
***   stack: red/OS-image/get-data 0 0018FADCh                                                           
***   stack: red/image/compare 03D6B6F0h 03D6B700h 7                                                     
***   stack: red/block/compare-value 03D6B6F0h 03D6B700h 7 0                                             
***   stack: red/_sort/qsort 03D6B6F0h 2 16 7 0 4430762                                                  
***   stack: red/block/sort 02AA2464h false 02AA2454h 02AA2454h 02AA2454h false false false              
***   stack: red/actions/sort 02AA2464h false 02AA2454h 02AA2454h 02AA2454h false false false            
***   stack: red/actions/sort* -1 -1 -1 -1 -1 -1 -1                                                      
***   stack: red/interpreter/eval-arguments 02D8A660h 03D6B5F8h 03D6B5F8h 00000000h 00000000h            
***   stack: red/interpreter/eval-code 02D8A660h 03D6B5D8h 03D6B5F8h false 00000000h 00000000h 02D8A660h 
***   stack: red/interpreter/eval-expression 03D6B5D8h 03D6B5F8h false false false                       
***   stack: red/interpreter/eval 02AA2434h true                                                         
***   stack: red/natives/catch* true 1                                                                   
***   stack: ctx||503~try-do 003925F0h                                                                   
***   stack: ctx||503~do-command 003925F0h                                                               
***   stack: ctx||503~eval-command 003925F0h                                                             
***   stack: ctx||503~run 003925F0h                                                                      
***   stack: ctx||503~launch 003925F0h                                                                   
***   stack: ctx||535~launch 00391D4Ch                                                                   
```

**Expected behavior**

No crashes on Red level.
`acquire-buffer` and `get-data` might at least have an assertion about that.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 31-Jan-2020/17:12:41+03:00 commit #414cdb3
```



Comments:
--------------------------------------------------------------------------------

On 2020-02-12T08:29:43Z, qtxie, commented:
<https://github.com/red/red/issues/4294#issuecomment-585089658>

    Should we throw an error when making an invalid image? 
    ```
    make image! 0x0
    make image! nx0
    make image! 0xn
    make image! -nx-m
    ```

--------------------------------------------------------------------------------

On 2020-02-12T08:40:53Z, 9214, commented:
<https://github.com/red/red/issues/4294#issuecomment-585093690>

    https://github.com/red/red/issues/2221, https://github.com/red/red/issues/3769

--------------------------------------------------------------------------------

On 2020-02-12T08:52:00Z, qtxie, commented:
<https://github.com/red/red/issues/4294#issuecomment-585097908>

    If we allow `make image! 0x0`, then we'll have problem when `save` it to some image formats (issue #4293). Some formats don't allow it, even it is allowed by the specs of some image formats, almost no libraries allow it in practical.

--------------------------------------------------------------------------------

On 2020-02-12T10:24:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/4294#issuecomment-585136685>

    Maybe SAVE should throw an error when it's not serialized but exported in a specific format?
    There is one (if small) practical point in having image of 0x0 size internally: less checks in "crop this - inspect contents - overlay it here" kind of code, as it just doesn't affect anything. 

--------------------------------------------------------------------------------

On 2020-02-12T22:50:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4294#issuecomment-585458280>

    There's actually one more practical point in having an empty image:
    ```
    >> i: make image! 2x2
    == make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
    >> copy skip i 4
    == make image! [0x0 #{}]
    ```
    This code has to be valid in Red

--------------------------------------------------------------------------------

On 2020-02-13T08:58:32Z, loziniak, commented:
<https://github.com/red/red/issues/4294#issuecomment-585620422>

    Image is a series, and series can be empty. I think image should also be allowed to be empty. Or at least add info to documentation and create checks on invalid values, because they are not obvious.

--------------------------------------------------------------------------------

On 2020-02-13T09:13:27Z, loziniak, commented:
<https://github.com/red/red/issues/4294#issuecomment-585626264>

    Interesting discussion in Python's Pillow:
    https://github.com/python-pillow/Pillow/issues/2259

--------------------------------------------------------------------------------

On 2020-02-13T09:23:44Z, 9214, commented:
<https://github.com/red/red/issues/4294#issuecomment-585630708>

    There is an image as a Red `image!` value in memory, and then there is its serialized representation as an image file stored on disk — don't confuse the two.
    
    The former can (and should) be zero, the latter is impractical and in some cases nigh impossible (as @qtxie [already pointed out](https://github.com/red/red/issues/4294#issuecomment-585097908)).

