# HUB webserver


## Host dialect


Dialect format:

	<host-name> [data]

<host-name> can be DEFAULT for default host or a server name

data:

	<plain> - do not use SSL

	<root-dir> [file!] - set root directory for data

	<default> [file! | block!] - default file (index.html ...)

	<alias> value [string! | file!] - set aliases

	<header> ['plain | 'web] - select default header. 'web is optimized for web

	<csp> | <content-security-policy> [block!] - CSP settings

## Cookies

```
Dialect format: [
	<name> [set-word!]
	<value> [any-type!]
	any [date! (Expires) | integer! (Max-Age) | word! (flag)]
]
```

By default, `Secure`, `HttpOnly` and `SameSite` flags are added.
To add no flags, use the `none` keyword.

```
Example: cookie: "value"             ; flags: [Secure HttpOnly SameSite]
Example: js-cookie: "value" secure   ; flags: [Secure]
Example: evil-cookie: "value" none   ; flags: []
```
