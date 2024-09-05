FROM ubuntu:24.10

RUN apt update &&\
    apt install curl -y

RUN curl -fsSL https://raw.githubusercontent.com/xvzc/SpoofDPI/main/install.sh | bash -s linux-amd64

ENTRYPOINT [ "/root/.spoofdpi/bin/spoofdpi", "-addr", "0.0.0.0" ]