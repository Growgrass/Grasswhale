FROM alpine:latest

MAINTAINER "admin@growgrass.ga"

COPY start.py .

RUN apk add python3 python3-dev
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
RUN sh gradlew jar

RUN rm -rf resources
WORKDIR /
RUN git clone https://github.com/tamilpp25/Grasscutter_Resources
RUN mv /Grasscutter_Resources/Resources /Grasscutter/resources

RUN mv /start.py /Grasscutter/start.py

EXPOSE 27017
EXPOSE 443
EXPOSE 22102

ENTRYPOINT [ "python3" ]

CMD [ "start.py" ]
