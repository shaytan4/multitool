FROM debian:latest
MAINTAINER Konstantin (shaytan4@gmail.com)

# Install some tools in the container
RUN apt-get update -y
RUN  apt-get install -y atop htop nload iftop wget strace mc vim tmux mlocate man-db iotop zip tar unzip curl gnupg net-tools nmap tcpdump telnet traceroute mtr nginx nmap rsync ftp jq git elinks 

RUN curl -sL https://deb.nodesource.com/setup_12.x  | bash -
RUN apt-get -y install nodejs
RUN apt-get install -y install gcc-c++ make
#   $ kubectl run multitool --image=shaytan4/multitool --replicas=1

COPY index.html /usr/share/nginx/html/

# Copy a custom nginx.conf with log files redirected to stderr and stdout
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx-connectors.conf /etc/nginx/conf.d/

EXPOSE 80 

# Start nginx in foreground:
CMD ["nginx", "-g", "daemon off;"]
