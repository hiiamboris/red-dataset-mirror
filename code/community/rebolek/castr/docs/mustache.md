# Mustache.red

Mustache.red is [Mustache](https://mustache.github.io/mustache.5.html)
implementation for Red.

## Additional features

Mustache.red has some additional features. Here is the list of them:

### Load data file

To easily select the source of data for the template, you can specify filename
using `%`:

```
{{{%data}}}
```

If the filename has no suffix, `%.red` is added automatically. When the file
is loaded, it's turned into a context.

Example:

```
Template:

  {{%data}}
  Hello {{planet}}!

%data.red:

  planet: "Earth"

Output:

  Hello Earth!
```

This is similar to **Non-False Value**, but let's you specifily a file instead
of just a context.

### Alternative Inverted Section

Because `^` is used as escape character in Red, if your Mustache template is
part of Red source code, you would need to use `^^`. To prevent possible errors
you can use `\` instead:

```
Template:

  {{#repo}}
    <b>{{name}}</b>
  {{/repo}}
  {{\repo}}
    No repos :(
  {{/repo}}

Data:

  #(
    "repo": []
  }

Output:

  No repos :(
```

### List handling

Mustache supports iterating over list where each value is a context. To make
thinks easier, it's also possible to iterate over list of values and refer to
the current value with a dot: `.`. See the example:

```
Template:

  {{#repo}}
    <b>{{.}}</b>
  {{/repo}}

Data:

  #(
    repo: ["resque" "hub" "rip]
  )

  Output:

  <b>resque</b>
  <b>hub</b>
  <b>rip</b>
```

### Inline code

You can put Red ocde snippets directly into the template with `:`:

```
Template

  {{:1 + 1}}

Output:

  2
```
