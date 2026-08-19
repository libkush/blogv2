+++
author = ["Kush"]
title = "How Hard Can It Possibly Be?"
date = "2026-07-26"
description = "How hard can self hosting an email server possibly be?"
type = "post"
math = false
+++

Everything I do in software engineering starts with me thinking to myself, "how hard can it possibly be" even though everybody else suggests otherwise. I have been an avid self-hoster ever since I began my journey in tech. In fact, you could say that I began my journey in tech because I wanted to host things. Something about having a personal machine that never shuts down, and whatever you put on it always keeps running gives an immense sense of pride to me. Now I am just like Google and Microsoft. My personal stuff, adblocking DNS server, discord bot, bookmark manager never goes down. And it always stays mine, no matter what. One of those things which wise people advice against, is self-hosting your email. But why?

## The Email Problem

So how hard can hosting your own email possibly be? You have a domain, you have a server. What's stopping you? The answer is -- A LOT OF THINGS

My research led me to Postfix and Exim. But of course, reading the documentation and actually trying to setup everything gave me a stroke. So I did the right thing. I tried [Mailcow](https://mailcow.email/). Now in my first attempt, I was an amateur kid in a pre-AI internet, and things were constantly going wrong while trying to install it on my server. Things like SELinux and stuff, which were terrifying to me. So I stopped. But years later I came across and awesome project called [Mox](https://www.xmox.nl/) on the HN frontpage. And it was so tempting, I had to do it.

My first intuition was to simply use the existing Oracle Cloud Free Tier instances which I had. Then I learned something the hard way. Something very awful. Oracle simply would not allow users to connect to an external host's port 25 through it's public IPs. It simply won't. But okay, I have credits in Google Cloud and Azure, what about those? NOPE. Heck, even my own ISP, the internet that I pay for, will not allow outbound port 25 connections. To this day, this sounds extremely absurd to me. How did we get here? Most people say it is to prevent spammers. But please, be honest. It smells we have a monopoly here. And you want to keep it that way. Imagine people setting up their own mail servers, hah. Who's gonna pay you then, innit?

Alright! I said. So who does allow port outbound 25 connections? Turns out only a handful of providers allow outbound port 25 connections by default -- OVH being one of them. So I made a temporary VM in OVH. It was kinda cheap, so I went for it to try. I successfully setup Mox after some trial and error. But it worked. Or so I thought.

Enter *Domain Name System-based Blackhole Lists*. Yes, the thing which makes you pay the price for someone else's actions. When I sent an email from my server, it went straight to spam. Turns out, the Mox log saying that my IP was blacklisted was in fact, very true. My IPv6 address assigned by OVH was in a DNSBL maintained by [SpamHaus](http://spamhaus.com/). So I wrote an unlisting request. They politely refused. They only remove an entire /64 IPv6 prefix at once. And since OVH has assigned me only one address in the blacklisted prefix, they can't do anything about it. So I temporarily made it work with binding Mox to just the IPv4.

But holy smokes, when it was up, I was so proud. My domain, my machine and my inbox. FREEDOM.

## It Is Pathetic That You Must Go Through This

Any sane person who values their time would have not gone through what I had to. It is actually pathetic. How hard can it possibly be? Not that much in theory, but very hard otherwise. Even when you go hunting for relay providers. You end up with approximately 5 good choices. And all of them are expensive for what they do. AWS SES is the least expensive one, but again, it is AWS ¯\_(ツ)_/¯

It pissed me off so much so, that I began reading RFCs. RFC 5322, 7489, 6376, 7208, and so on. I briefly mentioned about this in my [previous blog post.](/we-should-read-rfcs/)

Then, I wanted to implement them. So I made [raven](https://github.com/synqronlabs/raven). To any experienced readers out there, forgive me if I didn't follow the best practices for writing a Go library, it's my first time. But when I finished it, an idea was already forming in my mind.

## Raven

I made this library because I could not find the analog of HTTP libraries for SMTP. I had a look at [Haraka](https://haraka.github.io/), but it's not a library. It doesn't let me define my callbacks like a library would. It has a wonderful plugin ecosystem, but it's not exactly what I wanted. Sure, there are a couple of libraries available too. But none had everything I wanted, the way I wanted. I was inspired by Mox's codebase, and more importantly, it's adherence to the protocols.

Finally, I what I wanted was an email service that I can customize, that I can program. And is cheap.

## Enter mxRaven

[mxRaven](https://mxraven.com/) is the result of the vision I had for a mail service. I can program what happens when an email enters or exits. I can blur the boundaries between these terms like MTAs, MSAs and MUAs. mxRaven tries to do some of that. It gives you the autonomy to route your inbound and outbound mail the way you want.

You can build whatever you want on top of mxRaven. You can build user inboxes and groupware, you can build marketing campeigns, you can use it as a relay for your open-source software of choice, you can use it to run a honeypot for blacklisting spammers. You can make it a smarthost for your personal self-hosted mailbox like mailcow. You can build an entire SaaS on top of mxRaven.

You can dynamically create listeners and rules on the fly, use it for Agentic workflows. Build new integrations, use email as a flexible medium like push notifications, and so on. My point is, democratize SMTP. I don't want email to be a monopoly.

Which is why, even the library which mxRaven uses for SMTP stuff is MIT Licensed on [GitHub](https://github.com/synqronlabs/raven). Build your own mxRaven, for all I care. Indeed, how hard can it possibly be!
