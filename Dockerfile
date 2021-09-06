# syntax=docker/dockerfile-upstream:1-labs

FROM debian:11-slim


# Install Dependencies
RUN apt-get update && apt-get install -y openjdk-11-jre \
    && rm -rf /var/lib/apt/lists/*

RUN <<-EOF
    apt-get update

    apt-get install -y wget unzip make gcc
    apt-get install -y python-setuptools python3-setuptools

    wget https://github.com/joan2937/pigpio/archive/master.zip
    unzip master.zip
    cd pigpio-master
    make
    make install

    cd ..
    rm master.zip
    rm -r pigpio-master

    apt-get remove python-setuptools python3-setuptools
    apt-get remove wget unzip make gcc
    apt-get autoremove
    apt-get clean
EOF

# Run program
COPY target/distribution .
CMD ["./run.sh"]