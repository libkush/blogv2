+++
author = ["Kush"]
title = "Counting in Binary"
date = "2024-08-01"
description = "I feel like a lot of students are introduced to binary numbers in an algorithmic way to convert them into decimal and vice-versa without proper intuition of the binary system. Binary numbers don't feel like natural counting, but rather a mysterious encoding that magically works like encryption. This post will try to fix that."
type = "post"
math = true
+++

**Talking from experience**, a lot of mediocre teachers don't introduce binary numbers properly at all. They instead give you an algorithm to compute the binary representation of any given decimal number and hand it out to you without knowing why it is the way it is. Today, we are going to understand that process, but first we are going to learn to count.

## Counting

So, assume you are a toddler who is learning to count. You are given 10 different symbols, namely

$$
0, 1, 2, 3, 4, 5, 6, 7, 8\ and\ 9
$$

and are told that in this sequence each subsequent symbol represents the next number, formally known as the _successive_ number. So, we begin counting. We start with this symbol: $0$, then we say, by adding "one", we get this: $1$, then we get $2$ and so on until $9$. But then what? We ran out of all the symbols, so how do we show the successor of $9$?

Well, the decimal system invented the concept of place values. Since we ran out of digits to count, we just add another digit to the front of the previous one, and start counting again. Until now, that place didn't exist, so we could say we were counting

$$ 01, 02, 03 \ldots 09 $$ and now the "tenth" number is represented by adding one to the left side place, like so: $10$. Subsequent numbers can be counted again, starting from $11$ till $19$. After that, we complete the digits once again, so we add another digit on the tenth place (signifying that another set of 10 numbers has been added) to form $20$. We continue adding successive digits to the tens place until we reach $99$. Now how do we write the the successor of $99$? Well, we create another place which counts how many tens of tens have been completed. We completed tens nine times until now, and the successor of 99 will be the tenth ten. We also start naming every tenth ten as a hundred. When we count nine hundreds, we say the tenth hundred represents a _thousand_, and so on, each time adding a place to the left of the digits. All these places show how many powers of ten we reached until now.

If you observed our counting process carefully, you would notice that an increase in the rightmost digit signifies the increase in the factor of zeroth power of ten (just 1), the second rightmost digit increased the factor of first power of ten (tens), the third rightmost digit increased the factor of second power of ten (hundreds) and so on. Just by putting it this way, I am trying to make the _place value_ system which we learnt in primary school more intuitive.

Thus, we conclude by saying that any number, say $222011182$ is just

$$
2 \times 10^8 + 2 \times 10^7 + 2 \times 10^6 + 0 \times 10^5 + 1 \times 10^4 + 1 \times 10^3 + 1 \times 10^2 + 8 \times 10^1 + 2 \times 10^0
$$

## Counting with Two Digits

Well, we essentially repeat the same steps as above to count in binary. Just that this time, you don't have ten different symbols. You only have the symbols $0$ and $1$.

We start again with the number $0$. It's successor is $1$. Now we ran out of symbols, so we do the same thing as we did before .i.e, add a digit to the left. So the next number is $10$, followed by $11$. Now we ran out of digits again, so we add another digit to the left to get $100$, followed by $101, 110, 111$. We continue this process like so:

$$
\begin{matrix}
0\\
1\\
10\\
11\\
100\\
101\\
110\\
111\\
1000\\
1001\\
1010\\
1011\\
1100\\
1101\\
1110\\
1111
\end{matrix}
$$

Take a moment to observe that this is essentially the same process as before, we didn't invent some magical representation. It is just as natural as before, just that we don't have a lot of digits to count with. You might notice that every place in a number now signifies a power of two. Which means, the number 1100 is

$$
1 \times 2^3 + 1 \times 2^2 + 0 \times 2^1 + 0 \times 2^0
$$

You can evaluate this sum to get the decimal representation if you want, or you can keep it just like that. It doesn't really matter, they mean the same thing, just with a different set of symbols (or digits).

In fact, apart from the standard algorithm to convert decimals into binary, you can use some basic intuition too. If you want to represent the number 37, think of the largest number less than 37 which is a power of two. Well, $2^5$ is $32$, so the sixth place from the right is going to be a 1. Next, we are left with $37-32=5$. Now, $2^2$ is going to be $4$, so the third place from the right is going to be a 1. Next, we are left with $5-4=1$, so the first place from the right is going to be a 1.

The binary representation will be $100101$. It is really that easy.

{{< epigraph >}}
This of course, is only valid for natural counting numbers. We haven't touched integers or floating point numbers yet. However, the goal of this post was to only make you feel that the natural numbers in binary, are just as natural as decimals. If you want to learn more about binary representations used in computing, I would suggest reading Chapter 2 of the book "Computer Systems: A Programmer’s Perspective" by Randal Bryant. It's a wonderful book.
{{< /epigraph >}}