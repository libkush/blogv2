+++
author = ["Kush"]
title = "The Chronicles of Kush.in"
date = "2024-07-06"
description = "This is the history of my blog. This blog has gone through several overhauls since I began writing in 2022. It is time I share the journey of how this blog came to be what it is right now, and some of the reasons behind major overhauls."
type = "post"
toc = true
math = true
+++

The domain for this website was bought by my father some time after I was born (in 2006) and created a simple website shortly after{{< marginnote >}}I don't exactly remember the tech stack for obvious reasons{{< /marginnote >}}. Later when I began to explore web development, I took over the domain and hosted some of my stuff on the subdomains. In 10th grade, I thought using React to build a math solving website would be cool, so [I did](https://math.kush.in/). That thing probably has archaic code right now, thanks cloudflare for keeping it running.

## BytePost

Unlike most of my projects that never get finished, my blog is an exceptional project that got finished not once, but several times over. I started out with [Jekyll](https://jekyllrb.com/), because some jekyll theme probably landed on my github feed, and I thought it would be really cool to copy that template for a blog whose contents I was not entirely prepared for. Turns out, I wasn't quite good at HTML and CSS at the time{{< marginnote >}}Although who says I am now XD{{< /marginnote >}}. But after what seemed like a tremendous effort of borrowing someone's code to implement a dark theme, adding an option to switch was a real achievement. More effort was made into thinking of a name for this blog than what posts to write in it.

While writing this article, I realised wayback machine didn't archive the old blog, and I don't happen to have access to the old code as well, so I guess an old screenshot from a chat of mine should suffice.

{{< figure
  src="bytepost.png"
  label="mn-export-import"
  caption="This was bytepost, my old blog. Hey, don't make fun of me this was 2021 and I was 15"
>}}

This was just the blog, the [landing page](https://web.archive.org/web/20220129101307/https://www.kush.in/) for my website was different. By different, I mean very bad. It was a cesspool of all bad practices one could possibly implement in a website (never knew about lighthouse back then).

After a significant time of sticking with this cringe worthy page, I came to explore the YavaScript world beyond React. [Fireship](https://www.youtube.com/c/fireship) made me use sveltekit, and what better way of exploring a new framework than rewriting my blog. So that's what I did.

## The Website With SvelteKit

Here too, I started out with some template, but ended up making so many changes that I would barely call it a copy. I watched a couple of [Hyperplexed](https://www.youtube.com/@Hyperplexed)'s videos to bloat the entire website with a ton of css and fancy animations, only to gradually remove them one by one until it was minimalistic enough for me again. [This](https://web.archive.org/web/20230707135853/https://www.kush.in/) is what I ended up with. In terms of design choices, it was pretty decent. It was also fast enough, as sveltekit has SSG.

This website stuck around for quite a while, BytePost had been removed and the blog and landing page were consolidated into one website. It had an aesthetic look and decent performance. I tweaked it several times to get perfect lighthouse scores, and everything was really good and stable.

That was only until I was made aware of the harsh reality of the javascript world, I had to keep updating my code for every little breaking change sveltekit went through. A lot of the things didn't work as expected, $ \LaTeX $ wasn't supported. And it was just a terrible experience trying to maintain a codebase which I wanted to forget about. I spent more time on tweaking the javascript for a dead simple static site than actually writing any content.

## New Goals In Mind

I came across [Tufte CSS](https://edwardtufte.github.io/tufte-css/) a while ago, and really wanted a blog with all those features. I wanted them so badly that for a moment I was considering to write raw HTML like Tufte CSS's example page for every blog post. However, I had other plans too. I had been looking at a couple of [hugo](https://gohugo.io/) themes which had tufte's features. After several months of mere planning and exploring the idea was finalized. The following were roughly my goals for making this blog:

- Negligible, or no javascript dependencies.
- All the features and aesthetics of [Tufte CSS](https://edwardtufte.github.io/tufte-css/).
- Support for $ \LaTeX $
- Blazingly fast page speeds and minimalism.

I did find a [suitable template](https://github.com/loikein/hugo-tufte) which satisfied the first three requirements. However, as I began using them I had to customize a lot of minor things to get what I wanted. In the end, I got a lot more than what I had expected when starting out which is a different saga altogether. I hope to cover the details of this new blog on a different post.