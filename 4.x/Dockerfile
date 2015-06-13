FROM java:openjdk-7-jdk

MAINTAINER  Biczó Dezső "mxr576@gmail.com"

EXPOSE 8983

RUN apt-get update &&\
  apt-get -y upgrade &&\
  apt-get clean

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get -y install lsof curl procps screen

ENV SOLR_VERSION 4.10.4
ENV SOLR solr-$SOLR_VERSION
ENV SOLR_MEM_SIZE 512m

# Download Solr.
RUN mkdir -p /opt && \
  wget -nv --output-document=/opt/$SOLR.tgz http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
  tar -C /opt --extract --file /opt/$SOLR.tgz && \
  rm /opt/$SOLR.tgz && \
  mv /opt/$SOLR /opt/solr

# Add Drupal schema files.
RUN wget -nv http://ftp.drupal.org/files/projects/search_api_solr-7.x-1.7.tar.gz && \
  tar -xvzf  search_api_solr-7.x-* && \
  cp search_api_solr/solr-conf/4.x/* /opt/solr/example/solr/collection1/conf && \
  rm -rf ./apachesolr*

CMD ["/bin/bash", "-c", "screen /opt/solr/bin/solr -f -m $SOLR_MEM_SIZE"]
