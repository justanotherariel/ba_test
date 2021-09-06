FROM debian:latest

# Update to latest packages
RUN apt-get update

# Install Dependencies
RUN apt-get install -y openjdk-11-jre
RUN apt-get install -y pigpio

# Copy and run program
COPY target/distribution .
CMD ["./run.sh"]