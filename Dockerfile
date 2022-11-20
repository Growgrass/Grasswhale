FROM alpine:latest

COPY index.py .
COPY start.sh .
COPY mongo.sh .
RUN chmod +x index.py && chmod +x start.sh && chmod && mongo.sh

RUN apk add python3 python3-dev openjdk17 wget p7zip sudo
RUN apk add --no-cache git
RUN apk add --update docker openrc

RUN mkdir -p /data
RUN sh mongo.sh
# RUN rc-update add docker boot

RUN git clone https://github.com/Grasscutters/Grasscutter.git
WORKDIR /Grasscutter
RUN chmod +x gradlew
RUN sh gradlew jar

RUN rm -rf resources
WORKDIR /
RUN wget https://mirror.textcord.xyz/etc/Grasscutter_Resources-3.2.7z
RUN 7z x Grasscutter_Resources-3.2.7z
RUN mv /Resources /Grasscutter/resources
RUN mv /README.md /Grasscutter/resources/README.md

RUN mv /index.py /Grasscutter/index.py

EXPOSE 27017
EXPOSE 443
EXPOSE 22102/udp

VOLUME /data/db

CMD ["sh", "start.sh"]
