# JRE base
FROM adoptopenjdk/openjdk16:debianslim-jre

# Environment variables
ENV MC_VERSION="latest" \
    PAPER_BUILD="latest" \
    MC_RAM="" \
    JAVA_OPTS=""

ADD papermc.sh .
RUN apt-get update \
    && apt-get install -y wget jq \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /papermc

# Start script
CMD ["sh", "./papermc.sh"]

# Container setup
EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /papermc
