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