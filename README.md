* GC

This is a collection of Docker containers that compose the servers and bots that we use in GC.

** Installing

** Configuring

*** Make sure your firewall is configured--UFW will do in a pinch.
    - Open SSH port (default: 22)
    - Open 64738 for Mumble

*** Generate a private SSL cert
- `$ openssl dhparam -out dhparam-2048.pem 2048

*** Assign ownership of /data according to uid and gid of murmur (for the sqlite database)
- `$ chown 106:109 data

** Considerations

*** Configure proper Ice endpoints
 in mumble-server.ini:
 `
ice="tcp -h mumble -p 6502"

in mumble-json.py:

proxy = comm.stringToProxy('Meta -e 1.0:tcp -h mumble -p ' + str(ICE_PORT))

Make sure dnsmasq is properly configured.

youtube will block your IP if you hit its ipv6 address too many times, it seems