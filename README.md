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

# Relational Database

<h4>Relational Database</h4>
<p>
  A type of structured database in which data is stored following a tabular
  format; often supports powerful querying using SQL.
</p>
<h4>Non-Relational Database</h4>
<p>
  In contrast with relational database (SQL databases), a type of database that
  is free of imposed, tabular-like structure. Non-relational databases are often
  referred to as NoSQL databases.
</p>
<h4>SQL</h4>
<p>
  Structured Query Language. Relational databases can be used using a derivative
  of SQL such as PostgreSQL in the case of Postgres.
</p>
<h4>SQL Database</h4>
<p>
  Any database that supports SQL. This term is often used synonymously with
  "Relational Database", though in practice, not <i>every</i> relational
  database supports SQL.
</p>
<h4>NoSQL Database</h4>
<p>Any database that is not SQL-compatible is called NoSQL.</p>
<h4>ACID Transaction</h4>
<p>
  A type of database transaction that has four important properties:
</p>
<ul>
  <li>
    <b>Atomicity</b>: The operations that constitute the transaction will either
    all succeed or all fail. There is no in-between state.
  </li>
  <li>
    <b>Consistency</b>: The transaction cannot bring the database to an invalid
    state. After the transaction is committed or rolled back, the rules for each
    record will still apply, and all future transactions will see the effect of
    the transaction. Also named <b>Strong Consistency</b>.
  </li>
  <li>
    <b>Isolation</b>: The execution of multiple transactions concurrently will
    have the same effect as if they had been executed sequentially.
  </li>
  <li>
    <b>Durability</b>: Any committed transaction is written to non-volatile
    storage. It will not be undone by a crash, power loss, or network partition.
  </li>
</ul>
<h4>Database Index</h4>
<p>
  A special auxiliary data structure that allows your database to perform
  certain queries much faster. Indexes can typically only exist to reference
  structured data, like data stored in relational databases. In practice, you
  create an index on one or multiple columns in your database to greatly speed
  up <b>read</b> queries that you run very often, with the downside of slightly
  longer <b>writes</b> to your database, since writes have to also take place in
  the relevant index.
</p>
<h4>Strong Consistency</h4>
<p>
Strong Consistency usually refers to the consistency of ACID transactions, as opposed to <b>Eventual Consistency</b>.
</p>
<h4>Eventual Consistency</h4>
<p>
  A consistency model which is unlike <b>Strong Consistency</b>. In this model,
  reads might return a view of the system that is stale. An eventually
  consistent datastore will give guarantees that the state of the database will
  eventually reflect writes within a time period (could be 10 seconds, or
  minutes).
</p>
<h4>Postgres<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="_36tI9rYzSsMV4aoMxw-A5n"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  A relational database that uses a dialect of SQL called PostgreSQL. Provides
  ACID transactions.
</p>
<a href="https://www.postgresql.org/" target="_blank" class="_2HDna_Xo6tAd-QZodCVaIP">Learn more: <span class="Link Link--se _2jFzxkZcdWmXPz821xH3eM">https://www.postgresql.org/</span></a>

# Non Relational Database
<h4>Key-Value Store</h4>
<p>
  A Key-Value Store is a flexible NoSQL database that's often used for caching
  and dynamic configuration. Popular options include DynamoDB, Etcd, Redis, and
  ZooKeeper.
</p>
<h4>Etcd<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  Etcd is a strongly consistent and highly available key-value store that's
  often used to implement leader election in a system.
</p>
<a href="https://etcd.io/" target="_blank">Learn more: <span>https://etcd.io/</span></a></li><li><h4>Redis<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  An in-memory key-value store. Does offer some persistent storage options but is
  typically used as a really fast, best-effort caching solution. Redis is also often
  used to implement <b>rate limiting</b>.
</p>
<a href="https://redis.io/" target="_blank">Learn more: <span class="Link Link--se _2jFzxkZcdWmXPz821xH3eM">https://redis.io/</span></a></li><li><h4>ZooKeeper<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  ZooKeeper is a strongly consistent, highly available key-value store. It's
  often used to store important configuration or to perform leader election.
</p>
<a href="https://zookeeper.apache.org/" target="_blank" class="_2HDna_Xo6tAd-QZodCVaIP">Learn more: <span class="Link Link--se _2jFzxkZcdWmXPz821xH3eM">https://zookeeper.apache.org/</span></a>

# Specialized Storage Paradigms

<h4>Blob Storage</h4>
<p>
  Widely used kind of storage, in small and large scale systems. They don’t
  really count as databases per se, partially because they only allow the user
  to store and retrieve data based on the name of the blob. This is sort of like
  a key-value store but usually blob stores have different guarantees. They
  might be slower than KV stores but values can be megabytes large (or sometimes
  gigabytes large). Usually people use this to store things like
  <b>large binaries, database snapshots, or images</b> and other static assets
  that a website might have.
</p>
<p>
  Blob storage is rather complicated to have on premise, and only giant
  companies like Google and Amazon have infrastructure that supports it. So
  usually in the context of System Design interviews you can assume that you
  will be able to use <b>GCS</b> or <b>S3</b>. These are blob storage services
  hosted by Google and Amazon respectively, that cost money depending on how
  much storage you use and how often you store and retrieve blobs from that
  storage.
</p>
<h4>Time Series Database</h4>
<p>
  A <b>TSDB</b> is a special kind of database optimized for storing and
  analyzing time-indexed data: data points that specifically occur at a given
  moment in time. Examples of TSDBs are InfluxDB, Prometheus, and Graphite.
</p>
<h4>Graph Database</h4>
<p>
  A type of database that stores data following the graph data model. Data
  entries in a graph database can have explicitly defined relationships, much
  like nodes in a graph can have edges.
</p>
<p>
  Graph databases take advantage of their underlying graph structure to perform
  complex queries on deeply connected data very fast.
</p>
<p>
  Graph databases are thus often preferred to relational databases when dealing
  with systems where data points naturally form a graph and have multiple levels
  of relationships—for example, social networks.
</p>
<h4>Cypher</h4>
<p>
  A <b>graph query language</b> that was originally developed for the Neo4j
  graph database, but that has since been standardized to be used with other
  graph databases in an effort to make it the "SQL for graphs."
</p>
<p>
  Cypher queries are often much simpler than their SQL counterparts. Example
  Cypher query to find data in <b>Neo4j</b>, a popular graph database:
</p>
<pre>MATCH (some_node:SomeLabel)-[:SOME_RELATIONSHIP]-&gt;(some_other_node:SomeLabel {some_property:'value'})
</pre>
<h4>Spatial Database</h4>
<p>
  A type of database optimized for storing and querying spatial data like
  locations on a map. Spatial databases rely on spatial indexes like
  <b>quadtrees</b> to quickly perform spatial queries like finding all
  locations in the vicinity of a region.
</p>
<h4>Quadtree</h4>
<p>
  A tree data structure most commonly used to index two-dimensional spatial
  data. Each node in a quadtree has either zero children nodes (and is therefore
  a leaf node) or exactly four children nodes.
</p>
<p>
  Typically, quadtree nodes contain some form of spatial data—for example,
  locations on a map—with a maximum capacity of some specified number <b>n</b>.
  So long as nodes aren't at capacity, they remain leaf nodes; once they reach
  capacity, they're given four children nodes, and their data entries are split
  across the four children nodes.
</p>
<p>
  A quadtree lends itself well to storing spatial data because it can be
  represented as a grid filled with rectangles that are recursively subdivided
  into four sub-rectangles, where each quadtree node is represented by a
  rectangle and each rectangle represents a spatial region. Assuming we're
  storing locations in the world, we can imagine a quadtree with a maximum
  node-capacity <b>n</b> as follows:
</p>
<ul>
  <li>
    The root node, which represents the entire world, is the outermost
    rectangle.
  </li>
  <li>
    If the entire world has more than <b>n</b> locations, the outermost
    rectangle is divided into four quadrants, each representing a region of the
    world.
  </li>
  <li>
    So long as a region has more than <b>n</b> locations, its corresponding
    rectangle is subdivided into four quadrants (the corresponding node in the
    quadtree is given four children nodes).
  </li>
  <li>
    Regions that have fewer than <b>n</b> locations are undivided rectangles
    (leaf nodes).
  </li>
  <li>
    The parts of the grid that have many subdivided rectangles represent densely
    populated areas (like cities), while the parts of the grid that have few
    subdivided rectangles represent sparsely populated areas (like rural areas).
  </li>
</ul>
<p>
  Finding a given location in a perfect quadtree is an extremely fast operation
  that runs in <b>log<sub>4</sub>(x)</b> time (where <b>x</b> is the total
  number of locations), since quadtree nodes have four children nodes.
</p>
<h4>Google Cloud Storage<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>GCS is a blob storage service provided by Google.</p>
<a href="https://cloud.google.com/storage" target="_blank">Learn more: <span>https://cloud.google.com/storage</span></a><h4>S3<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  S3 is a blob storage service provided by Amazon through
  <b>Amazon Web Services (AWS)</b>
</p>
<a href="https://aws.amazon.com/s3/" target="_blank">Learn more: <span>https://aws.amazon.com/s3/</span></a><h4>InfluxDB<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>A popular open-source time series database.</p>
<a href="https://www.influxdata.com/" target="_blank">Learn more: <span>https://www.influxdata.com/</span></a><h4>Prometheus<div class="HZQeFFe9nh10ua4HjgqxH _2-XmJkh_v57HoeUaDUmu2z" data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="_36tI9rYzSsMV4aoMxw-A5n"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  A popular open-source time series database, typically used for monitoring
  purposes.
</p>
<a href="https://prometheus.io/" target="_blank">Learn more: <span>https://prometheus.io/</span></a><h4>Neo4j<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="_36tI9rYzSsMV4aoMxw-A5n"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  A popular graph database that consists of <b>nodes</b>, <b>relationships</b>,
  <b>properties</b>, and <b>labels</b>.
</p>
<a href="https://neo4j.com/" target="_blank">Learn more: <span class="Link Link--se _2jFzxkZcdWmXPz821xH3eM">https://neo4j.com/</span></a>

# Replication And Sharding

<h4>Replication</h4>
<p>
  The act of duplicating the data from one database server to others. This
  is sometimes used to increase the redundancy of your system and
  tolerate regional failures for instance. Other times you can use
  replication to move data closer to your clients, thus decreasing
  the latency of accessing specific data.
</p>
<h4>Sharding</h4>
<p>
  Sometimes called <b>data partitioning</b>, sharding is the
  act of splitting a database into two or more pieces called
  <b>shards</b> and is typically done to increase the throughput
  of your database. Popular sharding strategies include:
</p>
<ul>
  <li>Sharding based on a client's region</li>
  <li>Sharding based on the type of data being stored (e.g: user data gets
      stored in one shard, payments data gets stored in another
      shard)</li>
  <li>Sharding based on the hash of a column (only for structured
      data)</li>
</ul>
<h4>Hot Spot</h4>
<p>
  When distributing a workload across a set of servers, that workload might be
  spread unevenly. This can happen if your <b>sharding key</b> or your <b>hashing function</b>
  are suboptimal, or if your workload is naturally skewed: some servers will
  receive a lot more traffic than others, thus creating a "hot spot".
</p>

# Leader Election

<h4>Leader Election</h4>
<p>
  The process by which nodes in a cluster (for instance, servers in a set of
  servers) elect a so-called "leader" amongst them, responsible for the primary
  operations of the service that these nodes support. When correctly
  implemented, leader election guarantees that all nodes in the cluster know
  which one is the leader at any given time and can elect a new leader if the
  leader dies for whatever reason.
</p>
<h4>Consensus Algorithm</h4>
<p>
  A type of complex algorithms used to have multiple entities agree on a single
  data value, like who the "leader" is amongst a group of machines. Two popular
  consensus algorithms are <b>Paxos</b> and <b>Raft</b>.
</p>
<h4>Paxos &amp; Raft</h4>
<p>
  Two consensus algorithms that, when implemented correctly, allow for the
  synchronization of certain operations, even in a distributed setting.
</p>
<h4>Etcd<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  Etcd is a strongly consistent and highly available key-value store that's
  often used to implement leader election in a system.
</p>
<a href="https://etcd.io/" target="_blank">Learn more: <span>https://etcd.io/</span></a><h4>ZooKeeper<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  ZooKeeper is a strongly consistent, highly available key-value store. It's
  often used to store important configuration or to perform leader election.
</p>
<a href="https://zookeeper.apache.org/" target="_blank" class="_2HDna_Xo6tAd-QZodCVaIP">Learn more: <span class="Link Link--se _2jFzxkZcdWmXPz821xH3eM">https://zookeeper.apache.org/</span></a>

# Pear To Pear Network

<h4>Peer-To-Peer Network</h4>
<p>
  A collection of machines referred to as peers that divide a workload between
  themselves to presumably complete the workload faster than would otherwise be
  possible. Peer-to-peer networks are often used in file-distribution systems.
</p>
<h4>Gossip Protocol</h4>
<p>
  When a set of machines talk to each other in a uncoordinated manner in a
  cluster to spread information through a system without requiring a central
  source of data.
</p>

# Polling And Streaming

<h4>Polling</h4>
<p>
  The act of fetching a resource or piece of data regularly at an interval to
  make sure your data is not too stale.
</p>
<h4>Streaming</h4>
<p>
  In networking, it usually refers to the act of continuously getting a feed of
  information from a server by keeping an open connection between the two
  machines or processes.
</p>

# Configuration

<h4>Configuration</h4>
<p>
  A set of parameters or constants that are critical to a system. Configuration
  is typically written in <b>JSON</b> or <b>YAML</b> and can be either <b>static</b>, meaning
  that it's hard-coded in and shipped with your system's application code (like
  frontend code, for instance), or <b>dynamic</b>, meaning that it lives outside
  of your system's application code.
</p>

# Rate Limiting

<h4>Rate Limiting</h4>
<p>
  The act of limiting the number of requests sent to or from a system. Rate
  limiting is most often used to limit the number of incoming requests in order
  to prevent <b>DoS attacks</b> and can be enforced at the IP-address level, at the
  user-account level, or at the region level, for example. Rate limiting can
  also be implemented in tiers; for instance, a type of network request could be
  limited to 1 per second, 5 per 10 seconds, and 10 per minute.
</p>
<h4>DoS Attack</h4>
<p>
  Short for "denial-of-service attack", a DoS attack is an attack in which a
  malicious user tries to bring down or damage a system in order to render it
  unavailable to users. Much of the time, it consists of flooding it with
  traffic. Some DoS attacks are easily preventable with rate limiting, while
  others can be far trickier to defend against.
</p>
<h4>DDoS Attack</h4>
<p>
  Short for "distributed denial-of-service attack", a DDoS attack is a DoS
  attack in which the traffic flooding the target system comes from many
  different sources (like thousands of machines), making it much harder to
  defend against.
</p>
<h4>Redis<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  An in-memory key-value store. Does offer some persistent storage options but is
  typically used as a really fast, best-effort caching solution. Redis is also often
  used to implement <b>rate limiting</b>.
</p>
<a href="https://redis.io/" target="_blank" class="_2HDna_Xo6tAd-QZodCVaIP">Learn more: <span>https://redis.io/</span></a>

# Logging And Monitoring

<h4>Logging</h4>
<p>
  The act of collecting and storing logs--useful information about events in
  your system. Typically your programs will output log messages to its STDOUT
  or STDERR pipes, which will automatically get aggregated into a <b>centralized
  logging solution</b>.
</p>
<h4>Monitoring</h4>
<p>
  The process of having visibility into a system's key metrics, monitoring is
  typically implemented by collecting important events in a system and
  aggregating them in human-readable charts.
</p>
<h4>Alerting</h4>
<p>
  The process through which system administrators get notified when critical
  system issues occur. Alerting can be set up by defining specific thresholds
  on monitoring charts, past which alerts are sent to a communication channel
  like Slack.
</p>

# Publish/Subscribe Pattern

<h4>Publish/Subscribe Pattern</h4>
<p>
  Often shortened as <b>Pub/Sub</b>, the Publish/Subscribe pattern is a popular
  messaging model that consists of <b>publishers</b> and <b>subscribers</b>.
  Publishers publish messages to special <b>topics</b> (sometimes called
  <b>channels</b>) without caring about or even knowing who will read those
  messages, and subscribers subscribe to topics and read messages coming through
  those topics.
</p>
<p>
  Pub/Sub systems often come with very powerful guarantees like
  <b>at-least-once delivery</b>, <b>persistent storage</b>, 
  <b>ordering</b> of messages, and <b>replayability</b> of messages.
</p>
<h4>Idempotent Operation</h4>
<p>
  An operation that has the same ultimate outcome regardless of how many times
  it's performed. If an operation can be performed multiple times without
  changing its overall effect, it's idempotent. Operations performed through a
  <b>Pub/Sub</b> messaging system typically have to be idempotent, since Pub/Sub
  systems tend to allow the same messages to be consumed multiple times.
</p>
<p>
  For example, increasing an integer value in a database is <i>not</i> an
  idempotent operation, since repeating this operation will not have the same
  effect as if it had been performed only once. Conversely, setting a value to
  "COMPLETE" <i>is</i> an idempotent operation, since repeating this operation
  will always yield the same result: the value will be "COMPLETE".
</p>
<h4>Apache Kafka<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  A distributed messaging system created by LinkedIn. Very useful
  when using the <b>streaming</b> paradigm as opposed to <b>polling</b>.
</p>
<a href="https://kafka.apache.org/" target="_blank">Learn more: <span>https://kafka.apache.org/</span></a><h4>Cloud Pub/Sub<div data-tip="This is a technology or product that you can use in your systems." data-for="tooltip-generic" currentitem="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M216.056 509.316l197.488-340.044c4.471-7.699-1.87-17.173-10.692-15.973l-131.364 17.855L302.875 6.372c1.058-5.555-6.104-8.738-9.518-4.231L99.183 258.451c-5.656 7.465.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-1.145 5.917 6.85 8.914 9.877 3.702z" fill="#c00030"></path><path d="M159.905 240.287c-3.627.29-6.036-3.675-4.108-6.76L300.976 1.241c-2.16-1.709-5.56-1.819-7.619.899L99.183 258.45c-5.656 7.466.333 18.08 9.647 17.1l144.828-15.245-47.479 245.308c-.64 3.309 1.592 5.637 4.201 6.194l81.359-257.447c3.814-12.067-5.808-24.156-18.423-23.146l-113.411 9.073z" fill="#ff0040"></path></svg></div></h4>
<p>
  A highly-scalable Pub/Sub messaging service created by Google. Guarantees
  <b>at-least-once delivery</b> of messages and supports "rewinding" in order to
  reprocess messages.
</p>
<a href="https://cloud.google.com/pubsub/" target="_blank">Learn more: <span>https://cloud.google.com/pubsub/</span></a>