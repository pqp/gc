FROM ubuntu:20.04

WORKDIR /app

RUN apt update && apt full-upgrade -y
RUN apt install dnsmasq -y

CMD ["dnsmasq", "-C", "config/dnsmasq.conf", "--no-daemon", "--log-queries"]