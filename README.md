# System Design Fundamentals
Building scalable, production-ready applications is both art and science. Science, in that it requires knowledge of many topics in computer engineering; art, in that it demands an eye for making smart design choices and piecing together the right technologies.

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