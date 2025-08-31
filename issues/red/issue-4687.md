
#4687: Red can't load URL with percent encoded space
================================================================================
Issue is closed, was reported by rebolek and has 10 comment(s).
[status.resolved]
<https://github.com/red/red/issues/4687>

```
>> http://www.example.com?q=test%20(A)%20.html
*** Script Error: A has no value
*** Where: catch
*** Stack:
```

It seems that Red first decodes `%20` to space and then wrongly assumes it's a real space and thinks that theURL ended already.

 
**Platform version**
```
>> about
Red 0.6.4 for macOS built 13-Oct-2020/7:21:49
```



Comments:
--------------------------------------------------------------------------------

On 2020-10-22T17:56:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4687#issuecomment-714660342>

    Shouldn't your url be *fully* percent encoded?
    ```
    >> to "" http://www.example.com?q=test%20%28A%29%20.html
    == "http://www.example.com?q=test (A) .html"
    ```

--------------------------------------------------------------------------------

On 2020-10-23T07:08:22Z, rebolek, commented:
<https://github.com/red/red/issues/4687#issuecomment-715029920>

    Good point, however, this is something scraped from web. Also, there's another problem:
    
    ```
    >> load "http://www.example.com?q=test%20(A)%20.html"                                                             
    == [http://www.example.com?q=test%20
    ```

--------------------------------------------------------------------------------

On 2020-10-23T09:19:52Z, qtxie, commented:
<https://github.com/red/red/issues/4687#issuecomment-715217137>

    It's caused by Red's lexer treats parenthesis `(` as a delimiter.
    ```
    >> b: load "http://www.abc.com?q=test(A)abc"
    == [http://www.abc.com?q=test
    >> b/1
    == http://www.abc.com?q=test
    >> b/2
    == (A)
    >> b/3
    == abc
    ```
    Here is a workaround:
    ```
    to url! dehex "http://www.example.com?q=test%20(A)%20.html"
    ```

--------------------------------------------------------------------------------

On 2020-10-23T18:02:05Z, dockimbel, commented:
<https://github.com/red/red/issues/4687#issuecomment-715492595>

    AFAIR, parens are not legal characters in URL, so they must be hex-encoded.

--------------------------------------------------------------------------------

On 2020-10-24T02:08:42Z, qtxie, commented:
<https://github.com/red/red/issues/4687#issuecomment-715656836>

    Just a note, some molded URLs are not loadable:
    ```
    >> url: to url! "http://www.example.com?q=test(A).html"
    == http://www.example.com?q=test(A).html
    >> s: mold url
    == "http://www.example.com?q=test(A).html"
    >> url = load s
    == false
    ```
    According to RFC 3986, the characters in a URL have to be taken from a defined set of unreserved and reserved ASCII characters. Any other characters are not allowed in a URL.
    
    The unreserved characters can be encoded, but should not be encoded. The unreserved characters are:
    
    ```
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 - _ . ~
    ```
    
    The reserved characters have to be encoded only under certain circumstances. The reserved characters are:
    
    ```
    ! * ' ( ) ; : @ & = + $ , / ? % # [ ]
    ```
    I'm not sure we if should encode `( ) [ ]` or not. Rebol2 encodes those characters:
    ```
    R2:
    >> url: to url! "http://www.test.com?q=a(b)c[d]e.html"
    == http://www.test.com?q=a%28b%29c%5Bd%5De.html
    >> url = load mold url
    == true
    ```

