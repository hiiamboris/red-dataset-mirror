URL: <https://github.com/hiiamboris/red-formatting/discussions/14>
Date created: 2021-08-17T12:24:02Z

# Localization

I guess the simplest thing would be to hold maps with format data in `system/locale`. 
However, we always want to be able to switch format from OS-default locale to English when we're formatting:
- for other software
- for a reader in other parts of the world

This also affects presence of formats like `dddd-en` in `format-date-time*`. Do we want these in there, or we could just let format use the English locale? I'm sure in Red we can do fine without named `-en` formats, but if we consider spreadsheets, they come useful. But then *why should we not* generalize `-en` to a language specifier applicable to *any* format string?


## Comments

### greggirwin commented at 2021-08-19T19:24:31Z:

Let's  do a little reconnaissance. This came up during `composite` discussion too. We have to keep things simple on the Red side, for our own sanity and so we don't end up lost in international weeds right now. We have to remember that I18N also means colors and images. So while we can add standard locale settings for `format`, we should at least think about where user's app-specific locale data will go and how formatted data gets mixed with other content. Do we have _any_ idea how right-to-left will work in Red? The nightmare begins.

- https://github.com/red/red/wiki/%5BHOWTO%5D-Windows-Locale-Handling (we can rename the page and make Windows just a section in it)
- https://norbertlindenberg.com/2012/12/ecmascript-internationalization-api/
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl
- https://lokalise.com/blog/i18n-internationalization-l10n-localization-developer-tutorials/
- https://phrase.com/features/designers/

### greggirwin commented at 2021-09-03T01:36:01Z:

Doing some research and making haphazard notes. As I feared, L10N is a black hole. On the bright side, people have done a lot of work in this area. All we have to do now is figure out which 10% we need to care about and not paint ourselves into a corner if we want to expand later.

### greggirwin commented at 2022-05-16T22:08:36Z:

https://pub.dev/packages/intl (Dart Lang ref)

