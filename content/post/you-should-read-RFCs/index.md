+++
author = ["Kush"]
title = "We Should Read More RFCs"
date = "2026-05-09"
description = "Have you ever thought about how limited your imagination is? What we think is 'original' is never really novel, or out of this world. It is just an amalgamation of existing ideas in your head arranged in a novel way."
type = "post"
+++

Every now and then I come across peers in college who are brilliant students. They learn everything the curriculum has to offer. They score good GPA. The only problem is, everybody simply never seems to know what to do with what they just learned. 

I can't count the number of students who work so hard for academics, LeetCode, programming tutorials for projects, system design courses (that's new btw) etc, but as soon as I start talking about DNS nameservers, TLS, HTTP reverse proxies, forward proxies, VPNs (not the commercial ones only job is to provide exit nodes), they just stare at me and contemplate what all of their syllabi was for.

## It's Exclusive for Our Generation

It seems like the boomers who grew up having to install operating systems from floppy disks have better knowledge of how computers' internals and the internet protocols have been built, since they had no choice but to get their hands messy with the raw stuff that everything was being built upon. However, I keep worrying about how unaware today's graduates (at least from where I am from) are about the various standards, protocols and conventions that today's information highway is built upon.

## Everyday Examples in Academia Would Certainly Help

I don't know why academia is just so *academic*. Every professor I meet seems to be under a hurry to publish a new paper with yet another application of some neural network solving some issue in the most unpractical way.

If only my Computer Networks professor{{< marginnote >}}I am trying really hard to not deviate from the topic and rant about how incomptent retarded and arrogant leeches most Indian professors are, but that is a topic for another time{{</ marginnote >}} showed us, or at least led us to websites such as ARIN, APNIC etc., explained us what AS numbers are, what BGP is, used netcat to make us type out a real HTTP GET request over the TCP socket, things would have been so helpful and relevant.

I was blown away when I first saw someone hand write an HTTP request in the terminal using netcat. So you say that all these express.js endpoints I wrote was just some code that makes these computers communicate over text? Just like how we write formal letters? No I know it's called the *Hypertext Transfer Protocol* for a reason, but damn! That's truly empowering to know for someone who grew up with everything that just works — javascript frameworks, browsers, devtools in those browsers.

I know if some older audience is reading this they might find this weird. It is so obvious to most experienced engineers that HTTP is just a specification to communicate over a TCP socket. But it was not to me. At the moment I thought, maybe when I join college they'll teach us. But surprisingly, they never did!

They talked about the OSI and TCP/IP layers as if they are some constructs beyond comprehension for ordinary humans. Each layer is an opaque black box with some roles and procedures to follow, already implemented by smart aliens who handed out us these textbooks to pass in our exams.

We learned how bellman ford algorithm helps in deriving the routing table for every router in the network. But we never actually ever opened up a router and saw the table with our own eyes.

## My Expeditions Lead Me Here

So they told me how self-hosting email was hard and one must never do it. I hate being told that I cannot do something, unless it is me telling it to myself.

I self-hosted email with open-source software like mailcow. {{< marginnote >}}No I know I know I should have configured Postfix myself if I really cared about the challenge.{{</ marginnote >}} I learned about the entire DNS system, PTR records for IP addresses, DNSBLs and everything that got in my way.

I self hosted my authoritative DNS with BIND, tried to get myself off of DNSBLs unsuccessfully. But here's the thing. I never knew all of this before reading RFCs and long BIND documentation.

Then I set out on an even more ambitious journey: reading ALL the RFCs for SMTP and the modern authentication protocols (DKIM, SPF, DMARC, ARC, SMTPUTF8 and so on) to build my own SMTP server/client library. It was a really long but highly rewarding rabbithole, and I believe every CS major must go through.

## What To Do

It is quite surprising that so many of my peers simply do not know that there's something called a server.

By all means, please get yourself a server in any cloud provider of choice. Just get a publically reachable machine that you can SSH into. Host stuff you like. Host your websites, VPNs, mailboxes, databases. Host everything. Ocassionally mess up your firewall or SSH keys and lock yourself out. Troubleshoot DNS issues, troubleshoot file permission issues, figure out when SELinux doesn't allow you to do what you wanted, handle crashing applications.

Write your own implementations for popular internet standards such as DNS, HTTP or SMTP in the programming language of your choice. Learn what happens when you enter a URL in your browser's addressbar and hit enter!

Above all, read RFCs and documentation to know how everything you use came to be. That is the only way.

When you do all of that, it will become quite clear what you can do with all those algorithms, object-oriented programming principles, network concepts or operating system courses they taught you in school.

I can't imagine how bad it must be for people who are required to remember so much without knowing that it is the very thing that they use in their everyday life thousands of times. Yes, your browser sends the same DNS, HTTP requests, parses the same HTML and CSS as the standards have written about, right in front of your eyes. It's not rocket science after all!
