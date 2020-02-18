FROM debian:latest
MAINTAINER Konstantin (shaytan4@gmail.com)

# Install some tools in the container
RUN apt update -y
RUN  apt install -y atop nload iftop wget strace mc vim tmux mlocate man-db iotop zip tar unzip curl gnupg procps-ng hostname bind-utils iputils iproute net-tools nmap tcpdump telnet traceroute mtr openssh-clients nginx nmap-ncat rsync ftp jq git 

RUN curl -sL https://deb.nodesource.com/setup_12.x  | bash -
RUN apt-get -y install nodejs
RUN apt install -y install gcc-c++ make
#   $ kubectl run multitool --image=shaytan4/multitool --replicas=1

COPY index.html /usr/share/nginx/html/

# Copy a custom nginx.conf with log files redirected to stderr and stdout
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx-connectors.conf /etc/nginx/conf.d/

EXPOSE 80 

# Start nginx in foreground:
CMD ["nginx", "-g", "daemon off;"]
