FROM openjdk:8
MAINTAINER Travis Fields <cyberious77@gmail.com>

ENV GRAILS_VERSION 3.2.4

WORKDIR /opt
#DOWNLOAD GRAILS
RUN wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip
RUN unzip /opt/grails-$GRAILS_VERSION.zip && \
    ln -s /opt/grails/bin/grails /usr/local/bin/grails

RUN mkdir /app

WORKDIR /app

ENV GRAILS_HOME /opt/grails-$GRAILS_VERSION
ENV PATH $GRAILS_HOME/bin:$PATH

ENTRYPOINT ["grails"]
CMD ["run"]
