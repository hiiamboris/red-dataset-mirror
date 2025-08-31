Original URL: <http://helpin.red/Cryptography.html>

# Cryptography

* * *

* * *

### native! checksum  [Red-by-example](http://www.red-by-example.org/#checksum)

### Computes a checksum, CRC, hash, or HMAC.

### Arguments may be string! binary! or file!

Red \[]

print "-----------  MD5  --------------"

print checksum "my house in the middle of our street" 'MD5

print "----------  SHA1  --------------"

print checksum "my house in the middle of our street" 'SHA1

print "---------  SHA256 --------------"

print checksum "my house in the middle of our street" 'SHA256

print "---------  SHA384  -------------"

print checksum "my house in the middle of our street" 'SHA384

print "---------  SHA512  -------------"

print checksum "my house in the middle of our street" 'SHA512

print "---------  CRC32  --------------"

print checksum "my house in the middle of our street" 'CRC32

print "----------  TCP  --------------"

print checksum "my house in the middle of our street" 'TCP

-----------  MD5  --------------  
#{41F2FF19E5D7DF3B0E79FA9687C08397}

----------  SHA1  --------------  
#{E97AE5E15E8EC1B87B0113E6A4758AAAE6E26901}

---------  SHA256 --------------  
#{  
98E2A2BFF328D893161CA6B6F50BA64D544026BD8C24C2022BE7007832714BA4  
}

---------  SHA384  -------------  
#{  
2EAEA11D12F4CE8BE3CDE33DDED08765BFDCE1F277CF8E2126F7B1B6D4D17E31  
96D05D2427576C348A0FECF63537B7D3  
}

---------  SHA512  -------------  
#{  
0FAA749EAAEC728A6D821B85AC49CBE96DCE59E3FDC8E1005A3256A4CCE6797A  
11603E9DB6B870C166057CF5EFBABB2365A87F37CDF2C8C1BF86DC8CE6D948C9  
}

---------  CRC32  --------------  
\-1630692232

----------  TCP  --------------  
13706

### /with        =&gt; Extra value for HMAC key or hash table size; not compatible with TCP/CRC32 methods.

### I believe hash is not implemented in Red 0.63 and I could not figure out how HMAC works.

[&lt; Previous topic](http://helpin.red/Otherbases.html)                                                                                          [Next topic &gt;](http://helpin.red/BlocksSeries.html)
