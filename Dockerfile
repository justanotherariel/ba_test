FROM debian:11-slim

# Install Dependencies
RUN apt-get update && apt-get install -y openjdk-11-jre \
    python-setuptools \
    python3-setuptools \
    wget \
    unzip \
    make \
    gcc

# pigpio
RUN wget https://github.com/joan2937/pigpio/archive/master.zip && \
    unzip master.zip && \
    cd pigpio-master && \
    make && \
    make install

USER 1000

# Copy and run program
COPY target/distribution .
CMD ["./run.sh"]