$TTL 86400
@   IN  NS  ns1.example.com.
ns1 IN  A   120.0.38.5
www IN  A   120.0.38.6
