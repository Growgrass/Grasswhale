FROM alpine:latest

RUN apk add openjdk17
RUN apk add --no-cache git
RUN apk add mongodb

RUN rc-update add mongodb default
RUN rc-service mongodb start

RUN git clone https://github.com/Grasscutters/Grasscutter.git
WORKDIR Grasscutter
RUN chmod +x gradlew
RUN .\gradlew jar

EXPOSE 27017
EXPOSE 443
EXPOSE 22102

ENTRYPOINT [ "java" ]

CMD [ "-jar grasscutter-*.jar" ]
