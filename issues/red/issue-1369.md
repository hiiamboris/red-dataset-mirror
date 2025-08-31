
#1369: JavaScript compiler target
================================================================================
Issue is closed, was reported by arno-lee and has 16 comment(s).
[type.wish] [status.resolved]
<https://github.com/red/red/issues/1369>

It would be great if Red could produce JavaScript code. We'd be able to add red.js to npm and use JS libraries, and also write Node.js applications. That would make Red easy to try and adopt for a great many developers



Comments:
--------------------------------------------------------------------------------

On 2015-10-02T19:59:09Z, meijeru, commented:
<https://github.com/red/red/issues/1369#issuecomment-145140804>

    Shouldn't this be put forward in Gitter rather than as an "issue"?? Also, the [Ideas for Red Contributors](https://trello.com/b/tCypaglW/ideas-for-red-contributors) contain an item "JavaScript emitter" already

--------------------------------------------------------------------------------

On 2015-10-04T09:56:07Z, arno-lee, commented:
<https://github.com/red/red/issues/1369#issuecomment-145331423>

    This was supposed to be marked as "feature request"

--------------------------------------------------------------------------------

On 2015-10-04T10:13:44Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1369#issuecomment-145332227>

    I have marked this issue as a wish and left it open to give some time for a proposal to be written on the Red Github Wiki. There a growing number of proposals on the wiki. They are listed on the front page of the wiki.
    
    Looking at the current proposals, it very much seems as though we need to provide some guidelines for proposal submitters.
    
    It would be a help if you could at least come up with a first draft of a proposal for a JavaScript emitter. The proposal should include a clear definition of what is being proposed and the benefits of implementing  the proposal. Offers of help (or sponsorship) to implement the proposal would be well received.

--------------------------------------------------------------------------------

On 2015-10-05T13:14:45Z, grshiplett, commented:
<https://github.com/red/red/issues/1369#issuecomment-145523736>

    www.curl.com has a kind of JS emitter called CAEDE ... Curl is also an
    expression-based language ( former MIT Curl ) but their JavaScript app's
    have always been less powerful than what the somewhat LISP-like language is
    able to do ... making me wonder just how much work would be involved for
    Red.  To be clear, the result for that CAEDE effort has been that the full
    Curl language cannot be used for App's intended to be emitted as
    Javascript. I continue to find the full language far more useful in the
    case of Curl, but if Red runs on Android, this whole JS thing seems a low
    priority as a proposal.
    
    Or have I simply misunderstood?
    
    On 4 October 2015 at 07:13, PeterWAWood notifications@github.com wrote:
    
    > I have marked this issue as a wish and left it open to give some time for
    > a proposal to be written on the Red Github Wiki. There a growing number of
    > proposals on the wiki. They are listed on the front page of the wiki.
    > 
    > Looking at the current proposals, it very much seems as though we need to
    > provide some guidelines for proposal submitters.
    > 
    > It would be a help if you could at least come up with a first draft of a
    > proposal for a JavaScript emitter. The proposal should include a clear
    > definition of what is being proposed and the benefits of implementing the
    > proposal. Offers of help (or sponsorship) to implement the proposal would
    > be well received.
    > 
    > —
    > Reply to this email directly or view it on GitHub
    > https://github.com/red/red/issues/1369#issuecomment-145332227.

--------------------------------------------------------------------------------

On 2015-10-05T13:40:36Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1369#issuecomment-145530725>

    It would be helpful if general discussion related to Github issues could be held on Gitter rather than on the issue. Gitter provides a much better forum for discussions than here. It is integrated with GitHub. If you type #1369 in a Gitter message, it will automatically turn it into a hypertext link to this issue.
    
    Thanks.

--------------------------------------------------------------------------------

On 2015-10-05T20:13:10Z, arno-lee, commented:
<https://github.com/red/red/issues/1369#issuecomment-145654054>

    I see the following benefits of adding the JavaScript emitter to Red:
    - being able to use Node.js with its extensive set of ready to use frameworks for creation of web servers and other stuff. Targeting Android natively is good, but as it is a language does need extensive framework developers' support and the Red community obviously can't provide that kind of support to the extent of the JavaScript community with active members like Facebook. Targeting JavaScript would allow us to "cheat" and use those frameworks in the manner CoffeScript or Dart uses them without having to re-implement anything in Red
    - consequently the availability of miscellaneous useful frameworks like React, Ramda, Underscore, AngularJS etc. in Red would allow to target web and mobile development to the full extent, which is a really hot topic now, and I believe that features of Red may be appealing to web developers and improve their experience
    - having access to familiar libs and frameworks would smooth the learning and transition curve for those who wants to try Red, but wary
    - of time costs and technical risks of diving completely into some unknown technology. Red syntax itself is pretty tiny, so it would be enough for them to learn how to use already familiar frameworks in Red and explore new opportunities Red gives thereafter.
    - being able to add RedJS to NPM repository, thus simplifying and providing access to the language in a familiar way for developers
    
    The challenges here are as follows:
    - optimally mapping Red objects, function call protocols etc. to JavaScript so as to simplify the use of JavaScript frameworks without additional overhead
    - mapping Red implemented functions and objects back to JavaScript code so as to simplify their use in other languages and JavaScript itself
    - making the Red compiler emitted JavaScript code easily readable the way CoffeeScript does    efficiently mapping Red built-in vocabulary to JavaScript

--------------------------------------------------------------------------------

On 2015-10-05T22:19:41Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1369#issuecomment-145685951>

    Please move your proposal to the Red Github Wiki.

--------------------------------------------------------------------------------

On 2015-10-27T04:47:45Z, x8x, commented:
<https://github.com/red/red/issues/1369#issuecomment-151375237>

    @arno-lee +1

