
#3113: Auto-resolving percent-encoding in URL values can corrupt those values
================================================================================
Issue is open, was reported by rgchris and has 16 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/3113>

In cases where URL! values are loaded and altered by resolving any percent encoding present, this can corrupt the value and lead to fundamentally different values. This is particularly notable where percent-encoding resolves to special characters, e.g. `%3F` -> `?`, `%26` -> `&`

The example here is a URL copied from a search engine that when loaded is effectively transformed into a different address.

### Expected behavior

```
>> https://duckduckgo.com/?q=hergé+%26+tintin
== https://duckduckgo.com/?q=hergé+%26+tintin
```

### Actual behavior

```
>> https://duckduckgo.com/?q=hergé+%26+tintin
== https://duckduckgo.com/?q=hergé+&+tintin
```

### Red version and build date, operating system with version.

```
system/version 0.6.3
system/build/date 1-Sep-2017/13:19:56-04:00
system/build/config/config-name 'Darwin
```



Comments:
--------------------------------------------------------------------------------

On 2017-11-20T19:35:22Z, algorev, commented:
<https://github.com/red/red/issues/3113#issuecomment-345804807>

    So URL percent resolving should be removed?

--------------------------------------------------------------------------------

On 2017-11-21T03:12:25Z, rgchris, commented:
<https://github.com/red/red/issues/3113#issuecomment-345903672>

    @algorev My inclination would be to say yes.

--------------------------------------------------------------------------------

On 2017-11-21T19:32:06Z, algorev, commented:
<https://github.com/red/red/issues/3113#issuecomment-346136102>

    It's probably there (haven't checked, though): `red/runtime/datatypes/url.reds`

--------------------------------------------------------------------------------

On 2019-09-05T17:59:14Z, dockimbel, commented:
<https://github.com/red/red/issues/3113#issuecomment-528503024>

    I agree with the principle, even if Red currently implements the behavior of both R2 and R3.

--------------------------------------------------------------------------------

On 2020-03-23T12:32:23Z, 9214, commented:
<https://github.com/red/red/issues/3113#issuecomment-602562461>

    There's another divergence between R2 and R3.
    
    Rebol2:
    ```red
    >> to url! "https://duckduckgo.com/?q=hergé+%26+tintin"
    == https://duckduckgo.com/?q=hergé+%26+tintin
    ```
    
    Rebol3 (buggy):
    ```red
    >> to url! "https://duckduckgo.com/?q=hergé+%26+tintin"
    == https://duckduckgo.com/?q=herg┬é+%2526+tintin
    ```
    
    Red:
    ```red
    >> to url! "https://duckduckgo.com/?q=hergé+%26+tintin"
    == https://duckduckgo.com/?q=hergé+%2526+tintin
    ```
    

--------------------------------------------------------------------------------

On 2020-10-22T08:45:15Z, rebolek, commented:
<https://github.com/red/red/issues/3113#issuecomment-714335209>

    Currently Red does:
    ```
    >> to url! "https://duckduckgo.com/?q=hergé+%26+tintin"
    == https://duckduckgo.com/?q=herg%C3%A9+%2526+tintin
    ```

--------------------------------------------------------------------------------

On 2020-11-24T15:55:47Z, rgchris, commented:
<https://github.com/red/red/issues/3113#issuecomment-733065546>

    > I agree with the principle, even if Red currently implements the behavior of both R2 and R3.
    
    I believe both R2 and R3 behaviour are incorrect in this regard and that URLs are best left as dumb strings until processed by a scheme or other handler.
    
    As an example, an HTTP scheme would process the above example by only encoding characters outside the valid URI range (even to the extent where URI special characters are not correctly used—e.g. `http://thing/f%oo` -> `#{2F66256F6F}`). Thus:
    
        >> https://duckduckgo.com/?q=hergé+%26+tintin
        == https://duckduckgo.com/?q=hergé+%26+tintin
    
        -> "GET /?q=herg%C3%A9+%26+tintin"
    
    The same might go for Punycode domain names.
    
    Another data point would be a valid URL that encodes a query in Latin 1: `http://latin1.com/?q=herg%E9` <- the value of %E9 means nothing but to the `latin1.com` site, and while it may not be worth supporting legacy systems for the sake of it, there may be other reasons why a site may have quirky uses for URI conventions that you can't presume to know. On that basis, you may wish to offer finer grained control for how a scheme does the percent-encoding of extended characters, though that may be overkill and left up to the user to preprocess URL values before using.
    
    It may be that R2 and R3 attempted to mirror percent encoding handling in the FILE! type (arguable) which is an altogether different concern.

--------------------------------------------------------------------------------

On 2020-11-24T18:48:15Z, greggirwin, commented:
<https://github.com/red/red/issues/3113#issuecomment-733166589>

    https://tools.ietf.org/html/rfc3986#section-2.4
    
    Section 1.2.1 (can't type the symbol here, Chrome catches the keys, grrrr.) also has notes on when to encode, e.g. per Chris' Latin-1 comment, and also that they are strictly identifiers which can't presume, in general, to know how a particular scheme will use the content of each component.
    
    Now that Red files use quoting, and I agree with @rgchris that Carl probably wanted them to mirror each other for consistency, we don't have that issue.
    
    I believe we had some other tickets related to URLs, e.g. when you `append` content it needs to be encoded if it's not already a URL. As long as we doc the behavior, and it isn't pathological, that's the best we can do. Users need to know how to avoid double encoding or unintended decoding, e.g. when converting from strings. This is particularly important if you're scraping links from net content, which will be strings and likely already encoded in the source. 

