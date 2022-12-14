FROM alpine:latest

COPY index.py .
COPY start.sh .
RUN chmod +x index.py && chmod +x start.sh

RUN apk add python3 python3-dev openjdk17 wget p7zip
RUN apk add --no-cache git

RUN mkdir -p /data

RUN git clone https://github.com/Growgrass/Grasscutter.git
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

VOLUME /Grasscutter

CMD ["sh", "start.sh"]
