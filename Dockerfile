FROM debian:11-slim


# Install Dependencies
RUN apt update && apt install -y openjdk-11-jre libpigpiod-if2-1

# USER 1000

# Copy and run program
COPY target/distribution .
CMD ["./run.sh"]