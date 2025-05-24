FROM debian:trixie
ENV LANG=C.UTF-8    

# base
RUN apt-get update && apt-get -y install pipx git gcc && rm -rf /var/lib/apt/lists/*
RUN pipx install uv && /root/.local/bin/uv python install 3.8 && ~/.local/bin/uv python pin 3.8

COPY ./files/install.sh /tmp/
RUN /tmp/install.sh && rm /tmp/install.sh

COPY ./files/run.sh /opt/dlna-web/

RUN echo SERVER_PATH = \"/data: minidlna/divx/\" > /opt/dlna-web/src/config.py
CMD ["/opt/dlna-web/run.sh"]


