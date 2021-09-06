FROM debian:latest

# Update to latest packages
RUN apt-get update

# Install Dependencies
RUN apt-get install -y openjdk-11-jre
RUN apt-get install -y python-setuptools python3-setuptools

# pigpio
RUN wget https://github.com/joan2937/pigpio/archive/master.zip && \
    unzip master.zip && \
    cd pigpio-master && \
    make && \
    make install

# Copy and run program
COPY target/distribution .
CMD ["./run.sh"]