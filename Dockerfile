FROM debian:11-slim


# Install Dependencies
RUN apt update && apt install -y openjdk-11-jre pigpio

USER 1000

# Copy and run program
COPY target/distribution .
CMD ["./run.sh"]