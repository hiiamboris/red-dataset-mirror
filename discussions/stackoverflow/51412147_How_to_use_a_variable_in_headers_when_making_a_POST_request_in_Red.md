# How to use a variable in headers when making a POST request in Red

**Link:**
<https://stackoverflow.com/questions/51412147/how-to-use-a-variable-in-headers-when-making-a-post-request-in-red>

**Asked:** 2018-07-18 23:05:24 UTC

------------------------------------------------------------------------

I\'m trying to make a POST request using Red language.

I have to pass a header with authorization, and I\'m computing the value
for the authorization string before making the request and saving it in
a variable `auth-string`.

`probe` prints the `auth-string` value fine.

If I hard-code the authorization string in the headers section, it
works, but when I try to use the variable the program exits.

This code with hard-coded **`Authorization: "Basic c29tZX...`** works:

    username: "someusernamestring"
    password: "somepasswordstring"

    url: to url! rejoin ["https://example.com/" username "/Account.json"]

    auth-string: rejoin ["Basic " enbase/base rejoin [username ":" password] 64]
    probe auth-string

    response: write url [
            post [
            Content-Type: "application/x-www-form-urlencoded"
            Authorization: "Basic c29tZXVzZXJuYW1lc3RyaW5nOnNvbWVwYXNzd29yZHN0cmluZw=="
        ]
        {}    
    ]

    print response

------------------------------------------------------------------------

But, this code, with the variable **`Authorization: auth-string`** does
not work, the program exits, no error that I can see.

    username: "someusernamestring"
    password: "somepasswordstring"

    url: to url! rejoin ["https://example.com/" username "/Account.json"]

    auth-string: rejoin ["Basic " enbase/base rejoin [username ":" password] 64]
    probe auth-string

    response: write url [
            post [
            Content-Type: "application/x-www-form-urlencoded"
            Authorization: auth-string
        ]
        {}    
    ]

    print response

------------------------------------------------------------------------

How do I use a variable in the headers section?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by Graham Chiu

This should work as it does in Rebol

    response: write url compose/deep [
         post [
            Content-Type: "application/x-www-form-urlencoded"
            Authorization: (auth-string)
        ]
        {}    
    ]

------------------------------------------------------------------------

## Comments on question
