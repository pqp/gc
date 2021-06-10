FROM ubuntu:20.04

WORKDIR /app

RUN apt update && apt full-upgrade -y
RUN apt install -y software-properties-common
RUN apt-add-repository -y ppa:mumble/release
RUN apt install mumble-server -y

CMD ["murmurd", "-v", "-fg"]