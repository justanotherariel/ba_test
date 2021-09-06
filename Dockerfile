FROM debian:11-slim


# Install Dependencies
RUN apt-get update && apt-get install -y openjdk-11-jre
RUN docker/install_pigpio.sh

# Run program
COPY target/distribution .
CMD ["./run.sh"]