
#2996: Consider using HTTPS on red-lang.org
================================================================================
Issue is closed, was reported by wiktor-k and has 12 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2996>

Hello,

Currently the main site, including [downloads](http://www.red-lang.org/p/download.html) is served using plain HTTP. Please consider switching to HTTPS ([Let's Encrypt](https://letsencrypt.org/) have free SSL certificates). Downloading executable over HTTP is insecure.

Maybe it would be also good to use [code signing](https://www.certum.eu/certum/cert,offer_en_open_source_cs.xml) to further decrease the chance of antivirus complaining about the red executable.

Thank you for this excellent tool!


Comments:
--------------------------------------------------------------------------------

On 2017-09-14T04:58:32Z, dockimbel, commented:
<https://github.com/red/red/issues/2996#issuecomment-329371847>

    We already tried using Certum services, and they are very bad, the web site is so buggy, that you need to hack the HTML/JS code to be able to actually purchase such certificate. Then just generating the keys is a very painful process, again because of bugs. I would recommend anyone just avoiding Certum at all, and using a more professional company to acquire a certificate.
    
    For switching to HTTPS download, that would be desirable, though, it would kill the download performance for users in China, because the great firewall purposely slows down encrypted traffic, often to the point of generating time-outs. That would force our users in China to switch to a VPN in order to be able to download it reliably. Though, we could redirect to a local server in China to workaround such issues, but that's extra work for our currently limited resources. 
    
    An alternative to switching to encrypted mode, is to provide a hash of the binaries, so you can verify the integrity. That should provide a higher safety level, while not requiring too much server-side work for us.
    
    Anyway, we'll see what we can do to improve that.

--------------------------------------------------------------------------------

On 2017-09-15T08:38:42Z, wiktor-k, commented:
<https://github.com/red/red/issues/2996#issuecomment-329719352>

    Thanks for the context, now I understand your position better.
    
    I think offering HTTPS along with HTTP on red.org could be a good middle ground, people that want encrypted traffic could still manually use https: while people in China can keep using http:.
    
    Another option would be to provide binaries in GitHub Releases page (not just the source code). Since GitHub is using https that could be the easiest way.

--------------------------------------------------------------------------------

On 2017-09-15T10:34:25Z, dockimbel, commented:
<https://github.com/red/red/issues/2996#issuecomment-329745842>

    > Another option would be to provide binaries in GitHub Releases page (not just the source code). Since GitHub is using https that could be the easiest way.
    
    Not an option for us as we need easy access to rich download stats (unless GitHub Releases page now provides such information?).

--------------------------------------------------------------------------------

On 2017-09-15T11:14:18Z, wiktor-k, commented:
<https://github.com/red/red/issues/2996#issuecomment-329753386>

    I don't think they do.
    
    So maybe just integrity hashes (SHA256) for binaries on GitHub releases? That'd be secure as hashes would be served on HTTPS and you wouldn't have to setup HTTPS on your server.

--------------------------------------------------------------------------------

On 2017-09-15T12:25:35Z, dockimbel, commented:
<https://github.com/red/red/issues/2996#issuecomment-329767683>

    @wiktor-k Thanks, that's an interesting and cheap option we need to look into.

--------------------------------------------------------------------------------

On 2018-03-27T08:06:42Z, dockimbel, commented:
<https://github.com/red/red/issues/2996#issuecomment-376434483>

    We have switched the download section to HTTPS since a month.
    We have just switched the main red-lang.org site to HTTPS, as Google just enabled today that feature on Blogger for custom domains. \o/

