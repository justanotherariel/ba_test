FROM openjdk:11
COPY target/distribution .
CMD ["./run.sh"]