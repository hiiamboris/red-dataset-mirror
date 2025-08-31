# Red language executable also opening up a console

**Link:**
<https://stackoverflow.com/questions/46223140/red-language-executable-also-opening-up-a-console>

**Asked:** 2017-09-14 15:33:41 UTC

------------------------------------------------------------------------

I compiled an executable using following simple code (from Red language
websites) in Red language:

    Red [title: "test" needs: 'view]
    view [
        below
        button
        field
        text "Red is really pretty easy to program."
        text-list
        check
    ]

I used following command:

    red -c myprog.red

It was created without any error. However, when I run it there are 2
problems:

1.  The application window does not have the title given above
    (\"test\").

2.  A console window also opens that closes only after the application
    is shut down. It will be better if such a window does not open at
    all and only application window opens.

I am working on Windows-7. Where is the problem and how can these be
solved? Thanks for your help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by sqlab

Use

    red -c -t Windows myprog.red

and the compilat is specifically for Windows

*Comment by iArnold:* \@rgchris and mso I was mistaken that it was also
to be found on the Red github page. What is the \<rebol\> tag for?

*Comment by iArnold:* The reason I thought it was easy to find and on
the Red github Readme page is that I have it mentioned on my Red project
on Xiangqi, \"Chinese Chess\" here
[github.com/iArnold/Xiangqi](https://github.com/iArnold/Xiangqi){rel="nofollow noreferrer"}.
Sorry for the confusion.

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* You should split your `1. No title` into a
separate question
