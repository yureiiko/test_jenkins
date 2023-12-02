FROM adoptopenjdk/openjdk8:latest
COPY Main.java usr/Main.java
CMD javac usr/Main.java && cd usr && java Main
