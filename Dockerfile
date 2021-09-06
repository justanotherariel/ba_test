FROM debian:11-slim


# Install Dependencies
RUN apt update && apt install -y openjdk-11-jre

RUN docker/install_pigpio.sh

# Copy and run program
COPY target/distribution .
CMD ["./run.sh"]