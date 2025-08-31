
#3062: Reading files created by R2 - ASCII encoding issue?
================================================================================
Issue is closed, was reported by dsunanda and has 2 comment(s).
<https://github.com/red/red/issues/3062>

Issue found testing under Windows 10.

Red-062 cannot read back certain ASCII characters that R2 can write.

From an R2 console:
>    for c 0 255 1 [write join %chartest- c to-string to-char c]

From an R3 console:
>    c: -1
>    err-block: copy []
>	loop 256 [
>	    c: c + 1
>        if error? err-code: try [read append copy %chartest- c][append err-block c print [c mold err-code]]
>    ]	
>	   probe err-block
	  
These are the unreadable files with red-062 and red-20sep17-2509f96.exe
>    [128 129
>	 130 131 132 133 134 135 136 137 138 139 
>	 140 141 142 143 144 145 146 147 148 149
>    150 151 152 153 154 155 156 157 158 159
>     160 161 162 163 164 165 166 167 168 169
>    170 171 172 173 174 175 176 177 178 179
>     180 181 182 183 184 185 186 187 188 189
>     190 191
>    248 249
>     250 251 252 253 254 255]
	 
Red-063 (red-20sep17-2509f96.exe) does the same.

Discussion

If we write these files from Red, Red writes many of them as a two-byte file, encoding the binary.

R3 (alpha version 2.100.67.3.1) can successfully read both the one-byte file (from R2) and the two-byte file (from Red). In both cases, it ends up with the expected single character string.


Comments:
--------------------------------------------------------------------------------

On 2017-10-01T08:25:40Z, dockimbel, commented:
<https://github.com/red/red/issues/3062#issuecomment-333361473>

    There are a few issues with your code.
    
    Rebol2 uses ANSI 8-bit, so the characters above 127 are locale-dependent. Rebol3 and Red uses Unicode and require string-mode inputs to use UTF-8 encoding. The files you are creating with your Rebol2 code are only UTF-8 for the characters below 128, the rest is using whatever locale is set on your system.
    
    Your reading code is not doing what you think it does. `read` in Rebol3 implies binary-mode by default, unlike in Rebol2 and Red. So Rebol3 is reading the files in binary mode, not doing any decoding, so accepting any stream of bytes as valid, therefore no error can happen.
    
    When you run the same reading code in Red, it will use string-mode, so Red expects UTF-8 encoding, which works for characters less than 128, but fails for most of the characters above 128, as expected. That is the correct behavior. 
    
    If you change the code to use `read/string` instead, probe the read content, and run it in Rebol3, you will see that Rebol3 will wrongly decode the characters above 128, as it seems that it suffers a buffer overflow bug there.
    
    You can use [red/bug](https://gitter.im/red/bugs) to confirm bugs before opening a ticket on github, unless they are obvious, like a native crash when using only Red code.

