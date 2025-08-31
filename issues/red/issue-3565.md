
#3565: macOS: allow simple-io to use TLS >= 1.0
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/3565>

On macOS, more and more online APIs require TLS >= v1.2 while it looks like `simple-io` is brockering only a v1.0.
This is the kind of error online APIs returns:
```
success: false
errors: [
	#(
		yourTlsVersion: "TLSv1"
		message: {xxx does not support deprecated TLS versions for security reasons. Please upgrade your client to TLS 1.2 or greater.}
	)
]
```

Maybe should use any of these:
- `kCFStreamSocketSecurityLevelTLSv1`:
  - https://developer.apple.com/documentation/corefoundation/kcfstreamsocketsecurityleveltlsv1?language=objc
  - Apparently `kCFStreamSocketSecurityLevelTLSv1` means to use a minimum of TLS 1.0, which means TLS 1.2 will be used when available.
  - And should SSL <= 3.0 be disallowed because of [Poodle](https://www.us-cert.gov/ncas/alerts/TA14-290A)
- `kCFStreamSocketSecurityLevelNegotiatedSSL`:
  - https://developer.apple.com/documentation/corefoundation/kcfstreamsocketsecuritylevelnegotiatedssl?language=objc



Also, these OS APIs used by `simple-io` on macOS are marked as **deprecated**:
- `kCFStreamPropertyHTTPShouldAutoredirect`:
  - https://developer.apple.com/documentation/cfnetwork/kcfstreampropertyhttpshouldautoredirect?language=objc

- `kCFStreamPropertyHTTPResponseHeader`:
  - https://developer.apple.com/documentation/cfnetwork/kcfstreampropertyhttpresponseheader?language=objc

- `CFReadStreamCreateForHTTPRequest`
  - https://developer.apple.com/documentation/cfnetwork/1426845-cfreadstreamcreateforhttprequest?language=objc

- `CFURLCreateStringByAddingPercentEscapes`:
  - https://developer.apple.com/documentation/corefoundation/1542665-cfurlcreatestringbyaddingpercent?language=objc



Comments:
--------------------------------------------------------------------------------

On 2018-10-22T23:03:45Z, qtxie, commented:
<https://github.com/red/red/issues/3565#issuecomment-432021869>

    Fixed in commit 6c907d1642a4133f0917321b55da4687a29b4e97 .

