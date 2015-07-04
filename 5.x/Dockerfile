FROM java:openjdk-7-jdk

MAINTAINER Dezső BICZÓ "mxr576@gmail.com"

# Update the image.
RUN apt-get update &&\
  apt-get -y upgrade

# Install some additional package.
RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get -y install git && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV SOLR_VERSION 5.2.1
ENV SOLR solr-$SOLR_VERSION
ENV SOLR_MEM_SIZE 512m

# Download Solr.
RUN mkdir -p /opt && \
  wget -nv --output-document=/opt/$SOLR.tgz http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
  tar -C /opt --extract --file /opt/$SOLR.tgz && \
  rm /opt/$SOLR.tgz && \
  mv /opt/$SOLR /opt/solr

# Add Drupal schema files.
RUN git clone --branch 7.x-1.x http://git.drupal.org/project/search_api_solr.git && \
  mkdir -p /opt/solr/server/solr/drupal/conf && \   
  cp search_api_solr/solr-conf/5.x/* /opt/solr/server/solr/drupal/conf && \
  rm -rf ./search_api_solr*

# Create a Drupal Solr core.
RUN /opt/solr/bin/solr start && \
  sleep 10 && \
  /opt/solr/bin/solr create -c drupal -d /opt/solr/server/solr/drupal

VOLUME ["/opt/solr/server/solr/drupal/data", "/opt/solr/server/solr/drupal/conf"]

EXPOSE 8983

CMD ["/bin/bash", "-c", "/opt/solr/bin/solr start -f -m $SOLR_MEM_SIZE"]
