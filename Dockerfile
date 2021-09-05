FROM openjdk:11
COPY DISTRIBUTION .
CMD ["./run.sh"]