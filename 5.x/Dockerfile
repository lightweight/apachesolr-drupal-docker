FROM java:openjdk-7-jdk

MAINTAINER  Biczó Dezső "mxr576@gmail.com"

EXPOSE 8983

RUN apt-get update &&\
  apt-get -y upgrade &&\
  apt-get clean

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get -y install lsof curl procps screen

ENV SOLR_VERSION 5.2.0
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
  tar -xvzf search_api_solr-7.x-* && \
  mkdir -p /opt/solr/server/solr/drupal/conf && \   
  cp search_api_solr/solr-conf/5.x/* /opt/solr/server/solr/drupal/conf && \
  rm -rf ./search_api_solr*

# Create a Drupal Solr core.
RUN /opt/solr/bin/solr start && \
  /opt/solr/bin/solr create -c drupal -d /opt/solr/server/solr/drupal

CMD ["/bin/bash", "-c", "screen /opt/solr/bin/solr start -f -m $SOLR_MEM_SIZE"]
