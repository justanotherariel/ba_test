# FROM openjdk:11
FROM adoptopenjdk/openjdk11:armv7l-debianslim-jre-11.0.11_9
COPY target/distribution .
CMD ["./run.sh"]