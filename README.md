# System Design Fundamentals
Building scalable, production-ready applications is both art and science. Science, in that it requires knowledge of many topics in computer engineering; art, in that it demands an eye for making smart design choices and piecing together the right technologies.

# Client Server Model
<h4>Client</h4>
<p>
  A machine or process that requests data or service from a server.
</p>
<p>
  Note that a single machine or piece of software can be both a client and a
  server at the same time. For instance, a single machine could act as a server
  for end users and as a client for a database.
</p>
<h4>Server</h4>
<p>
  A machine or process that provides data or service for a client, usually by
  listening for incoming network calls.
</p>
<p>
  Note that a single machine or piece of software can be both a client and a
  server at the same time. For instance, a single machine could act as a server
  for end users and as a client for a database.
</p>
<h4>Client—Server Model</h4>
<p>
  The paradigm by which modern systems are designed, which consists of clients
  requesting data or service from servers and servers providing data or service
  to clients.
</p>
<h4>IP Address</h4>
<p>
  An address given to each machine connected to the public internet. IPv4
  addresses consist of four numbers separated by dots: <b>a.b.c.d</b> where all
  four numbers are between 0 and 255. Special values include:
</p>
<ul>
  <li>
    <b>127.0.0.1</b>: Your own local machine. Also referred to as
    <b>localhost</b>.
  </li>
  <li>
    <b>192.168.x.y</b>: Your private network. For instance, your machine and all
    machines on your private wifi network will usually have the
    <b>192.168</b> prefix.
  </li>
</ul>
<h4>Port</h4>
<p>
  In order for multiple programs to listen for new network connections on the
  same machine without colliding, they pick a <b>port</b> to listen on. A port
  is an integer between 0 and 65,535 (2<sup>16</sup> ports total).
</p>
<p>
  Typically, ports 0-1023 are reserved for <i>system ports</i> (also called
  <i>well-known</i> ports) and shouldn't be used by user-level processes.
  Certain ports have pre-defined uses, and although you usually won't be
  required to have them memorized, they can sometimes come in handy. Below are
  some examples:
</p>
<ul>
  <li>22: Secure Shell</li>
  <li>53: DNS lookup</li>
  <li>80: HTTP</li>
  <li>443: HTTPS</li>
</ul>
<h4>DNS</h4>
<p>
Short for Domain Name System, it describes the entities and protocols involved in the
translation from domain names to IP Addresses. Typically, machines make a DNS query to
a well known entity which is responsible for returning the IP address (or multiple ones)
of the requested domain name in the response.
</p>

# Database

<h4>Databases</h4>
<p>
  Databases are programs that either use disk or memory to do 2 core things:
  <b>record</b> data and <b>query</b> data. In general, they are themselves
  servers that are long lived and interact with the rest of your application
  through network calls, with protocols on top of TCP or even HTTP.
</p>
<p>
  Some databases only keep records in memory, and the users of such databases
  are aware of the fact that those records may be lost forever if the machine or
  process dies.
</p>
<p>
  For the most part though, databases need persistence of those records, and
  thus cannot use memory. This means that you have to write your data to disk.
  Anything written to disk will remain through power loss or network partitions,
  so that’s what is used to keep permanent records.
</p>
<p>
  Since machines die often in a large scale system, special disk partitions or
  volumes are used by the database processes, and those volumes can get
  recovered even if the machine were to go down permanently.
</p>
<h4>Disk</h4>
<p>
  Usually refers to either <b>HDD (hard-disk drive)</b> or
  <b>SSD (solid-state drive)</b>. Data written to disk will persist through
  power failures and general machine crashes. Disk is also referred to as
  <b>non-volatile storage</b>.
</p>
<p>
  SSD is far faster than HDD (see latencies of accessing data from SSD and HDD)
  but also far more expensive from a financial point of view. Because of that,
  HDD will typically be used for data that's rarely accessed or updated, but
  that's stored for a long time, and SSD will be used for data that's frequently
  accessed and updated.
</p>
<h4>Memory</h4>
<p>
  Short for <b>Random Access Memory (RAM)</b>. Data stored in memory will be
  <u>lost</u> when the process that has written that data dies.
</p>
<h4 >Persistent Storage</h4>
<p>
  Usually refers to disk, but in general it is any form of storage that persists
  if the process in charge of managing it dies.
</p>

# Latency Throughput
<h4>Latency</h4>
<p>
  The time it takes for a certain operation to complete in a system. Most often
  this measure is a time duration, like milliseconds or seconds. You should know
  these orders of magnitude:
</p>
<ul>
  <li><b>Reading 1 MB from RAM</b>: 250 μs (0.25 ms)</li>
  <li><b>Reading 1 MB from SSD</b>: 1,000 μs (1 ms)</li>
  <li><b>Transfer 1 MB over Network</b>: 10,000 μs (10 ms)</li>
  <li><b>Reading 1MB from HDD</b>: 20,000 μs (20 ms)</li>
  <li><b>Inter-Continental Round Trip</b>: 150,000 μs (150 ms)</li>
</ul>
<h4>Throughput</h4>
<p>
  The number of operations that a system can handle properly per time unit. For
  instance the throughput of a server can often be measured in requests per
  second (RPS or QPS).
</p>

# Availability
<h4>Availability</h4>
<p>
  The odds of a particular server or service being up and running at any point
  in time, usually measured in percentages. A server that has 99% availability
  will be operational 99% of the time (this would be described as having two
  <b>nines</b> of availability).
</p>
<h4>High Availability</h4>
<p>
  Used to describe systems that have particularly high levels of availability,
  typically 5 nines or more; sometimes abbreviated "HA".
</p>
<h4>Nines</h4>
<p>
  Typically refers to percentages of uptime. For example, 5 nines of
  availability means an uptime of 99.999% of the time. Below are the downtimes
  expected per year depending on those 9s:
</p>
<pre>- 99% (two 9s): 87.7 hours
- 99.9% (three 9s): 8.8 hours
- 99.99%: 52.6 minutes
- 99.999%: 5.3 minutes
</pre>
<h4>Redundancy</h4>
<p>
  The process of replicating parts of a system in an effort to make it more
  reliable.
</p>
<h4>SLA</h4>
<p>
  Short for "service-level agreement", an SLA is a collection of guarantees
  given to a customer by a service provider. SLAs typically make guarantees on a
  system's availability, amongst other things. SLAs are made up of one or
  multiple SLOs.
</p>
<h4>SLO</h4>
<p>
  Short for "service-level objective", an SLO is a guarantee given to a customer
  by a service provider. SLOs typically make guarantees on a system's
  availability, amongst other things. SLOs constitute an SLA.
</p>

# Cache

<h4>Cache</h4>
<p>
  A piece of hardware or software that stores data, typically meant to retrieve
  that data faster than otherwise.
</p>
<p>
  Caches are often used to store responses to network requests as well as
  results of computationally-long operations.
</p>
<p>
  Note that data in a cache can become <b>stale</b> if the main source of truth
  for that data (i.e., the main database behind the cache) gets updated and the
  cache doesn't.
</p>
<h4>Cache Hit</h4>
<p>When requested data is found in a cache.</p>
<h4>Cache Miss</h4>
<p>
  When requested data could have been found in a cache but isn't. This is
  typically used to refer to a negative consequence of a system failure or of a
  poor design choice. For example:
</p>
<p>
  <i>
    If a server goes down, our load balancer will have to forward requests to a
    new server, which will result in cache misses.
  </i>
</p>
<h4>Cache Eviction Policy</h4>
<p>
  The policy by which values get evicted or removed from a cache. Popular cache
  eviction policies include <b>LRU</b> (least-recently used), <b>FIFO</b> (first
  in first out), and <b>LFU</b> (least-frequently used).
</p>
<h4>Content Delivery Network</h4>
<p>
  A <b>CDN</b> is a third-party service that acts like a cache for your servers.
  Sometimes, web applications can be slow for users in a particular region if
  your servers are located only in another region. A CDN has servers all around
  the world, meaning that the latency to a CDN's servers will almost always be
  far better than the latency to your servers. A CDN's servers are often referred
  to as <b>PoPs</b> (Points of Presence). Two of the most popular CDNs are
  <b>Cloudflare</b> and <b>Google Cloud CDN</b>.
</p>

# Proxy
<h4>Forward Proxy</h4>
<p>
  A server that sits between a client and servers and acts on behalf of the
  client, typically used to mask the client's identity (IP address). Note that
  forward proxies are often referred to as just proxies.
</p>
<h4>Reverse Proxy</h4>
<p>
  A server that sits between clients and servers and acts on behalf of the
  servers, typically used for logging, load balancing, or caching.
</p>
<h4>Nginx<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="_36tI9rYzSsMV4aoMxw-A5n"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  Pronounced "engine X"—not "N jinx", Nginx is a very popular webserver that's
  often used as a <b>reverse proxy</b> and <b>load balancer</b>.
</p>
<a href="https://www.nginx.com/" target="_blank">Learn more: <span>https://www.nginx.com/</span></a>

# Load Balancer
<h4>Load Balancer</h4>
<p>
  A type of <b>reverse proxy</b> that distributes traffic across servers. Load
  balancers can be found in many parts of a system, from the DNS layer all the
  way to the database layer.
</p>
<h4>Server-Selection Strategy</h4>
<p>
  How a <b>load balancer</b> chooses servers when distributing traffic amongst
  multiple servers. Commonly used strategies include round-robin, random
  selection, performance-based selection (choosing the server with the best
  performance metrics, like the fastest response time or the least amount of
  traffic), and IP-based routing.
</p>
<h4>Hot Spot</h4>
<p>
  When distributing a workload across a set of servers, that workload might be
  spread unevenly. This can happen if your <b>sharding key</b> or your <b>hashing function</b>
  are suboptimal, or if your workload is naturally skewed: some servers will
  receive a lot more traffic than others, thus creating a "hot spot".
</p>
<h4>Nginx<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="_36tI9rYzSsMV4aoMxw-A5n"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  Pronounced "engine X"—not "N jinx", Nginx is a very popular webserver that's
  often used as a <b>reverse proxy</b> and <b>load balancer</b>.
</p>
<a href="https://www.nginx.com/" target="_blank">Learn more: <span>https://www.nginx.com/</span></a>

# Hashing

<h4>Consistent Hashing</h4>
<p>
  A type of hashing that minimizes the number of keys that need to be remapped
  when a hash table gets resized. It's often used by load balancers to
  distribute traffic to servers; it minimizes the number of requests that get
  forwarded to different servers when new servers are added or when existing
  servers are brought down.
</p>
<h4>Rendezvous Hashing</h4>
<p>
  A type of hashing also coined <b>highest random weight</b> hashing. Allows for
  minimal re-distribution of mappings when a server goes down.
</p>
<h4>SHA</h4>
<p>
  Short for "Secure Hash Algorithms", the SHA is a collection of cryptographic
  hash functions used in the industry. These days, SHA-3 is a popular choice to
  use in a system.
</p>