- Make sure firewall is installed
    - UFW will do
        - Open 22***
        - Open 64738

- Assign ownership of /data according to uid and gid of murmur (for the sqlite database)
    `~ chown 106:109 data
