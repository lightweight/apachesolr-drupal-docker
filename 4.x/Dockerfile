FROM java:openjdk-7-jdk

MAINTAINER  Biczó Dezső "mxr576@gmail.com"

# Update the image.
RUN apt-get update &&\
  apt-get -y upgrade

# Install some additional package.
RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get -y install git && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV SOLR_VERSION 4.10.4
ENV SOLR solr-$SOLR_VERSION
ENV SOLR_MEM_SIZE 512m
ENV PARTIAL_SEARCH_ENABLED false

# Download Solr.
RUN mkdir -p /opt && \
  wget -nv --output-document=/opt/$SOLR.tgz http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
  tar -C /opt --extract --file /opt/$SOLR.tgz && \
  rm /opt/$SOLR.tgz && \
  mv /opt/$SOLR /opt/solr

# Add Drupal schema files.
RUN git clone --branch 7.x-1.x http://git.drupal.org/project/search_api_solr.git && \
  cp search_api_solr/solr-conf/4.x/* /opt/solr/example/solr/collection1/conf

# Add partial search schema.
ADD ./partial_search partial_search

# Add start script.
ADD run.sh /run.sh

# Add executable right to the file.
RUN chmod +x /run.sh

VOLUME ["/opt/solr/example/solr/collection1/data", "/opt/solr/example/solr/collection1/conf"]

EXPOSE 8983

CMD ["/run.sh"]
