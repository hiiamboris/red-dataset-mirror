
#5478: JSON interoperability issue
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/5478>

**Describe the bug**

I've encountered some API which sends int64 values in and out unquoted in JSON. 

Current JSON codec is incapable of encoding or decoding that data. It reads these values as floats:
```
>> 1111111111111111111111111111 
== 1.111111111111111e27 
```
and encoded JSON payload as float or as string is rejected by the server.

The [library](https://cs.opensource.google/go/go/+/refs/tags/go1.22.0:src/encoding/json/decode.go;l=201) that does that is standard in Go, so will affect all programs unless they intentionally bother with 32-bit compatibility. RFC [does not *enforce*](https://www.rfc-editor.org/rfc/rfc8259#section-6) any restrictions on number digits.

**To reproduce**
```
>> load-json {{"orderId":1753829281023862788}}
== #(
    orderId: 1.7538292810238628e18
)
>> to-json load-json {{"orderId":1753829281023862788}}
== {{"orderId":1.753829281023863e18}}
```
**Expected behavior**

We need a 64 bit integer type, or a set of kludges to pass such values around.

**Platform version**
`Red 0.6.4 for Windows built 4-Feb-2024/4:57:33+03:00  commit #9b8169f`


Comments:
--------------------------------------------------------------------------------

On 2024-02-11T14:42:22Z, dockimbel, commented:
<https://github.com/red/red/issues/5478#issuecomment-1937773885>

    Such long ints could be detected while parsing by the JSON coded and then encoded on the Red side using specific syntax.  Maybe @rebolek can confirm the feasibility.
    
    It's unlikely we will implement 64-bit integer separately, as it would require many deep changes in the current toolchain. You'll need to wait for the new toolchain in Red.

--------------------------------------------------------------------------------

On 2024-02-11T15:03:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/5478#issuecomment-1937779137>

    Parsing is not as big problem as encoding, because the codec needs to tell the value apart from the string, meaning we would have to pass it as an issue or ref or smth, which would be a weird kludge.

--------------------------------------------------------------------------------

On 2024-02-11T16:35:27Z, dockimbel, commented:
<https://github.com/red/red/issues/5478#issuecomment-1937803041>

    Could it be encoded as a `binary!` value or is that type already used by the codec?

--------------------------------------------------------------------------------

On 2024-02-11T16:39:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5478#issuecomment-1937804102>

    Possibly. Currently it just forms binary in a json string:
    ```
    >> to-json #{aabbcc} 
    == {"#{AABBCC}"} 
    ```

--------------------------------------------------------------------------------

On 2024-02-11T22:55:26Z, greggirwin, commented:
<https://github.com/red/red/issues/5478#issuecomment-1937902661>

    1) We don't want to design it based on compatibility with this one library. 
    2) There is only one number type in JSON, so if they don't handle it correctly, that's on them.
    3) If there are conversion errors, because it becomes a float, that's a problem.
    4) What types of values are represented by the int64?
    
    Money also becomes a string. Percents become a float.  

--------------------------------------------------------------------------------

On 2024-02-12T08:01:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5478#issuecomment-1938197335>

    1-2. Like said above, by RFC you can have infinite precision numbers in JSON and it will be compliant.
    4. Order ids and timestamps in millisecs.
    
    `money!` type for it sounds best IMO.

