
#3777: reading uploaded file is broken
================================================================================
Issue is closed, was reported by rebred and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3777>

**Describe the bug**
when uploading a file using an HTML form RED can only read the first 4 lines

**To reproduce**
this is the RED script that print the file received from an HTML form:

#!/Library/WebServer/Documents/red2.dms
Red[]
print "Content-type: text/html^/"
print ["input1:" input]
print ["input2:" input]
print ["input3:" input]
print ["input4:" input]
print ["input5:" input]

this is the HTML output:

input1: ------WebKitFormBoundaryxBNH9pwUye3VNRvU 
input2: Content-Disposition: form-data; name="pic"; filename="img0.png" 
input3: Content-Type: image/png 
input4: 
input5: *** Runtime Error 100: no value matched in CASE *** at: 000D5922h

**Expected behavior**

RED should read every line of the file uploaded

**Screenshots**
If applicable, add screenshots to help explain your problem.

###   *** Runtime Error 100: no value matched in CASE *** at: 000D5922h

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 4-Feb-2019/19:45:38+01:00 commit #a4d8240
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-08T19:05:47Z, 9214, commented:
<https://github.com/red/red/issues/3777#issuecomment-461910902>

    Can you be _a bit more_ specific? What file? What HTML form? Error message indicates that the problem is in the type of data being passed (`image!` or `binary!` I surmise) rather than in the number of lines. How can we deduce any of this from your report?

--------------------------------------------------------------------------------

On 2019-02-08T21:04:47Z, rebred, commented:
<https://github.com/red/red/issues/3777#issuecomment-461946460>

    I am using Apache, I am uploading a PNG image and this is the HTML form
    ```
    <HTML>
    <BODY>
    <form action="/image.cgi" method="post" enctype="multipart/form-data">
      <input type="file" name="pic" >
      <input type="submit">
    </form>
    </BODY>
    </HTML>
    ```
    this is image.cgi
    ```
    #!/Library/WebServer/Documents/red2.dms
    Red[]
    print "Content-type: text/html^/"
    print "<body>"
    print "<BR><BR>input1:"
    print input
    print "<BR><BR>input2:"
    print input
    print "<BR><BR>input3:"
    print input
    print "<BR><BR>input4:"
    print input
    print "<BR><BR>input5:"
    print input
    ```
    
    this is the result I get in the HTML page
    
    ```
    input1: ------WebKitFormBoundary28OtoPMJe2JAN6lO 
    
    input2: Content-Disposition: form-data; name="pic"; filename="img0.png" 
    
    input3: Content-Type: image/png 
    
    input4: 
    
    input5: *** Runtime Error 100: no value matched in CASE *** at: 000D5922h
    ```
    this is the png I am using
    
    ![img0](https://user-images.githubusercontent.com/33818960/52506572-4cf7d800-2bef-11e9-932f-c40b0fd1af20.png)

--------------------------------------------------------------------------------

On 2019-02-18T03:28:15Z, qtxie, commented:
<https://github.com/red/red/issues/3777#issuecomment-464569052>

    The `input` function is for reading text only. You can use `read-stdin` to read binary data for now until we finish the full IO.

