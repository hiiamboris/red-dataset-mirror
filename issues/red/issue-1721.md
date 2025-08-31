
#1721: Console crashes when `word!` used with `url!` as an argument to `write`
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1721>

```
red>> write http://www.abc.com 'crashed
```

gives (in debug mode) -

```
*** Runtime Error 1: access violation
*** in file: /C/Users/ABC/Desktop/red/environment/console/unicode.reds
*** at line: 625
***
***   stack: red/unicode/to-utf16-len 02733BA0h 0018F568h
***   stack: red/unicode/to-utf16 02733BA0h
***   stack: red/simple-io/request-http 2 02733B90h 00000000h 02733BA0h false false false
***   stack: red/url/write 02733B90h 02733BA0h false false false false 02733B80h 02733B80h 02733B80h 02733B80h ***   stack: red/actions/write 02733B90h 02733BA0h false false false false 02733B80h 02733B80h 02733B80h 02733B80h
***   stack: red/actions/write* -1 -1 -1 -1 -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 027CB310h 027EC798h 027EC798h 00000000h 00000000h
***   stack: red/interpreter/eval-code 027CB310h 027EC778h 027EC798h false 00000000h 00000000h 027CB310h
***   stack: red/interpreter/eval-expression 027EC778h 027EC798h false false
***   stack: red/interpreter/eval 02733B80h true
***   stack: red/natives/do* false -1
***   stack: red/interpreter/eval-arguments 027CB4D0h 027BEEB0h 027BEEB0h 00000000h 00000000h
***   stack: red/interpreter/eval-code 027CB4D0h 027BEEA0h 027BEEB0h true 00000000h 00000000h 027CB4D0h
***   stack: red/interpreter/eval-expression 027BEEA0h 027BEEB0h false true
***   stack: red/interpreter/eval-arguments 027CAA70h 027BEE90h 027BEEB0h 027BEE70h 027BEEC4h
***   stack: red/interpreter/eval-code 027CAA70h 027BEE80h 027BEEB0h true 027BEE70h 027BEEC4h 027CAA70h
***   stack: red/interpreter/eval-path 027BEE70h 027BEE80h 027BEEB0h false false false false
***   stack: red/interpreter/eval-expression 027BEE80h 027BEEB0h false false
***   stack: red/interpreter/eval 02733B50h true
***   stack: red/natives/catch* true 1
***   stack: ctx253~try-do 0067CE0Ch
***   stack: red/_function/call 027A914Ch 0067CE0Ch
***   stack: red/interpreter/eval-code 027A914Ch 027BF574h 027BF5C4h true 00000000h 00000000h 027A914Ch
***   stack: red/interpreter/eval-expression 027BF564h 027BF5C4h false true
***   stack: red/interpreter/eval-arguments 027CAA70h 027BF554h 027BF5C4h 027BF534h 027BF5D8h
***   stack: red/interpreter/eval-code 027CAA70h 027BF544h 027BF5C4h true 027BF534h 027BF5D8h 027CAA70h
***   stack: red/interpreter/eval-path 027BF534h 027BF544h 027BF5C4h false false false false
***   stack: red/interpreter/eval-expression 027BF544h 027BF5C4h false false
***   stack: red/interpreter/eval 02733AD0h true
***   stack: red/natives/unless* false
***   stack: red/interpreter/eval-arguments 027CB370h 027BF410h 027BF430h 00000000h 00000000h
***   stack: red/interpreter/eval-code 027CB370h 027BF3E0h 027BF430h false 00000000h 00000000h 027CB370h
***   stack: red/interpreter/eval-expression 027BF3E0h 027BF430h false false
***   stack: red/interpreter/eval 02733AB0h true
***   stack: red/natives/do* true -1
***   stack: ctx253~eval-command 0067CE0Ch
***   stack: ctx253~run 0067CE0Ch
***   stack: ctx253~launch 0067CE0Ch
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-21T07:41:21Z, qtxie, commented:
<https://github.com/red/red/issues/1721#issuecomment-199159816>

    For now the IO support is simple and temporary, so we doesn't handle invaild arguments very well. 
    We will have complete error handling when we implement the full IO support in 0.7.

