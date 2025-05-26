FROM debian:trixie
ENV LANG=C.UTF-8    

# base
RUN apt-get update && apt-get -y install pipx git gcc && rm -rf /var/lib/apt/lists/*

# install all stuff w/ the install script
COPY ./files/install.sh /tmp/
RUN /tmp/install.sh && rm /tmp/install.sh

# run
COPY ./files/run.sh /opt/dlna-web/
CMD ["/opt/dlna-web/run.sh"]


