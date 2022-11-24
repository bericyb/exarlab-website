---
title: "homelab.config"
date: 2022-09-05T21:49:10Z
draft: false
summary: "configuring my homelab"
---

# fun++

The majority of the fun in homelabbing is making your
network and systems exactly the way you want them to be. For the longest time I avoided
setting up a homelab just because I thought it was work, but it ended up being more
fun than work in the end.

Let me run you through what I set up for myself. Most of the things I talk about here 
are super basic or only specific only to me, but you may find some things that would 
apply to your own homelab. I'll cover setting up static local IPs, high level network segmentation, and dealing with a dynamic public IP. 

# config

- static local IP

Consumer grade routers, or at least all the ones I've ever owned, are just one of those 
things that randomly stop, start, restart, of their own freewill. This poses a problem for
servers. Every time a computer connects to a router it is assigned a local IP address
but it is not always the same. Without a static local IP it is nearly impossible to keep
specific rules for each device on your network. When a router restarts, and devices
reconnect, local IPs can be different from what they were. 

Instead of randomly getting assigned an IP from the router, in my dhcpc client config, I specified a special local IP for my server that will be the same every time the router and server are connected. This means that I can place special networking rules just for my server and connect locally without having to search for the right device on my network.
Speaking of special networking rules...

- network segmentation

Because my server is open to the internet, anyone who knows my IP can just hop right in
and start wrecking things. To prevent this I have segmented, or segregated, my network. Currently, all outside in traffic will get routed to the static local IP of my server and
not to any other IPs. This was a surprisingly easy thing to do! I won't go over 
the specifics because each router/modem is different, but mine had a simple Demilitarized Zone (DMZ) feature that allows me to place my server's IP in a "quarantine" away from other devices on my network.  

The nice thing about the DMZ feature is that I can disable firewalls and open all ports
for the specific local IP I have selected for ease of use. If for whatever reason 
I want to access other devices on my network, I can still have separate port forwarding 
rules for the safe side of my network. Nice!

- dynamic public IP

Because of where I physically live, the only ISP I can use is Xfinity by Comcast. 
Unfortunately, Xfinity does not provide a static IP and for the longest time, 
this hurdle made me avoid homelabbing. 
Without a static IP no one would be able to reliably connect to my server 
from outside my network. 

In fact, after setting up a Minecraft server for my in-laws, 
Xfinity had an outage while I was out of town and when they had come back online, my
servers public IP had changed. No one could connect, including myself. Hell, I couldn't
even ssh into the server to see what the IP was. I was locked out of my **OWN** 
computer. Comcast... 

So how can you reliably connect to your own network with a dynamic ip address? 
First, you're gonna need a domain name like exarlab.com. Now instead of using a
weird sequence of numbers as an IP, we will use our domain name to point to our actual 
IP. This pointing is done with the domain name service (DNS) like dnsExit. Luckily my 
router
allows me to send a request to dnsExit each time my IP address changes to update exarlab.
com to point to my new IP address. If your router doesn't have this feature, you can
simply run a script on your server to update the DNS with your current IP. 

# done...

And that's it for now! This is quite the landmark for me to reach. In the past, I never
made the extra effort to configure things to last. 

Often in our lives, we hesitate to execute on the things we want to do. This is 
something I've tried to remove from myself lately. I found myself wanting to play video 
games, set up a homelab, or work on a programming project, but instead wasting hours
on youtube watching 20 minute videos on about some TV show I couldn't care less about. 

Although this was a lot of configuration for something simple, I feel proud to have 
done it, and even though the dishes are pilling up in the sink, I feel less guilty 
than if I had just pointlessly watched YLYL Challenges. 

-Exar