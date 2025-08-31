
#3691: Color disabled in rich-text data
================================================================================
Issue is closed, was reported by toomasv and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3691>

**Describe the bug**

Whenever `strike` or `underline` appear immediately before color-tuple in low-level data, color is not rendered.

**To reproduce**

```
>> view [rt: rich-text data [s [red "bbb"]] do [probe rt/data]]
[
    1x3 strike 255.0.0
]
```
![image](https://user-images.githubusercontent.com/11960635/50554894-c84e9b80-0ccb-11e9-8a3e-f2ee1ac1ebfc.png)

Color is rendered if tuple appears before `strike` / `underline` style-word. Also, this does not affect `italic` and `bold` styles.

**Expected behavior**

Color should be rendered with `strike` and `underline` as it is rendered now with `italic` and `bold`.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Dec-2018/4:42:09+02:00 commit #6968dad
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-01T10:53:14Z, qtxie, commented:
<https://github.com/red/red/issues/3691#issuecomment-450721940>

    It's strange that the code below works:
    ```
     view [rt: rich-text data [s [red "bbb"]] do [rt/data/2: 255.0.0 rt/data/3: 'strike probe rt/data]]
    ```

--------------------------------------------------------------------------------

On 2019-01-01T11:25:53Z, toomasv, commented:
<https://github.com/red/red/issues/3691#issuecomment-450723397>

    Yes, I noticed too, that if color appears before `strike` or `underline`, then it works. I based my partial fix to the problem on this. 

--------------------------------------------------------------------------------

On 2019-01-01T14:01:32Z, qtxie, commented:
<https://github.com/red/red/issues/3691#issuecomment-450730658>

    In low-level data, the color following the `strike` is used to set the color of the strike line, but this feature is not implemented yet. If we want to set both strike line color (255.255.0) and text color (255.0.0), we can use the following code:
    ```
    1x3 strike 255.255.0 255.0.0
    ```
    or
    ```
    1x3 255.0.0 strike 255.255.0
    ```
    
    Here is a more detail document for setting the styles of the text in `data` block. Properties can overlap and later ones have higher priority.
    ```
    data: [
        range1 property1 property2 ...        ;-- style for range1
        range2 property1 property2 ...        ;-- style for range2
        ...
    ]
    
    <style> ::= [pair! any <property>]        ;-- range properties
    <property> ::= [
        tuple!                      ;-- text color
        | backdrop tuple!           ;-- background color
        | bold                      ;-- bold font
        | italic
        | underline opt tuple! opt ['dash | 'double | 'triple ]    ;@@ color and shape are not supported yet
        | strike opt tuple! opt ['wave | 'double]                  ;@@ color and shape are not supported yet
        | border opt tuple! opt ['dash | 'wave]                    ;@@ not implemented
        | [integer! | float!]       ;-- font size
        | string!                   ;-- font name
    ]
    ```

--------------------------------------------------------------------------------

On 2019-01-01T14:12:09Z, toomasv, commented:
<https://github.com/red/red/issues/3691#issuecomment-450731228>

    OK, then my partial fix was OK. But this does not concern `italic` and `bold`, which show correctly if color follows to these?
    
    Then the full fix needs to insert color just after address when uniting styles in optimization phase?

--------------------------------------------------------------------------------

On 2019-01-01T18:30:29Z, toomasv, commented:
<https://github.com/red/red/issues/3691#issuecomment-450748522>

    Thanks for the detailed spec!

