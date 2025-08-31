
#1769: Issue with newlines on multiline strings in Console
================================================================================
Issue is closed, was reported by ghost and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1769>

```
red>> a: {
{
{
{
{
{
{
{
{
{
{
{
{
{
{
{
{    }
== "^/"
red>> print a


red>>
```

(only a single newline)

or -

```
red>> a: {
{
{
{
{
{
{
{
{
{    a
{
{
{
{
{
{
{
{
{    }
== "^/a^/"
red>> print a

a

red>>
```

-_-
vs in Rebol 2 -

```
>> a: {
{
{
{
{
{
{
{
{
{
{
{
{
{
{
{
{
{
{
{    }
== {


















}
>> print a




















>>
```



