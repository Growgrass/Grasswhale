FROM alpine:latest

MAINTAINER "admin@growgrass.ga"

RUN apk add openjdk17
RUN apk add --no-cache git
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories
RUN apk update
RUN apk add mongodb
RUN mkdir -p /data/db/

RUN git clone https://github.com/Grasscutters/Grasscutter.git
WORKDIR /Grasscutter
RUN chmod +x gradlew
RUN .\gradlew jar

EXPOSE 27017
EXPOSE 443
EXPOSE 22102

ENTRYPOINT [ "java" ]

CMD [ "-jar grasscutter-*.jar" ]
